page 60338 "Reception Dossier Livraison"
{
    PageType = List;
    SourceTable = Table5940;
    SourceTableView = WHERE(Préparation/Livraison=CONST(Livrer),
                            Emplacement=CONST(Chez client),
                            Date Livraison=FILTER(<>''),
                            DateReceptionDossierLivraison=FILTER(''));

    layout
    {
        area(content)
        {
            group()
            {
                field(DateReceptionDossierLivraison1;DateReceptionDossierLivraison1)
                {
                    Caption = 'Date Réception Dossier Livraison';
                }
            }
            repeater(Group)
            {
                Editable = false;
                field("Date Livraison";"Date Livraison")
                {
                }
                field("Serial No.";"Serial No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Couleur et garnissage";"Couleur et garnissage")
                {
                    Editable = false;
                }
                field(Chez;Emplacement)
                {
                    CaptionML = ENU='Chez',
                                FRA='Chez';
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Location of Service Item";"Location of Service Item")
                {
                }
                field("Sales Unit Price";"Sales Unit Price")
                {
                }
                field("Warranty Starting Date (Labor)";"Warranty Starting Date (Labor)")
                {
                }
                field("Statut PVN";"Statut PVN")
                {
                }
                field("Préparation/Livraison";"Préparation/Livraison")
                {
                }
                field("Statut Carte Grise";"Statut Carte Grise")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("No Préparation";"No Préparation")
                {
                }
                field("No. Bord. PVN";"No. Bord. PVN")
                {
                }
                field("Date Emission Bord. PVN";"Date Emission Bord. PVN")
                {
                }
                field("Heure Emission Bord. PVN";"Heure Emission Bord. PVN")
                {
                }
                field(Emplacement;GetBin("Serial No."))
                {
                    CaptionML = ENU='Emplacement',
                                FRA='Emplacement';
                }
                field(Livreur;Livreur)
                {
                }
                field("Count lin préparation";"Count lin préparation")
                {
                }
                field(Finition;Finition)
                {
                }
                field("Désignation couleur";"Désignation couleur")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Valider)
            {

                trigger OnAction();
                begin
                    IF DateReceptionDossierLivraison1<>0D THEN BEGIN

                      CurrPage.SETSELECTIONFILTER(ServiceItem);
                      //ServiceItem.COPY(Rec);
                    NBVehicules:=  ServiceItem.COUNT;
                    IF ServiceItem.FINDSET THEN BEGIN
                        //IF CONFIRM('Etes-vous sûr avoir reçu  %1 dossiers de livraisons?',TRUE) THEN BEGIN
                      REPEAT
                            ServiceItem.VALIDATE(DateReceptionDossierLivraison,DateReceptionDossierLivraison1);
                            ServiceItem.VALIDATE(DossierLivraisonRecu,CURRENTDATETIME);
                            ServiceItem.MODIFY;
                      UNTIL ServiceItem.NEXT=0;
                        //END;
                        MESSAGE('Date de réception dossier de livraison %1 validée pour %2 véhicules',DateReceptionDossierLivraison1,NBVehicules);
                      END;

                    END;
                    //CurrPage.UPDATE;
                end;
            }
        }
    }

    var
        DateReceptionDossierLivraison1 : Date;
        ServiceItem : Record "5940";
        NBVehicules : Integer;
}

