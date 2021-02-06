table 60050 "Préconisation Transfert"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Designation';
        }
        field(3;"Quantié réceptionée";Decimal)
        {
        }
        field(4;"Code Magasin";Code[10])
        {
        }
        field(5;"Date Début";Date)
        {
        }
        field(6;"Quantité Mag EMB";Decimal)
        {
        }
        field(7;"Quantité Vendu SAV M";Decimal)
        {
        }
        field(8;"Quantité Vendu SAV M-1";Decimal)
        {
        }
        field(9;"Quantité Vendu COM M";Decimal)
        {
        }
        field(10;"Quantité Vendu COM M-1";Decimal)
        {
        }
        field(11;"Quantité Vendu SAV Année";Decimal)
        {
        }
        field(12;"Quantité Vendu COM Année";Decimal)
        {
        }
        field(13;"Date Fin";Date)
        {
        }
        field(14;"NbMoisHistorique Vente";Integer)
        {
        }
        field(15;"Code Modèl PR";Code[30])
        {
            TableRelation = "Hiérarchie Pièce"."Model Code";
        }
        field(16;"Stock Mag Source";Decimal)
        {
        }
        field(17;"Stock Mag Destination";Decimal)
        {
        }
        field(18;"Magasin Destination";Code[10])
        {
        }
        field(19;"Qty préconisé";Decimal)
        {

            trigger OnValidate();
            begin
                IF "Stock Mag Source" = 0 THEN
                  ERROR(TXT50000,"Stock Mag Source");

                IF "Qty préconisé" > "Stock Mag Source" THEN
                  ERROR(TXT50001);
            end;
        }
        field(20;"Ligne insérée";Boolean)
        {
        }
        field(21;"Product Group Code";Code[10])
        {
            CaptionML = ENU='Product Group Code',
                        FRA='Code groupe produits';
            TableRelation = "Product Group".Code WHERE (Item Category Code=FIELD(Item Category Code));
        }
        field(22;famille;Code[30])
        {
            TableRelation = "Hiérarchie Pièce"."Item Family" WHERE (Product Group Code=FIELD(Product Group Code));
        }
        field(23;"Model Code";Text[50])
        {
            CaptionML = ENU='Model Code',
                        FRA='Code Modèle';
            TableRelation = "Hiérarchie Pièce"."Model Code" WHERE (Product Group Code=FIELD(Product Group Code),
                                                                   Item Family=FIELD(famille));
        }
        field(5702;"Item Category Code";Code[10])
        {
            CaptionML = ENU='Item Category Code',
                        FRA='Code catégorie article';
            TableRelation = "Item Category".Code WHERE (Code=FILTER(PDR|ACCESSOIRE|PICKUP));
        }
    }

    keys
    {
        key(Key1;"No.","Code Magasin","Magasin Destination")
        {
        }
    }

    fieldgroups
    {
    }

    var
        TXT50000 : Label 'Stock magasin source égal %1';
        TXT50001 : Label 'Qté à préconisée doit être inférieur à Stock magasin source';
        TXT50002 : Label '"Vous devez inserer les lignes à préconiser "';
        TXT50003 : Label 'aucune quantité à préconiser est différente de 0';

    procedure InsertTransferLine(NumOrdreTransfert : Code[20]);
    var
        RecTransfertLine : Record "5741";
        NumLigne : Integer;
        RecPrecoTransfert : Record "60050";
    begin
        //KK 301115
        RecPrecoTransfert.RESET;
        IF RecPrecoTransfert.ISEMPTY THEN
          ERROR(TXT50002);

        RecPrecoTransfert.SETFILTER("Qty préconisé",'>0');
        IF RecPrecoTransfert.ISEMPTY THEN
          ERROR(TXT50003);

        RecTransfertLine.SETRANGE("Document No.",NumOrdreTransfert);
        IF RecTransfertLine.FINDLAST THEN
          NumLigne := RecTransfertLine."Line No."
        ELSE NumLigne := 0;

        RecPrecoTransfert.FINDFIRST;
        REPEAT
            RecTransfertLine.VALIDATE("Document No.",NumOrdreTransfert);
            RecTransfertLine.VALIDATE("Line No.",NumLigne+10000);
            RecTransfertLine.VALIDATE("Item No.",RecPrecoTransfert."No.");
            RecTransfertLine.VALIDATE(RecTransfertLine.Quantity,RecPrecoTransfert."Qty préconisé");
            RecTransfertLine.INSERT;

            NumLigne += 10000;
        UNTIL RecPrecoTransfert.NEXT=0;
        // END KK
    end;
}

