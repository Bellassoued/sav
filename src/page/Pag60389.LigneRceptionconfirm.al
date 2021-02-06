page 60389 "Ligne Réception à confirmé"
{
    // version Gestion RDV

    Editable = false;
    PageType = List;
    SourceTable = Table60096;
    SourceTableView = WHERE(Planning Confirmé=FILTER(No),
                            Dossier No.=FILTER(<>''));

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
                    Editable = false;
                }
                field("Nom Client";"Nom Client")
                {
                    Editable = false;
                }
                field("Préparer Planning";"Préparer Planning")
                {
                }
                field("No. Téléphone";"No. Téléphone")
                {
                    Editable = false;
                }
                field(Adresse;Adresse)
                {
                    Editable = false;
                }
                field("Code article";"Code article")
                {
                    Editable = false;
                }
                field("Désignation article";"Désignation article")
                {
                    Editable = false;
                }
                field("No. chassis";"No. chassis")
                {
                    Editable = false;
                }
                field("Accepter Réception";"Accepter Réception")
                {
                    Editable = false;
                }
                field("Source Réclamation";"Source Réclamation")
                {
                }
                field("Dossier No.";"Dossier No.")
                {
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Date Dossier";"Date Dossier")
                {
                    Editable = false;
                }
                field(Marque;Marque)
                {
                    Editable = false;
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
                field(Etat;Etat)
                {
                    Editable = false;
                }
                field("Reste à faire";"Reste à faire")
                {
                }
                field("heure debut";"heure debut")
                {
                    Editable = false;
                }
                field("heure fin";"heure fin")
                {
                    Editable = false;
                }
                field("Nbr. Heure";"Nbr. Heure")
                {
                }
                field("Date mise en route";"Date mise en route")
                {
                    Editable = false;
                }
                field("Date préparation planning";"Date préparation planning")
                {
                    Visible = false;
                }
                field("Date Intervention confirmée";"Date Intervention confirmée")
                {
                }
                field("Code technicien";"Code technicien")
                {
                }
                field("Nom technicien";"Nom technicien")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Confirmer Planning")
            {
                Visible = false;

                trigger OnAction();
                begin

                       IF CONFIRM('êtes vous sûre de vouloir confirmer le planning ?',TRUE,FALSE) THEN
                       BEGIN
                         Ligneréception.SETFILTER( "Préparer Planning",'%1',TRUE);
                         Ligneréception.SETFILTER("Planning Confirmé",'%1',FALSE);
                         Ligneréception.SETFILTER(Etat ,'%1',Ligneréception.Etat::Lancer);
                         Ligneréception.SETFILTER("Dossier No." ,'<>%1','');
                         Ligneréception.FIND('-');
                          REPEAT
                           Ligneréception."Planning Confirmé" := TRUE;
                           Ligneréception.MODIFY;
                          UNTIL  Ligneréception.NEXT = 0;
                      END
                end;
            }
            action("Consulter Ordre de Répataion")
            {
                Image = ViewRegisteredOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;
                PromotedOnly = false;

                trigger OnAction();
                begin
                    ReceptionSAV.RESET;
                    ReceptionSAV.SETRANGE("Reception No","Dossier No.");
                    IF ReceptionSAV.FINDFIRST THEN BEGIN
                      IF ReceptionSAV."Service Type"=ReceptionSAV."Service Type"::"Big Service" THEN BEGIN
                      CLEAR(FicheReceptionGrandeRéparat);
                      FicheReceptionGrandeRéparat.SETRECORD(ReceptionSAV);
                      FicheReceptionGrandeRéparat.SETTABLEVIEW(ReceptionSAV);
                      FicheReceptionGrandeRéparat.RUN;
                      END ELSE BEGIN
                          CLEAR(FicheReceptionCHRONO);
                          FicheReceptionCHRONO.SETRECORD(ReceptionSAV);
                          FicheReceptionCHRONO.SETTABLEVIEW(ReceptionSAV);
                          FicheReceptionCHRONO.RUN;
                        END;
                      END;
                end;
            }
        }
    }

    var
        "Ligneréception" : Record "60096";
        "Entêteréception12" : Page "60356";
        ReceptionSAV : Record "60008";
        "FicheReceptionGrandeRéparat" : Page "60018";
        FicheReceptionCHRONO : Page "70295";
}

