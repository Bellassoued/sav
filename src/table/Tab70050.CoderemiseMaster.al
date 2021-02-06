table 70050 "Code remise Master"
{
    // version CT

    DrillDownPageID = 70071;
    LookupPageID = 70071;

    fields
    {
        field(2;"Ancien Code Remise";Code[10])
        {
        }
        field(3;"Nouveau code remise";Code[10])
        {
        }
        field(4;"Traitée";Boolean)
        {
        }
        field(5;"NBR charac";Integer)
        {
        }
        field(23;"Main Group Code";Code[10])
        {
            CaptionML = ENU='Main Group Code',
                        FRA='Index';
            TableRelation = Index;
        }
        field(24;"Subgroup Code";Code[10])
        {
            CaptionML = ENU='Subgroup Code',
                        FRA='Segment';
            TableRelation = Segment;
        }
        field(25;"Line Group Code";Code[10])
        {
            CaptionML = ENU='Line Group Code',
                        FRA='Famille';
            TableRelation = Famille;
        }
        field(26;"Code Remise";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"SCC Manualle";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                RecItem.RESET;
                RecItem.SETRANGE("Product Code","Code Remise");
                IF RecItem.FINDSET THEN
                   REPEAT
                     RecItem."SCC Manual" := "SCC Manualle";
                     RecItem.MODIFY;
                   UNTIL RecItem.NEXT = 0;
            end;
        }
    }

    keys
    {
        key(Key1;"Code Remise","SCC Manualle")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RecItem : Record "27";
}

