page 60333 "Service Item Sold Not Shipped"
{
    // version NAVW18.00,CT16V001

    //  CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Service Item List',
                FRA='Liste des articles de service';
    CardPageID = "Service Item Card";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Table5940;
    SourceTableView = WHERE(Date Livraison=FILTER(''),
                            Sales Date=FILTER(<>''),
                            Salesperson Code=FILTER(<>''));

    layout
    {
        area(content)
        {
            repeater()
            {
                Editable = false;
                field(Famille;Famille)
                {
                }
                field(Description;Description)
                {
                }
                field("Serial No.";"Serial No.")
                {
                    CaptionML = ENU='Serial No.',
                                FRA='No Chassis (VIN)';
                }
                field(Matricule;Matricule)
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("No. Facture";"No. Facture")
                {
                }
                field("Date Embarquement";"Date Embarquement")
                {
                }
                field(Emplacement;GetBin("Serial No."))
                {
                }
                field(AI;AI)
                {
                }
                field("Date AI";"Date AI")
                {
                }
                field(DateCmde;DateCmde)
                {
                }
                field("Date Confirma Cde";"Date Confirma Cde")
                {
                }
                field(Justificatif;Justificatif)
                {
                }
                field("Date Justificatif";"Date Justificatif")
                {
                }
                field("Date Recep Dossier";"Date Recep Dossier")
                {
                }
                field("Date Heure Reception Dossier";"Date Heure Reception Dossier")
                {
                }
                field("Date  Dossier Complet";"Date  Dossier Complet")
                {
                }
                field("Dossier Validé";"Dossier Validé")
                {
                }
                field("Date Dossier Validé";"Date Dossier Validé")
                {
                }
                field("Date Time Emission Bord. PVN";"Date Time Emission Bord. PVN")
                {
                }
                field("Date Heure Envoie PVN";"Date Heure Envoie PVN")
                {
                }
                field("Date Heure Réception PVN";"Date Heure Réception PVN")
                {
                }
                field("Date preparation";"Date preparation")
                {
                }
                field("Date Acceptation Facturation";"Date Acceptation Facturation")
                {
                }
                field("Date Facturation Vente VN";"Date Facturation Vente VN")
                {
                }
                field("date réglement";"date réglement")
                {
                }
                field("Depot C.Grise";"Depot C.Grise")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("Recept C.Grise";"Recept C.Grise")
                {
                }
                field("Date rendez vous";"Date rendez vous")
                {
                }
                field("Date Livraison";"Date Livraison")
                {
                }
                field(Accepté;Accepté)
                {
                }
                field("Préparation/Livraison";"Préparation/Livraison")
                {
                }
                field("Centre de gestion";"Centre de gestion")
                {
                }
                field(VendeurLiv;VendeurLiv)
                {
                }
                field("Salesperson Code";"Salesperson Code")
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
                separator()
                {
                }
                group(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    action("&Dimensions-Single")
                    {
                        CaptionML = ENU='&Dimensions-Single',
                                    FRA='Affectations - &Simples';
                        Image = Dimensions;
                        RunObject = Page 540;
                        RunPageLink = Table ID=CONST(5940),
                                      No.=FIELD(No.);
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData 348=R;
                        CaptionML = ENU='Dimensions-&Multiple',
                                    FRA='Affectations - &Multiples';
                        Image = DimensionSets;

                        trigger OnAction();
                        var
                            ServiceItem : Record "5940";
                            DefaultDimMultiple : Page "542";
                        begin
                            CurrPage.SETSELECTIONFILTER(ServiceItem);
                            DefaultDimMultiple.SetMultiServiceItem(ServiceItem);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
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
                    action("Tr&endscape")
                    {
                        CaptionML = ENU='Tr&endscape',
                                    FRA='Tr&endscape';
                        Image = Trendscape;
                        RunObject = Page 5983;
                        RunPageLink = No.=FIELD(No.);
                    }
                }
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
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
                action("Resource Skills")
                {
                    CaptionML = ENU='Resource Skills',
                                FRA='Compétences ressource';
                    Image = ResourceSkills;
                    RunObject = Page 6019;
                    RunPageLink = Type=CONST(Service Item),
                                  No.=FIELD(No.);
                }
                action("S&killed Resources")
                {
                    CaptionML = ENU='S&killed Resources',
                                FRA='Ressources c&ompétentes';
                    Image = ResourceSkills;

                    trigger OnAction();
                    begin
                        CLEAR(SkilledResourceList);
                        SkilledResourceList.Initialize(ResourceSkill.Type::"Service Item","No.",Description);
                        SkilledResourceList.RUNMODAL;
                    end;
                }
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
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
                action("Ser&vice Contracts")
                {
                    CaptionML = ENU='Ser&vice Contracts',
                                FRA='Co&ntrats de service';
                    Image = ServiceAgreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 6075;
                    RunPageLink = Service Item No.=FIELD(No.);
                    RunPageView = SORTING(Service Item No.,Contract Status);
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
                action("Historique VIN")
                {
                    Image = History;
                    RunObject = Page 70253;
                    RunPageLink = VIN=FIELD(Serial No.);
                }
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
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                CaptionML = ENU='New',
                            FRA='Nouveau';
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
                action("Fiche véhicule")
                {
                    Image = Shipment;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        "PagLFichevéhicule" : Page "5980";
                    begin
                        //ADD KK 20122016
                        CLEAR(PagLFichevéhicule);
                        PagLFichevéhicule.SETRECORD(Rec);
                        PagLFichevéhicule.RUN;
                    end;
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
            action("Service Item Label")
            {
                CaptionML = ENU='Service Item Label',
                            FRA='Étiquette article de service';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5901;
            }
            action("Service Item Resource usage")
            {
                CaptionML = ENU='Service Item Resource usage',
                            FRA='Utilisation des ressources article de service';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 5939;
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
            action("Import campagne de rappel")
            {
                Visible = false;

                trigger OnAction();
                var
                    XmlPImportVINCompagne : XMLport "70050";
                begin
                    CLEAR(XmlPImportVINCompagne);
                    XmlPImportVINCompagne.RUN;
                end;
            }
        }
    }

    var
        ResourceSkill : Record "5956";
        SkilledResourceList : Page "6023";
}

