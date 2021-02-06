page 69096 "Update Customer Invoice"
{
    Permissions = TableData 17=rm,
                  TableData 21=rm,
                  TableData 32=rm,
                  TableData 36=rm,
                  TableData 37=rm,
                  TableData 110=rm,
                  TableData 111=rm,
                  TableData 112=rm,
                  TableData 113=rm,
                  TableData 254=rm,
                  TableData 379=rm,
                  TableData 5802=rm;

    layout
    {
        area(content)
        {
            field(FactNo;FactNo)
            {
                Caption = 'Numéro Factre';
                TableRelation = "Sales Invoice Header".No.;

                trigger OnValidate();
                begin
                    CLEAR(SalesInvoiceHeader);
                    SalesInvoiceHeader.GET(FactNo);
                    BEGIN
                    CustNo := SalesInvoiceHeader."Bill-to Customer No.";
                    CustName := SalesInvoiceHeader."Bill-to Name";
                    SalesInvoiceHeader.CALCFIELDS("Amount Including VAT");
                    AmountINVAT := SalesInvoiceHeader."Amount Including VAT";
                    PostinDate := SalesInvoiceHeader."Posting Date";
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
            }
            field("Nouveau Code Client";NewCustomerCode)
            {
                Caption = 'Nouveau Code Client';
                TableRelation = Customer.No.;

                trigger OnValidate();
                begin
                    CLEAR(Cust);
                    Cust.GET(NewCustomerCode);
                    BEGIN
                    NewCustomerName := Cust.Name;
                    END;
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
            action("Changer Client")
            {

                trigger OnAction();
                begin

                    //IF USERID <> '' THEN ERROR('Vous n''êtes pas autoriser à exécuter cette fonction');
                    //MESSAGE('fact %1 clt %2 new %3',FactNo,CustNo,NewCustomerCode);
                    IF USERID <> 'BSB\SBS' THEN ERROR('Vous n''êtes pas autoriser a cette fonction');
                    IF CONFIRM('ëtes vous sûre de vouloir changer le code client pour cette facture',TRUE,FALSE) THEN
                      BEGIN
                        CLEAR(CustLedgerEntry);
                        CLEAR(DetailedCustLedgEntry);
                        CLEAR(SalesShipmentHeader);
                        CLEAR(SalesShipmentLine);
                        CLEAR(ItemLedgerEntry);
                        CLEAR(ValueEntry);
                        CLEAR(SalesLine);
                        CLEAR(VATEntry);
                        CLEAR(GLEntry);
                        CLEAR(SalesInvoiceHeader1);
                        CLEAR(SalesInvoiceLine);
                        CLEAR(Cust1);
                        Cust1.GET(NewCustomerCode);
                        CustLedgerEntry.SETFILTER("Document No.",'%1',FactNo);
                        CustLedgerEntry.FIND('-');
                          REPEAT
                            CustLedgerEntry."Customer No."     := NewCustomerCode;
                            CustLedgerEntry.MODIFY;
                          UNTIL CustLedgerEntry.NEXT = 0;

                        DetailedCustLedgEntry.SETFILTER("Document No.",'%1',FactNo);
                        DetailedCustLedgEntry.FIND('-');
                          REPEAT
                            DetailedCustLedgEntry."Customer No."     := NewCustomerCode;
                            DetailedCustLedgEntry.MODIFY;
                            //        MESSAGE(' DetailedCustLedgEntry %1',DetailedCustLedgEntry."Document No.");
                          UNTIL DetailedCustLedgEntry.NEXT = 0;

                       GLEntry.SETFILTER("Document No.",'%1',FactNo);
                        GLEntry.FIND('-');
                          REPEAT
                            GLEntry."Source No."     := NewCustomerCode;
                            GLEntry.MODIFY;
                            //MESSAGE(' GLEntry %1',GLEntry."Document No.");
                          UNTIL GLEntry.NEXT = 0;

                        ItemLedgerEntry.SETFILTER("Document No.",'%1',FactNo);
                        IF ItemLedgerEntry.FIND('-') THEN
                          REPEAT
                             ItemLedgerEntry."Source No."    := NewCustomerCode;
                            ItemLedgerEntry.MODIFY;
                            //MESSAGE(' ItemLedgerEntry %1',ItemLedgerEntry."Document No.");
                          UNTIL ItemLedgerEntry.NEXT = 0;

                        ValueEntry.SETFILTER("Document No.",'%1',FactNo);
                        IF ValueEntry.FIND('-') THEN
                          REPEAT
                             ValueEntry."Source No."    := NewCustomerCode;
                             ValueEntry.MODIFY;
                            //MESSAGE(' ValueEntry %1',ValueEntry."Document No.");
                          UNTIL ValueEntry.NEXT = 0;

                        VATEntry.SETFILTER("Document No.",'%1',FactNo);
                        IF VATEntry.FIND('-') THEN
                          REPEAT
                             VATEntry."Bill-to/Pay-to No." := NewCustomerCode;
                             VATEntry.MODIFY;
                            //MESSAGE(' ValueEntry %1',ValueEntry."Document No.");
                          UNTIL VATEntry.NEXT = 0;

                        CLEAR(ShipmentInvoiced);
                        ShipmentInvoiced.SETFILTER("Invoice No.",'%1',FactNo);
                        IF ShipmentInvoiced.FIND('-') THEN
                          REPEAT
                            CLEAR(SalesShipmentHeader);
                            SalesShipmentHeader.SETFILTER(SalesShipmentHeader."No.",'%1',ShipmentInvoiced."Shipment No.");
                            IF SalesShipmentHeader.FIND('-') THEN
                              REPEAT
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
                                //MESSAGE(' SalesShipmentHeader %1',SalesShipmentHeader."No.");
                              UNTIL SalesShipmentHeader.NEXT = 0;


                            CLEAR(SalesShipmentLine);
                            SalesShipmentLine.SETFILTER("Document No.",'%1',ShipmentInvoiced."Shipment No.");
                            IF SalesShipmentLine.FIND('-') THEN
                              REPEAT
                                SalesShipmentLine."Sell-to Customer No." := NewCustomerCode;
                                SalesShipmentLine."Bill-to Customer No." :=NewCustomerCode;
                                SalesShipmentLine.MODIFY;
                               // MESSAGE(' SalesShipmentLine %1',SalesShipmentLine."Document No.");
                              UNTIL SalesShipmentLine.NEXT = 0;
                          UNTIL ShipmentInvoiced.NEXT = 0;


                    CLEAR(SalesInvoiceHeader);
                            SalesInvoiceHeader.SETFILTER("No.",'%1',FactNo);
                            IF SalesInvoiceHeader.FIND('-') THEN
                              REPEAT
                                SalesInvoiceHeader."Sell-to Customer No." := NewCustomerCode;
                                SalesInvoiceHeader."Sell-to Customer Name":=  NewCustomerName;
                                SalesInvoiceHeader."Bill-to Customer No." :=NewCustomerCode;
                                SalesInvoiceHeader."Bill-to Name" := NewCustomerName;
                                SalesInvoiceHeader."Ship-to Name" := NewCustomerName;
                                SalesInvoiceHeader."Bill-to Address" := Cust1.Address;
                                SalesInvoiceHeader."Bill-to City" := Cust1.City;
                                SalesInvoiceHeader."Bill-to Contact" := Cust1.Contact;
                                SalesInvoiceHeader."Ship-to Address" := Cust1.Address;
                                SalesInvoiceHeader."Ship-to City" := Cust1.City;
                                SalesInvoiceHeader."Invoice Disc. Code" := Cust1."Invoice Disc. Code";

                                SalesInvoiceHeader.MODIFY;
                                //MESSAGE(' SalesShipmentHeader %1',SalesShipmentHeader."No.");
                              UNTIL SalesInvoiceHeader.NEXT = 0;

                    CLEAR(SalesInvoiceLine);
                            SalesInvoiceLine.SETFILTER("Document No.",'%1',FactNo);
                            IF SalesInvoiceLine.FIND('-') THEN
                              REPEAT
                                SalesInvoiceLine."Sell-to Customer No." := NewCustomerCode;
                                SalesInvoiceLine."Bill-to Customer No." :=NewCustomerCode;
                                SalesInvoiceLine.MODIFY;
                               // MESSAGE(' SalesShipmentLine %1',SalesShipmentLine."Document No.");
                              UNTIL SalesInvoiceLine.NEXT = 0;
                    MESSAGE('Modification terminé : Nouveau client %1 pour la facture %2',NewCustomerCode,FactNo);
                      END;
                end;
            }
            action("Changer Client Facturé")
            {

                trigger OnAction();
                begin

                    //IF USERID <> '' THEN ERROR('Vous n''êtes pas autoriser à exécuter cette fonction');
                    //MESSAGE('fact %1 clt %2 new %3',FactNo,CustNo,NewCustomerCode);
                    IF USERID <> 'BSB\SBS' THEN ERROR('Vous n''êtes pas autoriser a cette fonction');
                    IF CONFIRM('ëtes vous sûre de vouloir changer le code client pour cette facture',TRUE,FALSE) THEN
                      BEGIN
                        CLEAR(CustLedgerEntry);
                        CLEAR(DetailedCustLedgEntry);
                        CLEAR(SalesShipmentHeader);
                        CLEAR(SalesShipmentLine);
                        CLEAR(ItemLedgerEntry);
                        CLEAR(ValueEntry);
                        CLEAR(SalesLine);
                        CLEAR(VATEntry);
                        CLEAR(GLEntry);
                        CLEAR(SalesInvoiceHeader1);
                        CLEAR(SalesInvoiceLine);
                        CLEAR(Cust1);
                        Cust1.GET(NewCustomerCode);
                        CustLedgerEntry.SETFILTER("Document No.",'%1',FactNo);
                        CustLedgerEntry.FIND('-');
                          REPEAT
                            CustLedgerEntry."Customer No."     := NewCustomerCode;
                            CustLedgerEntry.MODIFY;
                          UNTIL CustLedgerEntry.NEXT = 0;

                        DetailedCustLedgEntry.SETFILTER("Document No.",'%1',FactNo);
                        DetailedCustLedgEntry.FIND('-');
                          REPEAT
                            DetailedCustLedgEntry."Customer No."     := NewCustomerCode;
                            DetailedCustLedgEntry.MODIFY;
                            //        MESSAGE(' DetailedCustLedgEntry %1',DetailedCustLedgEntry."Document No.");
                          UNTIL DetailedCustLedgEntry.NEXT = 0;

                       GLEntry.SETFILTER("Document No.",'%1',FactNo);
                        GLEntry.FIND('-');
                          REPEAT
                            GLEntry."Source No."     := NewCustomerCode;
                            GLEntry.MODIFY;
                            //MESSAGE(' GLEntry %1',GLEntry."Document No.");
                          UNTIL GLEntry.NEXT = 0;

                        ItemLedgerEntry.SETFILTER("Document No.",'%1',FactNo);
                        IF ItemLedgerEntry.FIND('-') THEN
                          REPEAT
                             ItemLedgerEntry."Source No."    := NewCustomerCode;
                            ItemLedgerEntry.MODIFY;
                            //MESSAGE(' ItemLedgerEntry %1',ItemLedgerEntry."Document No.");
                          UNTIL ItemLedgerEntry.NEXT = 0;

                        ValueEntry.SETFILTER("Document No.",'%1',FactNo);
                        IF ValueEntry.FIND('-') THEN
                          REPEAT
                             ValueEntry."Source No."    := NewCustomerCode;
                             ValueEntry.MODIFY;
                            //MESSAGE(' ValueEntry %1',ValueEntry."Document No.");
                          UNTIL ValueEntry.NEXT = 0;

                        VATEntry.SETFILTER("Document No.",'%1',FactNo);
                        IF VATEntry.FIND('-') THEN
                          REPEAT
                             VATEntry."Bill-to/Pay-to No." := NewCustomerCode;
                             VATEntry.MODIFY;
                            //MESSAGE(' ValueEntry %1',ValueEntry."Document No.");
                          UNTIL VATEntry.NEXT = 0;

                        CLEAR(ShipmentInvoiced);
                        ShipmentInvoiced.SETFILTER("Invoice No.",'%1',FactNo);
                        IF ShipmentInvoiced.FIND('-') THEN
                          REPEAT
                            CLEAR(SalesShipmentHeader);
                            SalesShipmentHeader.SETFILTER(SalesShipmentHeader."No.",'%1',ShipmentInvoiced."Shipment No.");
                            IF SalesShipmentHeader.FIND('-') THEN
                              REPEAT
                                //SalesShipmentHeader."Sell-to Customer No." := NewCustomerCode;
                                SalesShipmentHeader."Bill-to Customer No." :=NewCustomerCode;
                                SalesShipmentHeader."Bill-to Name" := NewCustomerName;
                                SalesShipmentHeader."Bill-to Address" := Cust1.Address;
                                SalesShipmentHeader."Bill-to City" := Cust1.City;
                                SalesShipmentHeader."Bill-to Contact" := Cust1.Contact;
                                SalesShipmentHeader."Ship-to Address" := Cust1.Address;
                                SalesShipmentHeader."Ship-to City" := Cust1.City;
                                SalesShipmentHeader."Invoice Disc. Code" := Cust1."Invoice Disc. Code";;
                                SalesShipmentHeader.MODIFY;
                                //MESSAGE(' SalesShipmentHeader %1',SalesShipmentHeader."No.");
                              UNTIL SalesShipmentHeader.NEXT = 0;


                            CLEAR(SalesShipmentLine);
                            SalesShipmentLine.SETFILTER("Document No.",'%1',ShipmentInvoiced."Shipment No.");
                            IF SalesShipmentLine.FIND('-') THEN
                              REPEAT
                                //SalesShipmentLine."Sell-to Customer No." := NewCustomerCode;
                                SalesShipmentLine."Bill-to Customer No." :=NewCustomerCode;
                                SalesShipmentLine.MODIFY;
                               // MESSAGE(' SalesShipmentLine %1',SalesShipmentLine."Document No.");
                              UNTIL SalesShipmentLine.NEXT = 0;
                          UNTIL ShipmentInvoiced.NEXT = 0;


                    CLEAR(SalesInvoiceHeader);
                            SalesInvoiceHeader.SETFILTER("No.",'%1',FactNo);
                            IF SalesInvoiceHeader.FIND('-') THEN
                              REPEAT
                                //SalesInvoiceHeader."Sell-to Customer No." := NewCustomerCode;
                                //SalesInvoiceHeader."Sell-to Customer Name":=  NewCustomerName;
                                SalesInvoiceHeader."Bill-to Customer No." :=NewCustomerCode;
                                SalesInvoiceHeader."Bill-to Name" := NewCustomerName;
                                SalesInvoiceHeader."Ship-to Name" := NewCustomerName;
                                SalesInvoiceHeader."Bill-to Address" := Cust1.Address;
                                SalesInvoiceHeader."Bill-to City" := Cust1.City;
                                SalesInvoiceHeader."Bill-to Contact" := Cust1.Contact;
                                SalesInvoiceHeader."Ship-to Address" := Cust1.Address;
                                SalesInvoiceHeader."Ship-to City" := Cust1.City;
                                SalesInvoiceHeader."Invoice Disc. Code" := Cust1."Invoice Disc. Code";

                                SalesInvoiceHeader.MODIFY;
                                //MESSAGE(' SalesShipmentHeader %1',SalesShipmentHeader."No.");
                              UNTIL SalesInvoiceHeader.NEXT = 0;

                    CLEAR(SalesInvoiceLine);
                            SalesInvoiceLine.SETFILTER("Document No.",'%1',FactNo);
                            IF SalesInvoiceLine.FIND('-') THEN
                              REPEAT
                                //SalesInvoiceLine."Sell-to Customer No." := NewCustomerCode;
                                SalesInvoiceLine."Bill-to Customer No." :=NewCustomerCode;
                                SalesInvoiceLine.MODIFY;
                               // MESSAGE(' SalesShipmentLine %1',SalesShipmentLine."Document No.");
                              UNTIL SalesInvoiceLine.NEXT = 0;
                    MESSAGE('Modification terminé : Nouveau client %1 pour la facture %2',NewCustomerCode,FactNo);
                      END;
                end;
            }
        }
    }

    var
        FactNo : Code[20];
        CustNo : Code[30];
        CustName : Code[100];
        AmountINVAT : Decimal;
        PostinDate : Date;
        SalesInvoiceHeader : Record "112";
        NewCustomerCode : Code[20];
        NewCustomerName : Code[100];
        Cust : Record "18";
        CustLedgerEntry : Record "21";
        DetailedCustLedgEntry : Record "379";
        SalesShipmentHeader : Record "110";
        SalesShipmentLine : Record "111";
        ItemLedgerEntry : Record "32";
        ValueEntry : Record "5802";
        PurchaseHeader : Record "38";
        SalesLine : Record "37";
        VATEntry : Record "254";
        GLEntry : Record "17";
        SalesInvoiceHeader1 : Record "112";
        SalesInvoiceLine : Record "113";
        Cust1 : Record "18";
        ShipmentInvoiced : Record "10825";
}

