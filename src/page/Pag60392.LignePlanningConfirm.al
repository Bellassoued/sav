page 60392 "Ligne Planning Confirmé"
{
    // version Gestion RDV

    PageType = ListPart;
    SourceTable = Table60096;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Réception";"No. Réception")
                {
                }
                field("Code Client";"Code Client")
                {
                }
                field("Nom Client";"Nom Client")
                {
                }
                field("No. Téléphone";"No. Téléphone")
                {
                }
                field(Adresse;Adresse)
                {
                }
                field("Code article";"Code article")
                {
                }
                field("Désignation article";"Désignation article")
                {
                }
                field("No. chassis";"No. chassis")
                {
                }
                field("Source Réclamation";"Source Réclamation")
                {
                }
                field("Dossier No.";"Dossier No.")
                {
                }
                field("Date Dossier";"Date Dossier")
                {
                }
                field(Marque;Marque)
                {
                }
                field(Gouvernerat;Gouvernerat)
                {
                }
                field("Intervention demandé /client";"Intervention demandé /client")
                {
                }
                field("Date Intervention souhaitée";"Date Intervention souhaitée")
                {
                }
                field("Date Intervention confirmée";"Date Intervention confirmée")
                {
                }
                field(Etat;Etat)
                {
                }
                field("Motif clôture planning";"Motif clôture planning")
                {
                }
                field("Reste à faire";"Reste à faire")
                {
                }
                field("Commentaire Technicient";"Commentaire Technicient")
                {
                }
                field("Nbr. Heure";"Nbr. Heure")
                {
                }
                field("Date mise en route";"Date mise en route")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Créer Planning")
            {

                trigger OnAction();
                begin

                     IF CONFIRM('¨tes cous sûre de vouloir créer un planning des interventions pour ces lignes de réclamations ?',TRUE,FALSE) THEN
                     BEGIN
                      CLEAR(EnteteplanningIntervention);
                      EnteteplanningIntervention.Désignation := 'Planning d''intervention du :' + FORMAT(WORKDATE) + '' + 'jusqu''a le .......' ;
                      EnteteplanningIntervention.INSERT(TRUE);

                      CLEAR(Ligneréception);
                      Ligneréception.SETFILTER("No. Réception",'<>%1','');
                      Ligneréception.SETFILTER("Dossier No.",'<>%1','');
                      Ligneréception.SETFILTER("Accepter Réception",'%1',TRUE);
                      Ligneréception.SETFILTER("Planning Confirmé" ,'%1',TRUE);
                      Ligneréception.SETFILTER("No. Planning",'%1','');
                      Ligneréception.FIND('-');
                      REPEAT
                        Ligneréception."No. Planning" := EnteteplanningIntervention."No. Planning";
                        Ligneréception.MODIFY;
                      UNTIL Ligneréception.NEXT = 0;
                     END;
                end;
            }
        }
    }

    var
        EnteteplanningIntervention : Record "60097";
        "Ligneréception" : Record "60096";
}

