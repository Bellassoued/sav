page 60172 "Change Status Reception"
{
    // version Temporaire a supprimer


    layout
    {
        area(content)
        {
            field(NoRecption;NoRecption)
            {
                Caption = 'Numéro de fiche de reception';
                TableRelation = "Reception SAV";
            }
            field(NewStatus;NewStatus)
            {
                Caption = 'Nouveau Statut';
            }
            field(InvoiceNo;InvoiceNo)
            {
                Caption = 'Numéro de Facture de Service';
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Changer Statut")
            {
                Image = Confirm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    RecReceptionSAV.GET(NoRecption);
                    RecReceptionSAV."Status SR" := NewStatus;
                    RecReceptionSAV.MODIFY;
                    IF  NewStatus = NewStatus::Facturée THEN BEGIN
                      RecServiceInvoiceHeader.GET(InvoiceNo);
                      RecServiceInvoiceHeader."Reception No":= NoRecption;
                      RecServiceInvoiceHeader.MODIFY;

                    END
                end;
            }
        }
    }

    var
        NoRecption : Code[20];
        NewStatus : Option "Fiche Crée","Lancée","Commande Crée","Pièces demandé","Facturée","Annulé";
        InvoiceNo : Code[20];
        RecReceptionSAV : Record "60008";
        RecServiceInvoiceHeader : Record "5992";
}

