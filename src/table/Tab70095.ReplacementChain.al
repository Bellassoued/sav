table 70095 "Replacement Chain"
{
    // version INC2.30.05,INC3.0.1.0

    // +----------------------------------------------+
    // | Copyright © 2000 Incadea AG Germany          |
    // +----------------------------------------------+
    // | INCADEA ENGINE                               |
    // +----------------------------------------------+
    // PA-Nummer  Datum                               |
    // -----------------------------------------------+
    // PA022121   07.12.03

    CaptionML = ENU='Replacement Chain',
                FRA='Chaîne de remplacements';
    DrillDownPageID = 5028710;
    LookupPageID = 5028710;

    fields
    {
        field(1;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° Pièce';
            Editable = false;
            TableRelation = Item.No.;
        }
        field(2;"Chain No.";Integer)
        {
            CaptionML = ENU='Chain No.',
                        FRA='N° Chaîne';
            Editable = false;
            NotBlank = true;
        }
        field(10;"Item Description";Text[80])
        {
            CalcFormula = Lookup(Item.Description WHERE (No.=FIELD(Item No.)));
            CaptionML = ENU='Item Description',
                        FRA='Désignation pièce';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11;"No. of Chains";Integer)
        {
            CalcFormula = Count("Replacement Chain" WHERE (Item No.=FIELD(Item No.)));
            CaptionML = ENU='No. of Chains',
                        FRA='Nbre  de chaînes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;Inventory;Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(Item No.),
                                                                  Location Code=FIELD(Location Filter)));
            CaptionML = ENU='Inventory',
                        FRA='Stock';
            DecimalPlaces = 0:5;
            Description = 'is needed for displaying';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;"Location Filter";Code[10])
        {
            CaptionML = ENU='Location Filter',
                        FRA='Filtre magasin';
            Editable = false;
            FieldClass = FlowFilter;
            TableRelation = Location.Code;
        }
        field(14;"Unit Price";Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = Lookup(Item."Unit Price" WHERE (No.=FIELD(Item No.)));
            CaptionML = ENU='Unit Price',
                        FRA='PU';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"Oldest Receipt on";Date)
        {
            CalcFormula = Min("Item Ledger Entry"."Posting Date" WHERE (Item No.=FIELD(Item No.),
                                                                        Entry Type=FILTER(Positive Adjmt.|Purchase|Transfer),
                                                                        Open=CONST(Yes)));
            CaptionML = ENU='Oldest Receipt on',
                        FRA='Prem. date réception';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"Total Inventory";Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(Item No.)));
            CaptionML = ENU='Total Inventory',
                        FRA='Total stock';
            DecimalPlaces = 0:5;
            Description = 'is needed for restriction';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17;"Stock Consolider";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Item No.","Chain No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Chain No.")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    procedure InsertCheck(PerformTriggerP : Boolean) Successful : Boolean;
    var
        RecL : Record "70095";
    begin
        // InsertCheck
        // Start PA022121
        RecL := Rec;
        IF RecL.FIND('=') THEN
          EXIT(FALSE);
        INSERT(PerformTriggerP);
        Successful := TRUE;
        // Stop PA022121
    end;
}

