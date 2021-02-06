page 60145 "Liste écriture préparation VN"
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
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field("Item No.";"Item No.")
                {
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field(Description;Description)
                {
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field("Serial No.";"Serial No.")
                {
                    CaptionML = ENU='Serial No.',
                                FRA='N° chassis';
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field("Location Code";"Location Code")
                {
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field("Bin Code";"Bin Code")
                {
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field(Quantity;Quantity)
                {
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field("User ID";"User ID")
                {
                    Style = Favorable;
                    StyleExpr = "Check Exists Livraison";
                }
                field("Check Exists Livraison";"Check Exists Livraison")
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
            action("Inspection avant livraison Vehicule Neuf")
            {
                Caption = 'Inspection Avant Livraison';
                Image = Check;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    ControlVenteVN : Record "60026";
                begin
                    CLEAR(ControlVenteVN);
                    ControlVenteVN.SETRANGE(ControlVenteVN."No Chassis","Serial No.");
                    ControlVenteVN.SETRANGE("Document No","Source No.");
                    ControlVenteVN.SETRANGE( "Type Control",ControlVenteVN."Type Control"::"Avant Livraison");
                    IF NOT ControlVenteVN.FINDFIRST THEN
                       CreateControl();
                    PAGE.RUN(PAGE::"Fiche écriture préparation VN",Rec);
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
        RecControlGroup.SETRANGE(RecControlGroup."Type Control",RecControlGroup."Type Control"::"Avant Livraison");
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
              ControlVenteVN."Type Control"     := RecControlGroup."Type Control"::"Avant Livraison";
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
                  ControlVenteVN."Type Control"     := RecControlGroup."Type Control"::"Avant Livraison";
                  ControlVenteVN.Description        := '    ' +RecLineControl.Description;
                  IF ControlVenteVN.INSERT THEN IntLineNo+= 10000;
              UNTIL RecLineControl.NEXT = 0;
        UNTIL RecControlGroup.NEXT = 0;
    end;
}

