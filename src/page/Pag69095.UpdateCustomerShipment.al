page 69095 "Update Customer Shipment"
{
    Permissions = TableData 21=rm,
                  TableData 32=rm,
                  TableData 36=rm,
                  TableData 37=rm,
                  TableData 110=rm,
                  TableData 111=rm,
                  TableData 112=rm,
                  TableData 113=rm,
                  TableData 379=rm,
                  TableData 5802=rm;

    layout
    {
        area(content)
        {
            field(Service;Service)
            {
                Caption = 'Service';
            }
            field(Comptoire;Comptoire)
            {
                Caption = 'Comptoire';
            }
            field("Numéro B.L";ShipNo)
            {
                Caption = 'Numéro B.L PR';
                TableRelation = "Sales Shipment Header".No.;

                trigger OnValidate();
                begin
                    CLEAR(SalesShipmentHeader);
                    SalesShipmentHeader.GET(ShipNo);
                    BEGIN
                    CustNo := SalesShipmentHeader."Bill-to Customer No.";
                    CustName := SalesShipmentHeader."Bill-to Name";
                    //SalesShipmentHeader.CALCFIELDS("Amount Including VAT");
                    //AmountINVAT := SalesInvoiceHeader."Amount Including VAT";
                    PostinDate := SalesShipmentHeader."Posting Date";
                    END;
                end;
            }
            field(SrvNo;SrvNo)
            {
                Caption = 'Numéro B.L Service';

                trigger OnValidate();
                begin
                    CLEAR(ServiceShipmentHeader);
                    ServiceShipmentHeader.GET(ShipNo);
                    BEGIN
                    CustNo := ServiceShipmentHeader."Bill-to Customer No.";
                    CustName := ServiceShipmentHeader."Bill-to Name";
                    //SalesShipmentHeader.CALCFIELDS("Amount Including VAT");
                    //AmountINVAT := SalesInvoiceHeader."Amount Including VAT";
                    PostinDate := ServiceShipmentHeader."Posting Date";
                    END;
                end;
            }
            field(CustNo;CustNo)
            {
                Caption = 'Code Client';
                Editable = false;
            }
            field(CustName;CustName)
            {
                Caption = 'Nom Client';
                Editable = false;
                Style = Attention;
                StyleExpr = TRUE;
            }
            field(PostinDate;PostinDate)
            {
                Caption = 'Date Comptabilisation';
                Editable = false;
            }
            field(AmountINVAT;AmountINVAT)
            {
                Caption = 'Montnat TTC';
                Editable = false;
                Visible = false;
            }
            field("Nouveau Code Client";NewCustomerCode)
            {
                Caption = 'Nouveau Code Client';
                TableRelation = Customer.No.;

                trigger OnValidate();
                begin
                    CLEAR(Cust);
                    Cust.GET(NewCustomerCode);
                    NewCustomerName := Cust.Name;
                end;
            }
            field("Nouveau Nom Client";NewCustomerName)
            {
                Caption = 'Nouveau Nom Client';
                Editable = false;
                Style = Favorable;
                StyleExpr = TRUE;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Changer code Client")
            {

                trigger OnAction();
                begin
                    CLEAR(Cust1);
                    Cust1.GET(NewCustomerCode);

                    //IF (USERID <> 'BSB\ADMINISTRATEUR') OR (USERID <> 'BSB\SBS') THEN ERROR('Vous n''êtes pas autoriser a cette fonction');
                    IF CONFIRM(' Hello Men : Do you want to change th customer number ? ',TRUE,FALSE) THEN
                    BEGIN
                    IF Comptoire THEN
                     BEGIN
                      CLEAR(ItemLedgerEntry);
                      ItemLedgerEntry.SETFILTER("Document No.",'%1',ShipNo);
                      IF ItemLedgerEntry.FIND('-') THEN
                        REPEAT
                            ItemLedgerEntry."Source No."    := NewCustomerCode;
                          ItemLedgerEntry.MODIFY;
                        UNTIL ItemLedgerEntry.NEXT = 0;
                      CLEAR(ValueEntry);
                      ValueEntry.SETFILTER("Document No.",'%1',ShipNo);
                      IF ValueEntry.FIND('-') THEN
                        REPEAT
                            ValueEntry."Source No."    := NewCustomerCode;
                            ValueEntry.MODIFY;
                        UNTIL ValueEntry.NEXT = 0;
                        CLEAR(SalesShipmentHeader);
                        SalesShipmentHeader.SETRANGE("No.",ShipNo);
                        IF SalesShipmentHeader.FIND('-') THEN
                          BEGIN
                            SalesShipmentHeader."Sell-to Customer No." := NewCustomerCode;
                            SalesShipmentHeader."Bill-to Customer No." :=NewCustomerCode;
                            SalesShipmentHeader."Bill-to Name" := NewCustomerName;
                            SalesShipmentHeader."Bill-to Address" := Cust1.Address;
                            SalesShipmentHeader."Bill-to City" := Cust1.City;
                            SalesShipmentHeader."Bill-to Contact" := Cust1.Contact;
                            SalesShipmentHeader."Ship-to Address" := Cust1.Address;
                            SalesShipmentHeader."Ship-to City" := Cust1.City;
                            SalesShipmentHeader."Invoice Disc. Code" := Cust1."Invoice Disc. Code";;
                            SalesShipmentHeader.MODIFY;

                            CLEAR(SalesHeader);
                            SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::Order);
                            SalesHeader.SETRANGE("No.",SalesShipmentHeader."Order No.");
                            SalesHeader.FINDFIRST;
                            BEGIN
                                SalesHeader."Sell-to Customer No." := NewCustomerCode;
                                SalesHeader."Bill-to Customer No." :=NewCustomerCode;
                                SalesHeader."Bill-to Name" := NewCustomerName;
                                SalesHeader."Bill-to Address" := Cust1.Address;
                                SalesHeader."Bill-to City" := Cust1.City;
                                SalesHeader."Bill-to Contact" := Cust1.Contact;
                                SalesHeader."Ship-to Address" := Cust1.Address;
                                SalesHeader."Ship-to City" := Cust1.City;
                                SalesHeader."Invoice Disc. Code" := Cust1."Invoice Disc. Code";;
                                SalesHeader.MODIFY;
                             END;
                            CLEAR(SalesLine);
                            SalesLine.SETFILTER("Document Type",'%1',SalesLine."Document Type"::Order);
                            SalesLine.SETFILTER("Document No.",'%1',SalesShipmentHeader."Order No.");
                            SalesLine.FINDFIRST;
                            BEGIN
                              SalesLine."Sell-to Customer No." := NewCustomerCode;
                              SalesLine."Bill-to Customer No." :=NewCustomerCode;
                              SalesLine.MODIFY;
                             END;
                          END;
                          CLEAR(SalesShipmentLine);
                          SalesShipmentLine.SETFILTER("Document No.",'%1',ShipNo);
                          IF SalesShipmentLine.FIND('-') THEN
                            REPEAT
                              SalesShipmentLine."Sell-to Customer No." := NewCustomerCode;
                              SalesShipmentLine."Bill-to Customer No." :=NewCustomerCode;
                              SalesShipmentLine.MODIFY;
                            UNTIL SalesShipmentLine.NEXT = 0;
                       MESSAGE('Modification terminé : Nouveau client %1 pour le Bonde de Liv. %2',NewCustomerCode,ShipNo);
                      END;

                    //___________________________________________SERVICE

                    IF Service THEN
                     BEGIN
                      CLEAR(ItemLedgerEntry);
                      ItemLedgerEntry.SETFILTER("Document No.",'%1',ShipNo);
                      IF ItemLedgerEntry.FIND('-') THEN
                        REPEAT
                            ItemLedgerEntry."Source No."    := NewCustomerCode;
                          ItemLedgerEntry.MODIFY;
                        UNTIL ItemLedgerEntry.NEXT = 0;
                      CLEAR(ValueEntry);
                      ValueEntry.SETFILTER("Document No.",'%1',ShipNo);
                      IF ValueEntry.FIND('-') THEN
                        REPEAT
                            ValueEntry."Source No."    := NewCustomerCode;
                            ValueEntry.MODIFY;
                        UNTIL ValueEntry.NEXT = 0;
                        CLEAR(SalesShipmentHeader);
                        SalesShipmentHeader.SETRANGE("No.",ShipNo);
                        IF SalesShipmentHeader.FIND('-') THEN
                          BEGIN
                            SalesShipmentHeader."Sell-to Customer No." := NewCustomerCode;
                            SalesShipmentHeader."Bill-to Customer No." :=NewCustomerCode;
                            SalesShipmentHeader."Bill-to Name" := NewCustomerName;
                            SalesShipmentHeader."Bill-to Address" := Cust1.Address;
                            SalesShipmentHeader."Bill-to City" := Cust1.City;
                            SalesShipmentHeader."Bill-to Contact" := Cust1.Contact;
                            SalesShipmentHeader."Ship-to Address" := Cust1.Address;
                            SalesShipmentHeader."Ship-to City" := Cust1.City;
                            SalesShipmentHeader."Invoice Disc. Code" := Cust1."Invoice Disc. Code";;
                            SalesShipmentHeader.MODIFY;

                            CLEAR(SalesHeader);
                            SalesHeader.SETRANGE("Document Type",SalesHeader."Document Type"::Order);
                            SalesHeader.SETRANGE("No.",SalesShipmentHeader."Order No.");
                            SalesHeader.FINDFIRST;
                            BEGIN
                                SalesHeader."Sell-to Customer No." := NewCustomerCode;
                                SalesHeader."Bill-to Customer No." :=NewCustomerCode;
                                SalesHeader."Bill-to Name" := NewCustomerName;
                                SalesHeader."Bill-to Address" := Cust1.Address;
                                SalesHeader."Bill-to City" := Cust1.City;
                                SalesHeader."Bill-to Contact" := Cust1.Contact;
                                SalesHeader."Ship-to Address" := Cust1.Address;
                                SalesHeader."Ship-to City" := Cust1.City;
                                SalesHeader."Invoice Disc. Code" := Cust1."Invoice Disc. Code";;
                                SalesHeader.MODIFY;
                             END;
                            CLEAR(SalesLine);
                            SalesLine.SETFILTER("Document Type",'%1',SalesLine."Document Type"::Order);
                            SalesLine.SETFILTER("Document No.",'%1',SalesShipmentHeader."Order No.");
                            SalesLine.FINDFIRST;
                            BEGIN
                              SalesLine."Sell-to Customer No." := NewCustomerCode;
                              SalesLine."Bill-to Customer No." :=NewCustomerCode;
                              SalesLine.MODIFY;
                             END;
                          END;
                          CLEAR(SalesShipmentLine);
                          SalesShipmentLine.SETFILTER("Document No.",'%1',ShipNo);
                          IF SalesShipmentLine.FIND('-') THEN
                            REPEAT
                              SalesShipmentLine."Sell-to Customer No." := NewCustomerCode;
                              SalesShipmentLine."Bill-to Customer No." :=NewCustomerCode;
                              SalesShipmentLine.MODIFY;
                            UNTIL SalesShipmentLine.NEXT = 0;
                       MESSAGE('Modification terminé : Nouveau client %1 pour le Bonde de Liv. %2',NewCustomerCode,ShipNo);
                      END



                    END;
                end;
            }
        }
    }

    var
        ShipNo : Code[20];
        CustNo : Code[30];
        CustName : Code[100];
        AmountINVAT : Decimal;
        PostinDate : Date;
        NewCustomerCode : Code[20];
        NewCustomerName : Code[100];
        Cust : Record "18";
        ServiceShipmentHeader : Record "5990";
        ServiceShipmentItemLine : Record "5989";
        ServiceShipmentLine : Record "5991";
        ItemLedgerEntry : Record "32";
        ValueEntry : Record "5802";
        ServiceLedgerEntry : Record "5907";
        SalesLine : Record "37";
        Cust1 : Record "18";
        ShipmentInvoiced : Record "10825";
        WarehouseEntry : Record "7312";
        SalesHeader : Record "36";
        SalesShipmentHeader : Record "110";
        SalesShipmentLine : Record "111";
        SrvNo : Code[20];
        Service : Boolean;
        Comptoire : Boolean;
}

