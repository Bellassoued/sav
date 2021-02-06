page 70097 "Receptions/expeditions"
{
    Editable = false;
    PageType = List;
    SourceTable = Table50043;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-from Name";"Transfer-from Name")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
                field("Transfer-to Name";"Transfer-to Name")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field(Comment;Comment)
                {
                }
                field("Transfer Order No.";"Transfer Order No.")
                {
                }
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Reception No";"Reception No")
                {
                }
                field("Type Reception";"Type Reception")
                {
                }
                field("No Service Order";"No Service Order")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Source No";"Source No")
                {
                }
                field(Retour;Retour)
                {
                }
                field("Company Name";"Company Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Fiche)
            {
                Image = Card;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    /*IF "Operation type"="Operation type"::Reception THEN BEGIN
                      IF COMPANYNAME = "Company Name" THEN  BEGIN
                          TransferReceiptHeader.RESET;
                          TransferReceiptHeader.SETRANGE("No.","No.");
                          IF TransferReceiptHeader.FINDFIRST THEN  BEGIN
                              //url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5745,TransferReceiptHeader);
                              //HYPERLINK(url);
                              PAGE.RUN(5745,TransferReceiptHeader);
                          END;
                      END ELSE  BEGIN
                          TransferReceiptHeader.CHANGECOMPANY("Company Name");
                          TransferReceiptHeader.SETRANGE("No.","No.");
                          IF TransferReceiptHeader.FINDFIRST THEN BEGIN
                              url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5745,TransferReceiptHeader);
                              HYPERLINK(url);
                          END;
                      END;
                    END
                    ELSE IF "Operation type"="Operation type"::Transfert THEN BEGIN
                      IF COMPANYNAME = "Company Name" THEN  BEGIN
                          TransferShipmentHeader.RESET;
                          TransferShipmentHeader.SETRANGE("No.","No.");
                          IF TransferShipmentHeader.FINDFIRST THEN  BEGIN
                              //url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5743,TransferShipmentHeader);
                              //HYPERLINK(url);
                            PAGE.RUN(5743,TransferShipmentHeader);
                          END;
                      END ELSE  BEGIN
                          TransferShipmentHeader.CHANGECOMPANY("Company Name");
                          TransferShipmentHeader.SETRANGE("No.","No.");
                          IF TransferShipmentHeader.FINDFIRST THEN BEGIN
                              url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5743,TransferShipmentHeader);
                             HYPERLINK(url);
                    
                          END;
                      END;
                    
                    END;
                    */
                    Rec.ShowCard;

                end;
            }
        }
    }

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        DELETEALL;
    end;

    var
        TransferReceiptHeader : Record "5746";
        TransferShipmentHeader : Record "5744";
        url : Text[500];
}

