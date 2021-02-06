page 70053 "Entête financement"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = Table70043;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No. Financement";"No. Financement")
                {
                }
                field("No. Arrivage";"No. Arrivage")
                {
                }
                field("No. L.C";"No. L.C")
                {
                }
                field("No. série";"No. série")
                {
                }
                field("Date de création";"Date de création")
                {
                }
                field(Statut;Statut)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
            }
            part(;70054)
            {
                SubPageLink = No. Financement=FIELD(No. Financement);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Lancer)
            {
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    RecLignefinancement : Record "70044";
                    CurrExchRate : Record "330";
                begin
                    RecLignefinancement.RESET;

                    RecLignefinancement.SETRANGE("No. Financement","No. Financement");
                    IF RecLignefinancement.FINDSET THEN
                      BEGIN
                        RecLignefinancement.TESTFIELD("Cour de financement");
                        RecLignefinancement.TESTFIELD("Date Création");
                        RecLignefinancement.TESTFIELD("Date Echéance");
                        RecLignefinancement."Nb. jours" := RecLignefinancement."Date Echéance"-RecLignefinancement."Date Création";
                        //RecLignefinancement."Montant C / Financement"       := RecLignefinancement."Court de financement" * RecLignefinancement."Montant Arrivage (Devise)";
                        //RecLignefinancement."Ecart Montant"    := RecLignefinancement."Montant C / Financement" -RecLignefinancement."Montant Arrivage (Tnd)";
                        RecLignefinancement.MODIFY
                      END;
                end;
            }
            action("Proposer Commission/Intérêt")
            {

                trigger OnAction();
                var
                    LettredecreditLC : Record "70036";
                    PageCommissionparbanque : Page "70034";
                    RecCommisionparbanque : Record "70005";
                    op : Option LC,Arrivage,Financement;
                begin
                    op := op::Financement;
                    LettredecreditLC.GET("No. L.C");
                    CLEAR(PageCommissionparbanque);
                    RecCommisionparbanque.SETFILTER(Banque,'%1',LettredecreditLC.Banque);
                    PageCommissionparbanque.SETTABLEVIEW(RecCommisionparbanque);
                    PageCommissionparbanque.LOOKUPMODE := TRUE;
                    PageCommissionparbanque.GetLettredeCredit(LettredecreditLC,"No. Arrivage",op,"No. Financement");  //Op : Commission sur LC ou Commission sur arrivage
                    //,"N° Dossier"
                    IF PageCommissionparbanque.RUNMODAL <> ACTION::Cancel THEN;
                end;
            }
            action("Proposer Reglement Fournisseur")
            {
                Image = Payment;

                trigger OnAction();
                begin
                    MgtAures.InsererComptaRegFRS(Rec);
                end;
            }
            action("Payment Financement")
            {
                Image = PaymentForecast;

                trigger OnAction();
                begin
                    MgtAures.InsererComptaPaymentFIN(Rec);
                end;
            }
        }
    }

    var
        RecArrivageVN : Record "50011";
        MgtAures : Codeunit "70003";
}

