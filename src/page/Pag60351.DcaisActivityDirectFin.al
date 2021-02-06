page 60351 "Décais. Activity Direct. Fin"
{
    Caption = 'Décaissement';
    PageType = CardPart;
    SourceTable = Table50085;

    layout
    {
        area(content)
        {
            cuegroup()
            {
                field("Solde Fournisseurs";"Solde Fournisseurs")
                {

                    trigger OnDrillDown();
                    begin
                        GRecVendor.RESET;
                        GRecVendor.CALCFIELDS("Balance (LCY)");
                        GRecVendor.SETFILTER("Balance (LCY)",'>%1',0);
                        IF GRecVendor.FINDSET THEN;
                        CLEAR(GPageVendorList);
                        GPageVendorList.SETRECORD(GRecVendor);
                        GPageVendorList.SETTABLEVIEW(GRecVendor);
                        GPageVendorList.RUN;
                    end;
                }
            }
            cuegroup("Chèque Fournisseur")
            {
                Caption = 'Chèque Fournisseur';
                field("chèques Frs en signature";"chèques Frs en signature")
                {
                }
                field("chèques Frs en coffre";"chèques Frs en coffre")
                {
                }
                field("chèques Frs Remis";"chèques Frs Remis")
                {
                }
            }
            cuegroup("Fournisseur Effet")
            {
                CaptionML = ENU='Fournisseur Effet',
                            FRA='Effet Fournisseur';
                field("Effets Frs en signature";"Effets Frs en signature")
                {
                }
                field("Effets Frs en coffre";"Effets Frs en coffre")
                {
                }
                field("Effets Frs Remis";"Effets Frs Remis")
                {
                }
            }
            cuegroup("Virement fournisseur")
            {
                Caption = 'Virement fournisseur';
                field("Virement frs signé";"Virement frs signé")
                {
                }
                field("Virement en coffre";"Virement en coffre")
                {
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

