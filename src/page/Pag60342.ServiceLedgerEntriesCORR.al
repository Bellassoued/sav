page 60342 "Service Ledger EntriesCORR"
{
    // version CORRECTION

    CaptionML = ENU='Service Ledger Entries',
                FRA='Écritures comptables service';
    DataCaptionFields = "Service Contract No.","Service Item No. (Serviced)","Service Order No.";
    PageType = List;
    Permissions = TableData 5907=rm;
    SourceTable = Table5907;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("Entry Type";"Entry Type")
                {
                }
                field("Service Order Type";"Service Order Type")
                {
                    Visible = false;
                }
                field("Service Contract No.";"Service Contract No.")
                {
                }
                field("Service Order No.";"Service Order No.")
                {
                }
                field("Job No.";"Job No.")
                {
                    Visible = false;
                }
                field("Job Task No.";"Job Task No.")
                {
                    Visible = false;
                }
                field("Job Line Type";"Job Line Type")
                {
                    Visible = false;
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Visible = false;
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Ship-to Code";"Ship-to Code")
                {
                    Visible = false;
                }
                field("Service Item No. (Serviced)";"Service Item No. (Serviced)")
                {
                }
                field("Item No. (Serviced)";"Item No. (Serviced)")
                {
                }
                field("Serial No. (Serviced)";"Serial No. (Serviced)")
                {
                }
                field("Contract Invoice Period";"Contract Invoice Period")
                {
                    Visible = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Contract Group Code";"Contract Group Code")
                {
                    Visible = false;
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field("Cost Amount";"Cost Amount")
                {
                }
                field("Discount Amount";"Discount Amount")
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Charged Qty.";"Charged Qty.")
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
                field("Discount %";"Discount %")
                {
                }
                field("Contract Disc. Amount";"Contract Disc. Amount")
                {
                    Visible = false;
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                }
                field("Moved from Prepaid Acc.";"Moved from Prepaid Acc.")
                {
                }
                field("Serv. Contract Acc. Gr. Code";"Serv. Contract Acc. Gr. Code")
                {
                }
                field("Fault Reason Code";"Fault Reason Code")
                {
                }
                field(Description;Description)
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Location Code";"Location Code")
                {
                    Visible = false;
                }
                field("Bin Code";"Bin Code")
                {
                    Visible = false;
                }
                field(Prepaid;Prepaid)
                {
                    Visible = false;
                }
                field(Open;Open)
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Entry No.";"Entry No.")
                {
                }
                field("Applies-to Entry No.";"Applies-to Entry No.")
                {
                }
                field(Amount;Amount)
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
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Entry")
            {
                CaptionML = ENU='&Entry',
                            FRA='Écritur&e';
                Image = Entry;
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate.SetDoc("Posting Date","Document No.");
                    Navigate.RUN;
                end;
            }
            action("Ouvrir Ordre de Réparation")
            {
                Image = Receipt;

                trigger OnAction();
                begin
                    ReceptionSAV.GET("Reception No");
                    CLEAR(FicheReceptionGrandeRéparat);
                    FicheReceptionGrandeRéparat.SETRECORD(ReceptionSAV);
                    FicheReceptionGrandeRéparat.SETTABLEVIEW(ReceptionSAV);
                    FicheReceptionGrandeRéparat.RUNMODAL;
                end;
            }
        }
    }

    var
        Navigate : Page "344";
        "FicheReceptionGrandeRéparat" : Page "60018";
        ReceptionSAV : Record "60008";
}

