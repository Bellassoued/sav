page 60315 "Tranfert Retour"
{
    // version RT001

    DeleteAllowed = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Table60073;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                    Editable = GBoolAllEditable;
                }
                field("Transfer-from Name";"Transfer-from Name")
                {
                    Editable = GBoolAllEditable;
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                    Editable = GBoolAllEditable;
                }
                field("Transfer-to Name";"Transfer-to Name")
                {
                    Editable = GBoolAllEditable;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = GBoolAllEditable;
                }
                field(Status;Status)
                {
                    Editable = GBoolAllEditable;
                }
                field("External Document No.";"External Document No.")
                {
                    Editable = GBoolAllEditable;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    Editable = GBoolAllEditable;
                }
                field("Reception No";"Reception No")
                {
                    Editable = GBoolAllEditable;
                }
                field("Type Reception";"Type Reception")
                {
                    Editable = GBoolAllEditable;
                }
                field("No Service Order";"No Service Order")
                {
                    Editable = GBoolAllEditable;
                }
                field("Source Type";"Source Type")
                {
                    Editable = GBoolAllEditable;
                }
                field("Source No";"Source No")
                {
                    Editable = GBoolAllEditable;
                }
                field(Retour;Retour)
                {
                    Editable = GBoolAllEditable;
                }
                field(InterCompany;InterCompany)
                {
                    Editable = GBoolAllEditable;
                }
                field(Expédié;Expédié)
                {
                    Editable = GBoolAllEditable;
                }
                field(Réceptionné;Réceptionné)
                {
                    Editable = GBoolAllEditable;
                }
                field("Commande Source";"Commande Source")
                {
                }
            }
            part(;60316)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Expédier")
            {

                trigger OnAction();
                var
                    RetourDetailPRSAV : Codeunit "70013";
                begin
                    RetourDetailPRSAV.ValiderExpedition("No.");
                end;
            }
            action("Réceptionner")
            {

                trigger OnAction();
                begin
                    RetourDetailPRSAV.ValiderRéception("No.");
                end;
            }
            action("Imprimer Pick")
            {

                trigger OnAction();
                var
                    LRepTransferOrder : Report "50074";
                    LRecTransferOrder : Record "60073";
                    LRecLocation : Record "14";
                begin

                    CLEAR(LRepTransferOrder);
                    LRecLocation.RESET;
                    LRecLocation.GET("Transfer-to Code");
                    //MESSAGE('Location');
                    LRepTransferOrder.FctPropagerNoReception(LRecLocation."Centre de Gestion");
                    //MESSAGE('Propager');
                    LRecTransferOrder.SETRANGE("No.","No.");
                    LRecTransferOrder.FINDFIRST;
                    LRepTransferOrder.SETTABLEVIEW(LRecTransferOrder);
                    LRepTransferOrder.RUN;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        UserSetup.GET(USERID);
        GBoolAllEditable:=UserSetup."Modifier client/Client Facturé";
        //GBoolAllEditable:=FALSE
    end;

    var
        ItemJournalLine : Record "83";
        RetourDetailPRSAV : Codeunit "70013";
        UserSetup : Record "91";
        GBoolAllEditable : Boolean;
}

