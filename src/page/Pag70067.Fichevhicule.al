page 70067 "Fiche véhicule"
{
    // version NAVW19.00,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Service Item Card',
                FRA='Fiche article de service';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = Table5940;

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
                    Editable = false;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                    Importance = Promoted;
                }
                field("Item No.";"Item No.")
                {
                    CaptionML = ENU='Item No.',
                                FRA='Modèle Véhicule';
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        CALCFIELDS("Item Description");
                    end;
                }
                field("Item Description";"Item Description")
                {
                    DrillDown = false;
                }
                field("Service Item Group Code";"Service Item Group Code")
                {
                }
                field("Service Price Group Code";"Service Price Group Code")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field("Serial No.";"Serial No.")
                {
                    AssistEdit = true;

                    trigger OnAssistEdit();
                    var
                        ItemLedgerEntry : Record "32";
                    begin
                        CLEAR(ItemLedgerEntry);
                        ItemLedgerEntry.FILTERGROUP(2);
                        ItemLedgerEntry.SETRANGE("Item No.","Item No.");
                        IF "Variant Code" <> '' THEN
                          ItemLedgerEntry.SETRANGE("Variant Code","Variant Code");
                        ItemLedgerEntry.SETFILTER("Serial No.",'<>%1','');
                        ItemLedgerEntry.FILTERGROUP(0);

                        IF PAGE.RUNMODAL(0,ItemLedgerEntry) = ACTION::LookupOK THEN
                          VALIDATE("Serial No.",ItemLedgerEntry."Serial No.");
                    end;
                }
                field(Matricule;Matricule)
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("Sales Date";"Sales Date")
                {
                }
                field(Status;Status)
                {
                    Importance = Promoted;
                }
                field("Service Item Components";"Service Item Components")
                {
                }
                field("Search Description";"Search Description")
                {
                }
                field("Response Time (Hours)";"Response Time (Hours)")
                {
                }
                field(Priority;Priority)
                {
                }
                field("Last Service Date";"Last Service Date")
                {
                    Editable = false;
                }
                field("Warranty Starting Date (Parts)";"Warranty Starting Date (Parts)")
                {
                }
                field("Warranty Ending Date (Parts)";"Warranty Ending Date (Parts)")
                {
                }
                field("Warranty % (Parts)";"Warranty % (Parts)")
                {
                }
                field("Warranty Starting Date (Labor)";"Warranty Starting Date (Labor)")
                {
                }
                field("Warranty Ending Date (Labor)";"Warranty Ending Date (Labor)")
                {
                }
                field("Warranty % (Labor)";"Warranty % (Labor)")
                {
                }
                field("Preferred Resource";"Preferred Resource")
                {
                }
                field("Affecté sur";"Affecté sur")
                {
                }
                field("No. Bord. PVN";"No. Bord. PVN")
                {
                }
                field("Statut PVN";"Statut PVN")
                {
                    Editable = false;
                }
                field("Statut Carte Grise";"Statut Carte Grise")
                {
                    Editable = false;
                }
                field("Statut Livraison";"Statut Livraison")
                {
                    Editable = false;
                }
            }
            group(Customer)
            {
                CaptionML = ENU='Customer',
                            FRA='Client';
                field("Customer No.";"Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        CALCFIELDS(Name,"Name 2",Address,"Address 2","Post Code",
                          City,Contact,"Phone No.",County,"Country/Region Code");
                        CustomerNoOnAfterValidate;
                    end;
                }
                field(Name;Name)
                {
                    DrillDown = false;
                    Importance = Promoted;
                }
                field(Address;Address)
                {
                    DrillDown = false;
                }
                field("Address 2";"Address 2")
                {
                    DrillDown = false;
                }
                field("Post Code";"Post Code")
                {
                    DrillDown = false;
                }
                field(City;City)
                {
                    DrillDown = false;
                }
                field(Contact;Contact)
                {
                    DrillDown = false;
                    Importance = Promoted;
                }
                field("Phone No.";"Phone No.")
                {
                    DrillDown = false;
                }
                field("Location of Service Item";"Location of Service Item")
                {
                    Importance = Promoted;
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        UpdateShipToCode;
                    end;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    DrillDown = false;
                }
                field("Ship-to Address";"Ship-to Address")
                {
                    DrillDown = false;
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                    DrillDown = false;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    DrillDown = false;
                    Importance = Promoted;
                }
                field("Ship-to City";"Ship-to City")
                {
                    DrillDown = false;
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    DrillDown = false;
                    Importance = Promoted;
                }
                field("Ship-to Phone No.";"Ship-to Phone No.")
                {
                    DrillDown = false;
                }
                field(Emplacement;Emplacement)
                {
                }
                field("Préparation/Livraison";"Préparation/Livraison")
                {
                }
            }
            group(Contract)
            {
                CaptionML = ENU='Contract',
                            FRA='Contrat';
                field("Default Contract Cost";"Default Contract Cost")
                {
                }
                field("Default Contract Value";"Default Contract Value")
                {
                }
                field("Default Contract Discount %";"Default Contract Discount %")
                {
                }
                field("Service Contracts";"Service Contracts")
                {
                }
            }
            group(Vendor)
            {
                CaptionML = ENU='Vendor',
                            FRA='Fournisseur';
                field("Vendor No.";"Vendor No.")
                {

                    trigger OnValidate();
                    begin
                        CALCFIELDS("Vendor Name");
                    end;
                }
                field("Vendor Name";"Vendor Name")
                {
                    DrillDown = false;
                }
                field("Vendor Item No.";"Vendor Item No.")
                {
                }
                field("Vendor Item Name";"Vendor Item Name")
                {
                }
            }
            group(Detail)
            {
                CaptionML = ENU='Detail',
                            FRA='Détails';
                field("Sales Unit Cost";"Sales Unit Cost")
                {
                }
                field("Sales Unit Price";"Sales Unit Price")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Installation Date";"Installation Date")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9084)
            {
                SubPageLink = No.=FIELD(Customer No.),
                              Date Filter=FIELD(Date Filter);
                Visible = true;
            }
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
                separator()
                {
                }
                action("&Components")
                {
                    CaptionML = ENU='&Components',
                                FRA='&Composants';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 5986;
                    RunPageLink = Active=CONST(Yes),
                                  Parent Service Item No.=FIELD(No.);
                    RunPageView = SORTING(Active,Parent Service Item No.,Line No.);
                }
                action("&Dimensions")
                {
                    CaptionML = ENU='&Dimensions',
                                FRA='A&xes analytiques';
                    Image = Dimensions;
                    RunObject = Page 540;
                    RunPageLink = Table ID=CONST(5940),
                                  No.=FIELD(No.);
                    ShortCutKey = 'Shift+Ctrl+D';
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
                        RunObject = Page 5993;
                        RunPageLink = Type=CONST(Service Item),
                                      No.=FIELD(No.);
                    }
                    action("<Page Troubleshooting>")
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
                    separator()
                    {
                        CaptionML = ENU='',
                                    FRA='';
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
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
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
                                FRA='Contrats d&e service';
                    Image = ServiceAgreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 6075;
                    RunPageLink = Service Item No.=FIELD(No.);
                    RunPageView = SORTING(Service Item No.,Contract Status);
                }
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
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
                Image = NewItem;
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
            action("Service Line Item Label")
            {
                CaptionML = ENU='Service Line Item Label',
                            FRA='Étiquette article ligne service';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5901;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        UpdateShipToCode;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        IF "Item No." = '' THEN
          IF GETFILTER("Item No.") <> '' THEN
            IF GETRANGEMIN("Item No.") = GETRANGEMAX("Item No.") THEN
              "Item No." := GETRANGEMIN("Item No.");

        IF "Customer No." = '' THEN
          IF GETFILTER("Customer No.") <> '' THEN
            IF GETRANGEMIN("Customer No.") = GETRANGEMAX("Customer No.") THEN
              "Customer No." := GETRANGEMIN("Customer No.");
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        //<<CT16V001 ZM 15/05/2016
        IF "Item No." = '' THEN
          ERROR(TXT50000);
        TESTFIELD("Serial No.");
        IF Emplacement=Emplacement::"Chez client" THEN
          TESTFIELD(Matricule);
        // TMP IF STRLEN("Serial No.") <> 17 THEN ERROR('17 caractères !')
        //>>CT16V001 ZM 15/05/2016
    end;

    var
        ResourceSkill : Record "5956";
        SkilledResourceList : Page "6023";
        TXT50000 : Label 'Merci de saisir le modèle de véhicule.';

    local procedure UpdateShipToCode();
    begin
        IF "Ship-to Code" = '' THEN BEGIN
          "Ship-to Name" := Name;
          "Ship-to Address" := Address;
          "Ship-to Address 2" := "Address 2";
          "Ship-to Post Code" := "Post Code";
          "Ship-to City" := City;
          "Ship-to Phone No." := "Phone No.";
          "Ship-to Contact" := Contact;
        END ELSE
          CALCFIELDS(
            "Ship-to Name","Ship-to Name 2","Ship-to Address","Ship-to Address 2","Ship-to Post Code","Ship-to City",
            "Ship-to County","Ship-to Country/Region Code","Ship-to Contact","Ship-to Phone No.");
    end;

    local procedure CustomerNoOnAfterValidate();
    begin
        IF "Customer No." <> xRec."Customer No." THEN
          UpdateShipToCode;
    end;
}

