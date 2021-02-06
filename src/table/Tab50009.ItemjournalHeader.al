table 50009 "Item journal Header"
{
    // version DOC STOCK

    Caption = 'Document de stock';
    LookupPageID = 50033;

    fields
    {
        field(1; "N°"; Code[20])
        {
            Caption = 'N°';
        }
        field(2; "Type Mvt"; Option)
        {
            CaptionML = ENU = 'Type',
                        FRA = 'Type';
            OptionCaptionML = ENU = 'Input,Output,Transfer',
                              FRA = 'Entrée,Sortie,Transfert';
            OptionMembers = "Entrée",Sortie,Transfert;
        }
        field(3; "N° Client"; Code[10])
        {
            CaptionML = ENU = 'Customer No.',
                        FRA = 'N° Client';
            TableRelation = Customer;
        }
        field(4; "Code Vendeur"; Code[10])
        {
            CaptionML = ENU = 'Salesperson code',
                        FRA = 'Code Vendeur';
            TableRelation = Salesperson/Purchaser;
        }
        field(5;"N° Fournisseur";Code[10])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° Fournisseur';
            TableRelation = Vendor;
        }
        field(6;"N° Souche";Code[20])
        {
            CaptionML = ENU='Series No.',
                        FRA='N° Souche';
            TableRelation = "No. Series";
        }
        field(8;"Type origine";Option)
        {
            OptionCaption = 'Montage,Démontage';
            OptionMembers = Montage,"Démontage";
        }
        field(9;"Sourec Doc Type";Option)
        {
            CaptionML = ENU='Sourec Doc Type',
                        FRA='Type Document source';
            OptionCaption = 'Ordre de Réparation,Ordre de Préparation,Achat spécifique';
            OptionMembers = "Ordre de Réparation","Ordre de Préparation","Achat spécifique";
        }
        field(10;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.',
                        FRA='Num. origine';
        }
        field(52;"Date comptabilisation";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
            Editable = true;
        }
        field(53;"Cree par";Code[50])
        {
            CaptionML = ENU='Created By',
                        FRA='Créé par';
            Editable = false;
            TableRelation = User;
        }
        field(56;"Valide par";Code[50])
        {
            CaptionML = ENU='Posted By',
                        FRA='Validé par';
            Editable = false;
            TableRelation = User;
        }
        field(53000;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            CaptionML = ENU='Global Dimension 1 Code',
                        FRA='Code axe principal 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(53001;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            CaptionML = ENU='Global Dimension 2 Code',
                        FRA='Code axe principal 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(53004;"Transfer-from Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code Magasin';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
            end;
        }
        field(53005;"Transfer-to Code";Code[10])
        {
            CaptionML = ENU='Transfer-to Code',
                        FRA='Code dest. transfert';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
            end;
        }
        field(53027;Commentaire;Text[250])
        {
            CaptionML = ENU='Comments',
                        FRA='Commentaire';
        }
        field(53028;"Numero de Chassis";Code[20])
        {
        }
        field(53029;"Modèle Vehicule";Code[20])
        {
        }
        field(53030;"Code Variante";Code[20])
        {
        }
        field(53031;"Description Véhicule";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"N°")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
        RecLItemJournalBatch : Record "233";
        RecLItemJournalTemplate : Record "82";
        CodLDefaultSeriesCode : Code[20];
    begin

        RecGInventorySetup.GET;
        CodLDefaultSeriesCode:=RecGInventorySetup."Souche Entree Stock";
        IF "N°" = '' THEN
        BEGIN

          IF ("Type Mvt"="Type Mvt"::Sortie) AND (RecGInventorySetup."Souche Sortie Stock" <>'') THEN
             CodLDefaultSeriesCode:=RecGInventorySetup."Souche Sortie Stock";

          IF ("Type Mvt"="Type Mvt"::Transfert) AND (RecGInventorySetup."Souche Transfert Stock" <>'') THEN
             CodLDefaultSeriesCode:=RecGInventorySetup."Souche Transfert Stock";

          //CodLDefaultSeriesCode:=GetNoSeriesCodeByRespCenter(CodLDefaultSeriesCode);
          CduNoSeriesMgt.InitSeries(CodLDefaultSeriesCode,xRec."N°",TODAY,"N°","N° Souche");
        END;


        RecLItemJournalBatch.INIT;
        RecLItemJournalBatch.Name:="N°";

        IF "Type Mvt"<>"Type Mvt"::Transfert THEN
          BEGIN
            RecLItemJournalTemplate.GET(RecGInventorySetup."Modele Feuille");
            RecLItemJournalBatch."Template Type":=RecLItemJournalBatch."Template Type"::Item ;
          END ELSE
            BEGIN
              RecLItemJournalTemplate.GET(RecGInventorySetup."Modele Feuille Transfert");
              RecLItemJournalBatch."Template Type":=RecLItemJournalBatch."Template Type"::Transfer;
            END;

        RecLItemJournalBatch."Journal Template Name":=RecLItemJournalTemplate.Name;
        //RecLItemJournalBatch."Posting No. Series":=GetNoSeriesCodeByRespCenter(RecLItemJournalTemplate."Posting No. Series");

        IF RecLItemJournalBatch.INSERT THEN;

        "Date comptabilisation":= TODAY;
        "Cree par":=USERID;

        // "Global Dimension 2 Code":=UserMngt.GetActivityBySeries("N° Souche");
    end;

    var
        RecGInventorySetup : Record "313";
        CduNoSeriesMgt : Codeunit "396";
        Text001 : Label 'Création  décompte appro.';
        UserMngt : Codeunit "5700";
        UserSetup : Record "91";
        RecLocationA : Record "14";
        RecLocationB : Record "14";
        "------MYC--------" : Integer;
        RecGClient : Record "18";
        RecGItemLine : Record "83";
        RecGVendor : Record "23";
        Text002 : Label 'Aucune site n''est paramétré pour l''utilisateur courant';

    procedure AssistEditEntree(RecLStockHeader : Record "50009") : Boolean;
    begin
        IF UserMngt.GetSalesFilter() = '' THEN
          ERROR(Text002);

        RecGInventorySetup.GET;
        //CduNoSeriesMgt.SetOrigine(4);
        IF CduNoSeriesMgt.SelectSeries(RecGInventorySetup."Item Charge Nos.","N° Souche","N° Souche") THEN BEGIN
          CduNoSeriesMgt.SetSeries("N°");
          EXIT(TRUE);
        END;
    end;

    procedure GetNoSeriesCodeByRespCenter(CodLDefaultSeriesCode : Code[20]) : Code[10];
    var
        RecLSeriesRelationship : Record "310";
    begin
        /*IF UserMngt.GetSalesFilter() <> '' THEN
        BEGIN
          RecLSeriesRelationship.SETRANGE(Code,CodLDefaultSeriesCode);
          RecLSeriesRelationship.SETRANGE(Site,UserMngt.GetSalesFilter());
          UserMngt.GetSeriesActivityFilter(RecLSeriesRelationship);
         IF RecLSeriesRelationship.FINDFIRST THEN
            EXIT(RecLSeriesRelationship."Series Code")
           ELSE
           BEGIN
             RecLSeriesRelationship.RESET;
             RecLSeriesRelationship.SETRANGE(Code,CodLDefaultSeriesCode);
             UserMngt.GetSeriesActivityFilter(RecLSeriesRelationship);
             IF RecLSeriesRelationship.FINDFIRST THEN
                 EXIT(RecLSeriesRelationship."Series Code")
             ELSE
                 EXIT(CodLDefaultSeriesCode)
           END
        END
        ELSE
          ERROR(Text002);
         */

    end;

    procedure ControleQuantity(StockHeader : Record "50009");
    var
        JournalLine : Record "83";
        Text004 : Label 'Quantité saisie ne peut etre négative %1';
        Text003 : Label 'Quantité en stock insuffisante';
        OK : Boolean;
        CheckItemAvail : Page "50030";
                             RecLSetup : Record "313";
    begin
        /*
        RecLSetup.GET;
        JournalLine.RESET;
        JournalLine.SETRANGE(JournalLine."Journal Template Name", RecLSetup."Modele Feuille");
        JournalLine.SETFILTER(JournalLine."Journal Batch Name",StockHeader."N°");
        IF JournalLine.FIND('-') THEN
          REPEAT
            IF (JournalLine."Item No."<>'') AND (JournalLine.Quantity <>0) THEN
              IF CheckItemAvail.ItemJnlLineShowWarning(JournalLine) THEN BEGIN
                OK := CheckItemAvail.RUNMODAL = ACTION::Yes;
                CLEAR(CheckItemAvail);
                IF NOT OK THEN
                BEGIN
        
        
                  ERROR(Text003);
                END
              END;
          UNTIL JournalLine.NEXT = 0
        */

    end;

    procedure AssistEditSortie(RecLStockHeader : Record "50009") : Boolean;
    begin
        IF UserMngt.GetSalesFilter() = '' THEN
          ERROR(Text002);

        RecGInventorySetup.GET;
        //CduNoSeriesMgt.SetOrigine(4);
        IF CduNoSeriesMgt.SelectSeries(RecGInventorySetup."Souche Sortie Stock","N° Souche","N° Souche") THEN BEGIN
          CduNoSeriesMgt.SetSeries("N°");
          EXIT(TRUE);
        END;
    end;

    procedure AssistEditTransfert(RecLStockHeader : Record "50009") : Boolean;
    begin
        IF UserMngt.GetSalesFilter() = '' THEN
          ERROR(Text002);


        RecGInventorySetup.GET;
        //CduNoSeriesMgt.SetOrigine(4);
        IF CduNoSeriesMgt.SelectSeries(RecGInventorySetup."Souche Transfert Stock","N° Souche","N° Souche") THEN BEGIN
          CduNoSeriesMgt.SetSeries("N°");
          EXIT(TRUE);
        END;
    end;
}

