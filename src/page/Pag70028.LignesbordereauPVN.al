page 70028 "Lignes bordereau PVN"
{
    // version MAZDA13,MAZDA13.1,MAZDA13.2,MAZDA301.1

    AutoSplitKey = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = Table70022;

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
                field("Payment Line No.";"Payment Line No.")
                {
                    Visible = false;
                }
                field("Payment Class";"Payment Class")
                {
                    Visible = false;
                }
                field("Payment Document No.";"Payment Document No.")
                {
                    Visible = false;
                }
                field("Payment External Document No.";"Payment External Document No.")
                {
                    Visible = false;
                }
                field("Account Type";"Account Type")
                {
                }
                field("Account No.";"Account No.")
                {
                }
                field("Bank Branch No.";"Bank Branch No.")
                {
                }
                field("Bank Account No.";"Bank Account No.")
                {
                }
                field("Agency Code";"Agency Code")
                {
                }
                field("Bank Name";"Bank Name")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Payment Status";"Payment Status")
                {
                }
                field("Date Heure Depôt";"Date Heure Depôt")
                {
                }
                field("Autorisé Envoie CG";"Autorisé Envoie CG")
                {
                }
                field("Source Type";"Source Type")
                {
                    Visible = false;
                }
                field("Source ID";"Source ID")
                {
                    Visible = false;
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
                action("Réceptionner ligne")
                {
                    Image = ReceiptLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin

                         TESTFIELD(Statut,Statut::"Encours de préparation");
                         Statut := Statut::Terminé;
                         MODIFY;
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
                         TESTFIELD(Statut,Statut::Terminé);
                         Statut := Statut::"Encours de préparation";
                         MODIFY;
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

