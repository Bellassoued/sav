page 60317 "List  Retour Piece Avoir"
{
    // version RT001

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
                    IF COMPANYNAME = "Company Name" THEN  BEGIN
                      RecTransferHeader.RESET;
                      RecTransferHeader.SETRANGE("No.","No.");
                      IF RecTransferHeader.FINDFIRST THEN  BEGIN
                        //url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::
                        PAGE.RUN(60315,RecTransferHeader);
                        //HYPERLINK(url);
                      END;
                    END ELSE BEGIN
                      RecTransferHeader.CHANGECOMPANY("Company Name");
                      RecTransferHeader.SETRANGE("No.","No.");
                      IF RecTransferHeader.FINDFIRST THEN BEGIN
                        url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,60315,RecTransferHeader);
                        HYPERLINK(url);
                      END;
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
        RecTransferHeader : Record "60073";
        LinedemandePiece : Record "60086";
}

