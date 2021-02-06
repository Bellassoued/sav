page 60019 "Liste Reception Grande Réparat"
{
    // version SAV Automobile

    CaptionML = ENU='Reception Big Reparation Card',
                FRA='Liste Reception Grande Réparation';
    CardPageID = "Fiche Reception Grande Réparat";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60008;
    SourceTableView = SORTING(Reception No)
                      ORDER(Ascending)
                      WHERE(Service Type=CONST(Big Service));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Style = Strong;
                    StyleExpr = Color;
                }
                field("N° OR Archive";"N° OR Archive")
                {
                    Caption = 'N° OR Archive Incadea';
                    StyleExpr = Color;
                }
                field("Service Item Description";"Service Item Description")
                {
                    StyleExpr = Color;
                }
                field(VIN;VIN)
                {
                    StyleExpr = Color;
                }
                field(Matricule;Matricule)
                {
                    StyleExpr = Color;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    CaptionML = ENU='Vehicle No.',
                                FRA='Num Véhicule';
                    Editable = false;
                    StyleExpr = Color;
                }
                field(Kilométrage;Kilométrage)
                {
                    StyleExpr = Color;
                }
                field("Status SR";"Status SR")
                {
                    Caption = 'Status';
                    Style = AttentionAccent;
                    StyleExpr = Color;
                }
                field("Customer No.";"Customer No.")
                {
                    StyleExpr = Color;
                }
                field(Name;Name)
                {
                    StyleExpr = Color;
                }
                field(Priority;Priority)
                {
                    StyleExpr = Color;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    StyleExpr = color;
                }
                field("Created By";"Created By")
                {
                    StyleExpr = color;
                }
                field("Model Code";"Model Code")
                {
                    StyleExpr = color;
                }
                field("Creation date";"Creation date")
                {
                    StyleExpr = color;
                }
                field("Heur creation";"Heur creation")
                {
                    StyleExpr = color;
                }
                field("Reception Date";"Reception Date")
                {
                    StyleExpr = color;
                }
                field("Shipment date Request";"Shipment date Request")
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Type de garantie";"Type de garantie")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Sous Type de garantie";"Sous Type de garantie")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Approval Warranty Pick Request";"Approval Warranty Pick Request")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Approval Warranty Service Post";"Approval Warranty Service Post")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Intern;Intern)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Intern Type";"Intern Type")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Retour;Retour)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("No Réception Origine";"No Réception Origine")
                {
                    Caption = 'Num OR Origine';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("RC Garage";"RC Garage")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("No Réception Origine RC";"No Réception Origine RC")
                {
                    Caption = 'Num OR Origine RC';
                }
                field("Assurances conventionnées";"Assurances conventionnées")
                {
                }
                field("Code assureur conventionné";"Code assureur conventionné")
                {
                }
                field("Nom assureur conventionné";"Nom assureur conventionné")
                {
                }
                field("Assurances groupe";"Assurances groupe")
                {
                }
                field("Type assurances groupe";"Type assurances groupe")
                {
                }
                field(Warranty;Warranty)
                {
                    CaptionML = ENU='Garantie',
                                FRA='Garantie';
                }
                field(Personnel;Personnel)
                {
                }
                field("Last repair No.";"Last repair No.")
                {
                    CaptionML = ENU='Last repair No.',
                                FRA='N° dernière intervention';
                }
                field("Warranty Starting Date (Labor)";"Warranty Starting Date (Labor)")
                {
                }
                field("Warranty Ending Date (Labor)";"Warranty Ending Date (Labor)")
                {
                }
                field("Warranty Starting Date (Parts)";"Warranty Starting Date (Parts)")
                {
                }
                field("Warranty Ending Date (Parts)";"Warranty Ending Date (Parts)")
                {
                }
                field("Warranty % (Parts)";"Warranty % (Parts)")
                {
                }
                field("Warranty % (Labor)";"Warranty % (Labor)")
                {
                }
                field("Response Time (Hours)";"Response Time (Hours)")
                {
                }
                field("Installation Date";"Installation Date")
                {
                }
                field("Sales Date";"Sales Date")
                {
                }
                field("Commentaire SAV";"Commentaire SAV")
                {
                }
                field("Avance sur commande";"Avance sur commande")
                {
                }
                field("Type avance";"Type avance")
                {
                }
                field("TWC Number";"TWC Number")
                {
                }
                field("TWC Labor Hours";"TWC Labor Hours")
                {
                }
                field("TWC parts Amount";"TWC parts Amount")
                {
                }
                field("TWC Situation";"TWC Situation")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
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
        //SM 26112020
        color := '';
        //Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Compagne,Garantie  Constructeur+Campagne,
        IF "Type de garantie" = "Type de garantie"::"Payant par Client" THEN
          color :='Standard';

        IF "Type de garantie" = "Type de garantie"::Compagne THEN
          color :=  'Ambiguous';

        IF ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur") OR ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur+Campagne") OR ("Type de garantie" = "Type de garantie"::"Garantie  Prolongé")THEN
          color := 'Unfavorable';
    end;

    trigger OnOpenPage();
    begin




                IF UserMgt.GetServiceFilter <> '' THEN BEGIN
                  FILTERGROUP(2);
                  SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
                  FILTERGROUP(0);
                END;

                FILTERGROUP(2);
                SETRANGE("Service Type","Service Type"::"Big Service");
                FILTERGROUP(0);
    end;

    var
        UserMgt : Codeunit "5700";
        UserSetup : Record "91";
        color : Text;
}

