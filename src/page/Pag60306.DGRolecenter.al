page 60306 "DG Role center"
{
    PageType = RoleCenter;
    PopulateAllFields = true;

    layout
    {
        area(rolecenter)
        {
            part(;60305)
            {
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Suivi Charges & Marges VIN")
            {
                RunObject = Page 60327;
            }
            action("Simuation P.Revient VN")
            {
                RunObject = Page 50116;
            }
        }
        area(reporting)
        {
            group(VN)
            {
                action("Vente V.N par Vendeur/model")
                {
                    Image = Sales;
                    RunObject = Report 60130;
                }
                action("Devis émis par commercial")
                {
                    Image = Quote;
                    RunObject = Report 50077;
                }
                action("Reporting Journalier VN")
                {
                    Image = StatisticsDocument;
                    RunObject = Report 70020;
                }
                action("Etat journalier des commandes")
                {
                    Image = SalesInvoice;
                    RunObject = Report 60093;
                }
            }
            group("PR/SAV")
            {
                action("Chiffre d'affaire PR/SAV")
                {
                    Image = Sales;
                    RunObject = Report 70035;
                }
            }
        }
    }
}

