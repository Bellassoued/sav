table 70099 "Tmp Import Cmd Achat VN."
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;Type;Code[20])
        {
        }
        field(3;"No. Article";Code[30])
        {
            TableRelation = Item;
        }
        field(4;"Code variante";Code[20])
        {
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(No. Article));
        }
        field(5;VIN;Code[20])
        {
        }
        field(6;CAF;Code[20])
        {
        }
        field(7;"Désignation";Code[100])
        {
        }
        field(8;"Code Magasin";Code[20])
        {
            TableRelation = Location;
        }
        field(9;Emplacement;Code[20])
        {
            TableRelation = Bin.Code WHERE (Location Code=FIELD(Code Magasin));
        }
        field(10;"Date Commande";Date)
        {
        }
        field(11;"Date réception";Date)
        {
        }
        field(12;"Quantité";Decimal)
        {
        }
        field(13;"Quantité Recue";Decimal)
        {
        }
        field(14;"Code devise";Code[10])
        {
            TableRelation = Currency;
        }
        field(15;"Coût unitaire Dollar";Decimal)
        {
        }
        field(16;"Taux de change";Decimal)
        {
        }
        field(17;"dernier côut direct";Decimal)
        {
        }
        field(18;"No. Facture fournisseur";Code[20])
        {
        }
        field(19;"No. Expédition";Code[20])
        {
        }
        field(20;"No. L.C";Code[20])
        {
        }
        field(21;"No dossier VN";Code[20])
        {
        }
        field(22;"Date embarquement";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        TmpImportCmdAchatVN.RESET;
        IF TmpImportCmdAchatVN.FINDLAST THEN
          "Entry No." := TmpImportCmdAchatVN."Entry No." +1
        ELSE
          "Entry No." := 1;
    end;

    var
        TmpImportCmdAchatVN : Record "70099";
}

