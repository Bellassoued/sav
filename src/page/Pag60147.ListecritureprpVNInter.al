page 60147 "Liste écriture prép VN Inter"
{
    // version Preparation VN

    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table7312;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Source No.";"Source No.")
                {
                    CaptionML = ENU='Source No.',
                                FRA='N° Document';
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field("Item No.";"Item No.")
                {
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field(Description;Description)
                {
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field("Serial No.";"Serial No.")
                {
                    CaptionML = ENU='Serial No.',
                                FRA='N° chassis';
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field("Location Code";"Location Code")
                {
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field("Bin Code";"Bin Code")
                {
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field(Quantity;Quantity)
                {
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field("User ID";"User ID")
                {
                    Style = Ambiguous;
                    StyleExpr = "Check Exists Inter Parc";
                }
                field("Check Exists Inter Parc";"Check Exists Inter Parc")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Inspection Inter Parc")
            {
                Caption = 'Inspection Inter Parc';
                Image = CheckList;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    ControlVenteVN : Record "60026";
                begin
                    CLEAR(ControlVenteVN);
                    ControlVenteVN.SETRANGE( "No Chassis","Serial No.");
                    ControlVenteVN.SETRANGE("Document No","Source No.");
                    ControlVenteVN.SETRANGE( "Type Control",ControlVenteVN."Type Control"::"Réception VN inter Parc");

                    IF NOT ControlVenteVN.FINDFIRST THEN
                       CreateControl();
                    PAGE.RUN(PAGE::"Fiche écriture prép VN Inter",Rec);
                end;
            }
        }
    }

    procedure CreateControl();
    var
        RecControlGroup : Record "60027";
        RecLineControl : Record "60028";
        ControlVenteVN : Record "60026";
        IntLineNo : Integer;
    begin
        IntLineNo := 10000;
        CLEAR(RecControlGroup);
        RecControlGroup.SETRANGE(RecControlGroup."Type Control",RecControlGroup."Type Control"::"Réception VN inter Parc");
        IF RecControlGroup.FINDFIRST THEN
        REPEAT

              // INSERT LIGNE GROUPE;
              CLEAR(RecLineControl);
              ControlVenteVN."Document No"      := "Source No.";
              ControlVenteVN."No Chassis"       := "Serial No.";
              ControlVenteVN."Line No"          := IntLineNo;
              ControlVenteVN."Date de Creation" := TODAY;
              ControlVenteVN."Cree par"         := USERID;
              ControlVenteVN.Group              := RecControlGroup."Group No" ;
              ControlVenteVN."Type Control"     := RecControlGroup."Type Control"::"Réception VN inter Parc";
              ControlVenteVN.Description        := RecControlGroup."Group No";
              ControlVenteVN.Titre              := TRUE;
              ControlVenteVN.ShowDetail         := FALSE;
              IF ControlVenteVN.INSERT THEN IntLineNo+= 10000;

              // INSERT LIGNE CONTROL;
              CLEAR(RecLineControl);
              RecLineControl.SETRANGE(RecLineControl.Group,RecControlGroup."Group No");
              IF RecLineControl.FINDFIRST THEN
              REPEAT
                  CLEAR(ControlVenteVN);
                  IF RecLineControl."Titre Principale" THEN
                     ControlVenteVN."Titre Principale" := TRUE
                  ELSE ControlVenteVN.ShowDetail := TRUE;

                  ControlVenteVN."Document No"      := "Source No.";
                  ControlVenteVN."No Chassis"       := "Serial No.";
                  ControlVenteVN."Line No"          := IntLineNo;
                  ControlVenteVN."Date de Creation" := TODAY;
                  ControlVenteVN."Cree par"         := USERID;
                  ControlVenteVN.Group              := RecLineControl.Group ;
                  ControlVenteVN."Type Control"     := RecControlGroup."Type Control"::"Réception VN inter Parc";
                  ControlVenteVN.Description        := '   ' +RecLineControl.Description;
                  IF ControlVenteVN.INSERT THEN IntLineNo+= 10000;
              UNTIL RecLineControl.NEXT = 0;
        UNTIL RecControlGroup.NEXT = 0;
    end;
}

