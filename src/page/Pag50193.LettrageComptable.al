page 50193 "Lettrage Comptable"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData 17=rm;
    SourceTable = Table17;
    SourceTableView = WHERE(Letter=FILTER(''),
                            Posting Date=FILTER(>=01/01/19));

    layout
    {
        area(content)
        {
            group(Filtre)
            {
                field("No. Compte";AccNo)
                {
                    TableRelation = "G/L Account";

                    trigger OnValidate();
                    begin
                        IF AccNo <> '' THEN
                          SETRANGE("G/L Account No.",AccNo)
                        ELSE
                          SETRANGE("G/L Account No.");

                        CurrPage.UPDATE;
                    end;
                }
                field("Date début";DateDebut)
                {

                    trigger OnValidate();
                    begin
                        IF (DateDebut <> 0D) AND (DateFin <> 0D) THEN
                          BEGIN
                            IF DateDebut > DateFin THEN
                              ERROR('Période invalide !');
                            SETFILTER("Posting Date",'%1..%2',DateDebut,DateFin);
                          END
                        ELSE
                          SETRANGE("Posting Date");

                        CurrPage.UPDATE;
                    end;
                }
                field("Date fin";DateFin)
                {

                    trigger OnValidate();
                    begin
                        IF (DateDebut <> 0D) AND (DateFin <> 0D) THEN
                          BEGIN
                            IF DateDebut > DateFin THEN
                              ERROR('Période invalide !');
                            SETFILTER("Posting Date",'%1..%2',DateDebut,DateFin);
                          END
                        ELSE
                          SETRANGE("Posting Date");

                        CurrPage.UPDATE;
                    end;
                }
                group(Lettrage)
                {
                    field("Id proposition lettrage";IdProLettrage)
                    {

                        trigger OnValidate();
                        begin
                            IF AccNo = '' THEN
                              ERROR('Veuillez choisir un compte à lettrer !');

                            IF IdProLettrage = 0 THEN
                              BEGIN
                                SoldeIdLettrage := 0;
                                SETRANGE("Id Proposition Lettrage");
                              END
                            ELSE
                              BEGIN
                                SoldeIdLettrage := 0;
                                SumGLEntry.RESET;
                                SumGLEntry.SETRANGE("G/L Account No.",AccNo);
                                SumGLEntry.SETRANGE("Id Proposition Lettrage",IdProLettrage);
                                IF SumGLEntry.FINDSET THEN
                                  REPEAT
                                    SoldeIdLettrage += SumGLEntry.Amount;
                                  UNTIL SumGLEntry.NEXT=0;

                                SETRANGE("Id Proposition Lettrage",IdProLettrage);
                              END;

                            CurrPage.UPDATE;
                        end;
                    }
                    field("Solde lettrage";SoldeIdLettrage)
                    {
                        Editable = false;
                    }
                }
            }
            group("Filtre Id Lettrage")
            {
                field("Id début";IdLettDebut)
                {
                    MinValue = 0;
                }
                field("Id fin";IdLettFin)
                {
                    MinValue = 0;
                }
            }
            repeater(Group)
            {
                Editable = false;
                field("Entry No.";"Entry No.")
                {
                    Editable = false;
                }
                field("G/L Account No.";"G/L Account No.")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Amount;Amount)
                {
                }
                field("Debit Amount";"Debit Amount")
                {
                }
                field("Credit Amount";"Credit Amount")
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
                field(Letter;Letter)
                {
                }
                field("Id Proposition Lettrage";"Id Proposition Lettrage")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Proposition de lettrage")
            {

                trigger OnAction();
                begin
                      Win.OPEN(
                        'Recherche des propositions de lettrage #1###################\\' );


                    IF AccNo = '' THEN
                      ERROR('Veuillez spécifier une numéro de compte !');

                    IF DateDebut = 0D THEN
                      ERROR('Veuillez spécifier une date de début !');

                    IF DateFin = 0D THEN
                      ERROR('Veuillez spécifier une date Fin !');

                    CASE AccNo OF
                      '45740000' :
                            BEGIN
                              // Supprimer les ancienne proposition
                              LoopGLEntry.RESET;
                              LoopGLEntry.SETRANGE("G/L Account No.",AccNo);
                              LoopGLEntry.MODIFYALL("Id Proposition Lettrage",0);

                              IntProposition := 1;
                              LoopGLEntry.RESET;
                              LoopGLEntry.SETRANGE("G/L Account No.",AccNo);
                              LoopGLEntry.SETRANGE("Source Type",LoopGLEntry."Source Type"::Vendor);
                              LoopGLEntry.SETRANGE("Source No.",'FR000525');
                              LoopGLEntry.SETFILTER("Posting Date",'%1..%2',DateDebut,DateFin);
                              LoopGLEntry.SETFILTER(Letter,'''''');
                              IF LoopGLEntry.FINDSET THEN
                                REPEAT
                                  // Ligne carte grise lié au bord ATTT
                                  GLEntryFound := FALSE;
                                  CarteGriseLigne.RESET;
                                  CarteGriseLigne.SETRANGE("Payment No.",LoopGLEntry."Document No.");
                                  IF CarteGriseLigne.FINDSET THEN
                                    REPEAT
                                      // No Facture du VIN lié
                                      ServiceItem.RESET;
                                      ServiceItem.SETCURRENTKEY("Serial No.");
                                      ServiceItem.SETRANGE("Serial No.",CarteGriseLigne.VIN);
                                      ServiceItem.FINDFIRST;

                                      FindGLEntry.RESET;
                                      FindGLEntry.SETRANGE("G/L Account No.",AccNo);
                                      FindGLEntry.SETRANGE("Source Type",LoopGLEntry."Source Type"::Customer);
                                      FindGLEntry.SETRANGE("Document No.",ServiceItem."No. Facture");
                                      FindGLEntry.SETFILTER(Letter,'''''');
                                      IF FindGLEntry.FINDFIRST THEN
                                        BEGIN
                                          MarkGLEntry.GET(FindGLEntry."Entry No.");
                                          MarkGLEntry."Id Proposition Lettrage" := IntProposition ;
                                          MarkGLEntry.MODIFY;
                                          GLEntryFound := TRUE;
                                        END;
                                    UNTIL CarteGriseLigne.NEXT=0;


                                  IF GLEntryFound THEN
                                    BEGIN
                                      LoopGLEntry."Id Proposition Lettrage" := IntProposition;
                                      LoopGLEntry.MODIFY;
                                      IntProposition+=1;
                                      Win.UPDATE(1,IntProposition);
                                    END;

                                UNTIL LoopGLEntry.NEXT=0;
                            END;
                     '45730000' :
                            BEGIN
                              // Supprimer les ancienne proposition
                              LoopGLEntry.RESET;
                              LoopGLEntry.SETRANGE("G/L Account No.",AccNo);
                              LoopGLEntry.MODIFYALL("Id Proposition Lettrage",0);

                              IntProposition := 1;
                              LoopGLEntry.RESET;
                              LoopGLEntry.SETRANGE("G/L Account No.",AccNo);
                              LoopGLEntry.SETRANGE("Document Type",LoopGLEntry."Document Type"::Invoice);
                              LoopGLEntry.SETRANGE("Source Type",LoopGLEntry."Source Type"::Vendor);
                              LoopGLEntry.SETFILTER("Posting Date",'%1..%2',DateDebut,DateFin);
                              LoopGLEntry.SETFILTER(Letter,'''''');
                              IF LoopGLEntry.FINDSET THEN
                                REPEAT
                                  GLEntryFound := FALSE;
                                  PurchInvHeader.GET(LoopGLEntry."Document No.");

                                  PurchInvLine.RESET;
                                  PurchInvLine.SETRANGE("Document No.",PurchInvHeader."No.");
                                  PurchInvLine.SETFILTER(VIN,'<>%1','');
                                  IF PurchInvLine.FINDSET THEN
                                    REPEAT
                                     // No Facture du VIN lié
                                      ServiceItem.RESET;
                                      ServiceItem.SETCURRENTKEY("Serial No.");
                                      ServiceItem.SETRANGE("Serial No.",PurchInvLine.VIN);
                                      ServiceItem.FINDFIRST;

                                      FindGLEntry.RESET;
                                      FindGLEntry.SETRANGE("G/L Account No.",AccNo);
                                      FindGLEntry.SETRANGE("Source Type",LoopGLEntry."Source Type"::Customer);
                                      FindGLEntry.SETRANGE("Document No.",ServiceItem."No. Facture");
                                      FindGLEntry.SETFILTER(Letter,'''''');
                                      IF FindGLEntry.FINDFIRST THEN
                                        BEGIN
                                          MarkGLEntry.GET(FindGLEntry."Entry No.");
                                          MarkGLEntry."Id Proposition Lettrage" := IntProposition ;
                                          MarkGLEntry.MODIFY;
                                          GLEntryFound := TRUE;
                                        END;
                                    UNTIL PurchInvLine.NEXT=0;

                                  IF GLEntryFound THEN
                                    BEGIN
                                      LoopGLEntry."Id Proposition Lettrage" := IntProposition;
                                      LoopGLEntry.MODIFY;
                                      IntProposition+=1;
                                      Win.UPDATE(1,IntProposition);
                                    END;

                                UNTIL LoopGLEntry.NEXT=0;
                            END
                    ELSE
                      ERROR('Régle de lettrage automatique non encore spécifié pour le compte %1',AccNo);
                    END;

                    MESSAGE('Traitement terminé !');
                    Win.CLOSE;
                end;
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
                var
                    Navigate : Page "344";
                begin
                    Navigate.SetDoc("Posting Date","Document No.");
                    Navigate.RUN;
                end;
            }
            action("Lettrer les Propositions")
            {
                Caption = 'Lettrer les Propositions';
                Image = Apply;

                trigger OnAction();
                var
                    RecL_GLEntryProposed : Record "17";
                    IntL_NbLettrages : Integer;
                    RecL_GLE : Record "17";
                begin

                    // RecL_GLEntryProposed.COPY(Rec);
                    // RecL_GLEntryProposed.SETFILTER("Id Proposition Lettrage", '<> %1', 0);
                    // IF RecL_GLEntryProposed.FINDLAST THEN
                    //  ValiderLeLettrage(RecL_GLEntryProposed);
                      Win.OPEN(
                        'Lettrage des propositions #1###################\\' );

                    IntL_NbLettrages := 0;
                    RecL_GLEntryProposed.RESET;
                    RecL_GLEntryProposed.SETCURRENTKEY("Id Proposition Lettrage");
                    RecL_GLEntryProposed.SETFILTER("Id Proposition Lettrage", '<> %1', 0);
                    IF RecL_GLEntryProposed.FINDLAST THEN
                      IntL_NbLettrages := RecL_GLEntryProposed."Id Proposition Lettrage";

                    IF IntL_NbLettrages <> 0 THEN
                      REPEAT
                        Win.UPDATE(1,IntL_NbLettrages);
                        RecL_GLE.RESET;
                        RecL_GLE.SETRANGE("Id Proposition Lettrage",IntL_NbLettrages);
                        RecL_GLE.FINDSET;

                        Lettrer(IntL_NbLettrages);

                        ValiderLeLettrage(RecL_GLE);

                        IntL_NbLettrages := IntL_NbLettrages - 1;

                      UNTIL IntL_NbLettrages = 0;

                    COMMIT;
                    CurrPage.UPDATE;
                    Win.CLOSE;
                end;
            }
            group(Fonction)
            {
                Caption = 'Fonction';
                action("Constater Gain/Perte")
                {
                    Caption = 'Constater Gain/Perte';
                    Image = TileForestGreen;

                    trigger OnAction();
                    begin
                        IF AccNo = '' THEN
                          ERROR('Veuillez choisir un compte à lettrer !');

                        IF (IdLettDebut=0) AND (IdLettFin=0) THEN
                          GainPertAllProposition
                        ELSE
                          GainPertRangeOnly;
                    end;
                }
                action("Consulter feuille à valider")
                {
                    Caption = 'Consulter feuille à valider';

                    trigger OnAction();
                    var
                        GenJournalLine : Record "81";
                    begin
                        GenJournalLine.RESET;
                        GenJournalLine.SETRANGE("Journal Template Name",'GÉNÉRAL');
                        GenJournalLine.SETRANGE("Journal Batch Name",'DEFAUT');

                        PAGE.RUN(39,GenJournalLine);
                    end;
                }
            }
        }
    }

    var
        AccNo : Code[20];
        DateDebut : Date;
        DateFin : Date;
        LoopGLEntry : Record "17";
        FindGLEntry : Record "17";
        IntProposition : Integer;
        CarteGriseLigne : Record "60016";
        ServiceItem : Record "5940";
        GLEntryFound : Boolean;
        MarkGLEntry : Record "17";
        Win : Dialog;
        PurchInvHeader : Record "122";
        PurchInvLine : Record "123";
        IdProLettrage : Integer;
        SoldeIdLettrage : Decimal;
        SumGLEntry : Record "17";
        IdLettDebut : Integer;
        IdLettFin : Integer;

    procedure Lettrer(IntP_PropositionALettrer : Integer);
    var
        EntryApplID : Code[20];
        GLEntry : Record "17";
    begin
        //couples à lettrer
        IF IntP_PropositionALettrer = 0 THEN
          CurrPage.SETSELECTIONFILTER(GLEntry)
        ELSE BEGIN
          GLEntry.RESET;
          GLEntry.SETCURRENTKEY("Id Proposition Lettrage");
          GLEntry.SETRANGE("Id Proposition Lettrage", IntP_PropositionALettrer);
        END;


        //-- Make Applies-to ID --//
        GLEntry.LOCKTABLE;

        IF GLEntry.FIND('-') THEN BEGIN

          //clear ID Lettrage si non vide
          IF GLEntry."Applies-to ID" <> '' THEN
            EntryApplID := ''

          //sinon remplir ID Lettrage si vide avec USERID OU *** si ya pa USERID
          ELSE BEGIN
            IF EntryApplID = '' THEN BEGIN
              //OLD EntryApplID := USERID;
              EntryApplID := COPYSTR(USERID,STRPOS(USERID,'\')+1,STRLEN(USERID)-STRPOS(USERID,'\'));
              IF EntryApplID = '' THEN
                EntryApplID := '***';
            END;
          END;

        //-- Set Applies-to ID  --//
          REPEAT
            GLEntry."Applies-to ID" := EntryApplID;
            GLEntry.MODIFY;
          UNTIL GLEntry.NEXT = 0;
        END;
    end;

    procedure ValiderLeLettrage(var RecP_GLEntries : Record "17");
    var
        GLEntriesApplication : Codeunit "10842";
    begin
        GLEntriesApplication.SetHidMsgDialog(TRUE);
        GLEntriesApplication.Validate(RecP_GLEntries);
    end;

    local procedure GainPertAllProposition();
    var
        Cpt : Integer;
        FindGLEntry : Record "17";
        GLEntryFounded : Boolean;
        GenJournalLine : Record "81";
    begin
        //
        GenJournalLine.RESET;
        GenJournalLine.SETRANGE("Journal Template Name",'GÉNÉRAL');
        GenJournalLine.SETRANGE("Journal Batch Name",'DEFAUT');
        GenJournalLine.DELETEALL;


        Cpt := 1;
        GLEntryFounded := TRUE;
        REPEAT
          SoldeIdLettrage := 0;
          FindGLEntry.RESET;
          FindGLEntry.SETRANGE("G/L Account No.",AccNo);
          FindGLEntry.SETCURRENTKEY("Id Proposition Lettrage");
          FindGLEntry.SETRANGE("Id Proposition Lettrage",Cpt);
          IF FindGLEntry.ISEMPTY THEN
            GLEntryFounded := FALSE
          ELSE
            BEGIN
              FindGLEntry.FINDSET;
              REPEAT
                SoldeIdLettrage += FindGLEntry.Amount;
              UNTIL FindGLEntry.NEXT=0;

              //***
              IF SoldeIdLettrage <> 0 THEN
                BEGIN
                  GenJournalLine.INIT;
                  GenJournalLine."Journal Template Name" := 'GÉNÉRAL';
                  GenJournalLine."Journal Batch Name"    := 'DEFAUT';
                  GenJournalLine."Line No."              := Cpt * 10000;

                  GenJournalLine.VALIDATE("Posting Date",WORKDATE);
                  GenJournalLine.VALIDATE("Document No.",'Doc111');
                  GenJournalLine.VALIDATE("Account Type",GenJournalLine."Account Type"::"G/L Account");
                  GenJournalLine.VALIDATE("Account No.",AccNo);
                  GenJournalLine.VALIDATE(Amount,SoldeIdLettrage);
                  GenJournalLine.VALIDATE("Bal. Account Type",GenJournalLine."Bal. Account Type"::"G/L Account");
                  IF SoldeIdLettrage < 0 THEN
                    GenJournalLine.VALIDATE("Bal. Account No.",'63600000')
                  ELSE
                    GenJournalLine.VALIDATE("Bal. Account No.",'75621000');

                  GenJournalLine.INSERT;
                END;

              Cpt+=1;
            END;

        UNTIL GLEntryFounded = FALSE;

        MESSAGE('Terminé ');
    end;

    local procedure GainPertRangeOnly();
    var
        Cpt : Integer;
        FindGLEntry : Record "17";
        GLEntryFounded : Boolean;
        GenJournalLine : Record "81";
    begin
        //
        GenJournalLine.RESET;
        GenJournalLine.SETRANGE("Journal Template Name",'GÉNÉRAL');
        GenJournalLine.SETRANGE("Journal Batch Name",'DEFAUT');
        GenJournalLine.DELETEALL;

        IF IdLettDebut = 0 THEN
          ERROR('Veuillez saisir Id lettrage début !');

        IF IdLettFin = 0 THEN
          ERROR('Veuillez saisir Id lettrage Fin !');

        IF IdLettDebut > IdLettFin THEN
          ERROR('Id lettrage de début doit être suppérieur à Id lettrage fin !');



        GLEntryFounded := TRUE;
        FOR Cpt := IdLettDebut TO IdLettFin DO
          BEGIN

            FindGLEntry.RESET;
            FindGLEntry.SETRANGE("G/L Account No.",AccNo);
            FindGLEntry.SETCURRENTKEY("Id Proposition Lettrage");
            FindGLEntry.SETRANGE("Id Proposition Lettrage",Cpt);
            IF FindGLEntry.ISEMPTY THEN
              GLEntryFounded := FALSE
            ELSE
              BEGIN
                SoldeIdLettrage := 0;
                FindGLEntry.FINDSET;
                REPEAT
                  SoldeIdLettrage += FindGLEntry.Amount;
                UNTIL FindGLEntry.NEXT=0;

                //***
                IF SoldeIdLettrage <> 0 THEN
                  BEGIN
                    GenJournalLine.INIT;
                    GenJournalLine."Journal Template Name" := 'GÉNÉRAL';
                    GenJournalLine."Journal Batch Name"    := 'DEFAUT';
                    GenJournalLine."Line No."              := Cpt * 10000;

                    GenJournalLine.VALIDATE("Posting Date",WORKDATE);
                    GenJournalLine.VALIDATE("Document No.",'Doc111');
                    GenJournalLine.VALIDATE("Account Type",GenJournalLine."Account Type"::"G/L Account");
                    GenJournalLine.VALIDATE("Account No.",AccNo);
                    GenJournalLine.VALIDATE(Amount,SoldeIdLettrage);
                    GenJournalLine.VALIDATE("Bal. Account Type",GenJournalLine."Bal. Account Type"::"G/L Account");
                    IF SoldeIdLettrage < 0 THEN
                      GenJournalLine.VALIDATE("Bal. Account No.",'63600000')
                    ELSE
                      GenJournalLine.VALIDATE("Bal. Account No.",'75621000');

                    GenJournalLine.INSERT;
                  END;
              END;
          END;

        MESSAGE('Terminé ');
    end;
}

