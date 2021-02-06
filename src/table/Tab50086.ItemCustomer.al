table 50086 "Item - Customer"
{
    CaptionML = ENU='Item - Customer',
                FRA='Article - Client';
    DrillDownPageID = 60355;
    LookupPageID = 60355;

    fields
    {
        field(1;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='Code Client';
            TableRelation = Customer;

            trigger OnValidate();
            begin
                Customer.GET("Customer No.");
                VALIDATE("Customer Name",Customer.Name);
            end;
        }
        field(2;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='No. Article';
            TableRelation = Item;

            trigger OnValidate();
            begin
                Item.GET("Item No.");
                VALIDATE("Item Description",Item.Description);
            end;
        }
        field(3;"Customer Name";Text[100])
        {
        }
        field(4;"Item Description";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Customer No.","Item No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Item : Record "27";
        Customer : Record "18";
}

