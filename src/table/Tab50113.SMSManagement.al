table 50113 "SMS Management"
{

    fields
    {
        field(1;"No Seq.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Phone No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Mesage;Text[160])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Creation Date";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Send;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Send Date";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Return;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No Seq.")
        {
        }
    }

    fieldgroups
    {
    }

    procedure SendSMS(Tel : Code[8];Msg : Text[160]);
    var
        LastSeq : Integer;
    begin
        IF FINDLAST THEN
         LastSeq := "No Seq."+1
        ELSE
         LastSeq := 1;

        INIT;
        "No Seq." := LastSeq;
        "Phone No" := Tel;
        Mesage := Msg;
        "Created By" := USERID;
        "Creation Date" := CURRENTDATETIME;
        INSERT;
    end;
}

