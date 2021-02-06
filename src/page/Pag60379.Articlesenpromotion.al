page 60379 "Articles en promotion"
{
    // version PROMO

    PageType = List;
    SourceTable = Table50058;

    layout
    {
        area(content)
        {
            field("Code promotion";CodePromotion)
            {
                ShowCaption = false;
            }
            repeater(Group)
            {
                field(Code;Code)
                {
                }
                field("Sales Code";"Sales Code")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Line Discount %";"Line Discount %")
                {
                }
                field("Sales Type";"Sales Type")
                {
                }
                field("Minimum Quantity";"Minimum Quantity")
                {
                }
                field("Ending Date";"Ending Date")
                {
                }
                field(Type;Type)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field(Prmotion;Prmotion)
                {
                }
                field("Stock suffisant";"Stock suffisant")
                {
                }
                field("Marge rentable";"Marge rentable")
                {
                }
                field("Prix de vente";"Prix de vente")
                {
                }
                field(CMP;CMP)
                {
                }
                field("CMP calculé";"CMP calculé")
                {
                }
                field("Prix fob";"Prix fob")
                {
                }
                field("Stock global";"Stock global")
                {
                }
                field("Quantité sur commande achat";"Quantité sur commande achat")
                {
                }
                field("%Marge";"%Marge")
                {
                }
                field("Consommation année gliassante";"Consommation année gliassante")
                {
                }
                field(Status;Status)
                {

                    trigger OnValidate();
                    begin
                        "Status manuel":=TRUE;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Valider)
            {
                Image = Approve;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    IF CodePromotion='' THEN
                      ERROR('Code promotion obligatoire');
                    CurrPage.SETSELECTIONFILTER(GRecArticlesenpromotion);
                    //GRecArticlesenpromotion.RESET;
                    //GRecArticlesenpromotion.SETRANGE(Status,Status::" ");
                    GRecArticlesenpromotion.MARKEDONLY(TRUE);
                    IF GRecArticlesenpromotion.FINDSET THEN BEGIN
                      REPEAT
                        GRecArticlesenpromotion.VALIDATE(Code);
                        IF GRecArticlesenpromotion."Stock global"+GRecArticlesenpromotion."Quantité sur commande achat">0 THEN
                        GRecArticlesenpromotion."CMP calculé":=(GRecArticlesenpromotion.CMP*GRecArticlesenpromotion."Stock global"
                        +GRecArticlesenpromotion."Quantité sur commande achat"*GRecArticlesenpromotion."Prix fob"*GRecArticlesenpromotion."Coefficient promotions")
                        /(GRecArticlesenpromotion."Stock global"+GRecArticlesenpromotion."Quantité sur commande achat");
                        GRecArticlesenpromotion."%Marge":=(GRecArticlesenpromotion."Prix de vente"-GRecArticlesenpromotion."CMP calculé")/GRecArticlesenpromotion."Prix de vente"*100;
                        GRecArticlesenpromotion."Marge rentable":=(GRecArticlesenpromotion."%Marge">=20);
                        IF GRecArticlesenpromotion."Stock suffisant" AND GRecArticlesenpromotion."Marge rentable" THEN BEGIN
                          GRecArticlesenpromotion.Status:=GRecArticlesenpromotion.Status::Validé;
                          GRecArticlesenpromotion."Promotion No.":=CodePromotion;
                        END;
                        GRecArticlesenpromotion.MODIFY;
                      UNTIL GRecArticlesenpromotion.NEXT=0;
                    END;
                end;
            }
            action("Insérer")
            {
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    TESTFIELD("Line Discount %");
                    IF CodePromotion='' THEN
                      ERROR('Code promotion obligatoire');

                    //GRecArticlesenpromotion.RESET;
                    //GRecArticlesenpromotion.SETRANGE(Status,GRecArticlesenpromotion.Status::Validé);
                    //CurrPage.SETSELECTIONFILTER(GRecArticlesenpromotion);
                    GRecArticlesenpromotion.RESET;
                    GRecArticlesenpromotion.SETRANGE(Status,Status::Validé);
                    GRecArticlesenpromotion.SETRANGE("Promotion No.",CodePromotion);
                    //GRecArticlesenpromotion.MARKEDONLY(TRUE);
                    IF GRecArticlesenpromotion.FINDSET THEN BEGIN
                      REPEAT
                        //GRecSalesLineDiscount.INIT;
                        //GRecSalesLineDiscount.TRANSFERFIELDS(GRecArticlesenpromotion);
                        //GRecSalesLineDiscount.INSERT;

                        Location.RESET;
                        Location.SETRANGE("Magasin central succursale",TRUE);
                        IF Location.FINDSET THEN BEGIN
                          IF GRecArticlesenpromotion.Status=GRecArticlesenpromotion.Status::Validé THEN
                            REPEAT
                              Reclassementarticlespromo.INIT;
                              Reclassementarticlespromo.VALIDATE("Promotion No.",GRecArticlesenpromotion."Promotion No.");
                              Reclassementarticlespromo.VALIDATE("Code article",GRecArticlesenpromotion.Code);
                              //Reclassementarticlespromo.VALIDATE("Quantité préconisée",GRecArticlesenpromotion."Consommation année gliassante"/2);
                              Reclassementarticlespromo.VALIDATE("Code magasin",Location.Code);
                              Reclassementarticlespromo.INSERT(TRUE);
                            UNTIL Location.NEXT=0;
                          END;
                        GRecArticlesenpromotion.Status:=GRecArticlesenpromotion.Status::Inséré;
                        GRecArticlesenpromotion.MODIFY;
                      UNTIL GRecArticlesenpromotion.NEXT=0;
                    END;
                    //Consommation 2 mois par centre de gestion
                    Reclassementarticlespromo1.RESET;
                    Reclassementarticlespromo1.SETRANGE("Promotion No.",CodePromotion);
                    IF Reclassementarticlespromo1.FINDSET THEN BEGIN
                        CLEAR(ReclassementarticlesenpromoPage);
                        ReclassementarticlesenpromoPage.SETRECORD(Reclassementarticlespromo1);
                        ReclassementarticlesenpromoPage.SETTABLEVIEW(Reclassementarticlespromo1);
                        ReclassementarticlesenpromoPage.RUN;
                    END;
                end;
            }
            action("Déplacer vers emplacement promotion")
            {
                Caption = 'Déplacer vers emplacement promotion';

                trigger OnAction();
                begin
                    CurrPage.SETSELECTIONFILTER(GRecArticlesenpromotion);
                    //GRecArticlesenpromotion.RESET;
                    //GRecArticlesenpromotion.SETRANGE(Status,Status::" ");
                    //GRecArticlesenpromotion.SETRANGE("Promotion No.",CodePromotion);
                    GRecArticlesenpromotion.MARKEDONLY(TRUE);
                    IF GRecArticlesenpromotion.FINDSET THEN BEGIN

                      REPEAT
                          Location.RESET;
                          Location.SETRANGE("Magasin central succursale",TRUE);
                          IF Location.FINDSET THEN BEGIN
                            IF GRecArticlesenpromotion.Status=GRecArticlesenpromotion.Status::Validé THEN
                              REPEAT
                                Reclassementarticlespromo.INIT;
                                Reclassementarticlespromo.VALIDATE("Promotion No.",GRecArticlesenpromotion."Promotion No.");
                                Reclassementarticlespromo.VALIDATE("Code article",GRecArticlesenpromotion.Code);
                                Reclassementarticlespromo.VALIDATE("Quantité préconisée",GRecArticlesenpromotion."Consommation année gliassante"/2);
                                Reclassementarticlespromo.VALIDATE("Code magasin",Location.Code);
                                Reclassementarticlespromo.INSERT(TRUE);
                              UNTIL Location.NEXT=0;
                           END;
                      UNTIL GRecArticlesenpromotion.NEXT=0;
                    END;
                    //Consommation 2 mois par centre de gestion
                    CLEAR(ReclassementarticlesenpromoPage);
                    ReclassementarticlesenpromoPage.SETRECORD(Reclassementarticlespromo);
                    ReclassementarticlesenpromoPage.SETTABLEVIEW(Reclassementarticlespromo);
                    ReclassementarticlesenpromoPage.RUN;
                end;
            }
        }
    }

    var
        GRecArticlesenpromotion : Record "50058";
        GRecSalesLineDiscount : Record "7004";
        CodePromotion : Code[10];
        Reclassementarticlespromo : Record "50059";
        Location : Record "14";
        ReclassementarticlesenpromoPage : Page "60380";
        Reclassementarticlespromo1 : Record "50059";
}

