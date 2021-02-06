page 60122 "Extraire Doc Extourner"
{
    // version MAZDA400

    Editable = false;
    PageType = ListPlus;
    SourceTable = Table5991;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    HideValue = hidevalue;
                    Lookup = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("N° Facture";FactNo)
                {
                }
                field("Order No.";"Order No.")
                {
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
                field("Description 2";"Description 2")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
                field("VAT %";"VAT %")
                {
                }
                field("Line Discount %";"Line Discount %")
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                }
                field("Customer Disc. Group";"Customer Disc. Group")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(ExtraireExp)
            {
                Caption = 'Extraire Ligne Expédition';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    // Get selected line
                     CurrPage.SETSELECTIONFILTER(RecServiceShipmentLine);
                      // Inserrer une ligne vide
                      // insert selected row

                     CLEAR(XServiceHeader);
                     XServiceHeader.SETRANGE(XServiceHeader."No.", NewAvoir);
                     IF NOT XServiceHeader.FINDFIRST THEN ERROR('Pas de Bl sélectionner');
                      intLineNo := 10000 ;

                      IF RecServiceShipmentLine.FINDFIRST THEN
                        FctPropagerNoReception(RecServiceShipmentLine."Document No.");
                      REPEAT
                         IF XBlNo <> RecServiceShipmentLine."Document No." THEN
                            BEGIN
                              //SM 291217
                               IF (XServiceHeader."VAT Bus. Posting Group" <> RecServiceShipmentLine."VAT Bus. Posting Group") THEN
                                 ERROR('Le groupe compta TVA est %1 dans entête avoir mais il est %2 dans ligne facture',XServiceHeader."VAT Bus. Posting Group",RecServiceShipmentLine."VAT Bus. Posting Group");
                               //END SM
                                CLEAR(NewServiceLine);
                                NewServiceLine."Document Type" := XServiceHeader."Document Type";
                                NewServiceLine."Document No."  := XServiceHeader."No." ;
                                NewServiceLine."Customer No."  := XServiceHeader."Customer No.";
                                NewServiceLine.Description     := 'Expédition : ' + RecServiceShipmentLine."Document No." ;
                                NewServiceLine."Line No." := intLineNo;
                                IF NewServiceLine.INSERT() THEN
                                  intLineNo +=10000;
                                  XBlNo := RecServiceShipmentLine."Document No.";

                                CLEAR(NewServiceLine);
                                NewServiceLine."Document Type" := XServiceHeader."Document Type";
                                NewServiceLine."Document No."  := XServiceHeader."No." ;
                                NewServiceLine."Customer No."  := XServiceHeader."Customer No.";
                                NewServiceLine.Type := RecServiceShipmentLine.Type ;
                                NewServiceLine.VALIDATE("No." , RecServiceShipmentLine."No.") ;
                                NewServiceLine.VALIDATE("Location Code" , RecServiceShipmentLine."Location Code") ;
                                NewServiceLine.VALIDATE(Quantity,RecServiceShipmentLine.Quantity);
                                NewServiceLine.VALIDATE(NewServiceLine."Unit Price",RecServiceShipmentLine."Unit Price");
                                NewServiceLine.VALIDATE("Qty. Shipped Not Invoiced" , 0);
                                 NewServiceLine.VALIDATE("Line Discount %",RecServiceShipmentLine."Line Discount %" );

                                NewServiceLine."Line No." := intLineNo;

                                //SM MAZDA400
                                NewServiceLine."Service Item No."        := RecServiceShipmentLine."Service Item No."       ;
                                NewServiceLine."Service Item Serial No." := RecServiceShipmentLine."Service Item Serial No.";
                                //END SM
                                IF NewServiceLine.INSERT() THEN
                                BEGIN
                                    intLineNo +=10000;
                                END;
                            END
                         ELSE
                            BEGIN
                               CLEAR(NewServiceLine);
                               NewServiceLine."Document Type" := XServiceHeader."Document Type";
                               NewServiceLine."Document No."  := XServiceHeader."No." ;
                               NewServiceLine."Customer No."  := XServiceHeader."Customer No.";
                               NewServiceLine.Type := RecServiceShipmentLine.Type ;
                               NewServiceLine.VALIDATE( "No." , RecServiceShipmentLine."No." );
                               NewServiceLine.VALIDATE("Location Code" , RecServiceShipmentLine."Location Code") ;
                               NewServiceLine.VALIDATE(Quantity,RecServiceShipmentLine.Quantity);
                               NewServiceLine.VALIDATE(NewServiceLine."Unit Price",RecServiceShipmentLine."Unit Price");
                               NewServiceLine.VALIDATE("Qty. Shipped Not Invoiced" , 0);
                               NewServiceLine.VALIDATE("Line Discount %",RecServiceShipmentLine."Line Discount %" );
                               NewServiceLine."Line No." := intLineNo;
                               //SM MAZDA400
                               NewServiceLine."Service Item No."        := RecServiceShipmentLine."Service Item No."       ;
                               NewServiceLine."Service Item Serial No." := RecServiceShipmentLine."Service Item Serial No.";
                               //END SM
                               IF NewServiceLine.INSERT() THEN intLineNo +=10000;
                            END;
                       UNTIL RecServiceShipmentLine.NEXT = 0;

                    CurrPage.CLOSE;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        TempServInvLine : Record "5993" temporary;
    begin
        //SM
        FactNo := '';
        IF Type = Type::Item THEN BEGIN
          GetServInvLinesNoLocal(TempServInvLine);
          IF TempServInvLine.FINDFIRST THEN
            FactNo := TempServInvLine."Document No."
        END;

        //EN SM
    end;

    trigger OnAfterGetRecord();
    var
        TempServInvLine : Record "5993" temporary;
    begin
        //SM
        FactNo := '';
        IF Type = Type::Item THEN BEGIN
          GetServInvLinesNoLocal(TempServInvLine);
          IF TempServInvLine.FINDFIRST THEN
            FactNo := TempServInvLine."Document No."

        END;

        //EN SM
    end;

    var
        HideValue : Boolean;
        RecServiceShipmentLine : Record "5991";
        NextDocNo : Code[20];
        NewAvoir : Code[20];
        NewServiceLine : Record "5902";
        XServiceHeader : Record "5900";
        XBlNo : Code[20];
        intLineNo : Integer;
        ServiceInvoiceLine : Record "5993";
        FactNo : Code[50];

    procedure GetAvoirNo(AvoirNo : Code[20]);
    begin
        NewAvoir := AvoirNo ;
    end;

    local procedure FctPropagerNoReception(CdeShipmentHeaderNo : Code[20]);
    var
        LRecServiceHeader : Record "5900";
        LRecServiceShipmentHeader : Record "5990";
    begin
        LRecServiceShipmentHeader.GET(CdeShipmentHeaderNo);
        LRecServiceHeader.GET(LRecServiceHeader."Document Type"::"Credit Memo",NewAvoir);
        LRecServiceHeader."Reception No":=LRecServiceShipmentHeader."Reception No";
        LRecServiceHeader."Payment Method Code" := LRecServiceShipmentHeader."Payment Method Code";
        LRecServiceHeader."Payment Terms Code" := LRecServiceShipmentHeader."Payment Terms Code";
        LRecServiceHeader."Salesperson Code" :=   LRecServiceShipmentHeader."Salesperson Code";
        //MESSAGE(' Vendeur1 %1  vendeur 1 %2 a  %3 ',LRecServiceHeader."Salesperson Code" ,LRecServiceShipmentHeader."Salesperson Code",LRecServiceShipmentHeader."Payment Method Code"  );
        //MESSAGE(' Vendeur1 %1   ',LRecServiceShipmentHeader."No.");//LRecServiceShipmentHeader."Salesperson Code");
        LRecServiceHeader.MODIFY;
    end;
}

