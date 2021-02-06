page 60178 "Defalcation facture service"
{
    // version SAV Automobile,MAZDA06,MAZDA07

    DataCaptionFields = "Document Type","Document No.","No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    Permissions = TableData 5741=rimd,
                  TableData 5745=rimd,
                  TableData 5747=rimd;
    SourceTable = Table5902;
    SourceTableTemporary = true;
    SourceTableView = SORTING(Document Type,Document No.,Line No.)
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            field(CustomerCode;CustomerCode)
            {
                Caption = 'Code client';
                TableRelation = Customer;

                trigger OnValidate();
                begin
                    IF RecGCustomer.GET(CustomerCode) THEN
                      CustomerName := RecGCustomer.Name ;
                end;
            }
            field(CustomerName;CustomerName)
            {
                Caption = 'Désignation client';
                Editable = false;
                Enabled = false;
            }
            repeater(Group)
            {
                field(Selectionner;MARK)
                {
                    Editable = false;
                    Enabled = false;
                }
                field(Type;Type)
                {
                    Editable = false;
                    Enabled = false;
                }
                field("No.";"No.")
                {
                    Enabled = false;
                }
                field(Description;Description)
                {
                    Enabled = false;
                    TableRelation = Location.Code;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                    Enabled = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Enabled = false;
                }
            }
        }
        area(factboxes)
        {
            part(;50013)
            {
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sélectionner")
            {
                Image = SelectEntries;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+g';
                Visible = true;

                trigger OnAction();
                var
                    Rec338LOCAL : Record "338" temporary;
                begin
                    MARK(NOT MARK);
                end;
            }
            action("Tous Sélectionner")
            {
                Image = SelectField;
                Promoted = true;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction();
                begin
                    IF FINDSET THEN
                    REPEAT
                      MARK(NOT MARK)
                    UNTIL NEXT = 0;
                end;
            }
            action("Filtrer sur Sélectionner")
            {
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction();
                begin
                    MARKEDONLY(NOT MARKEDONLY)
                end;
            }
            action("Supprimer la sélection")
            {
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction();
                begin
                    CLEARMARKS
                end;
            }
            action("Défalquer commande")
            {
                Caption = 'Defalquer Commande';

                trigger OnAction();
                var
                    RecLToServiceHeader : Record "5900";
                    RecLFromServiceHeader : Record "5900";
                    NewDocNo : Code[20];
                    RecLtoServItemLine : Record "5901";
                    RecLFromServItemLine : Record "5901";
                    RecLToServiceLine : Record "5902";
                    RecLFromServiceLine : Record "5902";
                    RecLTranferLine : Record "5741";
                    RecLShipedTransfer : Record "5745";
                    RecLreceivedTransfer : Record "5747";
                    RecLServiceShipmentHdr : Record "5990";
                    RecLILE : Record "32";
                    RecLPurchLine : Record "39";
                    RecLPurchRcptLine : Record "121";
                    RecLPurchHdr : Record "38";
                    RecLPurchRcptHdr : Record "120";
                begin
                    IF NOT CONFIRM(Text001) THEN
                      EXIT;

                    MARKEDONLY(TRUE);
                    IF FINDSET THEN
                      BEGIN
                        //create new service header from existing service header
                        RecLFromServiceHeader.GET(RecLFromServiceHeader."Document Type"::Order,"Document No.");
                        RecLToServiceHeader.INIT;
                        //RecLToServiceHeader."Document Type" := RecLToServiceHeader."Document Type"::Order;
                        //RecLToServiceHeader.INSERT(TRUE);
                        RecLToServiceHeader.TRANSFERFIELDS(RecLFromServiceHeader);
                        RecLToServiceHeader."No." := '' ;
                        RecLToServiceHeader.VALIDATE("Bill-to Customer No.",CustomerCode);
                        RecLToServiceHeader.INSERT(TRUE);

                        NewDocNo := RecLToServiceHeader."No." ;
                        // create service item line from existing service item line

                        RecLFromServItemLine.SETRANGE(RecLFromServItemLine."Document Type",RecLFromServiceHeader."Document Type");
                        RecLFromServItemLine.SETRANGE(RecLFromServItemLine."Document No.",RecLFromServiceHeader."No.");
                        IF RecLFromServItemLine.FINDFIRST THEN
                          BEGIN
                            CLEAR(RecLtoServItemLine);
                            RecLtoServItemLine.INIT;
                            RecLtoServItemLine.TRANSFERFIELDS(RecLFromServItemLine);
                            RecLtoServItemLine."Document No." := NewDocNo ;
                            RecLtoServItemLine.INSERT(TRUE);
                          END;

                        // create Service lines from selected lines
                        REPEAT
                          RecLToServiceLine.INIT;
                          RecLToServiceLine.TRANSFERFIELDS(Rec);
                          RecLToServiceLine."Document No." := NewDocNo ;
                          RecLToServiceLine.INSERT(TRUE);
                          IF Type = Type::Item THEN
                            BEGIN
                              //udate any existing transfers
                              //Open transfer order
                              RecLTranferLine.SETRANGE("Item No.","No.");
                              RecLTranferLine.SETRANGE("No Service Order","Document No.");
                              IF RecLTranferLine.FINDSET THEN
                                RecLTranferLine.MODIFYALL("No Service Order",NewDocNo);

                              //posted Shipped tranfer
                              RecLShipedTransfer.SETRANGE("Item No.","No.");
                              RecLShipedTransfer.SETRANGE("Source No","Document No.");
                              IF RecLShipedTransfer.FINDSET THEN
                                RecLShipedTransfer.MODIFYALL("Source No",NewDocNo);

                              //Posted received Transfert
                              RecLreceivedTransfer.SETRANGE("Item No.","No.");
                              RecLreceivedTransfer.SETRANGE("Source No","Document No.");
                              IF RecLreceivedTransfer.FINDSET THEN
                                RecLreceivedTransfer.MODIFYALL("Source No",NewDocNo);

                              //Update ILE
                              RecLILE.RESET;
                              RecLILE.SETCURRENTKEY("Item No.");
                              RecLILE.SETRANGE("Item No.","No.");
                              RecLILE.SETRANGE("From No Service Order",ServiceOrderNo);
                              IF RecLILE.FINDSET THEN
                                RecLILE.MODIFYALL("From No Service Order",NewDocNo);

                            END;

                          //Update any special order header and lines
                          RecLPurchHdr.RESET;
                          //RecLPurchHdr.SETCURRENTKEY("Special Order Service","Special Order Service No.","Special Order S Item Line No.","Special Order Service Line No.");
                          RecLPurchHdr.SETRANGE("Sales Service Order No",ServiceOrderNo);
                          IF RecLPurchHdr.FINDSET THEN
                            RecLPurchHdr.MODIFYALL("Sales Service Order No",NewDocNo);

                          RecLPurchLine.RESET;
                          RecLPurchLine.SETCURRENTKEY("Special Order Service","Special Order Service No.","Special Order S Item Line No.","Special Order Service Line No.");
                          RecLPurchLine.SETRANGE(RecLPurchLine."Special Order Service",TRUE);
                          RecLPurchLine.SETRANGE(RecLPurchLine."Special Order Service No.",ServiceOrderNo);
                          RecLPurchLine.SETRANGE(RecLPurchLine."Special Order Service Line No.","Line No.");
                          IF RecLPurchLine.FINDSET THEN
                            RecLPurchLine.MODIFYALL(RecLPurchLine."Special Order Service No.",NewDocNo);

                          //Update any special received order header and lines
                          RecLPurchRcptHdr.RESET;
                          //RecLPurchRcptHdr.SETCURRENTKEY("Special Order Service","Special Order Service No.","Special Order S Item Line No.","Special Order Service Line No.");
                          RecLPurchRcptHdr.SETRANGE("Sales Service Order No",ServiceOrderNo);
                          IF RecLPurchRcptHdr.FINDSET THEN
                            RecLPurchRcptHdr.MODIFYALL("Sales Service Order No",NewDocNo);

                          RecLPurchRcptLine.RESET;
                          RecLPurchRcptLine.SETCURRENTKEY("Special Order Service","Special Order Service No.","Special Order S Item Line No.","Special Order Service Line No.");
                          RecLPurchRcptLine.SETRANGE("Special Order Service",TRUE);
                          RecLPurchRcptLine.SETRANGE("Special Order Service No.",ServiceOrderNo);
                          RecLPurchRcptLine.SETRANGE("Special Order Service Line No.","Line No.");
                          IF RecLPurchRcptLine.FINDSET THEN
                            RecLPurchRcptLine.MODIFYALL("Special Order Service No.",NewDocNo);

                          //Update existing service lines by deleting from original service lines
                          RecLFromServiceLine.GET("Document Type","Document No.","Line No.");
                          RecLFromServiceLine.DELETE;

                        UNTIL NEXT = 0 ;
                        MESSAGE(STRSUBSTNO(Text003,NewDocNo));
                      END ELSE
                        MESSAGE(Text002);
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        RecServiceLine.RESET;
        RecServiceLine.SETRANGE("Document Type",RecServiceLine."Document Type"::Order);
        RecServiceLine.SETRANGE("Document No.",ServiceOrderNo);
        IF RecServiceLine.FINDFIRST THEN
          REPEAT
            INIT;
            TRANSFERFIELDS(RecServiceLine);
            INSERT;
          UNTIL RecServiceLine.NEXT = 0;
    end;

    var
        RecUserSetup : Record "91";
        TXT50000 : Label 'Vous avez une quantité en transit pour l''article %1 qui vont satisfaire la quantité demandé.';
        TXT50001 : Label 'Vous n''avez pas une quantité suffisante dans magasin %1 pour l''article %2.';
        ServiceOrderNo : Code[20];
        RecServiceLine : Record "5902";
        CustomerCode : Code[20];
        CustomerName : Text[50];
        RecGServiceOrder : Record "5900";
        RecGCustomer : Record "18";
        Text001 : Label 'êtes-vous sure de vouloir défalquer la commande de service en fonction de vos sélections ?';
        Text002 : Label 'auccun traitement n''a été effectué, vous devez au moins sélectionner une ligne en utilisant les bouton action';
        Text003 : Label 'Traitement effectué avec succès\ une nouvelle commande de service à été crée avec le numéro :%1';

    procedure InitDocumentNo(DocNo : Code[20]);
    begin
        ServiceOrderNo := DocNo ;
        RecGServiceOrder.GET(RecGServiceOrder."Document Type"::Order,DocNo);
        CustomerCode := RecGServiceOrder."Customer No." ;
        CustomerName := RecGServiceOrder.Name ;
    end;
}

