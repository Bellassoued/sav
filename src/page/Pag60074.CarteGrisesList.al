page 60074 "Carte Grises List"
{
    // version MAZDA13

    CardPageID = "Carte Grise";
    Editable = false;
    PageType = List;
    SourceTable = Table60015;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N° Bordereau";"N° Bordereau")
                {
                    Editable = false;
                    StyleExpr = Couleur;
                }
                field("Date Création";"Date Création")
                {
                    Editable = false;
                }
                field("Date Emission";"Date Emission")
                {
                    Editable = false;
                }
                field("Nbre Carte Grise";"Nbre Carte Grise")
                {
                    Editable = false;
                }
                field(Statut;Statut)
                {
                    Editable = false;
                }
                field("Purchase Request No.";"Purchase Request No.")
                {
                    Editable = false;
                }
                field("Purchase request line No.";"Purchase request line No.")
                {
                    Editable = false;
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
                Image = SelectField;
                Promoted = true;
                Visible = GBoolSelectVisible;

                trigger OnAction();
                begin
                    IF "Purchase Request No."='' THEN BEGIN
                      "Purchase Request No.":=GCdeNoDA;
                      "Purchase request line No.":=GIntPRLineNo;
                      MODIFY;

                    END ELSE
                     BEGIN
                      "Purchase request line No.":=0;
                      "Purchase Request No.":='';
                      MODIFY;
                      END;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        CarteGriseLigne.RESET;
        CarteGriseLigne.SETRANGE("N° Bordereau","N° Bordereau");
        CarteGriseLigne.SETRANGE("Payment Status",CarteGriseLigne."Payment Status"::"Non Soldé",CarteGriseLigne."Payment Status"::Soldé);
        IF CarteGriseLigne.ISEMPTY THEN
          Couleur := 'Favorable'
        ELSE
          Couleur := 'Attention';
    end;

    trigger OnAfterGetRecord();
    begin
        CarteGriseLigne.RESET;
        CarteGriseLigne.SETRANGE("N° Bordereau","N° Bordereau");
        CarteGriseLigne.SETRANGE("Payment Status",CarteGriseLigne."Payment Status"::"Non Soldé",CarteGriseLigne."Payment Status"::Soldé);
        IF CarteGriseLigne.ISEMPTY THEN
          Couleur := 'Favorable'
        ELSE
          Couleur := 'Attention';
    end;

    var
        CarteGriseLigne : Record "60016";
        Couleur : Text[20];
        GBoolSelectVisible : Boolean;
        GCdeNoDA : Code[20];
        GIntPRLineNo : Integer;
        GBoolSelected : Boolean;

    procedure FctSetPurchaseRequestNo(PCodeRequestNo : Code[20];PIntLineNo : Integer;SelectVisible : Boolean);
    begin
        GCdeNoDA:=PCodeRequestNo;
        GIntPRLineNo:=PIntLineNo;
        GBoolSelectVisible:=SelectVisible;
        FILTERGROUP(2);
        SETFILTER("Purchase request line No.",'%1|%2',PIntLineNo,0);
        SETFILTER("Purchase Request No.",'%1|%2',PCodeRequestNo,'');
        FILTERGROUP(2);
    end;
}

