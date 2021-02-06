page 50111 "Import Facture ArabSoft."
{
    // Activité
    // D011 : PR
    // D021 : SAV
    // 
    // type document    --------
    // 01 facture a terme
    // 02 avoir
    // 03 factute comptant
    // 
    // 
    // site    ---------
    // 10S1  marsa
    // 01S1 charguia
    // 09Sa1 sousse akouda
    // 13S1 sousse sidi a
    // 12S1 sfax
    // 
    // 
    // "ExoTva/Oui/Non"
    // O : oui
    // N : Non
    // 
    // 
    // "Appliquer timbre"   ---------
    // O : oui
    // N : Non

    CaptionML = ENU='Import Facture ArabSoft.',
                FRA='Import Facture ArabSoft.';
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table50061;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Facture";"No. Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Type Document";"Type Document")
                {
                }
                field(Site;Site)
                {
                }
                field(Activité;Activité)
                {
                }
                field("No. client Arabsoft";"No. client Arabsoft")
                {
                }
                field("Nom client AranSoft";"Nom client AranSoft")
                {
                }
                field("Montant H.T";"Montant H.T")
                {
                }
                field("Montant remise";"Montant remise")
                {
                }
                field("Montant TVA";"Montant TVA")
                {
                }
                field("ExoTva/Oui/Non";"ExoTva/Oui/Non")
                {
                }
                field("Appliquer timbre";"Appliquer timbre")
                {
                }
                field("Transferer vers Compta.";"Transferer vers Compta.")
                {
                }
                field("Valider en comptabilité";"Valider en comptabilité")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Transférer Fct. vers Comptab.")
            {
                Caption = 'Transférer Fact. vers Comptabilité';

                trigger OnAction();
                begin
                    IF CONFIRM('ëtes vous sûres de vouloir insérer les factures en cours',TRUE,FALSE) THEN
                    BEGIN
                      Dia.OPEN('Update Line N°:  #1#######');
                        CLEAR(RecGImportFactureArabSoft);
                        RecGImportFactureArabSoft.SETFILTER("Transferer vers Compta.",'%1',FALSE);
                        RecGImportFactureArabSoft.FIND('-');
                        REPEAT
                          RecGImportFactureArabSoft.CALCFIELDS("Valider en comptabilité");
                          IF (NOT RecGImportFactureArabSoft."Transferer vers Compta.") AND (RecGImportFactureArabSoft."Valider en comptabilité") THEN
                            ERROR(Text000001,RecGImportFactureArabSoft."No. Facture");
                          Dia.UPDATE(1,RecGImportFactureArabSoft."No. Facture");
                          CLEAR(Customer);
                          Customer.SETRANGE("No. 2",RecGImportFactureArabSoft."No. client Arabsoft");
                          IF NOT Customer.FIND('-') THEN
                          CreateCustomerFromAS(RecGImportFactureArabSoft);

                          ComptabilisationTTC(RecGImportFactureArabSoft);
                          ComptabilisationHT(RecGImportFactureArabSoft);
                          IF RecGImportFactureArabSoft."Montant TVA" <> 0 THEN
                          ComptabilisationTVA(RecGImportFactureArabSoft);
                          IF RecGImportFactureArabSoft."Appliquer timbre" = 'O' THEN
                          ComptabilisationTibre(RecGImportFactureArabSoft);
                          RecGImportFactureArabSoft."Transferer vers Compta." := TRUE;
                          RecGImportFactureArabSoft.MODIFY;

                        UNTIL RecGImportFactureArabSoft.NEXT = 0;
                        Dia.CLOSE;
                    END;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF (USERID <> 'BSB\MOEZ_BOUATAY') AND (USERID <> 'BSB\ADMINISTRATEUR') THEN
          ERROR('ERROR');
    end;

    var
        RecGImportFactureArabSoft : Record "50061";
        GenJournalLine : Record "81";
        Customer1 : Record "18";
        Customer : Record "18";
        Customer2 : Record "18";
        GenJournalLine1 : Record "81";
        Dia : Dialog;
        Text000001 : Label 'Transfert impossile : factures déja importé %1';

    local procedure ComptabilisationTTC(var ImportFactureArabSoft : Record "50061");
    var
        GenJournalLine : Record "81";
        TimbreFisc : Decimal;
    begin
        CLEAR(GenJournalLine);
        GenJournalLine."Journal Template Name" := 'IMP-ARABS';
        GenJournalLine."Journal Batch Name" := 'DEFAUT';
        CLEAR(GenJournalLine1);
        GenJournalLine1.SETRANGE("Journal Template Name",'IMP-ARABS');
        GenJournalLine1.SETRANGE("Journal Batch Name",'DEFAUT');
        IF GenJournalLine1.FINDLAST THEN
        GenJournalLine."Line No." := GenJournalLine1."Line No." + 10000
        ELSE
        GenJournalLine."Line No." :=  10000;

        GenJournalLine."Account Type" := GenJournalLine."Account Type" ::Customer;
        CLEAR(Customer2);
        Customer2.SETRANGE("No. 2",ImportFactureArabSoft."No. client Arabsoft");
        Customer2.FIND('-');
        GenJournalLine.VALIDATE("Account No.",Customer2."No.");

        InitInsert(GenJournalLine,ImportFactureArabSoft);
        TimbreFisc := 0;
        IF ImportFactureArabSoft."Appliquer timbre" = 'O' THEN
        TimbreFisc := 0.6;

        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::Invoice THEN
           GenJournalLine.VALIDATE("Debit Amount",(ImportFactureArabSoft."Montant H.T"-ImportFactureArabSoft."Montant remise") + ImportFactureArabSoft."Montant TVA"+TimbreFisc);
        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::"Credit Memo" THEN
           GenJournalLine.VALIDATE("Credit Amount",ImportFactureArabSoft."Montant H.T"-ImportFactureArabSoft."Montant remise"+ ImportFactureArabSoft."Montant TVA"+TimbreFisc);

        GenJournalLine.INSERT;

    end;

    local procedure ComptabilisationHT(var ImportFactureArabSoft : Record "50061");
    var
        GenJournalLine : Record "81";
    begin
        CLEAR(GenJournalLine);
        GenJournalLine."Journal Template Name" := 'IMP-ARABS';
        GenJournalLine."Journal Batch Name" := 'DEFAUT';
        CLEAR(GenJournalLine1);
        GenJournalLine1.SETRANGE("Journal Template Name",'IMP-ARABS');
        GenJournalLine1.SETRANGE("Journal Batch Name",'DEFAUT');
        IF GenJournalLine1.FINDLAST THEN
        GenJournalLine."Line No." := GenJournalLine1."Line No." + 10000
        ELSE
        GenJournalLine."Line No." :=  10000;

        GenJournalLine."Account Type" := GenJournalLine."Account Type" ::"G/L Account";
        GenJournalLine.VALIDATE("Account No.",'70721900');
        CLEAR(Customer2);
        Customer2.SETRANGE("No. 2",ImportFactureArabSoft."No. client Arabsoft");
        Customer2.FIND('-');
        GenJournalLine."Source Type" := GenJournalLine."Source Type"::Customer;
        GenJournalLine."Source No." := Customer2."No.";

        InitInsert(GenJournalLine,ImportFactureArabSoft);

        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::Invoice THEN
           GenJournalLine.VALIDATE("Credit Amount",ImportFactureArabSoft."Montant H.T"-ImportFactureArabSoft."Montant remise" );
        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::"Credit Memo" THEN
           GenJournalLine.VALIDATE("Debit Amount",ImportFactureArabSoft."Montant H.T"-ImportFactureArabSoft."Montant remise");
        GenJournalLine.INSERT;

    end;

    local procedure ComptabilisationTVA(var ImportFactureArabSoft : Record "50061");
    var
        GenJournalLine : Record "81";
    begin
        CLEAR(GenJournalLine);
        GenJournalLine."Journal Template Name" := 'IMP-ARABS';
        GenJournalLine."Journal Batch Name" := 'DEFAUT';
        CLEAR(GenJournalLine1);
        GenJournalLine1.SETRANGE("Journal Template Name",'IMP-ARABS');
        GenJournalLine1.SETRANGE("Journal Batch Name",'DEFAUT');
        IF GenJournalLine1.FINDLAST THEN
        GenJournalLine."Line No." := GenJournalLine1."Line No." + 10000
        ELSE
        GenJournalLine."Line No." :=  10000;

        GenJournalLine."Account Type" := GenJournalLine."Account Type" ::"G/L Account";
        GenJournalLine.VALIDATE("Account No.",'43671190');
        CLEAR(Customer2);
        Customer2.SETRANGE("No. 2",ImportFactureArabSoft."No. client Arabsoft");
        Customer2.FIND('-');
        GenJournalLine."Source Type" := GenJournalLine."Source Type"::Customer;
        GenJournalLine."Source No." := Customer2."No.";
        InitInsert(GenJournalLine,ImportFactureArabSoft);
        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::Invoice THEN
           GenJournalLine.VALIDATE("Credit Amount",ImportFactureArabSoft."Montant TVA");
        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::"Credit Memo" THEN
           GenJournalLine.VALIDATE("Debit Amount",ImportFactureArabSoft."Montant TVA");
        GenJournalLine.INSERT;

    end;

    local procedure ComptabilisationTibre(var ImportFactureArabSoft : Record "50061");
    var
        GenJournalLine : Record "81";
    begin
         CLEAR(GenJournalLine);
        GenJournalLine."Journal Template Name" := 'IMP-ARABS';
        GenJournalLine."Journal Batch Name" := 'DEFAUT';
        CLEAR(GenJournalLine1);
        GenJournalLine1.SETRANGE("Journal Template Name",'IMP-ARABS');
        GenJournalLine1.SETRANGE("Journal Batch Name",'DEFAUT');
        IF GenJournalLine1.FINDLAST THEN
        GenJournalLine."Line No." := GenJournalLine1."Line No." + 10000
        ELSE
        GenJournalLine."Line No." :=  10000;
        GenJournalLine."Account Type" := GenJournalLine."Account Type" ::"G/L Account";
        GenJournalLine.VALIDATE("Account No.",'43750000');
        CLEAR(Customer2);
        Customer2.SETRANGE("No. 2",ImportFactureArabSoft."No. client Arabsoft");
        Customer2.FIND('-');
        GenJournalLine."Source Type" := GenJournalLine."Source Type"::Customer;
        GenJournalLine."Source No." := Customer2."No.";
        InitInsert(GenJournalLine,ImportFactureArabSoft);
        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::Invoice THEN
           GenJournalLine.VALIDATE("Credit Amount",0.6);

        IF GenJournalLine."Document Type" = GenJournalLine."Document Type"::"Credit Memo" THEN
           GenJournalLine.VALIDATE("Debit Amount",0.6);
        GenJournalLine.INSERT;
    end;

    local procedure InitInsert(var InitGenJournalLine : Record "81";var InitImportFactureArabSoft : Record "50061");
    begin
        InitGenJournalLine."Posting Date" := InitImportFactureArabSoft."Date Facture";
        InitGenJournalLine."Document No."   := InitImportFactureArabSoft."No. Facture";
        InitGenJournalLine."Source Code" := 'VTEOD';
        CASE InitImportFactureArabSoft."Type Document" OF
          '01' :  InitGenJournalLine."Document Type" := InitGenJournalLine."Document Type"::Invoice;
          '02' :  InitGenJournalLine."Document Type" := InitGenJournalLine."Document Type"::"Credit Memo";
          '03' :  InitGenJournalLine."Document Type" := InitGenJournalLine."Document Type"::Invoice;
        END;
        CASE InitImportFactureArabSoft.Site OF
            '10S1' :  InitGenJournalLine."Responsibility Center" := 'MARSA';
            '01S1' :  InitGenJournalLine."Responsibility Center" := 'CHARGUIA';
            '09S1' :  InitGenJournalLine."Responsibility Center" := 'SOUSSE_AK';
            '13S1' :  InitGenJournalLine."Responsibility Center" := 'SOUSSE_SA';
            '12S1' :  InitGenJournalLine."Responsibility Center" := 'SFAX';
        END;

        CASE InitImportFactureArabSoft.Activité OF
           'D011' : InitGenJournalLine."Code Activité" := 'PR';
           'D021' : InitGenJournalLine."Code Activité" := 'SAV';
           'D500' : InitGenJournalLine."Code Activité" := 'SAV';
          END;

        InitGenJournalLine."Gen. Bus. Posting Group":= '';
        InitGenJournalLine."Gen. Prod. Posting Group":= '';

        InitGenJournalLine."VAT Bus. Posting Group":= '';
        InitGenJournalLine."VAT Prod. Posting Group":= '';
        InitGenJournalLine."Gen. Posting Type" := 0;
    end;

    local procedure CreateCustomerFromAS(var ImportFactureArabSoft1 : Record "50061");
    var
        GenJournalLine : Record "81";
        GenJournalLine1 : Record "81";
    begin
        Customer."No. 2" := ImportFactureArabSoft1."No. client Arabsoft";
        Customer.Name := ImportFactureArabSoft1."Nom client AranSoft";
        //MESSAGE('n  %1',ImportFactureArabSoft1."No. client Arabsoft");
        Customer."Customer Posting Group" := 'PARTIC';
        IF ImportFactureArabSoft1."ExoTva/Oui/Non" = 'N' THEN
        BEGIN
          Customer."Gen. Bus. Posting Group" := 'LOCAL-N-ASS';
          Customer."VAT Bus. Posting Group" := 'NON-ASSUJ';
        END
        ELSE
        BEGIN
          Customer."Gen. Bus. Posting Group" := 'LOCAL-ASS';
          Customer."VAT Bus. Posting Group" := 'ASSUJ';
        END;
        Customer."Code Titre" := 'PART';
        Customer."Comentaire démarage" := 'Import-Auto-AS';

        Customer.INSERT(TRUE);
        //MESSAGE('n  %1',Customer2."No. 2");
        COMMIT;
    end;
}

