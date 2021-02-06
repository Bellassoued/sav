page 60151 "Statistique Vehicule Line"
{
    // version NAVW17.00,MAZDA15

    CaptionML = ENU='Lines',
                FRA='Lignes';
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table2000000007;

    layout
    {
        area(content)
        {
            repeater()
            {
                Editable = false;
                field("Period Start";"Period Start")
                {
                    CaptionML = ENU='Period Start',
                                FRA='Début période';
                }
                field("Period Name";"Period Name")
                {
                    CaptionML = ENU='Period Name',
                                FRA='Nom période';
                }
                field(NbreDevisOuvert;NbreDevisOuvert)
                {
                    Caption = 'Nbre Devis Ouvert';
                }
                field(NbreDevisAapprouver;NbreDevisAapprouver)
                {
                    Caption = 'Nbre Devis Attente approb.';
                }
                field(NbreDevisLancer;NbreDevisLancer)
                {
                    Caption = 'Nbre Devis Lancer';
                }
                field(NbreReservation;NbreReservation)
                {
                    Caption = 'Nbre Reservation';
                }
                field(NbreVehiculeVendu;NbreVehiculeVendu)
                {
                    Caption = 'Nbre Vehicules Vendus';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        NbreDevisOuvert  := 0;
        NbreDevisLancer  := 0;
        NbreReservation  := 0;
        NbreVehiculeVendu:= 0;

        RecSalesQuotesOpenOrReleased.RESET;
        RecSalesQuotesOpenOrReleased.SETRANGE("Document Type",RecSalesQuotesOpenOrReleased."Document Type"::Quote);
        RecSalesQuotesOpenOrReleased.SETRANGE(Type,RecSalesQuotesOpenOrReleased.Type::Item);
        RecSalesQuotesOpenOrReleased.SETRANGE("Document Date","Period Start","Period End");
        RecSalesQuotesOpenOrReleased.SETRANGE("Posting Group",RecSalesSetup."Groupe Compta. Véhicule");
        IF CentreGestion <> '' THEN
          RecSalesQuotesOpenOrReleased.SETRANGE("Responsibility Center",CentreGestion);
        IF ModelCode <> '' THEN
          RecSalesQuotesOpenOrReleased.SETRANGE("No.",ModelCode);
        IF VariantCode <> '' THEN
          RecSalesQuotesOpenOrReleased.SETRANGE("Variant Code",VariantCode);
        IF SalesPersonCode <> '' THEN
          RecSalesQuotesOpenOrReleased.SETRANGE("Salesperson Code",SalesPersonCode);

        RecSalesQuotesOpenOrReleased.SETRANGE(Status,RecSalesQuotesOpenOrReleased.Status::Released);
        RecSalesQuotesOpenOrReleased.CALCSUMS(Quantity);
        NbreDevisLancer := RecSalesQuotesOpenOrReleased.Quantity;

        RecSalesQuotesOpenOrReleased.SETFILTER(Status,'<>%1',RecSalesQuotesOpenOrReleased.Status::Released);
        RecSalesQuotesOpenOrReleased.CALCSUMS(Quantity);
        NbreDevisOuvert := RecSalesQuotesOpenOrReleased.Quantity;

        RecSalesQuotesOpenOrReleased.SETFILTER(Status,'<>%1',RecSalesQuotesOpenOrReleased.Status::"Pending Approval");
        RecSalesQuotesOpenOrReleased.CALCSUMS(Quantity);
        NbreDevisAapprouver := RecSalesQuotesOpenOrReleased.Quantity ;

        RecSalesLines.RESET;
        RecSalesInvoiceLine.SETCURRENTKEY("Sell-to Customer No.",Type,"Document No.");
        RecSalesLines.SETRANGE(Type,RecSalesQuotesOpenOrReleased.Type::Item);
        RecSalesLines.SETRANGE("Posting Date","Period Start","Period End");
        RecSalesLines.SETRANGE("Posting Group",RecSalesSetup."Groupe Compta. Véhicule");
        IF CentreGestion <> '' THEN
          RecSalesLines.SETRANGE("Responsibility Center",CentreGestion);
        IF ModelCode <> '' THEN
          RecSalesLines.SETRANGE("No.",ModelCode);
        IF VariantCode <> '' THEN
          RecSalesLines.SETRANGE("Variant Code",VariantCode);
        IF SalesPersonCode <> '' THEN
          RecSalesLines.SETRANGE("Salesperson Code",SalesPersonCode);

        RecSalesLines.SETFILTER("Reserved Quantity",'<>0');
        IF RecSalesLines.FINDSET THEN BEGIN
          REPEAT
            RecSalesLines.CALCFIELDS("Reserved Quantity");
            NbreReservation += RecSalesLines."Reserved Quantity";
          UNTIL RecSalesLines.NEXT = 0;
        END;

        RecSalesInvoiceLine.RESET;
        RecSalesInvoiceLine.SETCURRENTKEY("Sell-to Customer No.",Type,"Document No.");
        RecSalesInvoiceLine.SETRANGE(Type,RecSalesInvoiceLine.Type::Item);
        RecSalesInvoiceLine.SETRANGE("Posting Date","Period Start","Period End");
        RecSalesInvoiceLine.SETRANGE("Posting Group",RecSalesSetup."Groupe Compta. Véhicule");
        IF CentreGestion <> '' THEN
          RecSalesInvoiceLine.SETRANGE("Responsibility Center",CentreGestion);
        IF ModelCode <> '' THEN
          RecSalesInvoiceLine.SETRANGE("No.",ModelCode);
        IF VariantCode <> '' THEN
          RecSalesInvoiceLine.SETRANGE("Variant Code",VariantCode);
        IF RecSalesInvoiceLine.FINDSET THEN BEGIN
            REPEAT

              IF SalesPersonCode = '' THEN
                NbreVehiculeVendu += RecSalesInvoiceLine.Quantity
              ELSE BEGIN
                    IF RecSalesInvoiceHeader.GET(RecSalesInvoiceLine."Document No.") THEN
                      IF SalesPersonCode = RecSalesInvoiceHeader."Salesperson Code" THEN

                        NbreVehiculeVendu += RecSalesInvoiceLine.Quantity;
                   END;

            UNTIL RecSalesInvoiceLine.NEXT = 0;

        END;
    end;

    trigger OnFindRecord(Which : Text) : Boolean;
    begin
        EXIT(PeriodFormMgt.FindDate(Which,Rec,ItemPeriodLength));
    end;

    trigger OnNextRecord(Steps : Integer) : Integer;
    begin
        EXIT(PeriodFormMgt.NextDate(Steps,Rec,ItemPeriodLength));
    end;

    trigger OnOpenPage();
    begin
        RESET;
        RecSalesSetup.GET;
    end;

    var
        Item : Record "27";
        PeriodFormMgt : Codeunit "359";
        ItemPeriodLength : Option Day,Week,Month,Quarter,Year,Period;
        NbrReceptionRpdnew : Integer;
        RecGReceptSAV : Record "60008";
        NbrReceptionRpdInvoiced : Integer;
        NbrReceptionRp : Integer;
        NbrReceptionGRD : Integer;
        CentreGestion : Code[20];
        SalesPersonCode : Code[10];
        ModelCode : Code[20];
        VariantCode : Code[20];
        NbreDevisOuvert : Decimal;
        NbreDevisLancer : Decimal;
        NbreReservation : Decimal;
        NbreVehiculeVendu : Decimal;
        RecSalesQuotesOpenOrReleased : Record "37";
        RecSalesLines : Record "37";
        RecSalesInvoiceLine : Record "113";
        RecReservation : Record "337";
        RecSalesHeader : Record "36";
        RecSalesSetup : Record "311";
        RecSalesInvoiceHeader : Record "112";
        NbreDevisAapprouver : Integer;

    procedure Set(NewItemPeriodLength : Integer;"New Centre de gestion" : Code[20];NewVendor : Code[10];NewModel : Code[20];NewVariant : Code[20]);
    begin
        ItemPeriodLength := NewItemPeriodLength;
        CentreGestion := "New Centre de gestion" ;
        SalesPersonCode := NewVendor;
        ModelCode := NewModel;
        VariantCode := NewVariant;
        CurrPage.UPDATE(FALSE);
    end;
}

