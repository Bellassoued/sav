page 60128 "Posted Sales Invoice Lines2"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Sales Invoice Lines',
                FRA='Lignes facture vente enreg.';
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    Permissions = TableData 113=rm;
    SourceTable = Table113;
    SourceTableView = SORTING(Document No.,Line No.)
                      ORDER(Ascending)
                      WHERE(Order Type=CONST(VN),
                            Posting Group=FILTER(<>VEHICULES),
                            Type=CONST(Item));

    layout
    {
        area(content)
        {
            repeater()
            {
                Editable = false;
                field("Posting Date";"Posting Date")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Affecter sur";"Affecter sur")
                {
                }
                field(Received;Received)
                {
                    Enabled = false;
                }
                field("Receive Date";"Receive Date")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Confirmer Reception")
            {
                Caption = 'Confirmer Reception';
                Image = Confirm;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin

                    RecGItemJnlCheckline.CheckUserWarehouse("Location Code",'');

                    Received := TRUE ;
                    "Receive Date" := TODAY ;
                    MODIFY;

                    CurrPage.UPDATE;
                end;
            }
            action("Imprimer Demande de Pièce")
            {
                Caption = 'Imprimer Demande de Pièce';
                Image = ItemAvailability;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunPageOnRec = true;

                trigger OnAction();
                begin

                    RecLSalesInvLine.COPY(Rec);
                    RecLSalesInvLine.SETRECFILTER;
                    REPORT.RUN(REPORT::"Demande Accessoire VN",TRUE,FALSE,RecLSalesInvLine);
                end;
            }
        }
    }

    trigger OnInit();
    begin

        SetLocationFilter;
    end;

    trigger OnOpenPage();
    begin
        SETRANGE(Received,FALSE);
    end;

    var
        SalesInvHeader : Record "112";
        RecGRespCenter : Record "5714";
        UserSetupMgt : Codeunit "418";
        RecLSalesInvLine : Record "113";
        RecGItemJnlCheckline : Codeunit "21";

    procedure SetLocationFilter();
    var
        UserSetupMgt : Codeunit "5700";
        RespCenterCode : Code[10];
    begin
        IF RecGRespCenter.GET(UserSetupMgt.GetSalesFilter) THEN
          BEGIN
            FILTERGROUP(2);
             SETRANGE("Location Code",RecGRespCenter."Magasin Calcul Stock PR");
            FILTERGROUP(0);
          END;
    end;
}

