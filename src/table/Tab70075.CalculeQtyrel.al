table 70075 "Calcule Qty réel"
{
    DrillDownPageID = 70120;
    LookupPageID = 70120;

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = false;
        }
        field(2;"Nom Société";Text[80])
        {
        }
        field(3;"No. Article";Code[20])
        {
        }
        field(4;"Date Comptabilisation";Date)
        {
        }
        field(5;"Type Ecriture";Text[30])
        {
        }
        field(6;"No. Document";Code[20])
        {
        }
        field(7;"Code Magasin";Code[10])
        {
        }
        field(8;"Quantité";Decimal)
        {
        }
        field(9;"Type Document";Text[30])
        {
        }
        field(10;"Magasin Source";Code[10])
        {
        }
        field(11;"No Commande";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    procedure FctGetlastEntry() : Integer;
    var
        "LrecCalculeQtyréel" : Record "70075";
    begin
        LrecCalculeQtyréel.RESET;
        IF LrecCalculeQtyréel.FINDLAST THEN
          EXIT("Entry No")
          ELSE
           EXIT(0);
    end;
}

