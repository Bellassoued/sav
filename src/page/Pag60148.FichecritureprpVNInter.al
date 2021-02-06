page 60148 "Fiche écriture prép VN Inter"
{
    // version Preparation VN

    Editable = true;
    PageType = Card;
    SourceTable = Table7312;

    layout
    {
        area(content)
        {
            group("Général")
            {
                Caption = 'Général';
                field("Source No.";"Source No.")
                {
                    CaptionML = ENU='Source No.',
                                FRA='N° Document';
                    Editable = false;
                }
                field("Item No.";"Item No.")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Serial No.";"Serial No.")
                {
                    CaptionML = ENU='Serial No.',
                                FRA='N° chassis';
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field("Bin Code";"Bin Code")
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field("User ID";"User ID")
                {
                    Editable = false;
                }
            }
            part(;60139)
            {
                SubPageLink = Document No=FIELD(Source No.),
                              No Chassis=FIELD(Serial No.);
                SubPageView = SORTING(Document No,Line No)
                              WHERE(Titre Principale=CONST(No),
                                    Type Control=CONST(Réception VN inter Parc));
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Imprimer Check Liste")
            {
                Image = PrintCheck;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction();
                var
                    RecWarehouseEntry : Record "7312";
                begin
                    CLEAR(RecWarehouseEntry);
                    RecWarehouseEntry.SETRANGE("Entry No.","Entry No.");
                    IF RecWarehouseEntry.FINDFIRST THEN
                    BEGIN
                        REPORT.RUN(REPORT::"Check liste Inter Parc",TRUE,TRUE,RecWarehouseEntry);
                    END;
                end;
            }
            action(Valider)
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ValiderControlLine();
                end;
            }
        }
    }

    procedure ValiderControlLine();
    var
        ControlVenteVN : Record "60026";
    begin

         IF CONFIRM('Voulez vous valider la liste de contrôl !') THEN
         BEGIN
           CLEAR(ControlVenteVN);
           ControlVenteVN.SETRANGE("Document No","Source No.");
           ControlVenteVN.SETRANGE("No Chassis","Serial No.");
           ControlVenteVN.SETRANGE( "Type Control",ControlVenteVN."Type Control"::"Réception VN inter Parc");

           IF ControlVenteVN.FINDFIRST THEN
           REPEAT
               IF ControlVenteVN.Valider = TRUE THEN ERROR('la liste de contrôl déja valider');
               ControlVenteVN.Valider := TRUE;
               ControlVenteVN.MODIFY;
           UNTIL ControlVenteVN.NEXT = 0;
         END;
    end;
}

