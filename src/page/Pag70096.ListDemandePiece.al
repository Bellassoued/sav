page 70096 "List Demande Piece"
{
    Caption = 'Liste des ordres de transfert';
    Editable = false;
    PageType = List;
    PopulateAllFields = true;
    SourceTable = Table70055;
    SourceTableTemporary = true;

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
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Receipt Date";"Receipt Date")
                {
                }
                field(Status;Status)
                {
                }
                field("Company Name";"Company Name")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field(Retour;Retour)
                {
                }
            }
            part(;70284)
            {
                SubPageLink = Document No.=FIELD(No.),
                              Derived From Line No.=CONST(0);
                UpdatePropagation = SubPart;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Fiche Transfert")
            {
                Image = Card;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction();
                var
                    LRecListDemandePiece : Record "70055";
                begin
                    FctShowTrabsferOrderCard(Rec);
                end;
            }
            action("Réceptionner")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    LRecTransferHeader : Record "5740";
                    LCduTransferOrderPostReceipt : Codeunit "5705";
                    LRecTransferLine : Record "5741";
                    navBinding : DotNet "'System.ServiceModel, Version=3.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.ServiceModel.BasicHttpBinding";
                    Address : Text;
                    BlnOK : Boolean;
                    SessionId : Integer;
                    ActiveSession : Record "2000000110";
                begin
                    LRecTransferHeader.CHANGECOMPANY("Company Name");
                    LRecTransferHeader.GET("No.");
                    //LRecTransferHeader.FctRunPostReceptTransfer(LRecTransferHeader,"Company Name");
                    //LRecTransferLine.CHANGECOMPANY("Company Name");
                    //CLEAR(LCduTransferOrderPostReceipt);
                    //LCduTransferOrderPostReceipt.RUN(LRecTransferHeader);
                    //SM 10/09/17
                    IF "Company Name" = COMPANYNAME THEN BEGIN
                      LCduTransferOrderPostReceipt.RUN(LRecTransferHeader);
                    END ELSE BEGIN
                    //END SM
                      IF NOT LRecTransferHeader.Retour THEN
                        BlnOK := STARTSESSION(SessionId, CODEUNIT::"TransferOrder-Post Receipt", "Company Name", LRecTransferHeader)
                       ELSE
                        BlnOK := STARTSESSION(SessionId, CODEUNIT::"TransferOrder-Post Shipment", "Company Name", LRecTransferHeader);

                      IF BlnOK THEN
                        BEGIN
                          SLEEP(30000);
                          MESSAGE('Order de transfert No. %1 est validé',LRecTransferHeader."No.");
                          STOPSESSION(SessionId, 'Logoff cache stress test session');
                        END
                      ELSE
                        ERROR('The session was not started successfully.');
                    END;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        FILTERGROUP(2);
        FILTERGROUP(0);
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        DELETEALL;
        LinedemandePiece.DELETEALL
    end;

    var
        url : Text[500];
        RecTransferHeader : Record "5740";
        LinedemandePiece : Record "60086";
}

