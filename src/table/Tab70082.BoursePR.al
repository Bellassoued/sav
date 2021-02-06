table 70082 "Bourse PR"
{
    DrillDownPageID = 70153;
    LookupPageID = 70153;

    fields
    {
        field(1;"No. Article";Code[20])
        {

            trigger OnValidate();
            begin
                IF RecItem.GET("No. Article") THEN
                  Description := RecItem.Description;
            end;
        }
        field(2;Description;Text[80])
        {
        }
        field(3;"Quantité";Decimal)
        {
        }
        field(4;"Prix Unitaire";Decimal)
        {
        }
        field(5;"% Remise";Decimal)
        {
        }
        field(6;"Prix Net";Decimal)
        {
        }
        field(7;"Code Client";Code[20])
        {

            trigger OnValidate();
            begin
                IF RecCustomer.GET("Code Client") THEN
                   "Raison Sociale" := RecCustomer.Name;
            end;
        }
        field(8;"Raison Sociale";Text[80])
        {
        }
        field(9;s;Integer)
        {
            AutoIncrement = true;
        }
        field(10;"Date Debut Promotion";Date)
        {
        }
        field(11;"Date Fin Promotion";Date)
        {
        }
    }

    keys
    {
        key(Key1;"No. Article","Code Client")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RecCustomer : Record "18";
        RecItem : Record "27";
}

