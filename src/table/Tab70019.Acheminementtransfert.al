table 70019 "Acheminement transfert"
{

    fields
    {
        field(1;"Item No.";Code[20])
        {
            TableRelation = Item;
        }
        field(2;"Magasin source";Code[10])
        {
            TableRelation = Location;
        }
        field(3;"Magasin destination";Code[10])
        {
            TableRelation = Location;
        }
        field(4;"Quantité";Decimal)
        {
        }
        field(5;"No. commande vente";Code[20])
        {
            TableRelation = "Sales Header".No.;
        }
        field(6;"No. Ligne commande";Integer)
        {
        }
        field(7;"Entry No";Integer)
        {
        }
        field(8;"No. ordre transfer";Code[20])
        {
            TableRelation = "Transfer Header";

            trigger OnValidate();
            begin
                IF Order=1 THEN
                  BEGIN
                    "No Doc Destinaton"         := "No. ordre transfer";
                    "No Ligne Doc destination"  := "No. ligne transfer";
                  END
                ELSE
                  BEGIN
                    Acheminementtransfert.RESET;
                    Acheminementtransfert.SETRANGE("Entry No","Entry No");
                    Acheminementtransfert.SETRANGE(Order,Order-1);
                    IF Acheminementtransfert.FINDFIRST THEN BEGIN
                      "No Doc Source"       := Acheminementtransfert."No. ordre transfer";
                      "No Ligne Doc Source" := Acheminementtransfert."No. ligne transfer";
                      "No Doc Destinaton"         := "No. ordre transfer";
                    END;
                  END;
            end;
        }
        field(9;"No. ligne transfer";Integer)
        {

            trigger OnValidate();
            begin
                "No Ligne Doc destination"  := "No. ligne transfer";
            end;
        }
        field(10;"Order";Integer)
        {

            trigger OnValidate();
            begin
                IF Order = 1 THEN
                  BEGIN
                    "Source ID" := 32;
                    RecItemLedgerEntry.RESET;
                    RecItemLedgerEntry.SETRANGE("Item No.","Item No.");
                    RecItemLedgerEntry.SETRANGE("Location Code","Magasin source");
                    RecItemLedgerEntry.SETRANGE(Open,TRUE);
                    RecItemLedgerEntry.SETRANGE(Positive,TRUE);
                    RecItemLedgerEntry.FINDFIRST;
                    "No Ligne Doc Source" := RecItemLedgerEntry."Entry No.";
                  END
                ELSE
                  "Source ID" := 5741;
            end;
        }
        field(11;"Primary Key";Integer)
        {
        }
        field(12;"Sales Order Location code";Code[10])
        {
            TableRelation = Location;
        }
        field(13;"Source ID";Integer)
        {
        }
        field(14;"No Doc Source";Code[20])
        {
        }
        field(15;"No Doc Destinaton";Code[20])
        {
        }
        field(16;"No Ligne Doc Source";Integer)
        {
        }
        field(17;"No Ligne Doc destination";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
        key(Key2;"Entry No","Order")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        IF "No. ordre transfer"<>'' THEN
          ERROR(TXT50000,"Primary Key");
    end;

    var
        Acheminementtransfert : Record "70019";
        RecItemLedgerEntry : Record "32";
        TXT50000 : Label 'Numéro ordre de transfert doit être égal à '''' dans ligne %1';
}

