page 60125 "Fiche Recoup proformat achat"
{
    AutoSplitKey = true;
    Editable = true;
    PageType = Card;
    SourceTable = Table60020;
    SourceTableTemporary = false;
    SourceTableView = WHERE(Vider=CONST(No));

    layout
    {
        area(content)
        {
            group()
            {
                field(NumDocument;NumDocument)
                {
                    Caption = 'Commande Achat N°';
                    TableRelation = "Purchase Header".No. WHERE (Document Type=CONST(Order));

                    trigger OnValidate();
                    begin

                        //1 - Récuperer les lignes commande achat.  les inserrer dans la nvelle table
                        GetPurchaseLine(NumDocument);
                        //2 - import fichier CSV
                        //ImportFile();
                    end;
                }
            }
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field("Line No.";"Line No.")
                {
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field(Type;Type)
                {
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field("No.";"No.")
                {
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field(Quantity;Quantity)
                {
                    CaptionML = ENU='Quantity',
                                FRA='Quantités commande';
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field("quantité proforma";"quantité proforma")
                {
                    Caption = 'Quantités proformat';
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                    CaptionML = ENU='Direct Unit Cost',
                                FRA='Prix commande';
                    StyleExpr = TextStyle;
                }
                field("Prix Proforma";"Prix Proforma")
                {
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field("existe proforma";"existe proforma")
                {
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field("Modifier Qte";"Modifier Qte")
                {
                }
                field("Modifier Prix";"Modifier Prix")
                {

                    trigger OnControlAddIn(Index : Integer; Data : Text);
                    begin
                        CLEAR(RecRecoupprofachat);
                        REPORT.RUN(REPORT::"Inventaire physique",TRUE,TRUE,RecRecoupprofachat);
                    end;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            Caption = 'Import';
            action("Import Ficher")
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                     ImportFile();
                end;
            }
            action("Imprimer Rapport")
            {
                Image = PrintAcknowledgement;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction();
                begin
                      CLEAR(RecRecoupprofachat);
                      REPORT.RUNMODAL(REPORT::"Recoupement proformat achat",TRUE,FALSE,RecRecoupprofachat);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        TextStyle :=SetStyle();
    end;

    trigger OnClosePage();
    begin
        CLEAR(RecRecoupprofachat);
        RecRecoupprofachat.DELETEALL;
    end;

    var
        NumDocument : Code[20];
        TextStyle : Text;
        RecRecoupprofachat : Record "60020";

    procedure GetPurchaseLine(DocNo : Code[20]);
    var
        RecPurchaseLine : Record "39";
        NewRecoupProformatachat : Record "60020";
    begin
         CLEAR(RecPurchaseLine);
         RecPurchaseLine.SETRANGE("Document No.", NumDocument);
         IF RecPurchaseLine.FINDFIRST THEN
         REPEAT
               CLEAR(NewRecoupProformatachat);
               NewRecoupProformatachat.TRANSFERFIELDS(RecPurchaseLine);
               NewRecoupProformatachat."exist in cmd" := TRUE;
               NewRecoupProformatachat.INSERT;
         UNTIL RecPurchaseLine.NEXT = 0
         ELSE ERROR('Commande d''achat n''existe pas');
    end;

    procedure ImportFile();
    var
        XmlImport : XMLport "50005";
    begin
        XmlImport.SetDocNo(NumDocument);
        XmlImport.RUN;
    end;

    procedure SetStyle() : Text;
    begin
        IF "Modifier Qte" = TRUE THEN EXIT('Unfavorable');
        IF "Modifier Prix" = TRUE THEN EXIT ('Ambiguous');
        IF ("Modifier Qte" = TRUE ) AND ("Modifier Prix" = TRUE) THEN EXIT('Attention');
    end;
}

