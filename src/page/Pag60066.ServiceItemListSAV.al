page 60066 "Service Item List SAV"
{
    // version NAVW17.00

    CaptionML = ENU='Service Item List',
                FRA='Liste des articles de service';
    CardPageID = "Service Item Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Table5940;

    layout
    {
        area(content)
        {
            repeater()
            {
                Editable = false;
                field("No.";"No.")
                {
                    Visible = false;
                }
                field("Serial No.";"Serial No.")
                {
                    CaptionML = ENU='Serial No.',
                                FRA='Num Chassis';
                }
                field(Matricule;Matricule)
                {
                }
                field(KATASHIKI;KATASHIKI)
                {
                }
                field("Item No.";"Item No.")
                {
                    CaptionML = ENU='Item No.',
                                FRA='Modèle Véhicule';
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Item Description";"Item Description")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Warranty Starting Date (Parts)";"Warranty Starting Date (Parts)")
                {
                }
                field("Warranty Ending Date (Parts)";"Warranty Ending Date (Parts)")
                {
                }
                field("Warranty Starting Date (Labor)";"Warranty Starting Date (Labor)")
                {
                }
                field("Warranty Ending Date (Labor)";"Warranty Ending Date (Labor)")
                {
                }
                field("Search Description";"Search Description")
                {
                }
                field("Code Titre";"Code Titre")
                {
                }
                field("Installation Date";"Installation Date")
                {
                    Visible = false;
                }
                field("Sales Date";"Sales Date")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("Service Contracts";"Service Contracts")
                {
                    Visible = false;
                }
                field("Last Service Date";"Last Service Date")
                {
                    Visible = false;
                }
                field(Status;Status)
                {
                    Visible = false;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Centre de gestion";"Centre de gestion")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Service Item")
            {
                CaptionML = ENU='&Service Item',
                            FRA='Article de &service';
                Image = ServiceItem;
                action("Com&ponent List")
                {
                    CaptionML = ENU='Com&ponent List',
                                FRA='L&iste des composants';
                    Image = Components;
                    RunObject = Page 5986;
                    RunPageLink = Active=CONST(Yes),
                                  Parent Service Item No.=FIELD(No.);
                    RunPageView = SORTING(Active,Parent Service Item No.,Line No.);
                }
                group(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    action(Statistics)
                    {
                        CaptionML = ENU='Statistics',
                                    FRA='Statistiques';
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page 5982;
                        RunPageLink = No.=FIELD(No.);
                        ShortCutKey = 'F7';
                    }
                }
                group(Troubleshooting)
                {
                    CaptionML = ENU='Troubleshooting',
                                FRA='Incident';
                    Image = Troubleshoot;
                    action("Troubleshooting Setup")
                    {
                        CaptionML = ENU='Troubleshooting Setup',
                                    FRA='Paramètres incidents';
                        Image = Troubleshoot;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page 5993;
                        RunPageLink = Type=CONST(Service Item),
                                      No.=FIELD(No.);
                    }
                    action(Troubleshooting)
                    {
                        CaptionML = ENU='Troubleshooting',
                                    FRA='Incident';
                        Image = Troubleshoot;

                        trigger OnAction();
                        var
                            TroubleshootingHeader : Record "5943";
                        begin
                            TroubleshootingHeader.ShowForServItem(Rec);
                        end;
                    }
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5911;
                    RunPageLink = Table Name=CONST(Service Item),
                                  Table Subtype=CONST(0),
                                  No.=FIELD(No.);
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                group("S&ervice Orders")
                {
                    CaptionML = ENU='S&ervice Orders',
                                FRA='Comm&andes service';
                    Image = "Order";
                    action("&Item Lines")
                    {
                        CaptionML = ENU='&Item Lines',
                                    FRA='Lignes &article';
                        Image = ItemLines;
                        RunObject = Page 5903;
                        RunPageLink = Service Item No.=FIELD(No.);
                        RunPageView = SORTING(Service Item No.);
                    }
                    action("&Service Lines")
                    {
                        CaptionML = ENU='&Service Lines',
                                    FRA='Lignes &service';
                        Image = ServiceLines;
                        RunObject = Page 5904;
                        RunPageLink = Service Item No.=FIELD(No.);
                        RunPageView = SORTING(Service Item No.);
                    }
                }
                group("Service Shi&pments")
                {
                    CaptionML = ENU='Service Shi&pments',
                                FRA='E&xpéditions service';
                    Image = Shipment;
                    action("&Item Lines")
                    {
                        CaptionML = ENU='&Item Lines',
                                    FRA='Lignes &article';
                        Image = ItemLines;
                        RunObject = Page 5950;
                        RunPageLink = Service Item No.=FIELD(No.);
                        RunPageView = SORTING(Service Item No.);
                    }
                    action("&Service Lines")
                    {
                        CaptionML = ENU='&Service Lines',
                                    FRA='Lignes &service';
                        Image = ServiceLines;
                        RunObject = Page 5949;
                        RunPageLink = Service Item No.=FIELD(No.);
                        RunPageView = SORTING(Service Item No.);
                    }
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            FRA='Historique';
                Image = History;
                action("Service Item Lo&g")
                {
                    CaptionML = ENU='Service Item Lo&g',
                                FRA='&Journal article de service';
                    Image = Log;
                    RunObject = Page 5989;
                    RunPageLink = Service Item No.=FIELD(No.);
                }
                action("Service Ledger E&ntries")
                {
                    CaptionML = ENU='Service Ledger E&ntries',
                                FRA='Écritures comptables se&rvice';
                    Image = ServiceLedger;
                    RunObject = Page 5912;
                    RunPageLink = Service Item No. (Serviced)=FIELD(No.),
                                  Service Order No.=FIELD(Service Order Filter),
                                  Service Contract No.=FIELD(Contract Filter),
                                  Posting Date=FIELD(Date Filter);
                    RunPageView = SORTING(Service Item No. (Serviced),Entry Type,Moved from Prepaid Acc.,Type,Posting Date);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("&Warranty Ledger Entries")
                {
                    CaptionML = ENU='&Warranty Ledger Entries',
                                FRA='Écritures comptables &garantie';
                    Image = WarrantyLedger;
                    RunObject = Page 5913;
                    RunPageLink = Service Item No. (Serviced)=FIELD(No.);
                    RunPageView = SORTING(Service Item No. (Serviced),Posting Date,Document No.);
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                CaptionML = ENU='New',
                            FRA='Nouveau';
                action("Import VIN Compagne")
                {
                    Image = UpdateXML;

                    trigger OnAction();
                    var
                        XmlImportVINCompagne : XMLport "50014";
                        LrecUserSetup : Record "91";
                    begin
                        LrecUserSetup.GET(USERID);
                        LrecUserSetup.TESTFIELD("Autoriser Import VIN Compagne",TRUE);
                        XmlImportVINCompagne.RUN;
                    end;
                }
                action("New Item")
                {
                    CaptionML = ENU='New Item',
                                FRA='Nouvel article';
                    Image = NewItem;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page 30;
                    RunPageMode = Create;
                }
            }
        }
        area(reporting)
        {
            action("Service Item")
            {
                CaptionML = ENU='Service Item',
                            FRA='Article de service';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 5935;
            }
            action("Service Item Out of Warranty")
            {
                CaptionML = ENU='Service Item Out of Warranty',
                            FRA='Article de service hors garantie';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 5937;
            }
        }
    }

    var
        ResourceSkill : Record "5956";
        SkilledResourceList : Page "6023";
}

