page 60365 "Liste Rendez-vous"
{
    // version Gestion RDV

    CardPageID = "Entête réception12";
    PageType = List;
    SourceTable = Table60095;
    SourceTableView = WHERE(Type=FILTER(Rendez-Vous));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. RDV";"No. Réception")
                {
                    Caption = 'No. RDV';
                }
                field(Type;Type)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date réception";"Date réception")
                {
                    Caption = 'Date réception RDV';
                }
                field("Temp de réception";"Temp de réception")
                {
                    Caption = 'Temp de réceptionRDV';
                }
                field("Code Client";"Code Client")
                {
                }
                field("No. CIN";"No. CIN")
                {
                }
                field("No. Téléphone";"No. Téléphone")
                {
                }
                field("No. chassis";"No. chassis")
                {
                    Caption = 'N° châssis';
                }
                field("No.Matricule";"No.Matricule")
                {
                }
                field("Réçu par";"Réçu par")
                {
                }
                field("No. Téléphone demandeur";"No. Téléphone demandeur")
                {
                }
                field("Centre de gestion";"Responsibility Center")
                {
                    Caption = 'Centre de gestion';
                }
                field("Date RDV";"Date RDV")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        Type := Type::"Rendez-Vous";
         UserSetup.GET(USERID) ;
         SETRANGE("Responsibility Center",UserSetup."Service Resp. Ctr. Filter");
    end;

    var
        UserSetup : Record "91";
}

