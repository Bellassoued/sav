page 50119 "Upd Bank Account Led Entries2"
{
    // version NAVW111.00.00.19846,NAVFR11.00.00.19846

    CaptionML = ENU='Bank Account Ledger Entries',
                FRA='Écritures comptables compte bancaire';
    DataCaptionFields = "Bank Account No.";
    PageType = List;
    Permissions = TableData 271=rimd;
    SourceTable = Table271;
    SourceTableView = SORTING(Bank Account No.,Posting Date)
                      ORDER(Descending);

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the posting date for the entry.',
                                FRA='Spécifie la date comptabilisation de l''écriture.';
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic,Suite;
                    Editable = false;
                    ToolTipML = ENU='Specifies the document type on the bank account entry. The document type will be Payment, Refund, or the field will be blank.',
                                FRA='Spécifie le type de document de l''écriture compte bancaire. Le type de document peut être Paiement ou Remboursement, ou le champ peut être vierge.';
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the document number on the bank account entry.',
                                FRA='Spécifie le numéro de document de l''écriture compte bancaire.';
                }
                field("Bank Account No.";"Bank Account No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the number of the bank account used for the entry.',
                                FRA='Spécifie le numéro du compte bancaire utilisé pour l''écriture.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the description of the bank account entry.',
                                FRA='Spécifie la description de l''écriture compte bancaire.';
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTipML = ENU='Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.',
                                FRA='Spécifie le code de l''axe analytique principal lié à l''enregistrement ou à l''écriture à des fins d''analyse. Deux axes analytiques principaux, généralement pour les activités les plus importantes de la société, sont disponibles sur l''ensemble des fiches, documents, états et listes.';
                    Visible = false;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Suite;
                    Editable = false;
                    ToolTipML = ENU='Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.',
                                FRA='Spécifie le code de l''axe analytique principal lié à l''enregistrement ou à l''écriture à des fins d''analyse. Deux axes analytiques principaux, généralement pour les activités les plus importantes de la société, sont disponibles sur l''ensemble des fiches, documents, états et listes.';
                    Visible = false;
                }
                field("Our Contact Code";"Our Contact Code")
                {
                    ApplicationArea = Advanced;
                    Editable = false;
                    ToolTipML = ENU='Specifies the code for the employee who is responsible for the bank account.',
                                FRA='Spécifie le code de l''employé responsable du compte bancaire.';
                    Visible = false;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Advanced;
                    Editable = false;
                    ToolTipML = ENU='Specifies the currency that is used on the entry.',
                                FRA='Spécifie le code devise utilisé pour l''écriture.';
                    Visible = false;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the amount of the entry denominated in the applicable foreign currency.',
                                FRA='Spécifie le montant de l''écriture dans la devise étrangère applicable.';
                    Visible = false;
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the amount of the entry in LCY.',
                                FRA='Spécifie le montant de l''écriture en DS.';
                    Visible = false;
                }
                field("Debit Amount";"Debit Amount")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the total of the ledger entries that represent debits.',
                                FRA='Spécifie le total des écritures comptables qui représentent les débits.';
                }
                field("Debit Amount (LCY)";"Debit Amount (LCY)")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the total of the ledger entries that represent debits, expressed in LCY.',
                                FRA='Spécifie le total des écritures comptables qui représentent les débits, exprimés en devise société.';
                    Visible = false;
                }
                field("Credit Amount";"Credit Amount")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the total of the ledger entries that represent credits.',
                                FRA='Spécifie le total des écritures comptables qui représentent les crédits.';
                }
                field("Credit Amount (LCY)";"Credit Amount (LCY)")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the total of the ledger entries that represent credits, expressed in LCY.',
                                FRA='Spécifie le total des écritures comptables qui représentent les crédits, exprimés en devise société.';
                    Visible = false;
                }
                field("Remaining Amount";"Remaining Amount")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the amount that remains to be applied to if the entry has not been completely applied to.',
                                FRA='Spécifie le montant qui reste à lettrer si l''écriture n''a pas été entièrement lettrée.';
                    Visible = false;
                }
                field("Bal. Account Type";"Bal. Account Type")
                {
                    ApplicationArea = Advanced;
                    Editable = false;
                    ToolTipML = ENU='Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.',
                                FRA='Spécifie le type de compte sur lequel une écriture contrepartie est validée, par exemple BANQUE pour un compte caisse.';
                    Visible = false;
                }
                field("Bal. Account No.";"Bal. Account No.")
                {
                    ApplicationArea = Advanced;
                    Editable = false;
                    ToolTipML = ENU='Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.',
                                FRA='Spécifie le numéro du compte général, client, fournisseur ou bancaire sur lequel l''écriture contrepartie est validée, par exemple, un compte caisse pour les achats.';
                    Visible = false;
                }
                field(Open;Open)
                {
                    ApplicationArea = Basic,Suite;
                    Editable = false;
                    ToolTipML = ENU='Specifies whether the amount on the bank account entry has been fully applied to or if there is still a remaining amount that must be applied to.',
                                FRA='Indique si le montant de l''écriture compte bancaire a été totalement lettré ou s''il y a encore un montant ouvert qui doit être lettré.';
                }
                field("User ID";"User ID")
                {
                    ApplicationArea = Advanced;
                    Editable = false;
                    ToolTipML = ENU='Specifies the ID of the user who posted the entry, to be used, for example, in the change log.',
                                FRA='Spécifie l''ID de l''utilisateur qui a validé l''écriture à utiliser, par exemple, dans le journal modification.';
                    Visible = false;
                }
                field("Source Code";"Source Code")
                {
                    ApplicationArea = Advanced;
                    Editable = false;
                    ToolTipML = ENU='Specifies the source code that specifies where the entry was created.',
                                FRA='Spécifie le code journal qui spécifie où l''écriture a été créée.';
                    Visible = false;
                }
                field("Reason Code";"Reason Code")
                {
                    ApplicationArea = Advanced;
                    Editable = false;
                    ToolTipML = ENU='Specifies the reason code, a supplementary source code that enables you to trace the entry.',
                                FRA='Spécifie le code motif qui est un code journal supplémentaire vous permettant de suivre l''écriture.';
                    Visible = false;
                }
                field(Reversed;Reversed)
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies if the entry has been part of a reverse transaction.',
                                FRA='Spécifie si l''écriture a fait partie d''une transaction contre-passée.';
                    Visible = false;
                }
                field("Reversed by Entry No.";"Reversed by Entry No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the number of the correcting entry that replaced the original entry in the reverse transaction.',
                                FRA='Spécifie le numéro de l''écriture de correction qui a remplacé l''écriture originale dans la transaction contre-passée.';
                    Visible = false;
                }
                field("Reversed Entry No.";"Reversed Entry No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the number of the original entry that was undone by the reverse transaction.',
                                FRA='Spécifie le numéro de l''écriture initiale annulée par la transaction contre-passée.';
                    Visible = false;
                }
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the number of the entry, as assigned from the specified number series when the entry was created.',
                                FRA='Spécifie le numéro de l''écriture, tel qu''il est affecté à partir de la souche de numéros spécifiée lors de la création de l''écriture.';
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies a reference to a combination of dimension values. The actual values are stored in the Dimension Set Entry table.',
                                FRA='Spécifie une référence à une combinaison de sections analytiques. Les valeurs réelles sont enregistrées dans la table Écriture ensemble de dimensions.';
                    Visible = false;
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
            group("Ent&ry")
            {
                CaptionML = ENU='Ent&ry',
                            FRA='É&criture';
                Image = Entry;
                action("Check Ledger E&ntries")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Check Ledger E&ntries',
                                FRA='Écritures comptables c&hèque';
                    Image = CheckLedger;
                    RunObject = Page 374;
                    RunPageLink = Bank Account Ledger Entry No.=FIELD(Entry No.);
                    RunPageView = SORTING(Bank Account Ledger Entry No.);
                    ShortCutKey = 'Shift+F7';
                    ToolTipML = ENU='View check ledger entries that result from posting transactions in a payment journal for the relevant bank account.',
                                FRA='Affichez des écritures comptables chèque qui proviennent de la validation de transactions dans une feuille paiement pour le compte bancaire approprié.';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTipML = ENU='View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.',
                                FRA='Afficher ou modifier les axes analytiques, tels que la zone, le projet ou le département que vous pouvez affecter aux documents vente et achat afin de distribuer les coûts et analyser l''historique des transactions.';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action(SetDimensionFilter)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Set Dimension Filter',
                                FRA='Définir le filtre axe';
                    Ellipsis = true;
                    Image = "Filter";
                    ToolTipML = ENU='Limit the entries according to dimension filters that you specify.',
                                FRA='Limiter les écritures en fonction des filtres axe que vous spécifiez.';

                    trigger OnAction();
                    begin
                        SETFILTER("Dimension Set ID",DimensionSetIDFilter.LookupFilter);
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
                action("Reverse Transaction")
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Reverse Transaction',
                                FRA='Transaction contre-passée';
                    Ellipsis = true;
                    Image = ReverseRegister;
                    ToolTipML = ENU='Undo an erroneous journal posting.',
                                FRA='Annulez une validation feuille erronée.';

                    trigger OnAction();
                    var
                        ReversalEntry : Record "179";
                    begin
                        CLEAR(ReversalEntry);
                        IF Reversed THEN
                          ReversalEntry.AlreadyReversedEntry(TABLECAPTION,"Entry No.");
                        IF "Journal Batch Name" = '' THEN
                          ReversalEntry.TestFieldError;
                        TESTFIELD("Transaction No.");
                        ReversalEntry.ReverseTransaction("Transaction No.");
                    end;
                }
            }
            action("&Navigate")
            {
                ApplicationArea = Basic,Suite;
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTipML = ENU='Find all entries and documents that exist for the document number and posting date on the selected entry or document.',
                            FRA='Recherchez toutes les écritures et tous les documents qui existent pour le numéro de document et la date comptabilisation sur l''écriture ou le document.';

                trigger OnAction();
                begin
                    Navigate.SetDoc("Posting Date","Document No.");
                    Navigate.RUN;
                end;
            }
        }
    }

    var
        Navigate : Page "344";
        DimensionSetIDFilter : Page "481";
}

