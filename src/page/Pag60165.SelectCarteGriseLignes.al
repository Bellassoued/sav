page 60165 "Select Carte Grise Lignes"
{
    // version MAZDA13.1,MAZDA13.2,MAZDA13.3

    AutoSplitKey = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60016;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sélectionner";MARK)
                {
                    Visible = ModeSelect;
                }
                field("N° Bordereau";"N° Bordereau")
                {
                    Editable = false;
                    Visible = false;
                }
                field("N° Ligne";"N° Ligne")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Modèle Véhicule";"Modèle Véhicule")
                {
                    Editable = false;
                }
                field("Code Variant";"Code Variant")
                {
                    Editable = false;
                }
                field(VIN;VIN)
                {
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        Rec336Temp : Record "336" temporary;
                    begin
                    end;

                    trigger OnValidate();
                    var
                        RecLigneVINInBord : Record "60016";
                    begin
                    end;
                }
                field(Statut;Statut)
                {
                    Editable = false;
                }
                field("N° Matriculation";"N° Matriculation")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Visible = false;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field("Payment No.";"Payment No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sélectionner")
            {
                Image = SelectEntries;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+g';
                Visible = ModeSelect;

                trigger OnAction();
                var
                    Rec338LOCAL : Record "338" temporary;
                begin
                    MARK(NOT MARK);
                end;
            }
            action("Tous Sélectionner")
            {
                Image = SelectField;
                Promoted = true;
                PromotedIsBig = true;
                Visible = ModeSelect;

                trigger OnAction();
                begin
                    IF FINDSET THEN
                    REPEAT
                      MARK(NOT MARK)
                    UNTIL NEXT = 0;
                end;
            }
            action("Filtrer sur Sélectionner")
            {
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;
                Visible = ModeSelect;

                trigger OnAction();
                begin
                    MARKEDONLY(NOT MARKEDONLY)
                end;
            }
            action("Supprimer la sélection")
            {
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;
                Visible = ModeSelect;

                trigger OnAction();
                begin
                    CLEARMARKS
                end;
            }
            action("Supprimer Lien Carte Grise")
            {
                Promoted = true;
                PromotedIsBig = true;
                Visible = NOT ModeSelect;

                trigger OnAction();
                begin
                    SupprimerLiaisonCarteGriseBorPaiement;
                    //IF FINDSET THEN BEGIN
                    //    MODIFYALL("Payment No.",'');
                    //    MODIFYALL("Payment Line No.",0);
                    //    MODIFYALL("Payment Class",'');
                    //    MODIFYALL("Payment Document No.",'');
                    //    MODIFYALL("Payment External Document No.",'');
                    //END;
                    //RecGPaymentLine.VALIDATE(Amount,0);
                    //RecGPaymentLine.MODIFY(TRUE);
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        CurrPage.LOOKUPMODE(TRUE);
        TotalAmount := 0;

        IF ModeSelect THEN BEGIN
          FILTERGROUP(2);
          SETFILTER("Payment No.",'''''');
          FILTERGROUP(0);
        END ELSE BEGIN
          FILTERGROUP(2);
          SETRANGE("Payment No.",RecGPaymentLine."No.");
          FILTERGROUP(0);
        END
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF CloseAction IN [ACTION::OK] THEN BEGIN
          IF ModeSelect THEN BEGIN
            LierLigneCarteGriseBordereauPaiement;
          END ELSE BEGIN
            SupprimerLiaisonCarteGriseBorPaiement;
          END;
        END;
    end;

    var
        RecGPaymentLine : Record "10866";
        RecLigneCarte : Record "60016";
        ModeSelect : Boolean;
        TotalAmount : Decimal;
        RecPaymentHeader : Record "10865";
        RecCarteGriseEntete : Record "60015";
        RecLigneCarte2 : Record "60016";

    procedure LierLigneCarteGriseBordereauPaiement();
    begin
        MARKEDONLY(TRUE);
        //SM MAZDA13.2
        RecPaymentHeader.GET(RecGPaymentLine."No.");
        //END SM
        
        IF FINDFIRST THEN BEGIN
          REPEAT
            RecLigneCarte.RESET;
            RecLigneCarte.GET("N° Bordereau","N° Ligne");
            RecLigneCarte."Payment No."                       := RecGPaymentLine."No.";
            RecLigneCarte."Payment Line No."                  := RecGPaymentLine."Line No.";
            RecLigneCarte."Payment Class"                     := RecGPaymentLine."Payment Class";
            RecLigneCarte."Payment Document No."              := RecGPaymentLine."Document No.";
            RecLigneCarte."Payment External Document No."     := RecGPaymentLine."External Document No.";
            //SM MAZDA13.2
            RecLigneCarte."Account Type"                      := RecPaymentHeader."Account Type";
            RecLigneCarte."Account No."                       := RecPaymentHeader."Account No.";
            RecLigneCarte."Bank Branch No."                   := RecPaymentHeader."Bank Branch No.";
            RecLigneCarte."Bank Account No."                  := RecPaymentHeader."Bank Account No.";
            RecLigneCarte."Agency Code"                       := RecPaymentHeader."Agency Code";
            RecLigneCarte."Bank Name"                         := RecPaymentHeader."Bank Name";
            RecLigneCarte.Statut                              := RecLigneCarte.Statut::"CHQ Préparé";
            RecLigneCarte."Date Heure Chq Pré"          :=CREATEDATETIME(WORKDATE,TIME);
           // RecLigneCarte."Heure Envoie Bordereau"            := TIME;
            //SM 091017 TMP RecLigneCarte.Statut                              := RecLigneCarte.Statut::"CHQ Préparé";
            //END SM
            //SM MAZDA13.3
            RecLigneCarte."Date Lettrage"                      := CURRENTDATETIME;
            //END SM
            RecLigneCarte.MODIFY;
            TotalAmount += RecLigneCarte."Frais immatriculation" + RecLigneCarte."Frais Redevence Comp. Véhicule"
                        +RecLigneCarte."Frais TME" + RecLigneCarte."Autre Frais" ;
            //SM MAZDA13.3
            RecCarteGriseEntete.GET("N° Bordereau");
            RecLigneCarte2.RESET;
            RecLigneCarte2.SETRANGE("N° Bordereau","N° Bordereau");
            RecLigneCarte2.SETFILTER("Payment No.",'''''');
            /*//SM 091017 TMP
            IF RecLigneCarte2.ISEMPTY THEN BEGIN
              RecCarteGriseEntete.Statut := RecCarteGriseEntete.Statut::Soldé;
              RecCarteGriseEntete.MODIFY;
            END ELSE BEGIN
              RecCarteGriseEntete.Statut := RecCarteGriseEntete.Statut::Envoyé;
              RecCarteGriseEntete.MODIFY;
            END;
            //SM 091017 TMP */
            //END SM MAZDA13.3
        
          UNTIL NEXT =0;
        
          RecGPaymentLine.VALIDATE(Amount,TotalAmount);
          RecGPaymentLine.MODIFY(TRUE);
        
        
        END;

    end;

    procedure SupprimerLiaisonCarteGriseBorPaiement();
    begin
        //SM MAZDA13.3
        IF FINDFIRST THEN BEGIN
          REPEAT
            RecLigneCarte.RESET;
            RecLigneCarte.GET("N° Bordereau","N° Ligne");
            RecLigneCarte."Payment No."                       := '';
            RecLigneCarte."Payment Line No."                  := 0;
            RecLigneCarte."Payment Class"                     := '';
            RecLigneCarte."Payment Document No."              := '';
            RecLigneCarte."Payment External Document No."     := '';
            RecLigneCarte."Account Type"                      := 0;
            RecLigneCarte."Account No."                       := '';
            RecLigneCarte."Bank Branch No."                   := '';
            RecLigneCarte."Bank Account No."                  := '';
            RecLigneCarte."Agency Code"                       := '';
            RecLigneCarte.Statut                              := RecLigneCarte.Statut::Envoyé;
            RecLigneCarte."Bank Name"                         := '';
            //SM 091017 TMP RecLigneCarte.Statut                              := RecLigneCarte.Statut::Envoyé;
            //SM MAZDA13.3
            RecLigneCarte."Date Lettrage"                     := 0DT;
            //END SM
        
            RecLigneCarte.MODIFY;
        
            RecCarteGriseEntete.GET("N° Bordereau");
            RecLigneCarte2.RESET;
            RecLigneCarte2.SETRANGE("N° Bordereau","N° Bordereau");
            RecLigneCarte2.SETFILTER("Payment No.",'''''');
            /*//SM 091017 TMP
            IF RecLigneCarte2.ISEMPTY THEN BEGIN
              RecCarteGriseEntete.Statut := RecCarteGriseEntete.Statut::Soldé;
              RecCarteGriseEntete.MODIFY;
            END ELSE BEGIN
              RecCarteGriseEntete.Statut := RecCarteGriseEntete.Statut::Envoyé;
              RecCarteGriseEntete.MODIFY;
            END;
            //SM 091017 TMP */
        
          UNTIL NEXT =0;
        
          RecGPaymentLine.VALIDATE(Amount,0);
          RecGPaymentLine.MODIFY(TRUE);
        END;

    end;

    procedure SetSource(var ParamPaymentLine : Record "10866";ParamModeSelect : Boolean);
    begin
        RecGPaymentLine := ParamPaymentLine;
        RecGPaymentLine.SETRECFILTER;
        ModeSelect := ParamModeSelect;
    end;
}

