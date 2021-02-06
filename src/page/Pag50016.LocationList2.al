page 50016 "Location List 2"
{
    // version CT16V001

    CaptionML = ENU='Location List',
                FRA='Liste des magasins';
    Editable = false;
    PageType = List;
    SourceTable = 14;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Code;Code)
                {
                }
                field(Name;Name)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Location")
            {
                CaptionML = ENU='&Location',
                            FRA='&Magasin';
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    RunObject = Page 5703;
                    RunPageLink = Code=FIELD(Code);
                    ShortCutKey = 'Shift+F5';
                }
                action("&Resource Locations")
                {
                    CaptionML = ENU='&Resource Locations',
                                FRA='&Magasins ressource';
                    RunObject = Page 6015;
                    RunPageLink = Location Code=FIELD(Code);
                }
                separator()
                {
                }
                action("&Zones")
                {
                    CaptionML = ENU='&Zones',
                                FRA='&Zones';
                    Image = Zones;
                    RunObject = Page 7300;
                    RunPageLink = Location Code=FIELD(Code);
                }
                action("&Bins")
                {
                    CaptionML = ENU='&Bins',
                                FRA='&Emplacements';
                    Image = Bins;
                    RunObject = Page 7302;
                    RunPageLink = Location Code=FIELD(Code);
                }
            }
        }
    }

    procedure GetSelectionFilter() SelectionFilter : Code[80];
    var
        Loc : Record "14";
    begin
        CurrPage.SETSELECTIONFILTER(Loc);
        Loc.SETCURRENTKEY(Code);
        IF Loc.COUNT > 0 THEN BEGIN
          Loc.FIND('-');
          SelectionFilter := Loc.Code;
        END;

        EXIT(SelectionFilter);
    end;
}

