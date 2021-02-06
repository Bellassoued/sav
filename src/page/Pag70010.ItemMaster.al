page 70010 "Item Master"
{
    // version PR00011

    CardPageID = "Item Master Card";
    Editable = false;
    PageType = List;
    SourceTable = Table70007;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Article Creer sur Commande";"Article Creer sur Commande")
                {
                }
                field("No.";"No.")
                {
                }
                field("Make Code";"Make Code")
                {
                }
                field("Search Description";"Search Description")
                {
                }
                field(Description;Description)
                {
                }
                field("Code Pays";"Code Pays")
                {
                }
                field("Code Devise";"Code Devise")
                {
                }
                field("New partnumber";"New partnumber")
                {
                }
                field("Alternative No.";"Alternative No.")
                {
                }
                field("Item Group";"Item Group")
                {
                }
                field("Product Code";"Product Code")
                {
                }
                field("Line Group Code";"Line Group Code")
                {
                }
                field(Price;Price)
                {
                }
                field("Net weight";"Net weight")
                {
                    DecimalPlaces = 6:6;
                }
                field("Replacement Type";"Replacement Type")
                {
                }
                field("Special Waste Group Code";"Special Waste Group Code")
                {
                }
                field("Sending Required";"Sending Required")
                {
                }
                field("Dangerous Goods Indicator";"Dangerous Goods Indicator")
                {
                }
                field("Dangerous Goods Code";"Dangerous Goods Code")
                {
                }
                field("Shipping Warehouse";"Shipping Warehouse")
                {
                }
                field("Manufacturing Country";"Manufacturing Country")
                {
                }
                field("Length (cm)";"Length (cm)")
                {
                }
                field("Width (cm)";"Width (cm)")
                {
                }
                field("Height (cm)";"Height (cm)")
                {
                }
                field("Insertion Manuelle";"Insertion Manuelle")
                {
                }
                field("Inséré par";"Inséré par")
                {
                }
                field("Date Insertion Manuelle";"Date Insertion Manuelle")
                {
                }
                field("Price Fob";"Price Fob")
                {
                }
                field("Item Exist";"Item Exist")
                {
                }
                field("Origin of division";"Origin of division")
                {
                }
                field("EPM Non Reorder Code";"EPM Non Reorder Code")
                {
                }
                field("R/A code";"R/A code")
                {
                }
                field("Price Class";"Price Class")
                {
                }
                field("Optifit flag";"Optifit flag")
                {
                }
                field("Substitution code";"Substitution code")
                {
                }
                field("Quantity in used";"Quantity in used")
                {
                }
                field("Production Start Date";"Production Start Date")
                {
                }
                field("Production End Date";"Production End Date")
                {
                }
                field("Unit pack code";"Unit pack code")
                {
                }
                field("Not used anymore";"Not used anymore")
                {
                }
                field("Qty in package";"Qty in package")
                {
                }
                field("Vin Check";"Vin Check")
                {
                }
                field("Distribution Code";"Distribution Code")
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
                field("Lexus ID";"Lexus ID")
                {
                }
                field("Part Name Code";"Part Name Code")
                {
                }
                field("Max qty via VOR";"Max qty via VOR")
                {
                }
                field("Tariff code";"Tariff code")
                {
                }
                field("Controle Technique";"Controle Technique")
                {
                }
                field("TMC Stock Code";"TMC Stock Code")
                {
                }
                field("Accessory Code";"Accessory Code")
                {
                }
                field("Iso Country Code";"Iso Country Code")
                {
                }
                field("Special Control Code";"Special Control Code")
                {
                }
                field("Forecast Code";"Forecast Code")
                {
                }
                field("Short tariff code";"Short tariff code")
                {
                }
                field("Product Function Code (PFC)";"Product Function Code (PFC)")
                {
                }
                field("European Discount Code (EDC)";"European Discount Code (EDC)")
                {
                }
                field("European Recommanded Price";"European Recommanded Price")
                {
                }
                field("Default Tarrif Code";"Default Tarrif Code")
                {
                }
                field("Dropshipment Flag";"Dropshipment Flag")
                {
                }
                field("Core Unit Part Number";"Core Unit Part Number")
                {
                }
                field("EPM Hazardous Goods Id 3";"EPM Hazardous Goods Id 3")
                {
                }
                field("Pricing Model";"Pricing Model")
                {
                }
                field("CCM Cost";"CCM Cost")
                {
                }
                field(FILLER05;FILLER05)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group()
            {
                action("Import item master")
                {
                    CaptionML = ENU='Import Item Master',
                                FRA='Import Article Master';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report 70003;
                }
                action("Item Master Price")
                {
                    Image = Item;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 70011;
                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Create Item")
                {
                    CaptionML = ENU='Create Item',
                                FRA='Creation Article';
                    Image = CreateMovement;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LPagConfigurateurFicheArticle : Page "60186";
                        LRecItemMaster : Record "70007";
                    begin
                        LPagConfigurateurFicheArticle.SetOpenItemCard(FALSE);
                        CurrPage.SETSELECTIONFILTER(LRecItemMaster);
                        LRecItemMaster.MARKEDONLY(TRUE);
                        IF LRecItemMaster.FINDSET THEN
                        REPEAT
                          LPagConfigurateurFicheArticle.FctCreateItemPiece(LRecItemMaster);
                        UNTIL LRecItemMaster.NEXT = 0;
                        MESSAGE('Nombre des articles crées : %1',LRecItemMaster.COUNT);
                    end;
                }
                action("Fiche Article")
                {
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 30;
                    RunPageLink = No.=FIELD(No.);
                }
                action("mise à jour code remise")
                {
                    RunObject = XMLport 50063;
                }
            }
        }
    }
}

