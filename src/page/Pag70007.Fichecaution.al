page 70007 "Fiche caution"
{
    // version CT16V002.2

    PageType = Card;
    SourceTable = Table70004;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("No. appel d'offre";"No. appel d'offre")
                {
                }
                field("Date création";"Date création")
                {
                }
                field("A partir de";"A partir de")
                {
                }
                field("Date limite";"Date limite")
                {
                    Caption = 'Fin Validité';
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Nbr. Jours Provisoir";"Nbr. Jours Provisoir")
                {
                }
                field("Nbr. Jours Définitif";"Nbr. Jours Définitif")
                {
                }
                field("Nbr. Jours garantie";"Nbr. Jours garantie")
                {
                }
                field("Client existe";"Client existe")
                {
                }
                field("Code client";"Code client")
                {
                }
                field("Code Fournisseur";"Code Fournisseur")
                {
                }
                field(Nom;"Nom client")
                {
                }
                field(Statut;Statut)
                {
                }
                field("Code banque";"Code banque")
                {
                }
                field("Montant marché";"Montant marché")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Caution provisoire";"Caution provisoire")
                {
                    Enabled = false;
                }
                field("No. Bord. Cau. Prov.";"No. Bord. Cau. Prov.")
                {
                    Editable = false;
                }
                field("Caution définitive";"Caution définitive")
                {
                    Editable = true;
                }
                field("No. Bord Cau. Def.";"No. Bord Cau. Def.")
                {
                    Editable = false;
                }
                field("% Mnt marché définitive";"% Mnt marché définitive")
                {
                }
                field("Avec Retenu Garantie";"Avec Retenu Garantie")
                {
                }
                field("Caution retenue de garantie";"Caution retenue de garantie")
                {
                    Editable = false;
                }
                field("No. Bord Cau. RG";"No. Bord Cau. RG")
                {
                }
                field("% Mnt marché Garantie";"% Mnt marché Garantie")
                {
                }
                field("Caution Fiscale";"Caution Fiscale")
                {
                }
                field("No. Bord Cau. Fiscale";"No. Bord Cau. Fiscale")
                {
                }
                field("No. enregistrement";"No. enregistrement")
                {
                }
                field("No. quitance";"No. quitance")
                {
                }
                field("Date quitance";"Date quitance")
                {
                }
                field(Objet;Objet)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Relatif à";"Relatif à")
                {
                }
            }
            part(;70008)
            {
                SubPageLink = No. Caution=FIELD(No.);
            }
            group()
            {
                field("Adresse client";"Adresse client")
                {
                }
                field("Créer par";"Créer par")
                {
                    Editable = false;
                }
                field("Contact client";"Contact client")
                {
                }
                field("Date réception définitive";"Date réception définitive")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Caution provisoire")
            {
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    // 1 lorsqu'il sagit une caution provisoire
                    Caution("No.",1);
                end;
            }
            action("Caution définitive")
            {
                Image = PaymentDays;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    // 2 lorsqu'il sagit une caution définitive

                    TESTFIELD("Montant marché");
                    TESTFIELD("% Mnt marché définitive");
                    TESTFIELD("No. enregistrement");
                    TESTFIELD("No. quitance");
                    TESTFIELD("Date quitance");
                    TESTFIELD("Relatif à");
                    TESTFIELD("Nbr. Jours Définitif");
                    Caution("No.",2);
                end;
            }
            action("Caution retenue garantie")
            {
                Image = PaymentForecast;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    // 3 lorsqu'il sagit une caution retenue de garantie

                    TESTFIELD("Montant marché");
                    TESTFIELD("% Mnt marché Garantie");
                    TESTFIELD("Nbr. Jours garantie");
                    Caution("No.",3);
                end;
            }
            action("Caution Fiscale")
            {
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    //TESTFIELD(Objet);
                    TESTFIELD("Relatif à");
                    Caution("No.",4);
                end;
            }
        }
    }
}

