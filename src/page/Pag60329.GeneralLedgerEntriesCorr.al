page 60329 "General Ledger EntriesCorr"
{
    // version CORRECTION

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='General Ledger Entries',
                FRA='Écritures comptables';
    DataCaptionExpression = GetCaption;
    PageType = List;
    Permissions = TableData 17=rimd;
    SourceTable = Table17;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Entry No.";"Entry No.")
                {
                }
                field("G/L Account No.";"G/L Account No.")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Bal. Account No.";"Bal. Account No.")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field("System-Created Entry";"System-Created Entry")
                {
                }
                field("Prior-Year Entry";"Prior-Year Entry")
                {
                }
                field("Job No.";"Job No.")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("VAT Amount";"VAT Amount")
                {
                }
                field("Business Unit Code";"Business Unit Code")
                {
                }
                field("Journal Batch Name";"Journal Batch Name")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Gen. Posting Type";"Gen. Posting Type")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Bal. Account Type";"Bal. Account Type")
                {
                }
                field("Transaction No.";"Transaction No.")
                {
                }
                field("Debit Amount";"Debit Amount")
                {
                }
                field("Credit Amount";"Credit Amount")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field("No. Series";"No. Series")
                {
                }
                field("Tax Area Code";"Tax Area Code")
                {
                }
                field("Tax Liable";"Tax Liable")
                {
                }
                field("Tax Group Code";"Tax Group Code")
                {
                }
                field("Use Tax";"Use Tax")
                {
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
                field("Additional-Currency Amount";"Additional-Currency Amount")
                {
                }
                field("Add.-Currency Debit Amount";"Add.-Currency Debit Amount")
                {
                }
                field("Add.-Currency Credit Amount";"Add.-Currency Credit Amount")
                {
                }
                field("Close Income Statement Dim. ID";"Close Income Statement Dim. ID")
                {
                }
                field("IC Partner Code";"IC Partner Code")
                {
                }
                field(Reversed;Reversed)
                {
                }
                field("Reversed by Entry No.";"Reversed by Entry No.")
                {
                }
                field("Reversed Entry No.";"Reversed Entry No.")
                {
                }
                field("G/L Account Name";"G/L Account Name")
                {
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Prod. Order No.";"Prod. Order No.")
                {
                }
                field("FA Entry Type";"FA Entry Type")
                {
                }
                field("FA Entry No.";"FA Entry No.")
                {
                }
                field("Account Id";"Account Id")
                {
                }
                field("Last Modified DateTime";"Last Modified DateTime")
                {
                }
                field("Entry Type";"Entry Type")
                {
                }
                field("Applies-to ID";"Applies-to ID")
                {
                }
                field(Letter;Letter)
                {
                }
                field("Letter Date";"Letter Date")
                {
                }
                field("N° budget d'investissement";"N° budget d'investissement")
                {
                }
                field("Currency Code Ledger Entrie";"Currency Code Ledger Entrie")
                {
                }
                field("Exchange Rate Ledger Entrie";"Exchange Rate Ledger Entrie")
                {
                }
                field("N° Bordereau";"N° Bordereau")
                {
                }
                field("Payement method code";"Payement method code")
                {
                }
                field("Payment type";"Payment type")
                {
                }
                field("N° Dossier";"N° Dossier")
                {
                }
                field("N° Prestation";"N° Prestation")
                {
                }
                field("Fodec Amount";"Fodec Amount")
                {
                }
                field("commentaire reglement";"commentaire reglement")
                {
                }
                field("Coffre Origine";"Coffre Origine")
                {
                }
                field("Vendor Order No.";"Vendor Order No.")
                {
                }
                field("Payment Due Date";"Payment Due Date")
                {
                }
                field("ID DM Set";"ID DM Set")
                {
                }
                field("No. lettre de ccrédit";"No. lettre de ccrédit")
                {
                }
                field(Commentaire;Commentaire)
                {
                }
                field("No dossier VN";"No dossier VN")
                {
                }
                field("Code Activité";"Code Activité")
                {
                }
                field("Code Etablissement";"Code Etablissement")
                {
                }
                field("Code utilisateur (Ouv)";"Code utilisateur (Ouv)")
                {
                }
                field("V.I.N";"V.I.N")
                {
                }
                field("Code marque (Ouv)";"Code marque (Ouv)")
                {
                }
                field("No dossier VIN";"No dossier VIN")
                {
                }
                field("Montant Initial (Ouv)";"Montant Initial (Ouv)")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("No. Compte Générale";"No. Compte Générale")
                {
                }
                field("Nom Origine No.";"Nom Origine No.")
                {
                }
                field("Dossier d'import PR";"Dossier d'import PR")
                {
                }
                field("Dossier d'import VN";"Dossier d'import VN")
                {
                }
                field("Objet Réglemen";"Objet Réglemen")
                {
                }
                field("Ancien Numéro Ecr.";"Ancien Numéro Ecr.")
                {
                }
                field("Ancien code journal";"Ancien code journal")
                {
                }
                field("Ancien Numéro de compte";"Ancien Numéro de compte")
                {
                }
                field("Ancien Lib. compte";"Ancien Lib. compte")
                {
                }
                field("Ancien Code tiers";"Ancien Code tiers")
                {
                }
                field("Ancien Seq. Ecr. Rapproché";"Ancien Seq. Ecr. Rapproché")
                {
                }
                field("Ancien Seq. Ecr. Lettrage";"Ancien Seq. Ecr. Lettrage")
                {
                }
                field("Ancien Numéro Sequence";"Ancien Numéro Sequence")
                {
                }
                field("Ancien Numéro Pièce.";"Ancien Numéro Pièce.")
                {
                }
                field("Tot amont lettrage";"Tot amont lettrage")
                {
                }
                field(Open;Open)
                {
                }
                field("Remaining Amount";"Remaining Amount")
                {
                }
                field("Closed by Entry No.";"Closed by Entry No.")
                {
                }
                field("Closed at Date";"Closed at Date")
                {
                }
                field("Closed by Amount";"Closed by Amount")
                {
                }
                field("Centre de gestion 2";"Centre de gestion 2")
                {
                }
                field("Ancien compte comptable";"Ancien compte comptable")
                {
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
            }
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
            group("Ent&ry")
            {
                CaptionML = ENU='Ent&ry',
                            FRA='É&criture';
                Image = Entry;
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                        CurrPage.SAVERECORD;
                    end;
                }
                action(GLDimensionOverview)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='G/L Dimension Overview',
                                FRA='Aperçu comptabilité par axe';
                    Image = Dimensions;

                    trigger OnAction();
                    begin
                        PAGE.RUN(PAGE::"G/L Entries Dimension Overview",Rec);
                    end;
                }
                action("Value Entries")
                {
                    AccessByPermission = TableData 27=R;
                    CaptionML = ENU='Value Entries',
                                FRA='Écritures valeur';
                    Image = ValueLedger;
                    Scope = Repeater;

                    trigger OnAction();
                    begin
                        ShowValueEntries;
                    end;
                }
                action("Ecriture Analytique")
                {
                    Image = DimensionSets;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //SM DM
                        ShowDMDimensionsEntries;
                        //CurrPage.SAVERECORD;
                        //END SM
                    end;
                }
                action("DM Dimension Ensemble de dimension Enregistré")
                {
                    Caption = 'DM Dimension Ensemble de dimension Enregistré';
                    Image = DataEntry;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //SM DM
                        ShowDMDimensions;
                        //CurrPage.SAVERECORD;
                        //END SM
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(ReverseTransaction)
                {
                    CaptionML = ENU='Reverse Transaction',
                                FRA='Transaction contre-passée';
                    Ellipsis = true;
                    Image = ReverseRegister;
                    Scope = Repeater;

                    trigger OnAction();
                    var
                        ReversalEntry : Record "179";
                    begin
                        CLEAR(ReversalEntry);
                        IF Reversed THEN
                          ReversalEntry.AlreadyReversedEntry(TABLECAPTION,"Entry No.");
                        IF "Journal Batch Name" = '' THEN
                          ReversalEntry.TestFieldError;
                        IF "Entry Type" = "Entry Type"::Simulation THEN
                          FIELDERROR("Entry Type");
                        TESTFIELD("Transaction No.");
                        ReversalEntry.ReverseTransaction("Transaction No.")
                    end;
                }
                group(IncomingDocument)
                {
                    CaptionML = ENU='Incoming Document',
                                FRA='Document entrant';
                    Image = Documents;
                    action(IncomingDocCard)
                    {
                        CaptionML = ENU='View Incoming Document',
                                    FRA='Afficher le document entrant';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;
                        ToolTipML = ;

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            IncomingDocument.ShowCard("Document No.","Posting Date");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData 130=R;
                        CaptionML = ENU='Select Incoming Document',
                                    FRA='Sélectionner le document entrant';
                        Enabled = NOT HasIncomingDocument;
                        Image = SelectLineToApply;
                        ToolTipML = ;

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            IncomingDocument.SelectIncomingDocumentForPostedDocument("Document No.","Posting Date",RECORDID);
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        CaptionML = ENU='Create Incoming Document from File',
                                    FRA='Créer un document entrant à partir d''un fichier';
                        Ellipsis = true;
                        Enabled = NOT HasIncomingDocument;
                        Image = Attach;
                        ToolTipML = ;

                        trigger OnAction();
                        var
                            IncomingDocumentAttachment : Record "133";
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromPostedDocument("Document No.","Posting Date");
                        end;
                    }
                }
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    Navigate : Page "344";
                begin
                    Navigate.SetDoc("Posting Date","Document No.");
                    Navigate.RUN;
                end;
            }
            action(DocsWithoutIC)
            {
                CaptionML = ENU='Posted Documents without Incoming Document',
                            FRA='Documents validés sans document entrant';
                Image = Documents;

                trigger OnAction();
                var
                    PostedDocsWithNoIncBuf : Record "134";
                begin
                    COPYFILTER("G/L Account No.",PostedDocsWithNoIncBuf."G/L Account No. Filter");
                    PAGE.RUN(PAGE::"Posted Docs. With No Inc. Doc.",PostedDocsWithNoIncBuf);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        IncomingDocument : Record "130";
    begin
        HasIncomingDocument := IncomingDocument.PostedDocExists("Document No.","Posting Date");
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        /*
         //<<CT16V001 ZM 15/05/2016
         RecSourceCode.GET("Source Code");
         RecUserSetup.GET(USERID);
         HideValueSourceCode := (NOT RecUserSetup."Autoriser Visibilité Journal") AND RecSourceCode."Non Visible";
         //>>CT16V001 ZM 15/05/2016
         */

    end;

    trigger OnAfterGetRecord();
    begin
        /*
         //<<CT16V001 ZM 15/05/2016
         RecSourceCode.GET("Source Code");
         RecUserSetup.GET(USERID);
         HideValueSourceCode := (NOT RecUserSetup."Autoriser Visibilité Journal") AND RecSourceCode."Non Visible";
         //>>CT16V001 ZM 15/05/2016
         */

    end;

    trigger OnModifyRecord() : Boolean;
    begin
        //KT 271017 Exception pour modification codes journaux erronnés. Tmp
    end;

    var
        GLAcc : Record "15";
        HasIncomingDocument : Boolean;
        RecSourceCode : Record "230";
        HideValueSourceCode : Boolean;
        RecUserSetup : Record "91";

    local procedure GetCaption() : Text[250];
    begin
        IF GLAcc."No." <> "G/L Account No." THEN
          IF NOT GLAcc.GET("G/L Account No.") THEN
            IF GETFILTER("G/L Account No.") <> '' THEN
              IF GLAcc.GET(GETRANGEMIN("G/L Account No.")) THEN;
        EXIT(STRSUBSTNO('%1 %2',GLAcc."No.",GLAcc.Name))
    end;
}

