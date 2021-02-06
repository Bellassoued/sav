page 50177 "Liste Voitures Populaire VPP"
{
    // version W H VPP

    CardPageID = "Fiche Inscription VPP";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table50112;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N° Séquence";"N° Séquence")
                {
                }
                field("N° de Reservation";"N° de Reservation")
                {
                    Caption = 'N° d''inscription';
                }
                field(Statut;Statut)
                {
                }
                field(Nom;Nom)
                {
                }
                field(Prénom;Prénom)
                {
                }
                field("N° CIN";"N° CIN")
                {
                }
                field("Date d'inscription";"Date d'inscription")
                {
                    Editable = false;
                }
                field("DateT Inscription";"DateT Inscription")
                {
                    Editable = false;
                }
                field(Profission;Profission)
                {
                    Caption = 'Profession';
                }
                field("Etat Civil";"Etat Civil")
                {
                }
                field(Adresse;Adresse)
                {
                }
                field("No. Bord Lié";"No. Bord Lié")
                {
                }
                field("Statut Bord Lié";"Statut Bord Lié")
                {
                }
                field("Code vendeur";"Code vendeur")
                {
                }
                field("N° Téléphone";"N° Téléphone")
                {
                }
                field("N° Téléphone 2";"N° Téléphone 2")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(;Outlook)
            {
            }
            systempart(;Notes)
            {
            }
            systempart(;MyNotes)
            {
            }
            systempart(;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF "No. Bord Lié" <> '' THEN
          BEGIN
            PaymentHeader.GET("No. Bord Lié");
            PaymentHeader.CALCFIELDS("Status Name");
            "Statut Bord Lié" := PaymentHeader."Status Name";

          END;
    end;

    trigger OnOpenPage();
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup.Admin_Vente_VN THEN
          BEGIN
            FILTERGROUP(0);
            SETRANGE("Code vendeur",UserSetup."Salespers./Purch. Code");
            FILTERGROUP(2);
          END;
    end;

    var
        PaymentHeader : Record "10865";
        PaymentStatus : Record "10861";
        UserSetup : Record "91";
}

