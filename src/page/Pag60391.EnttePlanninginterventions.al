page 60391 "Entête Planning interventions"
{
    // version Gestion RDV

    PageType = Document;
    SourceTable = Table60097;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No. Planning";"No. Planning")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field(Technicien;Technicien)
                {
                }
                field("Nom Technicien";"Nom Technicien")
                {
                }
                field("Technicien 2";"Technicien 2")
                {
                }
                field("Nom Technicien 2";"Nom Technicien 2")
                {
                }
                field(Date;Date)
                {
                }
                field("Créer par";"Créer par")
                {
                }
                field("Temps  de création";"Temps  de création")
                {
                }
                field(Vehicule;Vehicule)
                {
                }
                field(Statut;Statut)
                {
                }
            }
            part(;60392)
            {
                SubPageLink = No. Planning=FIELD(No. Planning);
            }
            part(;60393)
            {
                SubPageLink = Ancien No. planning=FIELD(No. Planning);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Clôturer")
            {

                trigger OnAction();
                begin

                    IF CONFIRM('ëtes vous sûre de voulour clôturer ce planning ?',TRUE,FALSE) THEN
                    CLEAR(Ligneréception);
                    CLEAR(Ligneréception);
                    Ligneréception.SETFILTER("No. Planning",'%1',"No. Planning");
                    Ligneréception.FIND('-');
                    REPEAT
                      IF (Ligneréception.Etat = 0) OR  (Ligneréception.Etat = 1) THEN
                         ERROR('Il existe des lignes non clôturer');
                      IF (Ligneréception.Etat = 3) OR  (Ligneréception.Etat = 4) THEN
                         Ligneréception.TESTFIELD("Motif clôture planning");
                      IF Ligneréception.Etat = 4 THEN // Reporter
                       BEGIN
                         Ligneréception.Etat := Ligneréception.Etat::Lancer;
                         Ligneréception."Planning Confirmé" := TRUE;
                         Ligneréception."No. Planning" := '';
                         Ligneréception."Ancien No. planning" := "No. Planning";
                         Ligneréception.MODIFY;
                       END;
                    UNTIL Ligneréception.NEXT = 0;
                    Statut := Statut::Clôturé ;
                    MODIFY;
                end;
            }
        }
    }

    var
        "Ligneréception" : Record "60096";
        Enteteplanning : Record "60097";
}

