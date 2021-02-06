page 60388 "Ligne Réception11"
{
    // version Gestion RDV

    Caption = 'Ligne RDV';
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
                    Caption = 'No.RDV';
                }
                field("Code Client";"Code Client")
                {
                    Editable = false;
                }
                field("Nom Client";"Nom Client")
                {
                    Editable = true;
                }
                field("Préparer Planning";"Préparer Planning")
                {
                    Visible = false;
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
                }
                field("Source Réclamation";"Source Réclamation")
                {
                }
                field("Dossier No.";"Dossier No.")
                {
                    Editable = false;
                }
                field("Date Dossier";"Date Dossier")
                {
                    Editable = false;
                }
                field("No.Matricule";"No.Matricule")
                {
                    Editable = true;
                }
                field(Marque;Marque)
                {
                    Editable = false;
                }
                field(Gouvernerat;Gouvernerat)
                {
                }
                field("Symptom Code";"Symptom Code")
                {
                    Caption = 'Code Symptôme';
                }
                field("Intervention demandé /client";"Intervention demandé /client")
                {
                }
                field("Date Intervention souhaitée";"Date Intervention souhaitée")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Lieu de réparation";"Lieu de réparation")
                {
                }
                field(Etat;Etat)
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Groupe ressources";"Groupe ressources")
                {

                    trigger OnValidate();
                    var
                        LIintnbrRDV2 : Integer;
                    begin
                        //AK150419

                        LIintnbrRDV2:=0;
                        RecResourceGroup.RESET;
                        RecResourceGroup.SETRANGE("No.","Groupe ressources");
                        RecResourceGroup.SETFILTER("Date Filter", '%1',"Date Intervention confirmée");
                        IF RecResourceGroup.FINDSET THEN
                          REPEAT
                              RecResourceGroup.CALCFIELDS("Sum RDV");
                              LIintnbrRDV2+=RecResourceGroup."Sum RDV";

                          UNTIL RecResourceGroup.NEXT=0 ;

                        //RecResponsibilityCenter.GET("Responsibility Center");
                        IF (LIintnbrRDV2 > RecResourceGroup."NB RDV/J")   THEN
                          ERROR('Le Nbr MAX de RDV est atteint')
                        ELSE
                           MESSAGE('%1 /%2',LIintnbrRDV2,RecResourceGroup."NB RDV/J");

                        //ENDAK
                    end;
                }
                field("Nom groupe ressources";"Nom groupe ressources")
                {
                    Editable = false;
                }
                field("Reste à faire";"Reste à faire")
                {
                }
                field("heure debut";"heure debut")
                {
                }
                field("heure fin";"heure fin")
                {

                    trigger OnValidate();
                    begin
                        //ADD NM 110319
                        TESTFIELD("heure debut");
                        IF ("heure fin" > "heure debut") THEN  BEGIN
                         "Nbr. Heure"  := (("heure fin" - "heure debut")/60000)/60;
                         //"Run Time"         :=  "Run Time (Base)"
                        //END
                        //ELSE BEGIN
                        // "Nbr. Heure"  :=0;
                        END;
                        //END NM
                    end;
                }
                field("Nbr. Heure";"Nbr. Heure")
                {
                }
                field("Date mise en route";"Date mise en route")
                {
                    Editable = false;
                }
                field("Date Intervention confirmée";"Date Intervention confirmée")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Date préparation planning";"Date préparation planning")
                {
                    Visible = false;
                }
                field("Code technicien";"Code technicien")
                {
                    Caption = 'Code Réceptionnaire';
                }
                field("Nom technicien";"Nom technicien")
                {
                    Caption = 'Nom Réceptionnaire';
                    Editable = false;
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
            action("Vidange ")
            {
            }
        }
    }

    var
        "Ligneréception" : Record "60096";
        "Entêteréception12" : Page "60356";
        RecResourceGroup : Record "152";
}

