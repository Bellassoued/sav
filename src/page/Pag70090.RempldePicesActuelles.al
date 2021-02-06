page 70090 "Rempl de Pièces Actuelles"
{
    PageType = List;
    SourceTable = Table70091;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Replacement No.";"Replacement No.")
                {
                    Visible = false;
                }
                field("Attached to Replacement No.";"Attached to Replacement No.")
                {
                    Visible = false;
                }
                field("Old Item No.";"Old Item No.")
                {
                }
                field("Make Code";"Make Code")
                {
                }
                field("New Item No.";"New Item No.")
                {
                }
                field("Full Replacement";"Full Replacement")
                {
                    Visible = false;
                }
                field(Remark;Remark)
                {
                }
                field("Created on";"Created on")
                {
                }
                field("Creation Time";"Creation Time")
                {
                }
                field("Created by User ID";"Created by User ID")
                {
                    Visible = false;
                }
                field("Process File Data";"Process File Data")
                {
                    Visible = false;
                }
                field("Processed by User ID";"Processed by User ID")
                {
                }
                field("Date Modified";"Date Modified")
                {
                }
                field("Origin Type";"Origin Type")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Aligner Données Fichiers")
            {
                Caption = 'Aligner Données Fichiers';
                Visible = false;

                trigger OnAction();
                begin
                    /*IF ("Old Item No." = '') OR ("New Item No." = '') THEN
                     ERROR(C_INC001);
                    Item.FILTERGROUP(2);
                    Item.SETFILTER("No.",'%1|%2',"Old Item No.","New Item No.");
                    Item.FILTERGROUP(0);
                    CLEAR(ItemChangeList);
                    ItemChangeList.SetItemReplacement("Old Item No.","New Item No.","Replacement No.");
                    ItemChangeList.SETTABLEVIEW(Item);
                    ItemChangeList.SETRECORD(Item);
                    ItemChangeList.RUNMODAL;
                    */

                end;
            }
            action("Activer Tous Les Remplacements")
            {
                Caption = 'Activer Tous Les Remplacements';
                Visible = false;

                trigger OnAction();
                begin
                    /*
                    // Start PA022333
                    ItemReplaceL.COPYFILTERS(Rec);
                    IF ItemReplaceL.FIND('-') THEN
                      REPEAT
                        IF NOT ItemReplaceL."Process File Data" THEN BEGIN
                          ItemReplaceL.VALIDATE("Process File Data",TRUE);
                          ItemReplaceL.MODIFY;
                        END;
                      UNTIL ItemReplaceL.NEXT=0;
                    // Stop PA022333
                    */

                end;
            }
            action("Créer un Remplacement")
            {
                Caption = 'Créer un Remplacement';
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    CurrReplcmts : Record "70091";
                    ReplcmtsCheck : Report "70092";
                    DoReplcmts : Report "70093";
                begin

                    // Start PA022333
                    IF CONFIRM(C_INC004,FALSE) THEN BEGIN

                      //OLD IF MARKEDONLY THEN
                      //OLD   ERROR(C_INC003);

                      //OLD CurrReplcmts.COPYFILTERS(Rec);
                      //OLD CurrReplcmts.SETRANGE("Process File Data",TRUE);

                      IF CurrReplcmts.COUNT = 0 THEN
                        ERROR(C_INC002);

                      //OLD CLEAR(ReplcmtsCheck);
                      //OLD ReplcmtsCheck.SETTABLEVIEW(CurrReplcmts);
                      //OLD ReplcmtsCheck.RUNMODAL;

                      CLEAR(DoReplcmts);
                      DoReplcmts.USEREQUESTPAGE(FALSE);

                      DoReplcmts.SETTABLEVIEW(Rec);//CurrReplcmts);
                      DoReplcmts.RUNMODAL;
                    END;

                    // Stop PA022333
                end;
            }
            action("Rempl Pièces terminées")
            {
                Image = Registered;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70091;
                RunPageLink = Old Item No.=FIELD(Old Item No.);
            }
            action("Chaines De Remplacements")
            {
                Image = RegisterPutAway;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 70092;
                RunPageLink = Item No.=FIELD(Old Item No.);
                Visible = false;
            }
        }
    }

    var
        Item : Record "27";
        C_INC001 : Label 'Vous devez indiquer l''ancien et le nouveau N° Pièce';
        C_INC002 : Label 'Aucun remplacement de pièce lancée';
        C_INC003 : Label 'Impossible d''utiliser les enregistrements marqués comme filtre';
        C_INC004 : Label 'Si les remplacements de pièce sélectionnés doivent être opérés';
}

