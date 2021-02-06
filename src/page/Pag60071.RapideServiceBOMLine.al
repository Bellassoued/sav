page 60071 "Rapide Service BOM Line"
{
    // version NAVW17.00

    AutoSplitKey = true;
    CaptionML = ENU='Lines',
                FRA='Lignes';
    DataCaptionFields = "Rapid Service BOM No.";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = Table60014;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field(Prix;Prix)
                {
                }
                field("Remplacé par";"Remplacé par")
                {
                }
            }
        }
    }

    actions
    {
    }

    procedure ShowComment();
    var
        ProdOrderCompComment : Record "99000776";
    begin
    end;

    procedure ShowWhereUsed();
    var
        Item : Record "27";
        ProdBomHeader : Record "99000771";
        ProdBOMWhereUsed : Page "99000811";
    begin
    end;
}

