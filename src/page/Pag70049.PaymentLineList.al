page 70049 "Payment Line List"
{
    // version NAVFR11.00

    //  T180001 KT 19/10/2018 : upgrade

    CaptionML = ENU='Payment Lines List',
                FRA='Liste des lignes règlement';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table10866;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                    ApplicationArea = All;
                    ToolTipML = ENU='Specifies the number of the payment.',
                                FRA='Spécifie le numéro du paiement.';
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the payment line''s entry number.',
                                FRA='Spécifie le numéro de l''écriture de la ligne de paiement.';
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies a document number for the payment line.',
                                FRA='Spécifie le numéro de document de la ligne de paiement.';
                }
                field("Currency Code";"Currency Code")
                {
                    ToolTipML = ENU='Specifies the currency code for the amount on this line.',
                                FRA='Spécifie le code devise du montant de cette ligne.';
                    Visible = false;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic,Suite;
                    DecimalPlaces = 3:5;
                    ToolTipML = ENU='Specifies the total amount (including VAT) of the payment line.',
                                FRA='Spécifie le montant total (TVA comprise) de la ligne de paiement.';
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                    ToolTipML = ENU='Specifies the total amount on the payment line in LCY.',
                                FRA='Spécifie le montant total de la ligne bordereau en DS.';
                    Visible = false;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the type of account that the payment line will be posted to.',
                                FRA='Spécifie le type de compte sur lequel la ligne bordereau sera validée.';
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the number of the account that the entry on the journal line will be posted to.',
                                FRA='Spécifie le numéro du compte sur lequel l''écriture de la ligne feuille sera validée.';
                }
                field("No. 2";"No. 2")
                {
                    Editable = false;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the due date on the entry.',
                                FRA='Spécifie la date d''échéance de l''écriture.';
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Payment Class";"Payment Class")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the payment class used when creating this payment slip line.',
                                FRA='Spécifie le type de règlement utilisé lors de la création de la ligne bordereau paiement.';
                }
                field("Status Name";"Status Name")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the status of the payment.',
                                FRA='Spécifie l''état du paiement.';
                }
                field("Status No.";"Status No.")
                {
                    ToolTipML = ENU='Specifies the status line entry number.',
                                FRA='Spécifie le numéro d''écriture de la ligne de statut.';
                    Visible = false;
                }
                field("Acceptation Code";"Acceptation Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies an acceptation code for the payment line.',
                                FRA='Spécifie un code acceptation pour la ligne bordereau.';
                }
                field(Coffre;Coffre)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Coffre Origine";"Coffre Origine")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Drawee Reference";"Drawee Reference")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the file reference which will be used in the electronic payment (ETEBAC) file.',
                                FRA='Spécifie la référence du fichier qui sera utilisé dans le fichier de paiement électronique (ETEBAC).';
                }
                field("Bank Account Name";"Bank Account Name")
                {
                    ToolTipML = ENU='Specifies the name of the bank account as entered in the Bank Account Code field.',
                                FRA='Spécifie le nom du compte bancaire entré dans le champ Code compte bancaire.';
                    Visible = false;
                }
                field("Bank Branch No.";"Bank Branch No.")
                {
                    ToolTipML = ENU='Specifies the branch number of the bank account.',
                                FRA='Spécifie le numéro de l''établissement du compte bancaire.';
                    Visible = false;
                }
                field("Agency Code";"Agency Code")
                {
                    ToolTipML = ENU='Specifies the agency code of the bank account.',
                                FRA='Spécifie le code agence du compte bancaire.';
                    Visible = false;
                }
                field(IBAN;IBAN)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the international bank account number (IBAN) for the payment slip.',
                                FRA='Spécifie le numéro du compte bancaire international (IBAN) du bordereau de paiement.';
                }
                field("SWIFT Code";"SWIFT Code")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the international bank identification code for the payment slip.',
                                FRA='Spécifie le code international d''identification bancaire du bordereau de paiement.';
                }
                field("Bank Account No.";"Bank Account No.")
                {
                    ToolTipML = ENU='Specifies the number of the customer or vendor bank account that you want to perform the payment to, or collection from.',
                                FRA='Spécifie le numéro du compte bancaire du client ou du fournisseur sur lequel effectuer le versement ou le recouvrement.';
                    Visible = false;
                }
                field("RIB Key";"RIB Key")
                {
                    ToolTipML = ENU='Specifies the two digit RIB key associated with the Bank Account No.',
                                FRA='Spécifie la clé RIB à deux chiffres associée au N° compte bancaire.';
                    Visible = false;
                }
                field("Payment in Progress";"Payment in Progress")
                {
                    ToolTipML = ENU='Specifies whether the payment line is taken into account for the customer or vendor payments in progress.',
                                FRA='Spécifie si la ligne bordereau est prise en compte pour les paiements client ou fournisseur en cours.';
                    Visible = false;
                }
                field("Header Account No.";"Header Account No.")
                {
                }
                field("No. Salarié";"No. Salarié")
                {
                }
                field(Compte_Entête;Compte_Entête)
                {
                }
                field("Compte comptable";"Compte comptable")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Copied To No.";"Copied To No.")
                {
                }
                field(Type_ED;Type_ED)
                {
                }
                field(Libellé;Libellé)
                {
                }
                field(Header_status;Header_status)
                {
                }
                field("Type Règlement";"Type Règlement")
                {
                }
                field(Situation;Situation)
                {
                }
                field(Commentaires;Commentaires)
                {
                }
                field("Num Cession";"Num Cession")
                {
                }
                field("Created from No.";"Created from No.")
                {
                }
                field(Controle_Statut;Controle_Statut)
                {
                }
                field("Exporter vers siège";"Exporter vers siège")
                {
                }
                field("Importer d'un site";"Importer d'un site")
                {
                }
                field("Num Br Origine Site";"Num Br Origine Site")
                {
                }
                field("Num Line Br Site";"Num Line Br Site")
                {
                }
                field("Transfert BR/Siège No";"Transfert BR/Siège No")
                {
                }
                field("Bank Account Code";"Bank Account Code")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                CaptionML = ENU='&Payment',
                            FRA='&Règlement';
                action(Card)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';
                    ToolTipML = ENU='Open the card for the entity on the selected line to view more details.',
                                FRA='Ouvrir la fiche de l''entité sur la ligne sélectionnée pour afficher plus de détails.';

                    trigger OnAction();
                    var
                        Statement : Record "10865";
                        StatementForm : Page "10868";
                    begin
                        IF Statement.GET("No.") THEN BEGIN
                          Statement.SETRANGE("No.","No.");
                          StatementForm.SETTABLEVIEW(Statement);
                          StatementForm.RUN;
                        END;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions2")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(Modify)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Modify',
                                FRA='Modifier';
                    Image = EditFilter;
                    ToolTipML = ENU='View and edit line information for payments and collections.',
                                FRA='Afficher et modifier des informations sur les paiements et recouvrements.';

                    trigger OnAction();
                    var
                        PaymentLine : Record "10866";
                        Consult : Page "10871";
                    begin
                        PaymentLine.COPY(Rec);
                        PaymentLine.SETRANGE("No.","No.");
                        PaymentLine.SETRANGE("Line No.","Line No.");
                        Consult.SETTABLEVIEW(PaymentLine);
                        Consult.RUNMODAL;
                    end;
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF CloseAction = ACTION::LookupOK THEN
          LookupOKOnPush;
    end;

    var
        Steps : Integer;
        PayNum : Code[20];
        UserMgt : Codeunit "5700";
        UserSetup : Record "91";
        ProfilReglement : Record "70031";

    procedure SetSteps(Step : Integer);
    begin
        Steps := Step;
    end;

    procedure SetNumBor(N : Code[20]);
    begin
        PayNum := N;
    end;

    procedure GetNumBor() N : Code[20];
    begin
        N := PayNum;
    end;

    local procedure LookupOKOnPush();
    var
        StatementLine : Record "10866";
        PostingStatement : Codeunit "10860";
    begin
        CurrPage.SETSELECTIONFILTER(StatementLine);
        PostingStatement.CopyLigBor(StatementLine,Steps,PayNum);
        CurrPage.CLOSE;
    end;
}

