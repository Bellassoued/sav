page 50126 "Import Commission Bancaire BSB"
{
    PageType = List;
    SourceTable = Table50071;
    SourceTableView = WHERE(Type=FILTER(Commission));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No Séquence";"No Séquence")
                {
                }
                field("No. Compte";"No. Compte")
                {
                }
                field("Date Comptabilisation";"Date Comptabilisation")
                {
                }
                field("Date Document";"Date Document")
                {
                }
                field("No. Doc. Externe";"No. Doc. Externe")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field("Mnt Débit";"Mnt Débit")
                {
                }
                field("Mnt Crédit";"Mnt Crédit")
                {
                }
                field("Transférer en Cpt.";"Transférer en Cpt.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group()
            {
                action("Transférer vers Feuille Compta.")
                {
                    Image = TransferToGeneralJournal;

                    trigger OnAction();
                    begin
                        IF CONFIRM('Voulez vous tranférer ces ligne vers la feuille comptabilité',TRUE,FALSE) THEN
                        BEGIN


                        CLEAR(ImportCommissionBancaireBSB);
                        ImportCommissionBancaireBSB.SETFILTER("Transférer en Cpt.",'%1',FALSE);
                        IF ImportCommissionBancaireBSB.FINDFIRST THEN
                        REPEAT
                          IF COPYSTR(ImportCommissionBancaireBSB."No. Compte",1,3) = '532' THEN
                            BEGIN
                              CLEAR(BankAccountPostingGroup);
                              BankAccountPostingGroup.SETRANGE(BankAccountPostingGroup."G/L Bank Account No.",ImportCommissionBancaireBSB."No. Compte");
                              IF BankAccountPostingGroup.FINDFIRST THEN
                                BEGIN
                                   CLEAR(BankAccount);
                                   BankAccount.SETRANGE(BankAccount."Bank Acc. Posting Group",BankAccountPostingGroup.Code);
                                   BankAccount.FIND('-');
                                      JournalBanque := BankAccount."Source Code";
                                END
                            END
                        UNTIL ImportCommissionBancaireBSB.NEXT = 0;



                        CLEAR(ImportCommissionBancaireBSB);
                        ImportCommissionBancaireBSB.SETFILTER("Transférer en Cpt.",'%1',FALSE);
                        IF ImportCommissionBancaireBSB.FINDFIRST THEN
                        REPEAT
                            CLEAR(GenJournalLine);
                            GenJournalLine."Journal Template Name"   := 'OD-ACH-MO';
                            GenJournalLine."Journal Batch Name" := 'COMMISSION';
                            GenJournalLine."Line No." := ImportCommissionBancaireBSB."No Séquence";
                            IF COPYSTR(ImportCommissionBancaireBSB."No. Compte",1,3) = '532' THEN
                            BEGIN
                              CLEAR(BankAccountPostingGroup);
                              BankAccountPostingGroup.SETRANGE(BankAccountPostingGroup."G/L Bank Account No.",ImportCommissionBancaireBSB."No. Compte");
                              IF BankAccountPostingGroup.FINDFIRST THEN
                                BEGIN
                                   CLEAR(BankAccount);
                                   BankAccount.SETRANGE(BankAccount."Bank Acc. Posting Group",BankAccountPostingGroup.Code);
                                   BankAccount.FIND('-');
                                    BEGIN
                                      GenJournalLine.VALIDATE(GenJournalLine."Account Type",GenJournalLine."Account Type"::"Bank Account");
                                      GenJournalLine.VALIDATE("Account No.",BankAccount."No.");
                                      JournalBanque := BankAccount."Source Code";
                                    END;
                                END
                                ELSE
                                BEGIN
                                  GenJournalLine.VALIDATE(GenJournalLine."Account Type",GenJournalLine."Account Type"::"G/L Account");
                                  GenJournalLine.VALIDATE("Account No.",ImportCommissionBancaireBSB."No. Compte");
                                END;
                             END
                             ELSE
                             BEGIN
                               GenJournalLine.VALIDATE(GenJournalLine."Account Type",GenJournalLine."Account Type"::"G/L Account");
                               GenJournalLine.VALIDATE("Account No.",ImportCommissionBancaireBSB."No. Compte");
                             END;


                            GenJournalLine."Posting Date" := ImportCommissionBancaireBSB."Date Comptabilisation" ;
                            GenJournalLine."Document Date" := ImportCommissionBancaireBSB."Date Document" ;

                            GenJournalLine."Document No." :=  ImportCommissionBancaireBSB."No. Doc. Externe" ;
                            GenJournalLine.Description :=  ImportCommissionBancaireBSB.Désignation;

                            IF ImportCommissionBancaireBSB."Mnt Débit" <> 0  THEN
                            GenJournalLine.VALIDATE("Debit Amount",ImportCommissionBancaireBSB."Mnt Débit");

                            IF ImportCommissionBancaireBSB."Mnt Crédit" <> 0  THEN
                            GenJournalLine.VALIDATE("Credit Amount",ImportCommissionBancaireBSB."Mnt Crédit");

                            GenJournalLine.VALIDATE("Source Code",BankAccount."Source Code");

                            GenJournalLine."External Document No." := ImportCommissionBancaireBSB."No. Doc. Externe";
                            GenJournalLine."Commentaire démarrage" := GenJournalLine."Document No."+' ' + FORMAT(WORKDATE);
                            GenJournalLine.INSERT;
                            ImportCommissionBancaireBSB."Transférer en Cpt." := TRUE;
                            ImportCommissionBancaireBSB.MODIFY;
                        UNTIL ImportCommissionBancaireBSB.NEXT = 0;


                        MESSAGE('les lignes ont étés transférer vers la feuille compta.');
                        END;

                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        Type := Type::Commission;
    end;

    trigger OnOpenPage();
    begin
        IF (USERID <> 'BSB\MOEZ_BOUATAY') AND (USERID <> 'BSB\ADMINISTRATEUR')
           AND (USERID <> 'BSB\SBS_SLIM')


          THEN ERROR('droit insuffisant');
    end;

    var
        ImportCommissionBancaireBSB : Record "50071";
        GenJournalLine : Record "81";
        BankAccountPostingGroup : Record "277";
        BankAccount : Record "270";
        JournalBanque : Code[30];
}

