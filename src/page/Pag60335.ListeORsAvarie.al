page 60335 "Liste ORs Avarie"
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
                      WHERE(Service Type=CONST(Big Service),
                            Created By=CONST(GRPLOUKIL\MOHAMED.SGHAIER));

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
                    StyleExpr = TRUE;
                }
                field("N° OR Archive";"N° OR Archive")
                {
                    Caption = 'N° OR Archive Incadea';
                }
                field("Service Item Description";"Service Item Description")
                {
                }
                field(VIN;VIN)
                {
                }
                field(Matricule;Matricule)
                {
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    CaptionML = ENU='Vehicle No.',
                                FRA='Num Véhicule';
                    Editable = false;
                }
                field(Kilométrage;Kilométrage)
                {
                }
                field("Status SR";"Status SR")
                {
                    Caption = 'Status';
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field("Creation date";"Creation date")
                {
                }
                field("Heur creation";"Heur creation")
                {
                }
                field("Reception Date";"Reception Date")
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
                field("Sales Date";"Sales Date")
                {
                }
                field("Date Facture OR";"Date Facture OR")
                {
                }
            }
        }
    }

    actions
    {
    }

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
}

