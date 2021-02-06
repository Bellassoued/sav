table 60040 "Code Axes Obligatoire table"
{

    fields
    {
        field(1;"Table Id";Integer)
        {
            CaptionML = ENU='Table Id',
                        FRA='Code Table';

            trigger OnValidate();
            begin
                RecRef.OPEN ("Table Id") ;

                IF RecRef.FINDFIRST THEN
                  "Description Table" := RecRef.CAPTION
                 ELSE ERROR ('le numéro de la table n''existe pas dans dynamics nav');


                RecRef.CLOSE;
            end;
        }
        field(2;"dimension ID";Code[20])
        {
            CaptionML = ENU='dimension ID',
                        FRA='code Axe analytique';
            TableRelation = Dimension.Code;
        }
        field(3;"Non obligatoire Si";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(4;"Description Table";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Table Id","dimension ID")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RecRef : RecordRef;
}

