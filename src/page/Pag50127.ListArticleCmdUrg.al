page 50127 "List Article Cmd Urg"
{
    PageType = List;
    SourceTable = Table60094;
    SourceTableView = SORTING(Article No.,Entry no.)
                      ORDER(Ascending)
                      WHERE(No Commande Achat=FILTER(''),
                            Selectionner=FILTER(Yes),
                            Status Ligne=FILTER(<>Annuler par reppro));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selectionner;Selectionner)
                {
                    CaptionML = ENU='Valider',
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
                field("Nom Client";"Nom Client")
                {
                }
                field("Article No.";"Article No.")
                {
                }
                field(Qté;Qté)
                {
                }
                field("No Commande Achat";"No Commande Achat")
                {
                }
                field(Description;Description)
                {
                }
                field("Unit de Mesure";"Unit de Mesure")
                {
                }
                field("Unit de Vente";"Unit de Vente")
                {
                }
                field("Unit de achat";"Unit de achat")
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
                field("Type Cmd Achat";"Type Cmd Achat")
                {
                }
                field("Centre de gestion Vente";"Centre de gestion Vente")
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
                field("Stock Actual";"Stock Actual")
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
                field("Date Demmande";"Date Demmande")
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
                    Visible = false;
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
                        SystemeReapproTYT.FctCreateautoCmdAchat_AU;
                    end;
                }
                action("Imprimer Pièce Urgent")
                {
                    Image = "Report";
                    RunObject = Report 60243;
                }
            }
        }
    }

    var
        SalesHeader : Record "36";
        ServiceHeader : Record "5900";
        url : Text[500];
        SystemeReapproTYT : Codeunit "70009";
}

