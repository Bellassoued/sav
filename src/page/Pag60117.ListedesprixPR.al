page 60117 "Liste des prix PR"
{
    // version CT16V002

    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table7002;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No.";"Item No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Unit Price";"Unit Price")
                {
                    CaptionML = ENU='Unit Price',
                                FRA='Prix vente HT';
                }
                field(DecGPrixTTC;DecGPrixTTC)
                {
                    Caption = 'Montant TTC';
                }
                field("Stock Pr";"Stock Pr")
                {
                    Caption = 'Stock Pr';
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Sales Type";"Sales Type")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Ending Date";"Ending Date")
                {
                }
                field("Groupe compta stock";"Groupe compta stock")
                {
                }
                field("Coût Unitaire";RecGItem."Unit Cost")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        DecGPrixTTC := "Unit Price" * 1.18 ;
        //"Stock Pr" := CalculStockPr("Item No.");
        CLEAR(RecGItem);

        IF RecGItem.GET("Item No.") THEN
            "Stock Pr" := RecGItem.CalcStockEconAuto();
    end;

    trigger OnOpenPage();
    begin
        //SM PRICE LIST 18/09/14
        SETFILTER("Starting Date",'<=t&<>''''');
        SETFILTER("Ending Date"  ,'>=t|''''');
        //END SM
    end;

    var
        DecGPrixTTC : Decimal;
        "Stock Pr" : Decimal;
        RecGItem : Record "27";

    procedure CalculStockPr(PItem : Code[30]) ResStock : Decimal;
    var
        RecUserSetup : Record "91";
        ItemLedgerEntry : Record "32";
    begin
        ResStock := 0 ;
        CLEAR(RecUserSetup);
        RecUserSetup.SETRANGE("User ID",USERID);
        IF RecUserSetup.FINDFIRST THEN
        BEGIN
            CLEAR(ItemLedgerEntry);
            ItemLedgerEntry.SETRANGE("Item No.",PItem);
            //SM
            IF RecUserSetup."Mag Reservation/Defaut" <> '' THEN
              ItemLedgerEntry.SETRANGE("Location Code",RecUserSetup."Mag Reservation/Defaut")
            ELSE
              ItemLedgerEntry.SETRANGE("Location Code");
            //END SM


            IF ItemLedgerEntry.FINDFIRST THEN
            BEGIN
                 ResStock := ResStock + ItemLedgerEntry.Quantity ;
            END;
        END;
    end;

    procedure BinContent(PItem : Code[30]) ResStock : Decimal;
    var
        RecUserSetup : Record "91";
        ItemLedgerEntry : Record "32";
        RecBinContent : Record "7302";
    begin
        ResStock := 0 ;
        CLEAR(RecUserSetup);
        RecUserSetup.SETRANGE("User ID",USERID);
        IF RecUserSetup.FINDFIRST THEN
        BEGIN
            CLEAR(RecBinContent);
            RecBinContent.SETRANGE(RecBinContent."Item No.",PItem);
            RecBinContent.SETRANGE(RecBinContent."Location Code",RecUserSetup."Mag Reservation/Defaut");
            IF RecBinContent.FINDFIRST THEN
            BEGIN
                 ResStock := ResStock + RecBinContent.Quantity ;
            END;
        END;
    end;
}

