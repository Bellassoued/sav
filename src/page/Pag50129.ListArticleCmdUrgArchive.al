page 50129 "List Article Cmd Urg Archive"
{
    PageType = List;
    SourceTable = Table60094;
    SourceTableView = SORTING(No. Document,Société,Client,Article No.)
                      WHERE(No Commande Achat=FILTER(<>''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selectionner;Selectionner)
                {
                    CaptionML = ENU='Selectionner',
                                FRA='Valider';
                }
                field("No. Document";"No. Document")
                {
                }
                field("Type Commande";"Type Commande")
                {
                }
                field(Société;Société)
                {
                }
                field(Client;Client)
                {
                }
                field("Article No.";"Article No.")
                {
                }
                field(Qté;Qté)
                {
                }
                field("EPM Non Reorder Code";"EPM Non Reorder Code")
                {
                }
                field("Substitution code";"Substitution code")
                {
                }
                field("Unit pack code";"Unit pack code")
                {
                }
                field("Not used anymore";"Not used anymore")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field("Sub Supplier Code";"Sub Supplier Code")
                {
                }
                field("Origin Code";"Origin Code")
                {
                }
                field("Non Stock Code";"Non Stock Code")
                {
                }
                field("Max qty via VOR";"Max qty via VOR")
                {
                }
                field("Tariff code";"Tariff code")
                {
                }
                field("TMC Stock Code";"TMC Stock Code")
                {
                }
                field("Accessory Code";"Accessory Code")
                {
                }
                field("Product Code";"Product Code")
                {
                }
                field("Type Document";"Type Document")
                {
                }
                field("No Ligne Cmd Achat";"No Ligne Cmd Achat")
                {
                }
                field("Type Cmd Achat";"Type Cmd Achat")
                {
                }
                field("Type Transport";"Type Transport")
                {
                }
                field("Type Order";"Type Order")
                {
                }
                field("Type FD";"Type FD")
                {
                }
                field("No Ligne Cmd Vente";"No Ligne Cmd Vente")
                {
                }
                field("Centre de gestion Vente";"Centre de gestion Vente")
                {
                }
                field("Nom Client";"Nom Client")
                {
                }
                field("No Arrivage";"No Arrivage")
                {
                }
                field("No colis";"No colis")
                {
                }
                field("No Facture";"No Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Date de Reception Prevu";"Date de Reception Prevu")
                {
                }
                field("No. Reception";"No. Reception")
                {
                }
                field("No. Reception Enreg.";"No. Reception Enreg.")
                {
                }
                field("No Commande Achat";"No Commande Achat")
                {
                }
                field("Qty in package";"Qty in package")
                {
                }
                field(Eur1;Eur1)
                {
                }
                field("Controle technique";"Controle technique")
                {
                }
                field(Stock;Stock)
                {
                }
                field("Qté CMD en cours";"Qté CMD en cours")
                {
                }
                field("Sur Commande";"Sur Commande")
                {
                }
                field("Prix Fob";"Prix Fob")
                {
                }
                field("Type Avance";"Type Avance")
                {
                }
                field("Montant Avance";"Montant Avance")
                {
                }
                field("Modele Vehicule";"Modele Vehicule")
                {
                }
                field(VIN;VIN)
                {
                }
                field("Status Ligne";"Status Ligne")
                {
                }
                field(Motif;Motif)
                {
                }
                field("Type de garantie";"Type de garantie")
                {
                }
                field("Date Demmande";"Date Demmande")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Process)
            {
                CaptionML = ENU='Process',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action("Diterminer Article Urgent")
                {
                    Image = Report2;
                    RunObject = Report 60216;
                }
                action("Afficher Document")
                {
                    Image = Document;

                    trigger OnAction();
                    begin
                        IF COMPANYNAME = Société THEN  BEGIN
                          IF "Type Commande" = "Type Commande"::PR THEN
                            BEGIN
                              SalesHeader.RESET;
                              SalesHeader.SETRANGE("No.","No. Document");
                              IF SalesHeader.FINDFIRST THEN
                                PAGE.RUN(60026,SalesHeader);
                            END;
                        //  END;
                        END ELSE
                          BEGIN
                          IF "Type Commande" = "Type Commande"::PR THEN
                              BEGIN
                                SalesHeader.RESET;
                                SalesHeader.SETRANGE("No.","No. Document");
                                IF SalesHeader.FINDFIRST THEN  BEGIN
                                   url := GETURL(CLIENTTYPE::Current, Société, OBJECTTYPE::Page,60026,SalesHeader);
                                   HYPERLINK(url);
                                END;
                              END
                              ELSE IF "Type Commande" = "Type Commande"::Service THEN BEGIN
                              ServiceHeader.CHANGECOMPANY(Société);
                              ServiceHeader.SETRANGE("No.","No. Document");
                              IF ServiceHeader.FINDFIRST THEN BEGIN
                                url := GETURL(CLIENTTYPE::Current, Société, OBJECTTYPE::Page,5900,ServiceHeader);
                                HYPERLINK(url);
                              END;
                            END;
                          END;
                    end;
                }
                action("Create auto Commande Achat PR")
                {
                    Image = CreateInteraction;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        MgtAures : Codeunit "70003";
                    begin
                        //MgtAures.FctCreateautoPOPRRegUrg;
                    end;
                }
            }
        }
    }

    var
        SalesHeader : Record "36";
        ServiceHeader : Record "5900";
        url : Text[500];
}

