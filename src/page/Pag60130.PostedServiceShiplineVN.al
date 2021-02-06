page 60130 "Posted Service Ship line VN"
{
    // version NAVW17.00

    AutoSplitKey = true;
    CaptionML = ENU='Posted Service Shipment Lines',
                FRA='Lignes expéd. service enreg.';
    DataCaptionFields = "Document No.";
    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = Table5991;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field(SelectionFilter;SelectionFilter)
                {
                    CaptionML = ENU='Selection Filter',
                                FRA='Filtre sélection';
                    OptionCaptionML = ENU='All Service Shipment Lines,Lines per Selected Service Item,Lines Not Item Related',
                                      FRA='Toutes les lignes expéd. service,Lignes article de service sélectionné,Lignes sans lien';

                    trigger OnValidate();
                    begin
                        SelectionFilterOnAfterValidate;
                    end;
                }
            }
            repeater()
            {
                Editable = false;
                field("Service Item Line No.";"Service Item Line No.")
                {
                    Visible = false;
                }
                field("Service Item No.";"Service Item No.")
                {
                    Visible = false;
                }
                field("Service Item Serial No.";"Service Item Serial No.")
                {
                    Visible = false;
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Work Type Code";"Work Type Code")
                {
                    Visible = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Quantity Consumed";"Quantity Consumed")
                {
                    BlankZero = true;
                }
                field("Qty. Shipped Not Invoiced";"Qty. Shipped Not Invoiced")
                {
                    BlankZero = true;
                }
                field("Fault Area Code";"Fault Area Code")
                {
                }
                field("Symptom Code";"Symptom Code")
                {
                }
                field("Fault Code";"Fault Code")
                {
                }
                field("Fault Reason Code";"Fault Reason Code")
                {
                    Visible = false;
                }
                field("Resolution Code";"Resolution Code")
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
                field("Spare Part Action";"Spare Part Action")
                {
                }
                field("Replaced Item Type";"Replaced Item Type")
                {
                }
                field("Replaced Item No.";"Replaced Item No.")
                {
                }
                field("Contract No.";"Contract No.")
                {
                }
                field("Posting Group";"Posting Group")
                {
                    Visible = false;
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;
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
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action(ItemTrackingEntries)
                {
                    CaptionML = ENU='Item &Tracking Entries',
                                FRA='Écritures &traçabilité';
                    Image = ItemTrackingLedger;

                    trigger OnAction();
                    begin
                        ShowItemTrackingLines;
                    end;
                }
                separator()
                {
                }
                action("Item Invoice &Lines")
                {
                    CaptionML = ENU='Item Invoice &Lines',
                                FRA='&Lignes facture article';
                    Image = ItemInvoice;

                    trigger OnAction();
                    begin
                        TESTFIELD(Type,Type::Item);
                        ShowItemServInvLines;
                    end;
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
                action("&Order Tracking")
                {
                    CaptionML = ENU='&Order Tracking',
                                FRA='C&haînage';
                    Image = OrderTracking;

                    trigger OnAction();
                    begin
                        ShowTracking;
                    end;
                }
                separator()
                {
                }
                action(UndoShipment)
                {
                    CaptionML = ENU='&Undo Shipment',
                                FRA='&Annuler expédition';
                    Image = UndoShipment;

                    trigger OnAction();
                    begin
                        UndoServShptPosting;
                    end;
                }
                action(UndoConsumption)
                {
                    CaptionML = ENU='U&ndo Consumption',
                                FRA='A&nnuler consommation';
                    Image = Undo;

                    trigger OnAction();
                    begin
                        UndoServConsumption;
                    end;
                }
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        CLEAR(SelectionFilter);
        SetSelectionFilter;
    end;

    var
        SelectionFilter : Option "All Shipment Lines","Lines per Selected Service Item","Lines Not Item Related";
        ServItemLineNo : Integer;

    procedure Initialize(ServItemLineNo2 : Integer);
    begin
        ServItemLineNo := ServItemLineNo2;
    end;

    procedure SetSelectionFilter();
    begin
        CASE SelectionFilter OF
          SelectionFilter::"All Shipment Lines":
            SETRANGE("Service Item Line No.");
          SelectionFilter::"Lines per Selected Service Item":
            SETRANGE("Service Item Line No.",ServItemLineNo);
          SelectionFilter::"Lines Not Item Related":
            SETFILTER("Service Item Line No.",'=%1',0);
        END;
        CurrPage.UPDATE(FALSE);
    end;

    procedure ShowTracking();
    var
        ItemLedgEntry : Record "32";
        TempItemLedgEntry : Record "32" temporary;
        TrackingForm : Page "99000822";
    begin
        TESTFIELD(Type,Type::Item);
        IF "Item Shpt. Entry No." <> 0 THEN BEGIN
          ItemLedgEntry.GET("Item Shpt. Entry No.");
          TrackingForm.SetItemLedgEntry(ItemLedgEntry);
        END ELSE
          TrackingForm.SetMultipleItemLedgEntries(TempItemLedgEntry,
            DATABASE::"Service Shipment Line",0,"Document No.",'',0,"Line No.");
        TrackingForm.RUNMODAL;
    end;

    procedure ShowDimensions();
    begin
        ShowDimensions;
    end;

    procedure ShowItemTrackingLines();
    begin
        ShowItemTrackingLines;
    end;

    procedure UndoServShptPosting();
    var
        ServShptLine : Record "5991";
    begin
        ServShptLine.COPY(Rec);
        CurrPage.SETSELECTIONFILTER(ServShptLine);
        CODEUNIT.RUN(CODEUNIT::"Undo Service Shipment Line",ServShptLine);
    end;

    procedure UndoServConsumption();
    var
        ServShptLine : Record "5991";
    begin
        ServShptLine.COPY(Rec);
        CurrPage.SETSELECTIONFILTER(ServShptLine);
        CODEUNIT.RUN(CODEUNIT::"Undo Service Consumption Line",ServShptLine);
    end;

    local procedure SelectionFilterOnAfterValidate();
    begin
        CurrPage.UPDATE;
        SetSelectionFilter;
    end;
}

