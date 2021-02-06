page 70099 "Suivi Essai sur Route"
{
    PageType = Card;
    SourceTable = Table70066;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Réception SAV";"No.")
                {
                    Caption = 'Num OR';
                    Editable = false;
                }
                field("No. réparation";"No. réparation")
                {
                    Caption = 'No.Réparation';
                    Editable = false;
                }
                field("Date de Creation";"Date de Creation")
                {
                    Editable = false;
                }
                field("Cree par";"Cree par")
                {
                    Caption = 'Crée par';
                    Editable = false;
                }
                field(Trajet1;Trajet1)
                {
                    Visible = false;
                }
                field(Trajet2;Trajet2)
                {
                    CaptionML = ENU='Trajet1( 30 minutes)',
                                FRA='Trajet1( 30 minutes)';
                }
                field(Trajet3;Trajet3)
                {
                    CaptionML = ENU='Trajet2( 1h) ',
                                FRA='Trajet2( 1h) ';
                }
                field("Nature travaux";"Nature travaux")
                {
                }
                field("Heure départ";"Heure départ")
                {
                }
                field("Heure retour";"Heure retour")
                {
                }
                field(Durée;Durée)
                {
                    Caption = 'Durée trajet (Heure)';
                    Editable = false;
                    Visible = false;
                }
                field("Duree Reelle";"Duree Reelle")
                {
                    Editable = false;
                }
                field("Kilométrage avant essai";"Kilométrage avant essai")
                {
                }
                field("Kilométrage après essai";"Kilométrage après essai")
                {
                }
                field(KM;KM)
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE;
                    end;
                }
                field(Essayeur;Essayeur)
                {
                    Caption = 'Code Essayeur';
                }
                field("Nom Essayeur";"Nom Essayeur")
                {
                }
                field("Obseravation avant essai";"Obseravation avant essai")
                {
                    Editable = false;
                }
                field("Observation essayeur";"Observation essayeur")
                {
                }
            }
            group(Carburant)
            {
                Caption = 'Carburant';
                Editable = CanEditFuelConsumption;
                field(Carburant;Carburant)
                {
                }
                field("Type de carburant";"Type de carburant")
                {
                    CaptionML = ENU='<Type de carburant>',
                                FRA='Type de carburant';
                    Enabled = Carburant;
                }
                field("Type bon pour carburant";"Type bon pour carburant")
                {
                    Caption = 'Quantité carburant (litre)';
                    Editable = Carburant;
                }
                field("Numéro bon pour carburant";"Numéro bon pour carburant")
                {
                    Editable = "Carburant";
                }
                field("Quantité carburant";"Quantité carburant")
                {
                    Visible = false;
                }
                field("Confirmer carburant";"Confirmer carburant")
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

                trigger OnAction();
                begin
                    REPORT.RUN(50021,TRUE,TRUE,Rec);
                    "Nbre Impressions"+=1;
                    "Printed By"      :=USERID;
                    "Printing Date"   :=WORKDATE;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        CanEditFuelConsumption:=NOT "Confirmer carburant";
    end;

    trigger OnAfterGetRecord();
    begin
        CanEditFuelConsumption:=NOT "Confirmer carburant";
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        VALIDATE("Type bon pour carburant",0);
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF Carburant THEN BEGIN
          TESTFIELD("Quantité carburant");
          TESTFIELD("Numéro bon pour carburant");
          TESTFIELD("Confirmer carburant",TRUE);
        END;
    end;

    var
        suiviessairoute : Record "70066";
        CanEditFuelConsumption : Boolean;
}

