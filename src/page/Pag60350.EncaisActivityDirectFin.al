page 60350 "Encais. Activity Direct. Fin"
{
    Caption = 'Encaissement';
    PageType = CardPart;
    SourceTable = Table50085;

    layout
    {
        area(content)
        {
            cuegroup("Client en Coffre")
            {
                Caption = 'Client en Coffre';
                field("Nombre chèques en coffre";"Nombre chèques en coffre")
                {
                }
                field("Solde chèques en coffre";"Solde chèques en coffre")
                {
                }
                field("Nombre effets en coffre";"Nombre effets en coffre")
                {
                }
                field("Solde effets en coffre";"Solde effets en coffre")
                {
                }
            }
            cuegroup()
            {
                field("Versement chèques";"Versement chèques")
                {
                }
                field("Versement effets";"Versement effets")
                {
                }
                field("Versement espèce";"Versement espèce")
                {
                }
            }
            cuegroup("Clients Chq Impayés")
            {
                Caption = 'Clients Chq Impayés';
                field("Nbr. Chèq. Impay. Client Grp";"Nbr. Chèq. Impay. Client Grp")
                {
                }
                field("Mnt Chèq. Impay. Client Grp";"Mnt Chèq. Impay. Client Grp")
                {
                }
                field("Nbr. Chèq. Impay. Client H.G";"Nbr. Chèq. Impay. Client H.G")
                {
                }
                field("Mnt Chèq. Impay. Client H.G";"Mnt Chèq. Impay. Client H.G")
                {
                }
            }
            cuegroup("Effets impayés")
            {
                Caption = 'Effets impayés';
                field("Mnt Effets Impayés Client Grp";"Mnt Effets Impayés Client Grp")
                {
                }
                field("Nbr Effets Impayés Client Grp";"Nbr Effets Impayés Client Grp")
                {
                }
                field("Mnt Effets Impayés Client H.G";"Mnt Effets Impayés Client H.G")
                {
                }
                field("Nbr Effets Impayés Client H.G";"Nbr Effets Impayés Client H.G")
                {
                }
            }
            cuegroup("Chq-Eff-En transit")
            {
                CaptionML = ENU='Chq-Eff-En transit',
                            FRA='Chq-Eff-En transit';
                Description = 'Chq-Eff-En transit';
                InstructionalTextML = ENU='Chq-Eff-En transit',
                                      FRA='Chq-Eff-En transit';
                field("Chèque en transit";"Chèque en transit")
                {
                    CaptionML = ENU='Chèque en transit',
                                FRA='Chèque en transit';
                    Importance = Promoted;
                }
                field("Effet en transit";"Effet en transit")
                {
                    CaptionML = ENU='Effet en transit',
                                FRA='Effet en transit';
                    Importance = Promoted;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Journale Caisse")
            {
                RunObject = Report 60021;
            }
        }
    }

    trigger OnOpenPage();
    begin
        RecUserSetup.GET(USERID);
        GET;
        DELETEALL;
        FiltreCoffre:=RecUserSetup."Filtre coffre";
        INSERT;

        //MESSAGE(FORMAT(RecUserSetup."Filtre coffre"));
    end;

    var
        RecUserSetup : Record "91";
        GRecVendor : Record "23";
        GPageVendorList : Page "27";
        GRecCustomer : Record "18";
        GPageCustomerList : Page "22";
}

