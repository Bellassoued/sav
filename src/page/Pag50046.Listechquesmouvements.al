page 50046 "Liste chèques mouvementés"
{
    // version Chéque @ DATASOFT 2013

    PageType = List;
    SourceTable = Table50017;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                }
                field("Code Nomenclature";"Code Nomenclature")
                {
                }
                field(Description;Description)
                {
                }
                field("Product Code";"Product Code")
                {
                }
                field(Statut;Statut)
                {
                }
                field("N° Bordereu";"N° Bordereu")
                {
                }
                field("Statut Bordereau";"Statut Bordereau")
                {
                }
                field("N° Statut";"N° Statut")
                {
                }
                field("Statut Modifiable";"Statut Modifiable")
                {
                }
                field("N° Ligne Bordereu";"N° Ligne Bordereu")
                {
                }
                field("N° Fournisseur";"N° Fournisseur")
                {
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Bloquer)
            {
                Caption = 'Bloquer';

                trigger OnAction();
                begin

                    IF NOT CONFIRM(Text003,FALSE) THEN EXIT;
                    Statut:=Statut::"1"; // Initial
                    "N° Bordereu":='';
                    "N° Ligne Bordereu":=0;
                    "Statut Bordereau":='';
                    "N° Statut":=0;
                    MODIFY;
                end;
            }
            action(Liberer)
            {
                Caption = 'Libérer';

                trigger OnAction();
                begin

                    //IF NOT "Statut Modifiable"  THEN ERROR(Text002);
                    IF NOT CONFIRM(Text001,FALSE) THEN EXIT;
                    Statut:=0; // Initial
                    "N° Bordereu":='';
                    "N° Ligne Bordereu":=0;
                    "Statut Bordereau":='';
                    "N° Statut":=0;
                    MODIFY;
                    EXIT;
                    RecPaymentLine.SETRANGE("No.","N° Bordereu") ;
                    RecPaymentLine.SETRANGE("No. chèque","Product Code");
                    IF RecPaymentLine.FINDFIRST THEN
                      BEGIN
                        Statut:=0; // Initial
                        "N° Bordereu":='';
                        "N° Ligne Bordereu":=0;
                        "Statut Bordereau":='';
                        "N° Statut":=0;
                        MODIFY;
                      END;
                end;
            }
        }
    }

    var
        RecPaymentLine : Record "10866";
        Text001 : Label 'Confirmer La libération De Ce Chéque';
        Text002 : Label 'Statut Bordereau ne Permet Pas De Libérer Ce Chaeque, Statut Doit Etre Initial';
        Text003 : Label 'Confirmer Le Bloquage De Ce Chéque';
}

