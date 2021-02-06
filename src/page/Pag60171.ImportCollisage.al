page 60171 "ImportCollisage"
{
    PageType = List;
    SourceTable = Table60024;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Commande;Commande)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage();
    begin

        //{ sm 120115
        CLEAR(ImportCollisage);
        IF ImportCollisage.FINDFIRST THEN
        REPEAT
            CLEAR(PurchaseLine);
            PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Order);
            PurchaseLine.SETRANGE("Document No.",ImportCollisage.Commande);
            IF PurchaseLine.FINDFIRST THEN
            REPEAT
                PurchaseLine.VALIDATE("Qty. to Receive",0);
                PurchaseLine.VALIDATE("Qty. to Invoice",0);
                PurchaseLine.MODIFY;
            UNTIL PurchaseLine.NEXT = 0;
        UNTIL ImportCollisage.NEXT = 0
        ELSE
          BEGIN
              ERROR(TXT001);
              EXIT;
          END;
        XmlImportListeCollisage.RUN;
        // }
    end;

    trigger OnOpenPage();
    begin
        CLEAR(ImportCollisage);
        ImportCollisage.DELETEALL;
    end;

    var
        ImportCollisage : Record "60024";
        PurchaseLine : Record "39";
        TXT001 : Label 'Insérer les numéro de commande a importer';
        XmlImportListeCollisage : XMLport "50006";
}

