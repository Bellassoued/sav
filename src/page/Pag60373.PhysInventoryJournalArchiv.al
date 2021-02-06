page 60373 "Phys. Inventory Journal Archiv"
{
    // version NAVW19.00,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Phys. Inventory Journal',
                FRA='Feuille inventaire';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = Table60090;

    layout
    {
        area(content)
        {
            group()
            {
                field(CurrentJnlBatchName;CurrentJnlBatchName)
                {
                    CaptionML = ENU='Batch Name',
                                FRA='Nom de la feuille';
                    Lookup = true;
                }
                field("No. Document";CdeNodocument)
                {
                    Editable = false;
                }
                field("Désignation Magasin";"Désignation Magasin")
                {
                    Editable = false;
                }
            }
            group()
            {
                field("Date Création";"Date Création")
                {
                    Editable = false;
                }
                field("<Crée par>";"Créer par")
                {
                    Caption = 'Crée par';
                    Editable = false;
                }
                field("Date de Clôture";"Date de Clôture")
                {
                    Editable = false;
                }
                field("Clôturé par";"Clôturé par")
                {
                    Editable = false;
                }
            }
            group()
            {
                field(Phase;Phase)
                {
                    Editable = false;
                }
                field("<Description Inventaire>";"Déscription Inventaire")
                {
                    Caption = 'Description Inventaire';
                    Editable = false;
                }
            }
            repeater()
            {
                Editable = false;
                field("Compteur Ligne";"Compteur Ligne")
                {
                    Caption = 'No Ligne';
                }
                field("Posting Date";"Posting Date")
                {
                    Visible = false;
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Entry Type";"Entry Type")
                {
                    OptionCaptionML = ENU='Purchase,Sale,Positive Adjmt.,Negative Adjmt.',
                                      FRA='Achat,Vente,Positif (ajust.),Négatif (ajust.)';
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    Visible = false;
                }
                field("Niveau Casier INV";"Niveau Casier INV")
                {
                    Caption = 'Niveau Casier';
                }
                field("Bin Code";"Bin Code")
                {
                    CaptionML = ENU='Bin Code',
                                FRA='Casier';
                }
                field("Code Famille";"Code Famille")
                {
                }
                field("Item No.";"Item No.")
                {
                    CaptionML = ENU='Item No.',
                                FRA='Code article';

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        //ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Alternative Item No.";"Alternative Item No.")
                {
                    CaptionML = ENU='Alternative Item No.',
                                FRA='Code article remplaçant';
                }
                field("Article Avec D";"Article Avec D")
                {
                    Caption = 'Code article avec préfixe D';
                }
                field(Description;Description)
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Emplacement par defaut";"Emplacement par defaut")
                {
                    Caption = 'Casier défaut';
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    Visible = false;

                    trigger OnValidate();
                    var
                        WMSManagement : Codeunit "7302";
                    begin
                        //WMSManagement.CheckItemJnlLineLocation(Rec,xRec);
                    end;
                }
                field("Par Defaut INV";"Par Defaut INV")
                {
                    CaptionML = ENU='I1 Indicateur casier par défaut',
                                FRA='I 1 Indicateur casier par défaut';
                    Editable = false;
                }
                field("Code Index";"Code Index")
                {
                    Visible = false;
                }
                field("Code Segment";"Code Segment")
                {
                    Visible = false;
                }
                field("S0 Sotck Consolidé par casier";"S0 Sotck Consolidé par casier")
                {
                }
                field("Count 1";"Count 1")
                {
                    Caption = 'C 1';
                }
                field("Count 2";"Count 2")
                {
                    Caption = 'C 2';
                }
                field("Count 3";"Count 3")
                {
                    Caption = 'C 3';
                }
                field("S Stock Consolidé par Magasin";"S Stock Consolidé par Magasin")
                {
                }
                field("Stock Auto";"Stock Auto")
                {
                }
                field("Q1 Total Qté Lue Cpt 1";"Q1 Total Qté Lue Cpt 1")
                {
                }
                field("E1 Ind Ecart Cpt1";"E1 Ind Ecart Cpt1")
                {
                    Editable = false;
                }
                field("Q2 Total Qté Lue Cpt 2";"Q2 Total Qté Lue Cpt 2")
                {
                }
                field("E2 Ind Ecart Cpt2";"E2 Ind Ecart Cpt2")
                {
                    Editable = false;
                }
                field("Q3 Total Qté Lue Cpt 3";"Q3 Total Qté Lue Cpt 3")
                {
                }
                field("User 1";"User 1")
                {
                }
                field("Date 1";"Date 1")
                {
                }
                field("user 2";"user 2")
                {
                }
                field("Date 2";"Date 2")
                {
                }
                field("user 3";"user 3")
                {
                }
                field("Date 3";"Date 3")
                {
                }
                field("Journal Template Name";"Journal Template Name")
                {
                    Visible = false;
                }
                field("Journal Batch Name";"Journal Batch Name")
                {
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    Visible = false;
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Qty. (Calculated)";"Qty. (Calculated)")
                {
                    Visible = false;
                }
                field("Qty. (Phys. Inventory)";"Qty. (Phys. Inventory)")
                {
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Visible = false;
                }
                field("Unit Amount";"Unit Amount")
                {
                    Description = 'alse';
                    Visible = false;
                }
                field(Amount;Amount)
                {
                    Visible = false;
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                    Visible = false;
                }
                field("Applies-to Entry";"Applies-to Entry")
                {
                    Visible = false;
                }
                field("Reason Code";"Reason Code")
                {
                    Visible = false;
                }
                field("CPT1 Posted";"CPT1 Posted")
                {
                    Visible = false;
                }
                field("CPT2 Posted";"CPT2 Posted")
                {
                    Visible = false;
                }
                field("CPT3 Posted";"CPT3 Posted")
                {
                    Visible = false;
                }
                field("Ecart CPT1 / CPT2";"Ecart CPT1 / CPT2")
                {
                    Visible = false;
                }
                field("Ecart CPT3 / Calc";"Ecart CPT3 / Calc")
                {
                    Visible = false;
                }
                field("Phys. Inventory To Post";"Phys. Inventory To Post")
                {
                    Visible = false;
                }
            }
            group()
            {
                fixed()
                {
                    group("Item Description")
                    {
                        CaptionML = ENU='Item Description',
                                    FRA='Désignation article';
                        field(ItemDescription;ItemDescription)
                        {
                            Editable = false;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ItemJnlMgt.GetItem("Item No.",ItemDescription);

        CdeNodocument := "Document No.";
        IF RecLocation.GET(CurrentJnlBatchName) THEN
           "Désignation Magasin" := RecLocation.Name;
    end;

    trigger OnAfterGetRecord();
    begin
        //ShowShortcutDimCode(ShortcutDimCode);
        CdeNodocument := "Document No.";

        IF RecLocation.GET(CurrentJnlBatchName) THEN
           "Désignation Magasin" := RecLocation.Name;
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveItemJnlLine : Codeunit "99000835";
        ItemJournalLineCAB : Record "83";
    begin

          ERROR('Vous ne pouvez supprimer l inventaire avec des lignes lues');
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        //SetUpNewLine(xRec);
        //CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage();
    var
        JnlSelected : Boolean;
    begin
        /*IF IsOpenedFromBatch THEN BEGIN
          CurrentJnlBatchName := "Journal Batch Name";
          CdeNodocument := "Document No.";
          ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
          EXIT;
        END;
        ItemJnlMgt.TemplateSelection(PAGE::"Phys. Inventory Journal",2,FALSE,Rec,JnlSelected);
        IF NOT JnlSelected THEN
          ERROR('');
        ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
        
        //<<CT16V001 ZM 15/05/2016
        RecUserSetup.GET(USERID);
        IF RecUserSetup."Mag Reservation/Defaut" <> '' THEN BEGIN
          CurrentJnlBatchName := RecUserSetup."Mag Reservation/Defaut";
          CdeNodocument := "Document No.";
          FILTERGROUP := 2;
          SETRANGE("Journal Batch Name",RecUserSetup."Mag Reservation/Defaut");
          FILTERGROUP := 0;
        END ELSE BEGIN
          CurrentJnlBatchName := RecUserSetup."Mag Reservation/Defaut";
          CdeNodocument := "Document No.";
          FILTERGROUP := 2;
          SETRANGE("Journal Batch Name",'DEFAULT');
          FILTERGROUP := 0;
        END;
        //>>CT16V001 ZM 15/05/2016
        */

    end;

    var
        ItemJournalBatch : Record "233";
        CalcQtyOnHand : Report "790";
        PhysInventoryList : Report "60066";
        ItemJnlMgt : Codeunit "240";
        ReportPrint : Codeunit "228";
        ItemAvailFormsMgt : Codeunit "353";
        CurrentJnlBatchName : Code[10];
        ItemDescription : Text[50];
        ShortcutDimCode : array [8] of Code[20];
        RecUserSetup : Record "91";
        TXT50000 : Label 'Vous n''avez pas le droit de sélélectionner une autres feuilles.';
        CdeNodocument : Code[20];
        RecLocation : Record "14";
        TXT50001 : TextConst ENU='Phase              #1######\',FRA='Phase              #1######\';
        TXT50002 : TextConst ENU='Article  #2######\',FRA='Article  #2######\';
        CalcQtyOnHand2 : Report "60212";
        ExportInventaire : Report "60223";
        ItemJournalLine : Record "83";

    local procedure CurrentJnlBatchNameOnAfterVali();
    begin
        CurrPage.SAVERECORD;
        //ItemJnlMgt.SetName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
    end;
}

