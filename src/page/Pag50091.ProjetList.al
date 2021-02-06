page 50091 "Projet List"
{
    // version NAVW17.00,MAZDA307

    CaptionML = ENU='Campaign List',
                FRA='Liste des Projets';
    CardPageID = "Projet Card";
    Editable = false;
    PageType = List;
    SourceTable = Table5071;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Salesperson Code";"Salesperson Code")
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
                group(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        CaptionML = ENU='Dimensions-Single',
                                    FRA='Affectations - Simples';
                        Image = Dimensions;
                        RunObject = Page 540;
                        RunPageLink = Table ID=CONST(5071),
                                      No.=FIELD(No.);
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        CaptionML = ENU='Dimensions-&Multiple',
                                    FRA='Affectations - &Multiples';
                        Image = DimensionSets;

                        trigger OnAction();
                        var
                            Campaign : Record "5071";
                            DefaultDimMultiple : Page "542";
                        begin
                            CurrPage.SETSELECTIONFILTER(Campaign);
                            DefaultDimMultiple.SetMultiCampaign(Campaign);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
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
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("&Activate Sales Prices/Line Discounts")
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
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5060;
            }
        }
    }

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

    procedure GetSelectionFilter() : Text;
    var
        Campaign : Record "5071";
        SelectionFilterManagement : Codeunit "46";
    begin
        CurrPage.SETSELECTIONFILTER(Campaign);
        EXIT(SelectionFilterManagement.GetSelectionFilterForCampaign(Campaign));
    end;
}

