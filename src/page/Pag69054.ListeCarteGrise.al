page 69054 "Liste Carte Grise"
{
    CaptionML = ENU='Liste Carte Grise',
                FRA='Liste Carte Grise';
    CardPageID = "Fiche carte grise";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table60016;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N° Bordereau";"N° Bordereau")
                {
                }
                field(VIN;VIN)
                {
                }
                field(Statut;Statut)
                {
                    OptionCaptionML = ENU=' ,Envoyé,CHQ Préparé,Déposé,Reçue',
                                      FRA=' ,Envoyé,CHQ Préparé,Déposé,Reçue';
                }
                field("Modèle Véhicule";"Modèle Véhicule")
                {
                }
                field("Code Variant";"Code Variant")
                {
                }
                field("N° Matriculation";"N° Matriculation")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field(Name;Name)
                {
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field("Payment No.";"Payment No.")
                {
                    Visible = true;
                }
                field(Emplacement;GRecServiceItem.GetBin(VIN))
                {
                    CaptionML = ENU='Emplacement',
                                FRA='Emplacement';
                }
                field("Payment Class";"Payment Class")
                {
                    Visible = false;
                }
                field("Payment Document No.";"Payment Document No.")
                {
                    Visible = false;
                }
                field("Payment External Document No.";"Payment External Document No.")
                {
                    Visible = false;
                }
                field("Désignation Modèle";"Désignation Modèle")
                {
                }
                field("Date Lettrage";"Date Lettrage")
                {
                    Caption = 'Date Préparation CHQ';
                    Visible = false;
                }
                field("Date Heure Depôt";"Date Heure Depôt")
                {
                    CaptionML = ENU='Date Depôt',
                                FRA='Date Depôt';
                }
                field("Date Reception";"Date Reception")
                {
                    Caption = 'Date Reception CG';
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Date Bordereau CG";"Date Bordereau CG")
                {
                }
                field("Heure Bordereau CG";"Heure Bordereau CG")
                {
                }
                field("Heure Envoie Bordereau";"Heure Envoie Bordereau")
                {
                    Visible = false;
                }
                field("Date Envoie Bordereau";"Date Envoie Bordereau")
                {
                    Visible = false;
                }
                field("Date réception dossier";GRecServiceItem."Date Recep Dossier")
                {
                    Editable = false;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Code emplacement";GREcWarehouseEntry."Bin Code")
                {
                    Editable = false;
                }
                field("Véhicule livré";GBoolVehLivre)
                {
                    CaptionML = ENU='Véhicule livré',
                                FRA='Véhicule livré';
                    Editable = false;
                }
                field("Date de livraison";GRecServiceItem."Date Livraison")
                {
                    Editable = false;
                }
                field(Montant;"Frais immatriculation"+"Frais TME"+"Frais Redevence Comp. Véhicule"+"Autre Frais")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        FctGetInfoServiceITem;
    end;

    trigger OnAfterGetRecord();
    begin
        FctGetInfoServiceITem;
    end;

    trigger OnInit();
    var
        GRecUserSetup : Record "91";
    begin
    end;

    trigger OnOpenPage();
    begin
        // Filter date création bordereau 2016
        // à remplacer avec date création entet carte grise
        //SETFILTER("N° Bordereau",'%1','CRT16*');

        RecUserSetup.GET(USERID);
        IF RecUserSetup."Salespers./Purch. Code"<>'' THEN
        IF NOT RecUserSetup."Service Compta." THEN //ADD RH
              BEGIN
            FILTERGROUP(2);
            IF (NOT RecUserSetup."Responsable agence VN") AND (NOT RecUserSetup.Admin_Vente_VN) THEN
              SETRANGE("Salesperson Code",RecUserSetup."Salespers./Purch. Code");
            IF (UserMgt.GetSalesFilter <> '') AND ( NOT RecUserSetup.Admin_Vente_VN) THEN BEGIN
              SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
            END;
            FILTERGROUP(0);
        END;
        //<<OLD ZMN 07/09/2017
        //IF RecUserSetup."Sales Resp. Ctr. Filter" <> '' THEN
        //  SETFILTER("Responsibility Center",RecUserSetup."Sales Resp. Ctr. Filter");
        // Filter centre de gestion
        //>>OLD ZMN 07/09/2017
    end;

    var
        RecUserSetup : Record "91";
        GRecServiceItem : Record "5940";
        SalesHeader : Record "36";
        SalesInvoiceHeader : Record "112";
        GCdeSalesPersonCode : Code[20];
        GREcWarehouseEntry : Record "7312";
        GBoolVehLivre : Boolean;
        UserMgt : Codeunit "5700";

    local procedure FctGetInfoServiceITem();
    var
        LRecCarteGriseLigne : Record "60016";
    begin
        GRecServiceItem.RESET;
        GRecServiceItem.SETRANGE("Serial No.",VIN);
        IF GRecServiceItem.FINDFIRST  THEN BEGIN
        GREcWarehouseEntry.RESET;
        GREcWarehouseEntry.SETRANGE("Serial No.",VIN);
        GREcWarehouseEntry.FINDLAST;
        IF GRecServiceItem."Préparation/Livraison"=GRecServiceItem."Préparation/Livraison"::Livrer THEN
          GBoolVehLivre:=TRUE
        ELSE
          GBoolVehLivre:=FALSE;
        END ELSE
           GBoolVehLivre:=FALSE;
    end;
}

