page 70081 "Ligne Factures P.R /Clois"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = Table70061;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Document";"No. Document")
                {
                }
                field("No Facture";"No Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Montant Devise";"Montant Devise")
                {
                }
                field("Nbr Colis";"Nbr Colis")
                {
                }
                field(Volume;Volume)
                {
                }
                field("Poid Brut";"Poid Brut")
                {
                }
                field("Montant Tnd";"Montant Tnd")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Fonction)
            {
                action("Extraire list des factures PR")
                {
                    Caption = 'Extraire list des factures';

                    trigger OnAction();
                    begin
                        GetListInvoicePR;
                        CurrPage.UPDATE;
                        PagEntêteFacturePRColis.FctUpdatePage;
                    end;
                }
            }
        }
    }

    var
        "PagEntêteFacturePRColis" : Page "70080";

    local procedure GetListInvoicePR();
    var
        EnteteFacturePRColis : Record "70060";
        DossierImportFactFour : Record "70025";
        PageListFactureFournisseurDI : Page "70063";
    begin
        
        EnteteFacturePRColis.GET("No. Document");
        /*EnteteFacturePRColis.TESTFIELD(Status,RecRecouvrementEntete.Status::Open);
        IF (RecRecouvrementEntete.Etape=RecRecouvrementEntete.Etape::Archiver) OR
            (RecRecouvrementEntete.Etape=RecRecouvrementEntete.Etape::Cloturer) THEN
              ERROR(Text001,"No. Bord. Recouvrement",RecRecouvrementEntete.Etape::Archiver,RecRecouvrementEntete.Etape::Cloturer);
        */
        
        //DossierImportFactFour.SETCURRENTKEY("No. Facture Fournisseur");
        DossierImportFactFour.SETFILTER("No. Dossier Import",'%1','');
        PageListFactureFournisseurDI.SETTABLEVIEW(DossierImportFactFour);
        PageListFactureFournisseurDI.LOOKUPMODE := TRUE;
        PageListFactureFournisseurDI.SetDossFin(EnteteFacturePRColis);
        IF PageListFactureFournisseurDI.RUNMODAL <> ACTION::Cancel THEN;

    end;
}

