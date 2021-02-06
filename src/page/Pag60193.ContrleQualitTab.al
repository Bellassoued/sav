page 60193 "Contrôle Qualité Tab"
{
    PageType = Card;
    PopulateAllFields = false;
    SourceTable = Table70070;

    layout
    {
        area(content)
        {
            group("Général")
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                field(Equipe;Equipe)
                {
                }
                field("Retour Atelier";"Retour Atelier")
                {
                }
                field("No.";"No.")
                {
                    Editable = false;
                }
                field(Nom;Nom)
                {
                    Visible = false;
                }
                field(Prénom;Prénom)
                {
                    Visible = false;
                }
                field(Immatriculation;Immatriculation)
                {
                    Visible = false;
                }
                field("N° de CT";"N° Commande de travaux")
                {
                    Editable = false;
                }
                field(Km;Km)
                {
                    Visible = false;
                }
                field("Entretien périodique";"Entretien périodique")
                {
                    Visible = false;
                }
                field(DS;DS)
                {
                }
                field("Bon Pour Facture";"Bon Pour Facture")
                {
                }
                field(Conformité;Conformité)
                {
                }
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Rows;
                    field(Commentaire;Commentaire)
                    {
                        Caption = 'Commentaires';
                        ColumnSpan = 16;
                        MultiLine = true;
                        Width = 1000;
                    }
                }
            }
            group(CDP)
            {
                Caption = '1 - Contrôle documentaire préalable';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            field(;'')
                            {
                            }
                            field("Conformité";'')
                            {
                                Caption = 'Conformité';
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                            }
                            field(;'')
                            {
                            }
                        }
                        grid()
                        {
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                            field("Rectifié";'')
                            {
                                Caption = 'Rectifié';
                            }
                        }
                        grid()
                        {
                            field("1.1 Les fiches «Explication des travaux et Conseil sur l’entretien» et «Check-list Plan d’Entretien» (si entretien) sont présentes, signées et renseignées";'')
                            {
                                Caption = '1.1 Les fiches «Explication des travaux et Conseil sur l’entretien» et «Check-list Plan d’Entretien» (si entretien) sont présentes, signées et renseignées';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP1T;CDP1T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens("CDP Présence Fiches",CDP1T,CDP1F,CDP1R,CDP1E);

                                    IF CDP1T THEN
                                      BEGIN
                                        CDP1R:=FALSE;
                                        CDP1F:=FALSE;
                                        CDP1E:=FALSE;
                                        Rec."CDP Présence Fiches":="CDP Présence Fiches"::Oui;
                                      END
                                end;
                            }
                            field(CDP1F;CDP1F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens("CDP Présence Fiches",CDP1T,CDP1F,CDP1R,CDP1E);
                                    IF CDP1F THEN
                                      BEGIN
                                        CDP1R:=FALSE;
                                        CDP1T:=FALSE;
                                        CDP1E:=FALSE;
                                        Rec."CDP Présence Fiches":="CDP Présence Fiches"::Non;
                                        END
                                end;
                            }
                            field(CDP1R;CDP1R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens("CDP Présence Fiches",CDP1T,CDP1F,CDP1R,CDP1E);
                                    IF CDP1R THEN
                                      BEGIN
                                        CDP1T:=FALSE;
                                        CDP1F:=FALSE;
                                        CDP1E:=FALSE;
                                        Rec."CDP Présence Fiches":="CDP Présence Fiches"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.2 Chaque rubrique des contrôles visuels effectués lors du tour du véhicule est renseignée";'')
                            {
                                Caption = '1.2 Chaque rubrique des contrôles visuels effectués lors du tour du véhicule est renseignée';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP2T;CDP2T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin

                                    //DégagerOptionBooléens(Rec."CDP Rubriques Renseignées",CDP2E,CDP2T,CDP2F,CDP2R);
                                    IF CDP2T THEN
                                      BEGIN
                                        CDP2R:=FALSE;
                                        CDP2F:=FALSE;
                                        CDP2E:=FALSE;
                                        Rec."CDP Rubriques Renseignées":="CDP Rubriques Renseignées"::Oui;
                                        END;
                                end;
                            }
                            field(CDP2F;CDP2F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Rubriques Renseignées",CDP2E,CDP2T,CDP2F,CDP2R);
                                    IF CDP2F THEN
                                      BEGIN
                                        CDP2R:=FALSE;
                                        CDP2T:=FALSE;
                                        CDP2E:=FALSE;
                                        Rec."CDP Rubriques Renseignées":="CDP Rubriques Renseignées"::Non;
                                        END
                                end;
                            }
                            field(CDP2R;CDP2R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Rubriques Renseignées",CDP2E,CDP2T,CDP2F,CDP2R);
                                    IF CDP2R THEN
                                      BEGIN
                                        CDP2T:=FALSE;
                                        CDP2F:=FALSE;
                                        CDP2E:=FALSE;
                                        Rec."CDP Rubriques Renseignées":="CDP Rubriques Renseignées"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.3 La vérification des campagnes a été réalisée";'')
                            {
                                Caption = '1.3 La vérification des campagnes a été réalisée';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP3T;CDP3T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Vérification Compagnes",CDP3E,CDP3T,CDP3F,CDP3R);
                                    IF CDP3T THEN
                                      BEGIN
                                        CDP3R:=FALSE;
                                        CDP3F:=FALSE;
                                        CDP3E:=FALSE;
                                        Rec."CDP Vérification Compagnes":="CDP Vérification Compagnes"::Oui;
                                        END
                                end;
                            }
                            field(CDP3F;CDP3F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Vérification Compagnes",CDP3E,CDP3T,CDP3F,CDP3R);
                                    IF CDP3F THEN
                                      BEGIN
                                        CDP3R:=FALSE;
                                        CDP3T:=FALSE;
                                        CDP3E:=FALSE;
                                        Rec."CDP Vérification Compagnes":="CDP Vérification Compagnes"::Non;
                                        END
                                end;
                            }
                            field(CDP3R;CDP3R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //"DégagerOptionBooléens"(Rec."CDP Vérification Compagnes",CDP3E,CDP3T,CDP3F,CDP3R);
                                    IF CDP3R THEN
                                      BEGIN
                                        CDP3T:=FALSE;
                                        CDP3F:=FALSE;
                                        CDP3E:=FALSE;
                                        Rec."CDP Vérification Compagnes":="CDP Vérification Compagnes"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.4 L'impression de l'écran de synthèse (ou de l'historique Garantie) est présente dans le dossier";'')
                            {
                                Caption = '1.4 L''impression de l''écran de synthèse (ou de l''historique Garantie) est présente dans le dossier';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP4T;CDP4T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Impression Ecran synthèse",CDP4E,CDP4T,CDP4F,CDP4R);
                                    IF CDP4T THEN
                                      BEGIN
                                        CDP4R:=FALSE;
                                        CDP4F:=FALSE;
                                        CDP4E:=FALSE;
                                        Rec."CDP Impression Ecran synthèse":="CDP Impression Ecran synthèse"::Oui;
                                        END
                                end;
                            }
                            field(CDP4F;CDP4F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Impression Ecran synthèse",CDP4E,CDP4T,CDP4F,CDP4R);
                                    IF CDP4F THEN
                                      BEGIN
                                        CDP4R:=FALSE;
                                        CDP4T:=FALSE;
                                        CDP4E:=FALSE;
                                        Rec."CDP Impression Ecran synthèse":="CDP Impression Ecran synthèse"::Non;
                                        END
                                end;
                            }
                            field(CDP4R;CDP4R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Impression Ecran synthèse",CDP4E,CDP4T,CDP4F,CDP4R);
                                    IF CDP4R THEN
                                      BEGIN
                                        CDP4T:=FALSE;
                                        CDP4F:=FALSE;
                                        CDP4E:=FALSE;
                                        Rec."CDP Impression Ecran synthèse":="CDP Impression Ecran synthèse"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.5 La commande de travaux est signée par le client et le CCS";'')
                            {
                                Caption = '1.5 La commande de travaux est signée par le client et le CCS';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP5T;CDP5T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Commande Signée Client CCS",CDP5E,CDP5T,CDP5F,CDP5R);
                                    IF CDP5T THEN
                                      BEGIN
                                        CDP5R:=FALSE;
                                        CDP5F:=FALSE;
                                        CDP5E:=FALSE;
                                        Rec."CDP Commande Signée Client CCS":="CDP Commande Signée Client CCS"::Oui;
                                        END
                                end;
                            }
                            field(CDP5F;CDP5F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Commande Signée Client CCS",CDP5E,CDP5T,CDP5F,CDP5R);
                                    IF CDP5F THEN
                                      BEGIN
                                        CDP5R:=FALSE;
                                        CDP5T:=FALSE;
                                        CDP5E:=FALSE;
                                        Rec."CDP Commande Signée Client CCS":="CDP Commande Signée Client CCS"::Non;
                                        END
                                end;
                            }
                            field(CDP5R;CDP5R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Commande Signée Client CCS",CDP5E,CDP5T,CDP5F,CDP5R);
                                    IF CDP5R THEN
                                      BEGIN
                                        CDP5T:=FALSE;
                                        CDP5F:=FALSE;
                                        CDP5E:=FALSE;
                                        Rec."CDP Commande Signée Client CCS":="CDP Commande Signée Client CCS"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.6 La commande de travaux est signée par le compagnon et les travaux réalisés sont cochés";'')
                            {
                                Caption = '1.6 La commande de travaux est signée par le compagnon et les travaux réalisés sont cochés';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP6T;CDP6T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP CommandeSgnée Compagnon",CDP6E,CDP6T,CDP6F,CDP6R);
                                    IF CDP6T THEN
                                      BEGIN
                                        CDP6F:=FALSE;
                                        CDP6R:=FALSE;
                                        CDP6E:=FALSE;
                                        Rec."CDP CommandeSgnée Compagnon":="CDP CommandeSgnée Compagnon"::Oui;
                                        END
                                end;
                            }
                            field(CDP6F;CDP6F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP CommandeSgnée Compagnon",CDP6E,CDP6T,CDP6F,CDP6R);
                                    IF CDP6F THEN
                                      BEGIN
                                        CDP6T:=FALSE;
                                        CDP6R:=FALSE;
                                        CDP6E:=FALSE;
                                        Rec."CDP CommandeSgnée Compagnon":="CDP CommandeSgnée Compagnon"::Non;
                                        END
                                end;
                            }
                            field(CDP6R;CDP6R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP CommandeSgnée Compagnon",CDP6E,CDP6T,CDP6F,CDP6R);
                                    IF CDP6R THEN
                                      BEGIN
                                        CDP6T:=FALSE;
                                        CDP6F:=FALSE;
                                        CDP6E:=FALSE;
                                        Rec."CDP CommandeSgnée Compagnon":="CDP CommandeSgnée Compagnon"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.7 Le montant de l'estimation est reporté sur la commande de travaux";'')
                            {
                                Caption = '1.7 Le montant de l''estimation est reporté sur la commande de travaux';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP7T;CDP7T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Montant Estimation Reporté",CDP7E,CDP7T,CDP7F,CDP7R);
                                    IF CDP7T THEN
                                      BEGIN
                                        CDP7F:=FALSE;
                                        CDP7R:=FALSE;
                                        CDP7E:=FALSE;
                                        Rec."CDP Montant Estimation Reporté":="CDP Montant Estimation Reporté"::Oui;
                                        END
                                end;
                            }
                            field(CDP7F;CDP7F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Montant Estimation Reporté",CDP7E,CDP7T,CDP7F,CDP7R);
                                    IF CDP7F THEN
                                      BEGIN
                                        CDP7T:=FALSE;
                                        CDP7R:=FALSE;
                                        CDP7E:=FALSE;
                                        Rec."CDP Montant Estimation Reporté":="CDP Montant Estimation Reporté"::Non;
                                        END
                                end;
                            }
                            field(CDP7R;CDP7R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Montant Estimation Reporté",CDP7E,CDP7T,CDP7F,CDP7R);
                                    IF CDP7R THEN
                                      BEGIN
                                        CDP7T:=FALSE;
                                        CDP7F:=FALSE;
                                        CDP7E:=FALSE;
                                        Rec."CDP Montant Estimation Reporté":="CDP Montant Estimation Reporté"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.8 La réalisation et les résultats de l'essai éventuel, sont mentionnés";'')
                            {
                                Caption = '1.8 La réalisation et les résultats de l''essai éventuel, sont mentionnés';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP8T;CDP8T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Résultats Essai Mentionnés",CDP8E,CDP8T,CDP8F,CDP8R);
                                    IF CDP8T THEN
                                      BEGIN
                                        CDP8R:=FALSE;
                                        CDP8F:=FALSE;
                                        CDP8E:=FALSE;
                                        Rec."CDP Résultats Essai Mentionnés":="CDP Résultats Essai Mentionnés"::Oui;
                                        END
                                end;
                            }
                            field(CDP8F;CDP8F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Résultats Essai Mentionnés",CDP8E,CDP8T,CDP8F,CDP8R);
                                    IF CDP8F THEN
                                      BEGIN
                                        CDP8R:=FALSE;
                                        CDP8T:=FALSE;
                                        CDP8E:=FALSE;
                                        Rec."CDP Résultats Essai Mentionnés":="CDP Résultats Essai Mentionnés"::Non;
                                        END
                                end;
                            }
                            field(CDP8R;CDP8R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Résultats Essai Mentionnés",CDP8E,CDP8T,CDP8F,CDP8R);
                                    IF CDP8R THEN
                                      BEGIN
                                        CDP8F:=FALSE;
                                        CDP8T:=FALSE;
                                        CDP8E:=FALSE;
                                        Rec."CDP Résultats Essai Mentionnés":="CDP Résultats Essai Mentionnés"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.9 La facture du sous-traitant (ou équivalent) est présente dans le dossier (le cas échéant)";'')
                            {
                                Caption = '1.9 La facture du sous-traitant (ou équivalent) est présente dans le dossier (le cas échéant)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP9T;CDP9T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Facture STPrésente",CDP9E,CDP9T,CDP9F,CDP9R);
                                    IF CDP9T THEN
                                      BEGIN
                                        CDP9F:=FALSE;
                                        CDP9R:=FALSE;
                                        CDP9E:=FALSE;
                                        Rec."CDP Facture STPrésente":="CDP Facture STPrésente"::Oui;
                                        END
                                end;
                            }
                            field(CDP9F;CDP9F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Facture STPrésente",CDP9E,CDP9T,CDP9F,CDP9R);
                                    IF CDP9F THEN
                                      BEGIN
                                        CDP9T:=FALSE;
                                        CDP9R:=FALSE;
                                        CDP9E:=FALSE;
                                        Rec."CDP Facture STPrésente":="CDP Facture STPrésente"::Non;
                                        END
                                end;
                            }
                            field(CDP9R;CDP9R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Facture STPrésente",CDP9E,CDP9T,CDP9F,CDP9R);
                                    IF CDP9R THEN
                                      BEGIN
                                        CDP9F:=FALSE;
                                        CDP9T:=FALSE;
                                        CDP9E:=FALSE;
                                        Rec."CDP Facture STPrésente":="CDP Facture STPrésente"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.10 Les travaux supplémentaires éventuels sont notés sur la CT et l’estimation complémentaire est acceptée par le client";'')
                            {
                                Caption = '1.10 Les travaux supplémentaires éventuels sont notés sur la CT et l’estimation complémentaire est acceptée par le client';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP10T;CDP10T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP TR. Supp. Notés CT Accepté",CDP10E,CDP10T,CDP10F,CDP10R);
                                    IF CDP10T THEN
                                      BEGIN
                                        CDP10R:=FALSE;
                                        CDP10F:=FALSE;
                                        CDP10E:=FALSE;
                                        Rec."CDP TR. Supp. Notés CT Accepté":="CDP TR. Supp. Notés CT Accepté"::Oui;
                                        END
                                end;
                            }
                            field(CDP10F;CDP10F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP TR. Supp. Notés CT Accepté",CDP10E,CDP10T,CDP10F,CDP10R);
                                    IF CDP10F THEN
                                      BEGIN
                                        CDP10R:=FALSE;
                                        CDP10T:=FALSE;
                                        CDP10E:=FALSE;
                                        Rec."CDP TR. Supp. Notés CT Accepté":="CDP TR. Supp. Notés CT Accepté"::Non;
                                        END
                                end;
                            }
                            field(CDP10R;CDP10R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP TR. Supp. Notés CT Accepté",CDP10E,CDP10T,CDP10F,CDP10R);
                                    IF CDP10R THEN
                                      BEGIN
                                        CDP10T:=FALSE;
                                        CDP10F:=FALSE;
                                        CDP10E:=FALSE;
                                        Rec."CDP TR. Supp. Notés CT Accepté":="CDP TR. Supp. Notés CT Accepté"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("1.11 Le cas échéant, les relevés de mesures sont présents dans le dossier (climatisation, batterie, géométrie, …)";'')
                            {
                                Caption = '1.11 Le cas échéant, les relevés de mesures sont présents dans le dossier (climatisation, batterie, géométrie, …)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CDP11T;CDP11T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Présence Relevés Mesures",CDP11E,CDP11T,CDP11F,CDP11R);
                                    IF CDP11T THEN
                                      BEGIN
                                        CDP11R:=FALSE;
                                        CDP11F:=FALSE;
                                        CDP11E:=FALSE;
                                        Rec."CDP Présence Relevés Mesures":="CDP Présence Relevés Mesures"::Oui;
                                        END
                                end;
                            }
                            field(CDP11F;CDP11F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Présence Relevés Mesures",CDP11E,CDP11T,CDP11F,CDP11R);
                                    IF CDP11F THEN
                                      BEGIN
                                        CDP11R:=FALSE;
                                        CDP11T:=FALSE;
                                        CDP11E:=FALSE;
                                        Rec."CDP Présence Relevés Mesures":="CDP Présence Relevés Mesures"::Non;
                                        END
                                end;
                            }
                            field(CDP11R;CDP11R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CDP Présence Relevés Mesures",CDP11E,CDP11T,CDP11F,CDP11R);
                                    IF CDP11R THEN
                                      BEGIN
                                        CDP11T:=FALSE;
                                        CDP11F:=FALSE;
                                        CDP11E:=FALSE;
                                        Rec."CDP Présence Relevés Mesures":="CDP Présence Relevés Mesures"::Rectifié;
                                        END
                                end;
                            }
                        }
                    }
                }
            }
            group(CSV)
            {
                Caption = '2 - Contrôle statique du véhicule';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                        }
                        grid()
                        {
                            field(;'')
                            {
                            }
                            field("Conformité";'')
                            {
                                Caption = 'Conformité';
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                            }
                            field(;'')
                            {
                            }
                        }
                        grid()
                        {
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                            field("Rectifié";'')
                            {
                                Caption = 'Rectifié';
                            }
                        }
                        grid()
                        {
                            field("2.1 Les travaux réalisés sont conformes au contenu de la commande de travaux (demande client, garantie, campagne, contrat service, …)";'')
                            {
                                Caption = '2.1 Les travaux réalisés sont conformes au contenu de la commande de travaux (demande client, garantie, campagne, contrat service, …)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV1T;CSV1T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Brouillard",CSV10E,CSV1T,CSV10F,CDP1R);
                                    IF CSV1T THEN
                                      BEGIN
                                        CSV1R:=FALSE;
                                        CSV1F:=FALSE;
                                        CSV1E:=FALSE;
                                        Rec."CSV Tr. Conformes à la Command":="CSV Tr. Conformes à la Command"::Oui;
                                        END;
                                end;
                            }
                            field(CSV1F;CSV1F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Tr. Conformes à la Command",CSV10E,CSV1T,CSV10F,CDP1R);
                                    IF CSV1F THEN
                                      BEGIN
                                        CSV1R:=FALSE;
                                        CSV1T:=FALSE;
                                        CSV1E:=FALSE;
                                        Rec."CSV Tr. Conformes à la Command":="CSV Tr. Conformes à la Command"::Non;
                                        END
                                end;
                            }
                            field(CSV1R;CSV1R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Brouillard",CSV10E,CSV1T,CSV10F,CDP1R);
                                    IF CSV1R THEN
                                      BEGIN
                                        CSV1T:=FALSE;
                                        CSV1F:=FALSE;
                                        CSV1E:=FALSE;
                                        Rec."CSV Tr. Conformes à la Command":="CSV Tr. Conformes à la Command"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.2 Les éléments concernés par la réparation fonctionnent correctement";'')
                            {
                                Caption = '2.2 Les éléments concernés par la réparation fonctionnent correctement';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV2T;CSV2T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eléments Réparés OK",CSV2E,CSV2T,CSV2F,CSV2R);
                                    IF CSV2T THEN
                                      BEGIN
                                        CSV2F:=FALSE;
                                        CSV2R:=FALSE;
                                        CSV2E:=FALSE;
                                        Rec."CSV Eléments Réparés OK":="CSV Eléments Réparés OK"::Oui;
                                        END
                                end;
                            }
                            field(CSV2F;CSV2F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eléments Réparés OK",CSV2E,CSV2T,CSV2F,CSV2R);
                                    IF CSV2F THEN
                                      BEGIN
                                        CSV2R:=FALSE;
                                        CSV2T:=FALSE;
                                        CSV2E:=FALSE;
                                        Rec."CSV Eléments Réparés OK":="CSV Eléments Réparés OK"::Non;
                                        END
                                end;
                            }
                            field(CSV2R;CSV2R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CF Date Heure A Jour",CSV2E,CSV2T,CSV2F,CSV2R);
                                    IF CSV2R THEN
                                      BEGIN
                                        CSV2T:=FALSE;
                                        CSV2F:=FALSE;
                                        CSV2E:=FALSE;
                                        Rec."CSV Eléments Réparés OK":="CSV Eléments Réparés OK"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.3 Les niveaux ont été contrôlés : huile moteur, liquide de refroidissement, liquide de frein, liquide de direction, liquide de lave-glace";'')
                            {
                                Caption = '2.3 Les niveaux ont été contrôlés : huile moteur, liquide de refroidissement, liquide de frein, liquide de direction, liquide de lave-glace';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV3T;CSV3T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Niveaux contrôlés",CSV3E,CSV3T,CSV3F,CSV3R);
                                    IF CSV3T THEN
                                      BEGIN
                                        CSV3R:=FALSE;
                                        CSV3F:=FALSE;
                                        CSV3E:=FALSE;
                                        Rec."CSV Niveaux contrôlés":="CSV Niveaux contrôlés"::Oui;
                                        END
                                end;
                            }
                            field(CSV3F;CSV3F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Niveaux contrôlés",CSV3E,CSV3T,CSV3F,CSV3R);
                                    IF CSV3F THEN
                                      BEGIN
                                        CSV3R:=FALSE;
                                        CSV3T:=FALSE;
                                        CSV3E:=FALSE;
                                        Rec."CSV Niveaux contrôlés":="CSV Niveaux contrôlés"::Non;
                                        END
                                end;
                            }
                            field(CSV3R;CSV3R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Niveaux contrôlés",CSV3E,CSV3T,CSV3F,CSV3R);
                                    IF CSV3R THEN
                                      BEGIN
                                        CSV3E:=FALSE;
                                        CSV3T:=FALSE;
                                        CSV3F:=FALSE;
                                        Rec."CSV Niveaux contrôlés":="CSV Niveaux contrôlés"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.4 Les éclairages ont été contrôlés (position, croisement, clignotant et antibrouillard, avant et arrière, stop et recul, éclairages intérieurs)";'')
                            {
                                Caption = '2.4 Les éclairages ont été contrôlés (position, croisement, clignotant et antibrouillard, avant et arrière, stop et recul, éclairages intérieurs)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV4T;CSV4T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eclairages Contrôlés",CSV4E,CSV4T,CSV4F,CSV4R);
                                    IF CSV4T THEN
                                      BEGIN
                                        CSV4R:=FALSE;
                                        CSV4F:=FALSE;
                                        CSV4E:=FALSE;
                                        Rec."CSV Eclairages Contrôlés":="CSV Eclairages Contrôlés"::Oui;
                                        END
                                end;
                            }
                            field(CSV4F;CSV4F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eclairages Contrôlés",CSV4E,CSV4T,CSV4F,CSV4R);
                                    IF CSV4F THEN
                                      BEGIN
                                        CSV4R:=FALSE;
                                        CSV4T:=FALSE;
                                        CSV4E:=FALSE;
                                        Rec."CSV Eclairages Contrôlés":="CSV Eclairages Contrôlés"::Non;
                                        END
                                end;
                            }
                            field(CSV4R;CSV4R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eclairages Contrôlés",CSV4E,CSV4T,CSV4F,CSV4R);
                                    IF CSV4R THEN
                                      BEGIN
                                        CSV4F:=FALSE;
                                        CSV4T:=FALSE;
                                        CSV4E:=FALSE;
                                        Rec."CSV Eclairages Contrôlés":="CSV Eclairages Contrôlés"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.5 Tous les témoins d'alerte au tableau de bord sont éteints après démarrage";'')
                            {
                                Caption = '2.5 Tous les témoins d''alerte au tableau de bord sont éteints après démarrage';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV5T;CSV5T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CPV Nettoyage Int. Fait",CSV5E,CSV5T,CSV5F,CSV5R);
                                    IF CSV5T THEN
                                      BEGIN
                                        CSV5R:=FALSE;
                                        CSV5F:=FALSE;
                                        CSV5E:=FALSE;
                                        Rec."CSV Témoins Alerte Eteints":="CSV Témoins Alerte Eteints"::Oui;
                                        END
                                end;
                            }
                            field(CSV5F;CSV5F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Témoins Alerte Eteints",CSV5E,CSV5T,CSV5F,CSV5R);
                                    IF CSV5F THEN
                                      BEGIN
                                        CSV5R:=FALSE;
                                        CSV5T:=FALSE;
                                        CSV5E:=FALSE;
                                        Rec."CSV Témoins Alerte Eteints":="CSV Témoins Alerte Eteints"::Non;
                                        END
                                end;
                            }
                            field(CSV5R;CSV5R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Témoins Alerte Eteints",CSV5E,CSV5T,CSV5F,CSV5R);
                                    IF CSV5R THEN
                                      BEGIN
                                        CSV5F:=FALSE;
                                        CSV5T:=FALSE;
                                        CSV5E:=FALSE;
                                        Rec."CSV Témoins Alerte Eteints":="CSV Témoins Alerte Eteints"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.6 Les réinitialisations sont effectuées selon les équipements et les travaux (ind. de maintenance, vitres électriques, fermeture centralisée, détecteur de sous gonflage)";'')
                            {
                                Caption = '2.6 Les réinitialisations sont effectuées selon les équipements et les travaux (ind. de maintenance, vitres électriques, fermeture centralisée, détecteur de sous gonflage)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV6T;CSV6T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Réinitialisation Effectuée",CSV6E,CSV6T,CSV6F,CSV6R);
                                    IF CSV6T THEN
                                      BEGIN
                                        CSV6R:=FALSE;
                                        CSV6F:=FALSE;
                                        CSV6E:=FALSE;
                                        Rec."CSV Réinitialisation Effectuée":="CSV Réinitialisation Effectuée"::Oui;
                                        END
                                end;
                            }
                            field(CSV6F;CSV6F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Réinitialisation Effectuée",CSV6E,CSV6T,CSV6F,CSV6R);
                                    IF CSV6F THEN
                                      BEGIN
                                        CSV6R:=FALSE;
                                        CSV6T:=FALSE;
                                        CSV6E:=FALSE;
                                        Rec."CSV Réinitialisation Effectuée":="CSV Réinitialisation Effectuée"::Non;
                                        END
                                end;
                            }
                            field(CSV6R;CSV6R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Réinitialisation Effectuée",CSV6E,CSV6T,CSV6F,CSV6R);
                                    IF CSV6R THEN
                                      BEGIN
                                        CSV6F:=FALSE;
                                        CSV6T:=FALSE;
                                        CSV6E:=FALSE;
                                        Rec."CSV Réinitialisation Effectuée":="CSV Réinitialisation Effectuée"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.7 Les éléments de protection sont en place (siège, tapis, volant, frein main et levier de vitesse)";'')
                            {
                                Caption = '2.7 Les éléments de protection sont en place (siège, tapis, volant, frein main et levier de vitesse)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV7T;CSV7T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eléments Protection OK",CSV7E,CSV7T,CSV7F,CSV7R);
                                    IF CSV7T THEN
                                      BEGIN
                                        CSV7R:=FALSE;
                                        CSV7F:=FALSE;
                                        CSV7E:=FALSE;
                                        Rec."CSV Eléments Protection OK":="CSV Eléments Protection OK"::Oui;
                                        END
                                end;
                            }
                            field(CSV7F;CSV7F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eléments Protection OK",CSV7E,CSV7T,CSV7F,CSV7R);
                                    IF CSV7F THEN
                                      BEGIN
                                        CSV7R:=FALSE;
                                        CSV7T:=FALSE;
                                        CSV7E:=FALSE;
                                        Rec."CSV Eléments Protection OK":="CSV Eléments Protection OK"::Non;
                                        END
                                end;
                            }
                            field(CSV7R;CSV7R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Eléments Protection OK",CSV7E,CSV7T,CSV7F,CSV7R);
                                    IF CSV7R THEN
                                      BEGIN
                                        CSV7F:=FALSE;
                                        CSV7T:=FALSE;
                                        CSV7E:=FALSE;
                                        Rec."CSV Eléments Protection OK":="CSV Eléments Protection OK"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.8 La pression des pneumatiques est vérifiée et conforme (dont roue de secours ou validité du kit de dépannage)";'')
                            {
                                Caption = '2.8 La pression des pneumatiques est vérifiée et conforme (dont roue de secours ou validité du kit de dépannage)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV8T;CSV8T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Pression Vérifiée Conforme",CSV8E,CSV8T,CSV8F,CSV8R);
                                    IF CSV8T THEN
                                      BEGIN
                                        CSV8R:=FALSE;
                                        CSV8F:=FALSE;
                                        CSV8E:=FALSE;
                                        Rec."CSV Pression Vérifiée Conforme":="CSV Pression Vérifiée Conforme"::Oui;
                                        END
                                end;
                            }
                            field(CSV8F;CSV8F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Pression Vérifiée Conforme",CSV8E,CSV8T,CSV8F,CSV8R);
                                    IF CSV8F THEN
                                      BEGIN
                                        CSV8R:=FALSE;
                                        CSV8T:=FALSE;
                                        CSV8E:=FALSE;
                                        Rec."CSV Pression Vérifiée Conforme":="CSV Pression Vérifiée Conforme"::Non;
                                        END
                                end;
                            }
                            field(CSV8R;CSV8R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Pression Vérifiée Conforme",CSV8E,CSV8T,CSV8F,CSV8R);
                                    IF CSV8R THEN
                                      BEGIN
                                        CSV8F:=FALSE;
                                        CSV8T:=FALSE;
                                        CSV8E:=FALSE;
                                        Rec."CSV Pression Vérifiée Conforme":="CSV Pression Vérifiée Conforme"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.9 L'état des balais d’essuie glaces est correct";'')
                            {
                                Caption = '2.9 L''état des balais d’essuie glaces est correct';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV9T;CSV9T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Etat Balais Essuie Glace",CSV9E,CSV9T,CSV9F,CSV9R);
                                    IF CSV9T THEN
                                      BEGIN
                                        CSV9F:=FALSE;
                                        CSV9R:=FALSE;
                                        CSV9E:=FALSE;
                                        Rec."CSV Etat Balais Essuie Glace":="CSV Etat Balais Essuie Glace"::Oui;
                                        END
                                end;
                            }
                            field(CSV9F;CSV9F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Etat Balais Essuie Glace",CSV9E,CSV9T,CSV9F,CSV9R);
                                    IF CSV9F THEN
                                      BEGIN
                                        CSV9R:=FALSE;
                                        CSV9T:=FALSE;
                                        CSV9E:=FALSE;
                                        Rec."CSV Etat Balais Essuie Glace":="CSV Etat Balais Essuie Glace"::Non;
                                        END
                                end;
                            }
                            field(CSV9R;CSV9R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Etat Balais Essuie Glace",CSV9E,CSV9T,CSV9F,CSV9R);
                                    IF CSV9R THEN
                                      BEGIN
                                        CSV9T:=FALSE;
                                        CSV9F:=FALSE;
                                        CSV9E:=FALSE;
                                        Rec."CSV Etat Balais Essuie Glace":="CSV Etat Balais Essuie Glace"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("2.10 Le klaxon fonctionne";'')
                            {
                                Caption = '2.10 Le klaxon fonctionne';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CSV10T;CSV10T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Klaxon Fonctionne",CSV10E,CSV10T,CSV10F,CSV10R);
                                    IF CSV10T THEN
                                      BEGIN
                                        CSV10F:=FALSE;
                                        CSV10R:=FALSE;
                                        CSV10E:=FALSE;
                                        Rec."CSV Klaxon Fonctionne":="CSV Klaxon Fonctionne"::Oui;
                                        END
                                end;
                            }
                            field(CSV10F;CSV10F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Klaxon Fonctionne",CSV10E,CSV10T,CSV10F,CSV10R);
                                    IF CSV10F THEN
                                      BEGIN
                                        CSV10R:=FALSE;
                                        CSV10T:=FALSE;
                                        CSV10E:=FALSE;
                                        Rec."CSV Klaxon Fonctionne":="CSV Klaxon Fonctionne"::Non;
                                        END
                                end;
                            }
                            field(CSV10R;CSV10R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CSV Klaxon Fonctionne",CSV10E,CSV10T,CSV10F,CSV10R);
                                    IF CSV10R THEN
                                      BEGIN
                                        CSV10F:=FALSE;
                                        CSV10T:=FALSE;
                                        CSV10E:=FALSE;
                                        Rec."CSV Klaxon Fonctionne":="CSV Klaxon Fonctionne"::Rectifié;
                                        END
                                end;
                            }
                        }
                    }
                }
            }
            group(ED)
            {
                Caption = '3 - Essai dynamique selon l’intervention effectuée';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                        }
                        grid()
                        {
                            field(;'')
                            {
                            }
                            field("Conformité";'')
                            {
                                Caption = 'Conformité';
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                            }
                            field(;'')
                            {
                            }
                        }
                        grid()
                        {
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                            field("Rectifié";'')
                            {
                                Caption = 'Rectifié';
                            }
                        }
                        grid()
                        {
                            field("3.1 Les éléments concernés par la réparation fonctionnent correctement";'')
                            {
                                Caption = '3.1 Les éléments concernés par la réparation fonctionnent correctement';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(ED1T;ED1T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."ED Eléments Réparés Fonctionne",ED1E,ED1T,ED1F,ED1R);
                                    IF ED1T THEN
                                      BEGIN
                                        ED1R:=FALSE;
                                        ED1F:=FALSE;
                                        ED1E:=FALSE;
                                        Rec."ED Eléments Réparés Fonctionne":="ED Eléments Réparés Fonctionne"::Oui;
                                        END
                                end;
                            }
                            field(ED1F;ED1F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."ED Eléments Réparés Fonctionne",ED1E,ED1T,ED1F,ED1R);
                                    IF ED1F THEN
                                      BEGIN
                                        ED1T:=FALSE;
                                        ED1R:=FALSE;
                                        ED1E:=FALSE;
                                        Rec."ED Eléments Réparés Fonctionne":="ED Eléments Réparés Fonctionne"::Non;
                                        END
                                end;
                            }
                            field(ED1R;ED1R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."ED Eléments Réparés Fonctionne",ED1E,ED1T,ED1F,ED1R);
                                    IF ED1R THEN
                                      BEGIN
                                        ED1F:=FALSE;
                                        ED1T:=FALSE;
                                        ED1E:=FALSE;
                                        Rec."ED Eléments Réparés Fonctionne":="ED Eléments Réparés Fonctionne"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("3.2 La reproduction des conditions d'apparition du défaut a été faite (selon Fiche Incident Client éventuellement jointe)";'')
                            {
                                Caption = '3.2 La reproduction des conditions d''apparition du défaut a été faite (selon Fiche Incident Client éventuellement jointe)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(ED2T;ED2T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."ED Condition Apparition Reprou",ED2E,ED2T,ED2F,ED2R);
                                    IF ED2T THEN
                                      BEGIN
                                        ED2R:=FALSE;
                                        ED2F:=FALSE;
                                        ED2E:=FALSE;
                                        Rec."ED Condition Apparition Reprou":="ED Condition Apparition Reprou"::Oui;
                                        END
                                end;
                            }
                            field(ED2F;ED2F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."ED Condition Apparition Reprou",ED2E,ED2T,ED2F,ED2R);
                                    IF ED2F THEN
                                      BEGIN
                                        ED2T:=FALSE;
                                        ED2R:=FALSE;
                                        ED2E:=FALSE;
                                        Rec."ED Condition Apparition Reprou":="ED Condition Apparition Reprou"::Non;
                                        END
                                end;
                            }
                            field(ED2R;ED2R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."ED Condition Apparition Reprou",ED2E,ED2T,ED2F,ED2R);
                                    IF ED2R THEN
                                      BEGIN
                                        ED2T:=FALSE;
                                        ED2F:=FALSE;
                                        ED2E:=FALSE;
                                        Rec."ED Condition Apparition Reprou":="ED Condition Apparition Reprou"::Rectifié;
                                        END
                                end;
                            }
                        }
                    }
                }
            }
            group(CC)
            {
                Caption = '4 - Contrôle carrosserie (le cas échéant)';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                        }
                        grid()
                        {
                            field(;'')
                            {
                            }
                            field("Conformité";'')
                            {
                                Caption = 'Conformité';
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                            }
                            field(;'')
                            {
                            }
                        }
                        grid()
                        {
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                            field("Rectifié";'')
                            {
                                Caption = 'Rectifié';
                            }
                        }
                        grid()
                        {
                            field("4.1 Remise en état des éléments correctement effectuée";'')
                            {
                                Caption = '4.1 Remise en état des éléments correctement effectuée';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CC1T;CC1T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Remise En Etat Correcte",CC1E,CC1T,CC1F,CC1R);
                                    IF CC1T THEN
                                      BEGIN
                                        CC1F:=FALSE;
                                        CC1R:=FALSE;
                                        CC1E:=FALSE;
                                        Rec."CC Remise En Etat Correcte":="CC Remise En Etat Correcte"::Oui;
                                        END
                                end;
                            }
                            field(CC1F;CC1F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Remise En Etat Correcte",CC1E,CC1T,CC1F,CC1R);
                                    IF CC1F THEN
                                      BEGIN
                                        CC1R:=FALSE;
                                        CC1T:=FALSE;
                                        CC1E:=FALSE;
                                        Rec."CC Remise En Etat Correcte":="CC Remise En Etat Correcte"::Non;
                                        END
                                end;
                            }
                            field(CC1R;CC1R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Remise En Etat Correcte",CC1E,CC1T,CC1F,CC1R);
                                    IF CC1R THEN
                                      BEGIN
                                        CC1F:=FALSE;
                                        CC1T:=FALSE;
                                        CC1E:=FALSE;
                                        Rec."CC Remise En Etat Correcte":="CC Remise En Etat Correcte"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("4.2 Ajustements corrects";'')
                            {
                                Caption = '4.2 Ajustements corrects';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CC2T;CC2T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Ajustements Corrects",CC2E,CC2T,CC2F,CC2R);
                                    IF CC2T THEN
                                      BEGIN
                                        CC2R:=FALSE;
                                        CC2F:=FALSE;
                                        CC2E:=FALSE;
                                        Rec."CC Ajustements Corrects":="CC Ajustements Corrects"::Oui;
                                        END
                                end;
                            }
                            field(CC2F;CC2F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Ajustements Corrects",CC2E,CC2T,CC2F,CC2R);
                                    IF CC2F THEN
                                      BEGIN
                                        CC2R:=FALSE;
                                        CC2T:=FALSE;
                                        CC2E:=FALSE;
                                        Rec."CC Ajustements Corrects":="CC Ajustements Corrects"::Non;
                                        END
                                end;
                            }
                            field(CC2R;CC2R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Ajustements Corrects",CC2E,CC2T,CC2F,CC2R);
                                    IF CC2R THEN
                                      BEGIN
                                        CC2F:=FALSE;
                                        CC2T:=FALSE;
                                        CC2E:=FALSE;
                                        Rec."CC Ajustements Corrects":="CC Ajustements Corrects"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("4.3 Bon fonctionnement des équipements";'')
                            {
                                Caption = '4.3 Bon fonctionnement des équipements';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CC3T;CC3T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Equipements Fonctionnels",CC3E,CC3T,CC3F,CC3R);
                                    IF CC3T THEN
                                      BEGIN
                                        CC3R:=FALSE;
                                        CC3F:=FALSE;
                                        CC3E:=FALSE;
                                        Rec."CC Equipements Fonctionnels":="CC Equipements Fonctionnels"::Oui;
                                        END
                                end;
                            }
                            field(CC3F;CC3F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Equipements Fonctionnels",CC3E,CC3T,CC3F,CC3R);
                                    IF CC3F THEN
                                      BEGIN
                                        CC3R:=FALSE;
                                        CC3T:=FALSE;
                                        CC3E:=FALSE;
                                        Rec."CC Equipements Fonctionnels":="CC Equipements Fonctionnels"::Non;
                                        END
                                end;
                            }
                            field(CC3R;CC3R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CC Equipements Fonctionnels",CC3E,CC3T,CC3F,CC3R);
                                    IF CC3R THEN
                                      BEGIN
                                        CC3F:=FALSE;
                                        CC3T:=FALSE;
                                        CC3E:=FALSE;
                                        Rec."CC Equipements Fonctionnels":="CC Equipements Fonctionnels"::Rectifié;
                                        END
                                end;
                            }
                        }
                    }
                }
            }
            group(CP)
            {
                Caption = '5 - Contrôle peinture (le cas échéant)';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                        }
                        grid()
                        {
                            field(;'')
                            {
                            }
                            field("Conformité";'')
                            {
                                Caption = 'Conformité';
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                            }
                            field(;'')
                            {
                            }
                        }
                        grid()
                        {
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                            field("Rectifié";'')
                            {
                                Caption = 'Rectifié';
                            }
                        }
                        grid()
                        {
                            field("5.1 Absence de rayure de ponçage";'')
                            {
                                Caption = '5.1 Absence de rayure de ponçage';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CP1T;CP1T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Reyures",CP1E,CP1T,CP1F,CP1R);
                                    IF CP1T THEN
                                      BEGIN
                                        CP1R:=FALSE;
                                        CP1F:=FALSE;
                                        CP1E:=FALSE;
                                        Rec."CP Absence Reyures":="CP Absence Reyures"::Oui;
                                        END
                                end;
                            }
                            field(CP1F;CP1F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Reyures",CP1E,CP1T,CP1F,CP1R);
                                    IF CP1F THEN
                                      BEGIN
                                        CP1R:=FALSE;
                                        CP1T:=FALSE;
                                        CP1E:=FALSE;
                                        Rec."CP Absence Reyures":="CP Absence Reyures"::Non;
                                        END
                                end;
                            }
                            field(CP1R;CP1R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Reyures",CP1E,CP1T,CP1F,CP1R);
                                    IF CP1R THEN
                                      BEGIN
                                        CP1F:=FALSE;
                                        CP1T:=FALSE;
                                        CP1E:=FALSE;
                                        Rec."CP Absence Reyures":="CP Absence Reyures"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("5.2 Absence de coulure";'')
                            {
                                Caption = '5.2 Absence de coulure';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CP2T;CP2T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Coulures",CP2E,CP2T,CP2F,CP2R);
                                    IF CP2T THEN
                                      BEGIN
                                        CP2R:=FALSE;
                                        CP2F:=FALSE;
                                        CP2E:=FALSE;
                                        Rec."CP Absence Coulures":="CP Absence Coulures"::Oui;
                                        END
                                end;
                            }
                            field(CP2F;CP2F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Coulures",CP2E,CP2T,CP2F,CP2R);
                                    IF CP2F THEN
                                      BEGIN
                                        CP2R:=FALSE;
                                        CP2T:=FALSE;
                                        CP2E:=FALSE;
                                        Rec."CP Absence Coulures":="CP Absence Coulures"::Non;
                                        END
                                end;
                            }
                            field(CP2R;CP2R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Coulures",CP2E,CP2T,CP2F,CP2R);
                                    IF CP2R THEN
                                      BEGIN
                                        CP2F:=FALSE;
                                        CP2T:=FALSE;
                                        CP2E:=FALSE;
                                        Rec."CP Absence Coulures":="CP Absence Coulures"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("5.3 Absence de débordement de peinture (suite à mauvais marouflage)";'')
                            {
                                Caption = '5.3 Absence de débordement de peinture (suite à mauvais marouflage)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CP3T;CP3T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Débordement",CP3E,CP3T,CP3F,CP3R);
                                    IF CP3T THEN
                                      BEGIN
                                        CP3R:=FALSE;
                                        CP3F:=FALSE;
                                        CP3E:=FALSE;
                                        Rec."CP Absence Débordement":="CP Absence Débordement"::Oui;
                                        END
                                end;
                            }
                            field(CP3F;CP3F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Débordement",CP3E,CP3T,CP3F,CP3R);
                                    IF CP3F THEN
                                      BEGIN
                                        CP3T:=FALSE;
                                        CP3R:=FALSE;
                                        CP3E:=FALSE;
                                        Rec."CP Absence Débordement":="CP Absence Débordement"::Non;
                                        END
                                end;
                            }
                            field(CP3R;CP3R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Débordement",CP3E,CP3T,CP3F,CP3R);
                                    IF CP3R THEN
                                      BEGIN
                                        CP3T:=FALSE;
                                        CP3F:=FALSE;
                                        CP3E:=FALSE;
                                        Rec."CP Absence Débordement":="CP Absence Débordement"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("5.4 Absence de poussières";'')
                            {
                                Caption = '5.4 Absence de poussières';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CP4T;CP4T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Poussière",CP4E,CP4T,CP4F,CP4R);
                                    IF CP4T THEN
                                      BEGIN
                                        CP4R:=FALSE;
                                        CP4F:=FALSE;
                                        CP4E:=FALSE;
                                        Rec."CP Absence Poussière":="CP Absence Poussière"::Oui;
                                        END
                                end;
                            }
                            field(CP4F;CP4F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Poussière",CP4E,CP4T,CP4F,CP4R);
                                    IF CP4F THEN
                                      BEGIN
                                        CP4T:=FALSE;
                                        CP4R:=FALSE;
                                        CP4E:=FALSE;
                                        Rec."CP Absence Poussière":="CP Absence Poussière"::Non;
                                        END
                                end;
                            }
                            field(CP4R;CP4R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Poussière",CP4E,CP4T,CP4F,CP4R);
                                    IF CP4R THEN
                                      BEGIN
                                        CP4F:=FALSE;
                                        CP4T:=FALSE;
                                        CP4E:=FALSE;
                                        Rec."CP Absence Poussière":="CP Absence Poussière"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("5.5 Teinte conforme";'')
                            {
                                Caption = '5.5 Teinte conforme';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CP5T;CP5T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Teinte Conforme",CP5E,CP5T,CP5F,CP5R);
                                    IF CP5T THEN
                                      BEGIN
                                        CP5R:=FALSE;
                                        CP5F:=FALSE;
                                        CP5E:=FALSE;
                                        Rec."CP Teinte Conforme":="CP Teinte Conforme"::Oui;
                                        END
                                end;
                            }
                            field(CP5F;CP5F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Teinte Conforme",CP5E,CP5T,CP5F,CP5R);
                                    IF CP5F THEN
                                      BEGIN
                                        CP5R:=FALSE;
                                        CP5T:=FALSE;
                                        CP5E:=FALSE;
                                        Rec."CP Teinte Conforme":="CP Teinte Conforme"::Non;
                                        END
                                end;
                            }
                            field(CP5R;CP5R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Teinte Conforme",CP5E,CP5T,CP5F,CP5R);
                                    IF CP5R THEN
                                      BEGIN
                                        CP5F:=FALSE;
                                        CP5T:=FALSE;
                                        CP5E:=FALSE;
                                        Rec."CP Teinte Conforme":="CP Teinte Conforme"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("5.6 Absence de brouillard";'')
                            {
                                Caption = '5.6 Absence de brouillard';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CP6T;CP6T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Brouillard",CP6E,CP6T,CP6F,CP6R);
                                    IF CP6T THEN
                                      BEGIN
                                        CP6R:=FALSE;
                                        CP6F:=FALSE;
                                        CP6E:=FALSE;
                                        Rec."CP Absence Brouillard":="CP Absence Brouillard"::Oui;
                                        END
                                end;
                            }
                            field(CP6F;CP6F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Brouillard",CP6E,CP6T,CP6F,CP6R);
                                    IF CP6F THEN
                                      BEGIN
                                        CP6R:=FALSE;
                                        CP6T:=FALSE;
                                        CP6E:=FALSE;
                                        Rec."CP Absence Brouillard":="CP Absence Brouillard"::Non;
                                        END
                                end;
                            }
                            field(CP6R;CP6R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CP Absence Brouillard",CP6E,CP6T,CP6F,CP6R);
                                    IF CP6R THEN
                                      BEGIN
                                        CP6T:=FALSE;
                                        CP6F:=FALSE;
                                        CP6E:=FALSE;
                                        Rec."CP Absence Brouillard":="CP Absence Brouillard"::Rectifié;
                                        END
                                end;
                            }
                        }
                    }
                }
            }
            group(CF)
            {
                Caption = '6 - Contrôle finition';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                        }
                        grid()
                        {
                            field(;'')
                            {
                            }
                            field("Conformité";'')
                            {
                                Caption = 'Conformité';
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                            }
                            field(;'')
                            {
                            }
                        }
                        grid()
                        {
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                            field("Rectifié";'')
                            {
                                Caption = 'Rectifié';
                            }
                        }
                        grid()
                        {
                            field("6.1 La date et l'heure sont à jour";'')
                            {
                                Caption = '6.1 La date et l''heure sont à jour';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CF1T;CF1T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CF Date Heure A Jour",CF1E,CF1T,CF1F,CF1R);
                                    IF CF1T THEN
                                      BEGIN
                                        CF1R:=FALSE;
                                        CF1F:=FALSE;
                                        CF1E:=FALSE;
                                        Rec."CF Date Heure A Jour":="CF Date Heure A Jour"::Oui;
                                        END
                                end;
                            }
                            field(CF1F;CF1F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CF Date Heure A Jour",CF1E,CF1T,CF1F,CF1R);
                                    IF CF1F THEN
                                      BEGIN
                                        CF1R:=FALSE;
                                        CF1T:=FALSE;
                                        CF1E:=FALSE;
                                        Rec."CF Date Heure A Jour":="CF Date Heure A Jour"::Non;
                                        END
                                end;
                            }
                            field(CF1R;CF1R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CF Date Heure A Jour",CF1E,CF1T,CF1F,CF1R);
                                    IF CF1R THEN
                                      BEGIN
                                        CF1F:=FALSE;
                                        CF1T:=FALSE;
                                        CF1E:=FALSE;
                                        Rec."CF Date Heure A Jour":="CF Date Heure A Jour"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("6.2 Les stations radio ont été programmées (au moins une station pré programmée)";'')
                            {
                                Caption = '6.2 Les stations radio ont été programmées (au moins une station pré programmée)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CF2T;CF2T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CF Stations Radio Programmées",CF2E,CF2T,CF2F,CF2R);
                                    IF CF2T THEN
                                      BEGIN
                                        CF2R:=FALSE;
                                        CF2F:=FALSE;
                                        CF2E:=FALSE;
                                        Rec."CF Stations Radio Programmées":="CF Stations Radio Programmées"::Oui;
                                        END
                                end;
                            }
                            field(CF2F;CF2F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CF Stations Radio Programmées",CF2E,CF2T,CF2F,CF2R);
                                    IF CF2F THEN
                                      BEGIN
                                        CF2R:=FALSE;
                                        CF2T:=FALSE;
                                        CF2E:=FALSE;
                                        Rec."CF Stations Radio Programmées":="CF Stations Radio Programmées"::Non;
                                        END
                                end;
                            }
                            field(CF2R;CF2R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CF Stations Radio Programmées",CF2E,CF2T,CF2F,CF2R);
                                    IF CF2R THEN
                                      BEGIN
                                        CF2F:=FALSE;
                                        CF2T:=FALSE;
                                        CF2E:=FALSE;
                                        Rec."CF Stations Radio Programmées":="CF Stations Radio Programmées"::Rectifié;
                                        END
                                end;
                            }
                        }
                    }
                }
            }
            group(CPV)
            {
                Caption = '7 - Contrôle présentation du véhicule';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                        }
                        grid()
                        {
                            field(;'')
                            {
                            }
                            field("Conformité";'')
                            {
                                Caption = 'Conformité';
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                            }
                            field(;'')
                            {
                            }
                        }
                        grid()
                        {
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                            field("Rectifié";'')
                            {
                                Caption = 'Rectifié';
                            }
                        }
                        grid()
                        {
                            field("7.1 L'intervention n'a pas engendré de salissures";'')
                            {
                                Caption = '7.1 L''intervention n''a pas engendré de salissures';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CPV1T;CPV1T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CPV Pas Salissures",CPV1E,CPV1T,CPV1F,CPV1R);
                                    IF CPV1T THEN
                                      BEGIN
                                        CPV1R:=FALSE;
                                        CPV1F:=FALSE;
                                        CPV1E:=FALSE;
                                        Rec."CPV Pas Salissures":="CPV Pas Salissures"::Oui;
                                        END
                                end;
                            }
                            field(CPV1F;CPV1F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CPV Pas Salissures",CPV1E,CPV1T,CPV1F,CPV1R);
                                    IF CPV1F THEN
                                      BEGIN
                                        CPV1R:=FALSE;
                                        CPV1T:=FALSE;
                                        CPV1E:=FALSE;
                                        Rec."CPV Pas Salissures":="CPV Pas Salissures"::Non;
                                        END
                                end;
                            }
                            field(CPV1R;CPV1R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CPV Pas Salissures",CPV1E,CPV1T,CPV1F,CPV1R);
                                    IF CPV1R THEN
                                      BEGIN
                                        CPV1F:=FALSE;
                                        CPV1T:=FALSE;
                                        CPV1E:=FALSE;
                                        Rec."CPV Pas Salissures":="CPV Pas Salissures"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("7.2 Le nettoyage intérieur a été effectué (contrôle si accord du client sur la commande de travaux)";'')
                            {
                                Caption = '7.2 Le nettoyage intérieur a été effectué (contrôle si accord du client sur la commande de travaux)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CPV2T;CPV2T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CPV Nettoyage Int. Fait",CPV2E,CPV2T,CPV2F,CPV2R);
                                    IF CPV2T THEN
                                      BEGIN
                                        CPV2R:=FALSE;
                                        CPV2F:=FALSE;
                                        CPV2E:=FALSE;
                                        Rec."CPV Nettoyage Int. Fait":="CPV Nettoyage Int. Fait"::Oui;
                                        END
                                end;
                            }
                            field(CPV2F;CPV2F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CPV Nettoyage Int. Fait",CPV2E,CPV2T,CPV2F,CPV2R);
                                    IF CPV2F THEN
                                      BEGIN
                                        CPV2R:=FALSE;
                                        CPV2T:=FALSE;
                                        CPV2E:=FALSE;
                                        Rec."CPV Nettoyage Int. Fait":="CPV Nettoyage Int. Fait"::Non;
                                        END
                                end;
                            }
                            field(CPV2R;CPV2R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //DégagerOptionBooléens(Rec."CPV Nettoyage Int. Fait",CPV2E,CPV2T,CPV2F,CPV2R);
                                    IF CPV2R THEN
                                      BEGIN
                                        CPV2F:=FALSE;
                                        CPV2T:=FALSE;
                                        CPV2E:=FALSE;
                                        Rec."CPV Nettoyage Int. Fait":="CPV Nettoyage Int. Fait"::Rectifié;
                                        END
                                end;
                            }
                        }
                        grid()
                        {
                            field("7.3 Le nettoyage extérieur a été effectué (contrôle si accord du client sur la commande de travaux)";'')
                            {
                                Caption = '7.3 Le nettoyage extérieur a été effectué (contrôle si accord du client sur la commande de travaux)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            field(CPV3T;CPV3T)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    IF CPV3T THEN
                                      BEGIN
                                        CPV3R:=FALSE;
                                        CPV3F:=FALSE;
                                        CPV3E:=FALSE;
                                        Rec."CPV Nettoyage Ext. Fait":="CPV Nettoyage Ext. Fait"::Oui;
                                        END
                                end;
                            }
                            field(CPV3F;CPV3F)
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    IF CPV3F THEN
                                      BEGIN
                                        CPV3R:=FALSE;
                                        CPV3T:=FALSE;
                                        CPV3E:=FALSE;
                                        Rec."CPV Nettoyage Ext. Fait":="CPV Nettoyage Ext. Fait"::Non;
                                        END
                                end;
                            }
                            field(CPV3R;CPV3R)
                            {
                                Caption = 'Rectifié';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    IF CPV3R THEN
                                      BEGIN
                                        CPV3T:=FALSE;
                                        CPV3F:=FALSE;
                                        CPV3E:=FALSE;
                                        Rec."CPV Nettoyage Ext. Fait":="CPV Nettoyage Ext. Fait"::Rectifié;
                                        END
                                end;
                            }
                        }
                    }
                }
            }
            group(Commentaires)
            {
                Caption = 'Commentaires';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group()
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Imprimer)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction();
                begin
                    ControleQualite.RESET;
                    ControleQualite.SETRANGE("No.","No.");
                    ControleQualite.FINDFIRST;
                    REPORT.RUN(70032,TRUE,TRUE,ControleQualite);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        // T:True, F:False, R:Rectifié,E:Empty(Rien n'est choisi)
        //CDP:Contrôle documentaire préalable
        DégagerBoléensOption(Rec."CDP Présence Fiches",CDP1E,CDP1T,CDP1F,CDP1R);

        DégagerBoléensOption(Rec."CDP Rubriques Renseignées",CDP2E,CDP2T,CDP2F,CDP2R);

        DégagerBoléensOption(Rec."CDP Vérification Compagnes",CDP3E,CDP3T,CDP3F,CDP3R);

        DégagerBoléensOption(Rec."CDP Impression Ecran synthèse",CDP4E,CDP4T,CDP4F,CDP4R);

        DégagerBoléensOption(Rec."CDP Commande Signée Client CCS",CDP5E,CDP5T,CDP5F,CDP5R);

        DégagerBoléensOption(Rec."CDP CommandeSgnée Compagnon",CDP6E,CDP6T,CDP6F,CDP6R);

        DégagerBoléensOption(Rec."CDP Montant Estimation Reporté",CDP7E,CDP7T,CDP7F,CDP7R);

        DégagerBoléensOption(Rec."CDP Résultats Essai Mentionnés",CDP8E,CDP8T,CDP8F,CDP8R);

        DégagerBoléensOption(Rec."CDP Facture STPrésente",CDP9E,CDP9T,CDP9F,CDP9R);

        DégagerBoléensOption(Rec."CDP TR. Supp. Notés CT Accepté",CDP10E,CDP10T,CDP10F,CDP10R);

        DégagerBoléensOption(Rec."CDP Présence Relevés Mesures",CDP11E,CDP11T,CDP11F,CDP11R);
        //CSV: Contrôle statique du véhicule
        DégagerBoléensOption(Rec."CSV Tr. Conformes à la Command",CSV1E,CSV1T,CSV1F,CDP1R);

        DégagerBoléensOption(Rec."CSV Eléments Réparés OK",CSV2E,CSV2T,CSV2F,CSV2R);

        DégagerBoléensOption(Rec."CSV Niveaux contrôlés",CSV3E,CSV3T,CSV3F,CSV3R);

        DégagerBoléensOption(Rec."CSV Eclairages Contrôlés",CSV4E,CSV4T,CSV4F,CSV4R);

        DégagerBoléensOption(Rec."CSV Témoins Alerte Eteints",CSV5E,CSV5T,CSV5F,CSV5R);

        DégagerBoléensOption(Rec."CSV Réinitialisation Effectuée",CSV6E,CSV6T,CSV6F,CSV6R);

        DégagerBoléensOption(Rec."CSV Eléments Protection OK",CSV7E,CSV7T,CSV7F,CSV7R);

        DégagerBoléensOption(Rec."CSV Pression Vérifiée Conforme",CSV8E,CSV8T,CSV8F,CSV8R);

        DégagerBoléensOption(Rec."CSV Etat Balais Essuie Glace",CSV9E,CSV9T,CSV9F,CSV9R);

        DégagerBoléensOption(Rec."CSV Klaxon Fonctionne",CSV10E,CSV10T,CSV10F,CSV10R);
        //ED: Essai dynamique selon l'intervention effectuée
        DégagerBoléensOption(Rec."ED Eléments Réparés Fonctionne",ED1E,ED1T,ED1F,ED1R);

        DégagerBoléensOption(Rec."ED Condition Apparition Reprou",ED2E,ED2T,ED2F,ED2R);

        //CC: Contrôle carrosserie (le cas échéant)
        DégagerBoléensOption(Rec."CC Remise En Etat Correcte",CC1E,CC1T,CC1F,CC1R);

        DégagerBoléensOption(Rec."CC Ajustements Corrects",CC2E,CC2T,CC2F,CC2R);

        DégagerBoléensOption(Rec."CC Equipements Fonctionnels",CC3E,CC3T,CC3F,CC3R);
        //CP: Contrôle peinture (le cas échéant)
        DégagerBoléensOption(Rec."CP Absence Reyures",CP1E,CP1T,CP1F,CP1R);

        DégagerBoléensOption(Rec."CP Absence Coulures",CP2E,CP2T,CP2F,CP2R);

        DégagerBoléensOption(Rec."CP Absence Débordement",CP3E,CP3T,CP3F,CP3R);

        DégagerBoléensOption(Rec."CP Absence Poussière",CP4E,CP4T,CP4F,CP4R);

        DégagerBoléensOption(Rec."CP Teinte Conforme",CP5E,CP5T,CP5F,CP5R);

        DégagerBoléensOption(Rec."CP Absence Brouillard",CP6E,CP6T,CP6F,CP6R);
        //CF: Contrôle finition
        DégagerBoléensOption(Rec."CF Date Heure A Jour",CF1E,CF1T,CF1F,CF1R);

        DégagerBoléensOption(Rec."CF Stations Radio Programmées",CF2E,CF2T,CF2F,CF2R);
        //CPV: Contrôle présentation du véhicule
        DégagerBoléensOption(Rec."CPV Pas Salissures",CPV1E,CPV1T,CPV1F,CPV1R);

        DégagerBoléensOption(Rec."CPV Nettoyage Int. Fait",CPV2E,CPV2T,CPV2F,CPV2R);

        DégagerBoléensOption(Rec."CPV Nettoyage Ext. Fait",CPV3E,CPV3T,CPV3F,CPV3R);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Date de contrôle":=WORKDATE;
    end;

    var
        CDP1T : Boolean;
        CDP1F : Boolean;
        CDP1R : Boolean;
        CDP1E : Boolean;
        CDP2T : Boolean;
        CDP2F : Boolean;
        CDP2R : Boolean;
        CDP2E : Boolean;
        CDP3T : Boolean;
        CDP3F : Boolean;
        CDP3R : Boolean;
        CDP3E : Boolean;
        CDP4T : Boolean;
        CDP4F : Boolean;
        CDP4R : Boolean;
        CDP4E : Boolean;
        CDP5T : Boolean;
        CDP5F : Boolean;
        CDP5R : Boolean;
        CDP5E : Boolean;
        CDP6T : Boolean;
        CDP6F : Boolean;
        CDP6R : Boolean;
        CDP6E : Boolean;
        CDP7T : Boolean;
        CDP7F : Boolean;
        CDP7R : Boolean;
        CDP7E : Boolean;
        CDP8T : Boolean;
        CDP8F : Boolean;
        CDP8R : Boolean;
        CDP8E : Boolean;
        CDP9T : Boolean;
        CDP9F : Boolean;
        CDP9R : Boolean;
        CDP9E : Boolean;
        CDP10T : Boolean;
        CDP10F : Boolean;
        CDP10R : Boolean;
        CDP10E : Boolean;
        CDP11T : Boolean;
        CDP11F : Boolean;
        CDP11R : Boolean;
        CDP11E : Boolean;
        CSV1T : Boolean;
        CSV1F : Boolean;
        CSV1R : Boolean;
        CSV1E : Boolean;
        CSV2T : Boolean;
        CSV2F : Boolean;
        CSV2R : Boolean;
        CSV2E : Boolean;
        CSV3T : Boolean;
        CSV3F : Boolean;
        CSV3R : Boolean;
        CSV3E : Boolean;
        CSV4T : Boolean;
        CSV4F : Boolean;
        CSV4R : Boolean;
        CSV4E : Boolean;
        CSV5T : Boolean;
        CSV5F : Boolean;
        CSV5R : Boolean;
        CSV5E : Boolean;
        CSV6T : Boolean;
        CSV6F : Boolean;
        CSV6R : Boolean;
        CSV6E : Boolean;
        CSV7T : Boolean;
        CSV7F : Boolean;
        CSV7R : Boolean;
        CSV7E : Boolean;
        CSV8T : Boolean;
        CSV8F : Boolean;
        CSV8R : Boolean;
        CSV8E : Boolean;
        CSV9T : Boolean;
        CSV9F : Boolean;
        CSV9R : Boolean;
        CSV9E : Boolean;
        CSV10T : Boolean;
        CSV10F : Boolean;
        CSV10R : Boolean;
        CSV10E : Boolean;
        ED1T : Boolean;
        ED1F : Boolean;
        ED1R : Boolean;
        ED1E : Boolean;
        ED2T : Boolean;
        ED2F : Boolean;
        ED2R : Boolean;
        ED2E : Boolean;
        CC1T : Boolean;
        CC1F : Boolean;
        CC1R : Boolean;
        CC1E : Boolean;
        CC2T : Boolean;
        CC2F : Boolean;
        CC2R : Boolean;
        CC2E : Boolean;
        CC3T : Boolean;
        CC3F : Boolean;
        CC3R : Boolean;
        CC3E : Boolean;
        CP1T : Boolean;
        CP1F : Boolean;
        CP1R : Boolean;
        CP1E : Boolean;
        CP2T : Boolean;
        CP2F : Boolean;
        CP2R : Boolean;
        CP2E : Boolean;
        CP3T : Boolean;
        CP3F : Boolean;
        CP3R : Boolean;
        CP3E : Boolean;
        CP4T : Boolean;
        CP4F : Boolean;
        CP4R : Boolean;
        CP4E : Boolean;
        CP5T : Boolean;
        CP5F : Boolean;
        CP5R : Boolean;
        CP5E : Boolean;
        CP6T : Boolean;
        CP6F : Boolean;
        CP6R : Boolean;
        CP6E : Boolean;
        CF1T : Boolean;
        CF1F : Boolean;
        CF1R : Boolean;
        CF1E : Boolean;
        CF2T : Boolean;
        CF2F : Boolean;
        CF2R : Boolean;
        CF2E : Boolean;
        CPV1T : Boolean;
        CPV1F : Boolean;
        CPV1R : Boolean;
        CPV1E : Boolean;
        CPV2T : Boolean;
        CPV2F : Boolean;
        CPV2R : Boolean;
        CPV2E : Boolean;
        CPV3T : Boolean;
        CPV3F : Boolean;
        CPV3R : Boolean;
        CPV3E : Boolean;
        ControleQualite : Record "70070";

    local procedure "DégagerBoléensOption"(var EtatChoisi : Option Vide,Oui,Non,"Rectifié";var EtatVide : Boolean;var EtatOui : Boolean;var EtatNon : Boolean;var EtatRect : Boolean);
    begin
         IF (EtatChoisi=EtatChoisi::Oui) THEN
          BEGIN
          EtatOui:=TRUE;
          EtatVide:=FALSE;
          EtatNon:=FALSE;
          EtatRect:=FALSE;
          END
          ELSE IF (EtatChoisi=EtatChoisi::Non )THEN
            BEGIN
            EtatNon:=TRUE;
            EtatVide:=FALSE;
            EtatOui:=FALSE;
            EtatRect:=FALSE;
            END
              ELSE IF (EtatChoisi=EtatChoisi::Rectifié) THEN
              BEGIN
              EtatRect:=TRUE;
              EtatVide:=FALSE;
              EtatOui:=FALSE;
              EtatNon:=FALSE;
              END
                  ELSE IF  (EtatChoisi=EtatChoisi::Vide) THEN
                  BEGIN
                  EtatVide:=TRUE;
                  EtatOui:=FALSE;
                  EtatNon:=FALSE;
                  EtatRect:=FALSE;
                  END
    end;

    local procedure ExclusionMutuelle(var Bool1 : Boolean;var Bool2 : Boolean;var Bool3 : Boolean;var Bool4 : Boolean);
    begin
        IF Bool1 THEN
          BEGIN
            Bool2:=FALSE;
            Bool3:=FALSE;
            Bool4:=FALSE;
          END
    end;

    local procedure "DégagerOptionBooléens"(var EtatChoisi : Option Vide,Oui,Non,"Rectifié";var EtatVide : Boolean;var EtatOui : Boolean;var EtatNon : Boolean;var EtatRect : Boolean);
    begin

          IF EtatOui THEN
            BEGIN
              EtatChoisi:=EtatChoisi::Oui;
            //  "DégagerBoléensOption"(EtatChoisi,EtatVide,EtatOui,EtatNon,EtatRect);
            ExclusionMutuelle(EtatOui, EtatVide,EtatNon, EtatRect);

            END
            ELSE IF EtatNon THEN
              BEGIN
                EtatChoisi:=EtatChoisi::Non;
                //"DégagerBoléensOption"(EtatChoisi,EtatVide,EtatOui,EtatNon,EtatRect);
                ExclusionMutuelle(EtatNon, EtatVide,EtatOui, EtatRect);

             END
             ELSE IF EtatRect THEN
              BEGIN
                EtatChoisi:=EtatChoisi::Rectifié;
                //"DégagerBoléensOption"(EtatChoisi,EtatVide,EtatOui,EtatNon,EtatRect);
                ExclusionMutuelle(EtatRect, EtatVide,EtatNon, EtatOui);

              END
             ELSE  IF EtatVide THEN
            BEGIN
                EtatChoisi:=EtatChoisi::Vide;
              //"DégagerBoléensOption"(EtatChoisi,EtatVide,EtatOui,EtatNon,EtatRect);
              ExclusionMutuelle(EtatVide,EtatOui,EtatNon,EtatRect);

             END
    end;
}

