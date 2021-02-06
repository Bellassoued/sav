page 50090 "Projet Card"
{
    // version NAVW17.00,MAZDA307

    CaptionML = ENU='Campaign Card',
                FRA='Fiche Projet';
    PageType = Card;
    PopulateAllFields = true;
    SourceTable = Table5071;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field("No.";"No.")
                {

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Status Code";"Status Code")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Ending Date";"Ending Date")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field(Activated;Activated)
                {
                }
                field("Immo. Investissement";"Immo. Investissement")
                {
                }
            }
            part("Frais/depenses";50092)
            {
                SubPageLink = Campaign no=FIELD(No.);
                SubPageView = SORTING(Campaign no,Line No)
                              ORDER(Ascending);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Total cost";"Total cost")
                {
                }
                field("Amount On Purchase Order";"Amount On Purchase Order")
                {
                }
                field("On Purchase Invoice";"On Purchase Invoice")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("C&ampaign")
            {
                CaptionML = ENU='C&ampaign',
                            FRA='C&ampagne';
                Image = Campaign;
                action("E&ntries")
                {
                    CaptionML = ENU='E&ntries',
                                FRA='É&critures';
                    Image = Entries;
                    RunObject = Page 5089;
                    RunPageLink = Campaign No.=FIELD(No.);
                    RunPageView = SORTING(Campaign No.);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5072;
                    RunPageLink = Table Name=CONST(Campaign),
                                  No.=FIELD(No.),
                                  Sub No.=CONST(0);
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 5088;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    RunObject = Page 540;
                    RunPageLink = Table ID=CONST(5071),
                                  No.=FIELD(No.);
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("T&o-dos")
                {
                    CaptionML = ENU='T&o-dos',
                                FRA='&Actions';
                    Image = TaskList;
                    RunObject = Page 5096;
                    RunPageLink = Campaign No.=FIELD(No.),
                                  System To-do Type=FILTER(Organizer);
                    RunPageView = SORTING(Campaign No.);
                }
                action("S&egments")
                {
                    CaptionML = ENU='S&egments',
                                FRA='Se&gments';
                    Image = Segment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page 5093;
                    RunPageLink = Campaign No.=FIELD(No.);
                    RunPageView = SORTING(Campaign No.);
                }
                group("Oppo&rtunities")
                {
                    CaptionML = ENU='Oppo&rtunities',
                                FRA='Oppo&rtunités';
                    Image = OpportunityList;
                    action(List)
                    {
                        CaptionML = ENU='List',
                                    FRA='Liste';
                        Image = OpportunitiesList;
                        RunObject = Page 5123;
                        RunPageLink = Campaign No.=FIELD(No.);
                        RunPageView = SORTING(Campaign No.);
                    }
                }
                action("Sales &Prices")
                {
                    CaptionML = ENU='Sales &Prices',
                                FRA='&Prix vente';
                    Image = SalesPrices;
                    RunObject = Page 7002;
                    RunPageLink = Sales Type=CONST(Campaign),
                                  Sales Code=FIELD(No.);
                    RunPageView = SORTING(Sales Type,Sales Code);
                }
                action("Sales &Line Discounts")
                {
                    CaptionML = ENU='Sales &Line Discounts',
                                FRA='Re&mises ligne vente';
                    Image = SalesLineDisc;
                    RunObject = Page 7004;
                    RunPageLink = Sales Type=CONST(Campaign),
                                  Sales Code=FIELD(No.);
                    RunPageView = SORTING(Sales Type,Sales Code);
                }
            }
        }
        area(processing)
        {
            group(Functions)
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(ActivateSalesPricesLineDisc)
                {
                    CaptionML = ENU='&Activate Sales Prices/Line Discounts',
                                FRA='&Activer prix vente/remises ligne';
                    Image = ActivateDiscounts;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CampaignMgmt.ActivateCampaign(Rec);
                    end;
                }
                action("&Deactivate Sales Prices/Line Discounts")
                {
                    CaptionML = ENU='&Deactivate Sales Prices/Line Discounts',
                                FRA='&Désactiver prix vente/remises ligne';
                    Image = DeactivateDiscounts;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CampaignMgmt.DeactivateCampaign(Rec,TRUE);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Campaign Details")
            {
                CaptionML = ENU='Campaign Details',
                            FRA='Détails de la campagne';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 5060;
            }
        }
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        //SM MAZDA307
        Type:=Type::Projet
    end;

    trigger OnOpenPage();
    begin
        //SM MAZDA307
        FILTERGROUP(2);
          SETRANGE(Type ,Type::Projet);
        FILTERGROUP(0);
        //END SM
    end;

    var
        CampaignMgmt : Codeunit "7030";
}

