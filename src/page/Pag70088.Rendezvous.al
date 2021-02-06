page 70088 "Rendez-vous"
{
    PageType = Card;
    SourceTable = Table60025;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field(Contact;Contact)
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Date rendez vous";"Date rendez vous")
                {

                    trigger OnValidate();
                    begin
                        IF "Date rendez vous"<>0DT THEN BEGIN
                          GRecServiceItem.RESET;
                          GRecServiceItem.SETRANGE("Serial No.",VIN);
                          IF GRecServiceItem.FINDFIRST THEN BEGIN
                            GRecServiceItem."Date Creation Rendez-Vous":=CURRENTDATETIME;
                            GRecServiceItem.MODIFY;
                          END;
                        END;
                    end;
                }
                field("Aire de livraision";"Aire de livraision")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Imprimer)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    GRecPreparationVN.RESET;
                    GRecPreparationVN.SETRANGE("Preparation No","Preparation No");
                    GRecPreparationVN.FINDFIRST;
                    CLEAR(GRepRendezvous);
                    GRepRendezvous.SETTABLEVIEW(GRecPreparationVN);
                    GRepRendezvous.RUN;
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        IF "Date Livraison" <> 0DT THEN BEGIN
          "Status Livraison" := "Status Livraison"::"Rendez-Vous crée";
          MODIFY;
        END;
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        IF "Date Livraison" <> 0DT THEN BEGIN
          "Status Livraison" := "Status Livraison"::"Rendez-Vous crée";
          MODIFY;
        END;
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF "Date Livraison" <> 0DT THEN BEGIN
          "Status Livraison" := "Status Livraison"::"Rendez-Vous crée";
          MODIFY;
        END;
    end;

    var
        GRepRendezvous : Report "60166";
        GRecPreparationVN : Record "60025";
        GRecServiceItem : Record "5940";
}

