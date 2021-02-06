page 60139 "Contrôle Livraison VN"
{
    // version Preparation VN

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = Table60026;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Description;Description)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = BoolStrong;
                }
                field(Oui;Oui)
                {
                    Editable = BoolOui;

                    trigger OnValidate();
                    begin
                        IF Oui = FALSE THEN
                        BEGIN
                          BoolOui := FALSE;
                          BoolNon := TRUE;
                        END
                        ELSE
                        BEGIN
                          BoolOui := TRUE;
                          BoolNon := FALSE;
                        END;
                    end;
                }
                field(Non;Non)
                {
                    Editable = BoolNon;

                    trigger OnValidate();
                    begin
                        IF Non = FALSE THEN
                        BEGIN
                          BoolOui := TRUE;
                          BoolNon := FALSE;
                        END
                        ELSE
                        BEGIN
                          BoolOui := FALSE;
                          BoolNon := TRUE;
                        END;
                    end;
                }
                field(NA;NA)
                {
                }
                field(Correctif;Correctif)
                {
                }
                field(Pilot;Pilot)
                {
                }
                field(Détails;Détails)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF (Titre) OR ("Titre Principale") THEN
          BoolStrong := TRUE
        ELSE BoolStrong := FALSE
    end;

    trigger OnClosePage();
    var
        RecControl : Record "60009";
    begin
    end;

    trigger OnOpenPage();
    begin
        BoolOui := TRUE;
        BoolNon := TRUE;
    end;

    var
        BoolOui : Boolean;
        BoolNon : Boolean;
        BoolStrong : Boolean;
}

