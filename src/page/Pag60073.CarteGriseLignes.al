page 60073 "Carte Grise Lignes"
{
    // version MAZDA13,MAZDA13.1,MAZDA13.2,MAZDA301.1

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = Table60016;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N° Bordereau";"N° Bordereau")
                {
                    Visible = false;
                }
                field("N° Ligne";"N° Ligne")
                {
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
                    Style = None;
                    StyleExpr = Couleur;

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        Rec336Temp : Record "336" temporary;
                    begin
                        /*Rec336Temp.DELETEALL;
                        Rec336Temp.INIT;
                        Rec336Temp."Entry No." := 10000;
                        Rec336Temp."Item No."  := "Modèle Véhicule";
                        Rec336Temp."Location Code"  := "Location Code";
                        Rec336Temp."Variant Code"  := "Code Variant";
                        Rec336Temp.INSERT;
                        //OLD ItemTrackingDataCollection.AssistEditLotSerialNoMAZDA(Rec336Temp,
                        //OLD   TRUE,1,0,1000000,Rec);
                        
                        ItemTrackingDataCollection.AssistEditLotSerialNoMAZDA2(Rec336Temp,
                          TRUE,1,0,1000000,Rec);
                        
                        CurrPage.UPDATE;
                         */

                    end;

                    trigger OnValidate();
                    var
                        RecLigneVINInBord : Record "60016";
                    begin
                    end;
                }
                field(Statut;Statut)
                {
                    Editable = true;
                }
                field("N° Matriculation";"N° Matriculation")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("Location Code";"Location Code")
                {
                    Visible = false;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                    Editable = false;
                }
                field(Name;Name)
                {
                    Editable = false;
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Editable = false;
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    Editable = false;
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field("Payment No.";"Payment No.")
                {
                }
                field("Payment Line No.";"Payment Line No.")
                {
                    Visible = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Date Envoie Bordereau";"Date Envoie Bordereau")
                {
                }
                field("Heure Envoie Bordereau";"Heure Envoie Bordereau")
                {
                }
                field("Date Heure Chq Pré";"Date Heure Chq Pré")
                {
                }
                field("Date Heure Depôt";"Date Heure Depôt")
                {
                }
                field("Date Heure Reçu";"Date Heure Reçu")
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Source ID";"Source ID")
                {
                    Editable = true;
                }
                field("Frais immatriculation";"Frais immatriculation")
                {
                }
                field("Frais Redevence Comp. Véhicule";"Frais Redevence Comp. Véhicule")
                {
                }
                field("Frais TME";"Frais TME")
                {
                }
                field("Autre Frais";"Autre Frais")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Réception")
            {
                Visible = false;
                action("Réceptionner ligne")
                {
                    Image = ReceiptLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        /*SM OLD
                         TESTFIELD(Statut,Statut::Envoyé);
                         Statut := Statut::"CHQ Préparé";
                         MODIFY;
                         */

                    end;
                }
                action("Annuler Réception ligne")
                {
                    Image = CancelLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                         /*SM OLD
                         TESTFIELD(Statut,Statut::"CHQ Préparé");
                         Statut := Statut::Envoyé;
                         MODIFY;
                         */

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        IF ("Payment Status"="Payment Status"::"Non Soldé") OR ("Payment Status"="Payment Status"::Soldé) THEN
          Couleur := 'Attention'
        ELSE
          Couleur := 'Favorable';
    end;

    trigger OnAfterGetRecord();
    begin
        IF ("Payment Status"="Payment Status"::"Non Soldé") OR ("Payment Status"="Payment Status"::Soldé) THEN
          Couleur := 'Attention'
        ELSE
          Couleur := 'Favorable';
    end;

    var
        ItemTrackingDataCollection : Codeunit "6501";
        Couleur : Text[50];
}

