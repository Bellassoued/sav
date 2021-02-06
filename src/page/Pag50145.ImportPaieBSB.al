page 50145 "Import Paie BSB"
{
    PageType = List;
    SourceTable = Table50071;
    SourceTableView = WHERE(Type=FILTER(Paie));

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
                field(Désignation;Désignation)
                {
                }
                field("Mnt Débit";"Mnt Débit")
                {
                }
                field("Mnt Crédit";"Mnt Crédit")
                {
                }
                field("No Salarié";"No Salarié")
                {
                }
                field("Code département";"Code département")
                {
                }
                field(Site;Site)
                {
                }
                field("Code Journal";"Code Journal")
                {
                }
                field("No. Doc. Externe";"No. Doc. Externe")
                {
                }
                field(Type;Type)
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
                    var
                        GeneralLedgerSetup : Record "98";
                    begin
                        GeneralLedgerSetup.GET;
                        IF CONFIRM('Voulez vous tranférer Les lignes Paie vers la feuille comptabilité',TRUE,FALSE) THEN
                        BEGIN
                        CLEAR(ImportCommissionBancaireBSB);
                        ImportCommissionBancaireBSB.SETFILTER("Transférer en Cpt.",'%1',FALSE);
                        ImportCommissionBancaireBSB.SETFILTER(ImportCommissionBancaireBSB.Type,'%1',ImportCommissionBancaireBSB.Type::Paie);
                        IF ImportCommissionBancaireBSB.FINDFIRST THEN
                          REPEAT
                              CLEAR(GenJournalLine);
                              GenJournalLine."Journal Template Name"   := GeneralLedgerSetup."Journal Template Name Paie";
                              GenJournalLine."Journal Batch Name" := GeneralLedgerSetup."Journal Batch Name Paie";
                              GenJournalLine."Line No." := ImportCommissionBancaireBSB."No Séquence";
                              GenJournalLine.VALIDATE(GenJournalLine."Account Type",GenJournalLine."Account Type"::"G/L Account");
                              GenJournalLine.VALIDATE("Account No.",ImportCommissionBancaireBSB."No. Compte");
                              GenJournalLine."Posting Date" := ImportCommissionBancaireBSB."Date Comptabilisation" ;
                              GenJournalLine."Document Date" := ImportCommissionBancaireBSB."Date Document" ;
                              GenJournalLine."Document No." :=  ImportCommissionBancaireBSB."No. Doc. Externe" ;
                              GenJournalLine.Description :=  ImportCommissionBancaireBSB.Désignation;
                              //GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code",ImportCommissionBancaireBSB."Code département");

                              GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code",ImportCommissionBancaireBSB.Site);
                              IF ImportCommissionBancaireBSB."Mnt Débit" <> 0  THEN
                                GenJournalLine.VALIDATE("Debit Amount",ImportCommissionBancaireBSB."Mnt Débit");
                              IF ImportCommissionBancaireBSB."Mnt Crédit" <> 0  THEN
                                GenJournalLine.VALIDATE("Credit Amount",ImportCommissionBancaireBSB."Mnt Crédit");

                              GenJournalLine.VALIDATE("Source Code",ImportCommissionBancaireBSB."Code Journal");
                              GenJournalLine."External Document No." := ImportCommissionBancaireBSB."No. Doc. Externe";
                              GenJournalLine."Commentaire démarrage" := GenJournalLine."Document No."+' ' + FORMAT(WORKDATE);
                              IF ImportCommissionBancaireBSB."No Salarié" <> '' THEN
                              BEGIN
                                 GenJournalLine."Source Type" := GenJournalLine."Source Type"::Employee;
                                 GenJournalLine."Source No." := ImportCommissionBancaireBSB."No Salarié";

                              END;
                              GenJournalLine."Code Activité" := ImportCommissionBancaireBSB."Code département";
                              GenJournalLine.INSERT;

                              ImportCommissionBancaireBSB."Transférer en Cpt." := TRUE;
                              ImportCommissionBancaireBSB.MODIFY;

                          UNTIL ImportCommissionBancaireBSB.NEXT = 0
                        ELSE
                          ERROR('Tous les lignes ont été transféré !');


                        MESSAGE('les lignes ont étés transférer vers la feuille compta.');
                        END;

                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        Type := Type::Paie;
    end;

    trigger OnOpenPage();
    begin
        IF (USERID <> 'BSB\MOEZ_BOUATAY') AND
           (USERID <> 'BSB\ADMINISTRATEUR') AND
           (USERID <> 'BSB\SBS_SLIM')  THEN

         ERROR('Droit insuffisant');
    end;

    var
        ImportCommissionBancaireBSB : Record "50071";
        GenJournalLine : Record "81";
        BankAccountPostingGroup : Record "277";
        BankAccount : Record "270";
        JournalBanque : Code[30];
}

