page 50176 "Purchase Request DG"
{
    // version DEM ACHAT,CT16V001

    CaptionML = ENU='Purchase request',
                FRA='demande d''achat';
    DeleteAllowed = false;
    PageType = Document;
    PopulateAllFields = true;
    SourceTable = Table50005;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Purchase Type";"Purchase Type")
                {
                    Visible = false;
                }
                field("Source Type";"Source Type")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        BoolVisible := "Source Type" = "Source Type"::Customer ;
                        CurrPage.UPDATE;
                    end;
                }
                field("Source No.";"Source No.")
                {
                    Editable = BoolVisible;
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Request Date";"Request Date")
                {
                }
                field("Requested Receipt Date";"Requested Receipt Date")
                {
                    Visible = PopAllFiledUsers;
                }
                field("---------------------";"---------------------")
                {
                    Visible = AllUsers;
                }
                field("Motif Refus Dir. Général.";"Motif Refus Dir. Général.")
                {
                    Visible = AllUsers;
                }
                field("Vendor No.";"Vendor No.")
                {
                    Visible = false;
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                    Visible = false;
                }
                field("Montant HT";"Montant HT")
                {
                }
                field("Request User ID";"Request User ID")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Visible = PopAllFiledUsers;
                }
                field("Purchaseperson Code";"Purchaseperson Code")
                {
                    Visible = false;
                }
                field("Approvée par la D.C.G";"Approvée par la D.C.G")
                {
                    Editable = false;
                    Visible = AllUsers;
                }
                field("Approvée par la Dir.Genenal";"Approvée par la Dir.Genenal")
                {
                    Editable = false;
                }
                field("Approbation totale";"Approbation totale")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Approvée par la D.F";"Approvée par la D.F")
                {
                    Editable = false;
                }
                field("D.A réglé";"D.A réglé")
                {
                    Visible = false;
                }
                field("Date Refus";"Date Refus")
                {
                    Visible = AllUsers;
                }
                field("Code Motif Refus";"Code Motif Refus")
                {
                }
                field("Customer No.";"Customer No.")
                {
                    Visible = false;
                }
                field("Pour le compte de :";"Pour le compte de :")
                {
                }
                field("Code Budget";"Code Budget")
                {
                    Editable = false;
                }
                field("Code direction";"Global Dimension 1 Code")
                {
                    CaptionML = ENU='Global Dimension 1 Code',
                                FRA='Code direction';
                    ShowMandatory = true;
                }
                field("Code Site";"Global Dimension 2 Code")
                {
                    CaptionML = ENU='Global Dimension 2 Code',
                                FRA='Code Site';
                    ShowMandatory = true;
                    Visible = PopAllFiledUsers;
                }
                field("Dépassement Budget";"Dépassement Budget")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
            }
            part(PurchaseReqLine;50005)
            {
                SubPageLink = Request No.=FIELD(No.);
            }
            group()
            {
                field("Approuvé par la DCG par";"Approuvé par la DCG par")
                {
                    Editable = false;
                }
                field("Approuvé par la DCG le";"Approuvé par la DCG le")
                {
                    Editable = false;
                }
                field("Temp d'approbation DCG";"Temp d'approbation DCG")
                {
                    Editable = false;
                }
                field("Approuvé par la DF par";"Approuvé par la DF par")
                {
                    Editable = false;
                }
                field("Approuvé par la DF le";"Approuvé par la DF le")
                {
                    Editable = false;
                }
                field("Temp d'approbation Finance";"Temp d'approbation Finance")
                {
                    Editable = false;
                }
                field("Approvée par la Dir.Genenal le";"Approvée par la Dir.Genenal le")
                {
                    Editable = false;
                }
                field("Temp d'approbation Dir.Genenal";"Temp d'approbation Dir.Genenal")
                {
                    Editable = false;
                }
                field("Refusé par la Dir.Genenal le";"Refusé par la Dir.Genenal le")
                {
                    Editable = false;
                }
                field("Temp Refus Dir.Genenal";"Temp Refus Dir.Genenal")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Demande)
            {
                Caption = 'Demande';
                action("Refusé Demande d'achat")
                {
                    Image = Cancel;
                    RunPageMode = View;
                    Visible = UserDirGene;

                    trigger OnAction();
                    begin
                        /*IF CONFIRM('ëtes vous sûre de refuser cette demande',TRUE,FALSE) THEN
                        BEGIN
                        "Refusé par la Dir.Genenal" := TRUE;
                        "Refusé par la Dir.Genenal le" := WORKDATE;
                         "Temp Refus Dir.Genenal" := TIME;
                        MODIFY;
                        END;
                         */

                    end;
                }
                action("Accepter Demande d'achat")
                {
                    Image = Approve;
                    Visible = UserDirGene;

                    trigger OnAction();
                    begin
                        /*
                        IF CONFIRM('ëtes vous sûre de refuser cette demande',TRUE,FALSE) THEN
                        BEGIN
                        "Approvée par la Dir.Genenal" := TRUE;
                        "Approvée par la Dir.Genenal le" := WORKDATE;
                         "Temp d'approbation Dir.Genenal" := TIME;
                        MODIFY;
                        END;
                        */

                    end;
                }
                action("Proposer Article")
                {
                    Image = LedgerEntries;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //<< MMS 09102013
                        CLEAR(RecGPagePropArticle);
                        //Type Document Demande Achat
                        RecGTypeDoc:=1;
                        RecGPagePropArticle.SetPurchaseRequest(Rec."No.",RecGTypeDoc);
                        RecGPagePropArticle.RUNMODAL();
                        //>>
                    end;
                }
                action("Commande Achat")
                {
                    Caption = 'Commande Achat';
                    Image = "Order";
                    Visible = Allusers;

                    trigger OnAction();
                    begin
                        CurrPage.PurchaseReqLine.PAGE.ShowPurchaseLineOrder;
                    end;
                }
                action("Fiche Article")
                {
                    Caption = 'Fiche Article';
                    Image = Item;
                    RunObject = Page 60100;
                    Visible = Allusers;

                    trigger OnAction();
                    begin
                        CurrPage.PurchaseReqLine.PAGE.ItemCard;
                    end;
                }
                group("Disponibilité Article par")
                {
                    Caption = 'Disponibilité Article par';
                    Image = Sales;
                    action(Periode)
                    {
                        Caption = 'Periode';
                        Image = ItemAvailabilitybyPeriod;
                        RunObject = Page 157;
                        Visible = Allusers;
                    }
                    action(Magasin)
                    {
                        Caption = 'Magasin';
                        Image = ItemAvailbyLoc;
                        RunObject = Page 492;
                        Visible = Allusers;
                    }
                }
            }
            group(Fonctions)
            {
                Caption = 'Fonctions';
                action(Lancer)
                {
                    Caption = 'Lancer';
                    Image = LaunchWeb;
                    Visible = Allusers;

                    trigger OnAction();
                    var
                        RecLLinePurchaseRequest : Record "50008";
                    begin
                        RecGUserSetup.GET(USERID);
                        IF RecGUserSetup."Lancer demande d'achat" THEN
                          ERROR('Vous ne pouvez pas lancer cette demande. Merci de contacter votre supérieur hiérarchique!');
                        RESET;
                        IF Status <> Status::Open THEN
                          ERROR(CstGText029);
                        
                        TESTFIELD("Dépassement Budget",'');
                        RecLLinePurchaseRequest.RESET;
                        RecLLinePurchaseRequest.SETFILTER(RecLLinePurchaseRequest."Request No.","No.");
                        IF RecLLinePurchaseRequest.FINDFIRST THEN
                        REPEAT
                         IF RecLLinePurchaseRequest.Type = 0 THEN ERROR(CstGText003);
                         RecLLinePurchaseRequest.TESTFIELD(RecLLinePurchaseRequest.Quantity);
                         RecLLinePurchaseRequest.TESTFIELD(RecLLinePurchaseRequest."Location Code");
                         RecLLinePurchaseRequest.TESTFIELD(RecLLinePurchaseRequest."Unit Cost");
                           IF RecLLinePurchaseRequest.Type = RecLLinePurchaseRequest.Type::Item THEN
                             RecLLinePurchaseRequest.TESTFIELD("Unit of Measure Code");
                         //KK
                         RecLLinePurchaseRequest.TESTFIELD("Vendor No.");
                        
                        UNTIL RecLLinePurchaseRequest.NEXT = 0;
                        
                        InclureBud := FALSE;
                        RecLLinePurchaseRequest.RESET;
                        RecLLinePurchaseRequest.SETFILTER(RecLLinePurchaseRequest."Request No.","No.");
                        IF RecLLinePurchaseRequest.FINDFIRST THEN
                        REPEAT
                         IF RecLLinePurchaseRequest."Exclure budget" = FALSE THEN
                            InclureBud := TRUE;
                        UNTIL RecLLinePurchaseRequest.NEXT = 0;
                        
                        
                        //contrôle budget
                        
                        TESTFIELD("Code Budget");
                        TESTFIELD("Global Dimension 1 Code");
                        TESTFIELD("Global Dimension 2 Code");
                        CLEAR(PurchaseRequestLine);
                        PurchaseRequestLine.SETFILTER(PurchaseRequestLine."Request No.",'%1',"No.");
                        PurchaseRequestLine.FINDFIRST;
                        REPEAT
                         CLEAR(GLAccount);
                         GLAccount.GET(PurchaseRequestLine."No. compte comptable");
                          IF  NOT GLAccount."Exclure Budget" THEN
                           BEGIN
                             MontantBudgetLigne := 0;
                             //<<________________________________________Calc Buget Autorise
                             CLEAR(GLBudgetEntry);
                             GLBudgetEntry.SETFILTER("Budget Name",'%1',"Code Budget");
                             GLBudgetEntry.SETFILTER("G/L Account No.",'%1',PurchaseRequestLine."No. compte comptable");
                             GeneralLedgerSetup.GET;
                             IF GeneralLedgerSetup."Activer budget par site" THEN
                             IF "Global Dimension 2 Code" <> '' THEN
                             GLBudgetEntry.SETFILTER("Global Dimension 2 Code",'%1',PurchaseRequestLine."Global Dimension 2 Code"); // a activer par la suite si le budget sera par site
                             GLBudgetEntry.FINDFIRST;
                              REPEAT
                                MontantBudgetLigne += GLBudgetEntry.Amount;
                              UNTIL GLBudgetEntry.NEXT = 0;
                                                                //>>________________________________________End Calc Buget Autorise
                              //________________________________________En cours par compte
                              DateDebBud := 0D;
                              DateFinBud := 0D;
                              encours    :=  0;
                              PurchaseRequestLine."Dépassement budget" := FALSE;
                              PurchaseRequestLine."Budget initial" := 0;
                              PurchaseRequestLine."Budget consommé" := 0;
                              PurchaseRequestLine."Solde budget" :=0;
                        
                              CLEAR(GLBudgetName);
                              GLBudgetName.GET("Code Budget");
                              GLAccount1.SETRANGE("No.",GLAccount."No.");
                              GLAccount1.SETRANGE("Budget Filter","Code Budget");
                              GLAccount1.SETRANGE("Date Filter",DMY2DATE(1,1,GLBudgetName."Année budget"),DMY2DATE(31,12,GLBudgetName."Année budget"));
                              GLAccount1.FINDFIRST;
                              GLAccount1.CALCFIELDS("D.A M.T Consommé","Mnt CMD-ACH facturé/DA","Mnt CMD-ACH non réceptionné/DA","Mnt CMD-ACH réceptionné/DA");
                              encours := GLAccount1."D.A M.T Consommé";// + GLAccount1."Mnt CMD-ACH facturé/DA" +GLAccount1."Mnt CMD-ACH non réceptionné/DA"+GLAccount1."Mnt CMD-ACH réceptionné/DA";
                        
                        
                              // IF "No." = 'DA-MS-192247' THEN
                             //    MESSAGE('DA %1   Fact %2 Cmd %3 réception  %4  %5',GLAccount1."D.A M.T Consommé",GLAccount1."Mnt CMD-ACH facturé/DA",GLAccount1."Mnt CMD-ACH non réceptionné/DA",
                                         // GLAccount1."Mnt CMD-ACH réceptionné/DA",encours);
                        
                               IF (encours) > MontantBudgetLigne  THEN
                                  BEGIN
                                      MESSAGE(CstGText015);
                                      "Dépassement Budget" := 'Attention dépassement budget';
                                      MODIFY;
                                      PurchaseRequestLine."Dépassement budget" := TRUE;
                                  END;
                                  PurchaseRequestLine."Budget initial" := MontantBudgetLigne;
                                  PurchaseRequestLine."Budget consommé" := encours;
                                  PurchaseRequestLine."Solde budget" := MontantBudgetLigne - encours;
                                  PurchaseRequestLine.MODIFY;
                           END;
                        
                        
                        
                        
                        
                        
                        
                        /*
                        IF PurchaseRequestLine.Type = PurchaseRequestLine.Type::"Charge (Item)" THEN
                         BEGIN
                         CLEAR(GLAccount);
                         GLAccount.GET(PurchaseRequestLine."No. compte comptable");
                          IF  NOT GLAccount."Exclure Budget" THEN
                           BEGIN
                             CLEAR(GLBudgetEntry);
                             GLBudgetEntry.SETFILTER("Budget Name",'%1',"Code Budget");
                             GLBudgetEntry.SETFILTER("G/L Account No.",'%1',PurchaseRequestLine."No. compte comptable");
                             //GLBudgetEntry.SETFILTER("Global Dimension 2 Code",'%1',PurchaseRequestLine."Global Dimension 2 Code"); // a activer par la suite si le budget sera par site
                             GLBudgetEntry.FINDFIRST;
                              REPEAT
                               MntAutoriseBudgetLigne += GLBudgetEntry.Amount;
                              UNTIL GLBudgetEntry.NEXT = 0;
                        
                              CLEAR(GLBudgetName);
                              GLBudgetName.GET("Code Budget");
                              DateDebBud := 0D;
                              DateFinBud := 0D;
                              GLAccount.SETRANGE("Date Filter",DMY2DATE(1,1,GLBudgetName."Année budget"),DMY2DATE(31,12,GLBudgetName."Année budget"));
                              GLAccount.CALCFIELDS("D.A M.T Consommé","Mnt CMD-ACH facturé/DA","Mnt CMD-ACH non réceptionné/DA","Mnt CMD-ACH réceptionné/DA");
                              encours := GLAccount."D.A M.T Consommé" + GLAccount."Mnt CMD-ACH facturé/DA" +GLAccount."Mnt CMD-ACH non réceptionné/DA"+GLAccount."Mnt CMD-ACH réceptionné/DA";
                                IF (encours) > MntAutoriseBudgetLigne  THEN
                                  BEGIN
                                      MESSAGE(CstGText015);
                                      "Dépassement Budget" := 'Attention dépassement budget';
                                      MODIFY;
                                      PurchaseRequestLine."Dépassement budget" := TRUE;
                                  END;
                                  PurchaseRequestLine."Budget initial" := MntAutoriseBudgetLigne;
                                  //OLD PurchaseRequestLine."Budget consommé" := GLAccount."Total budget D.A";// + PurchaseRequestLine.Montant;
                                  PurchaseRequestLine."Budget consommé" := encours;
                                  //OLD PurchaseRequestLine."Solde budget" := PurchaseRequestLine."Budget initial"- (GLAccount."Total budget D.A");// + PurchaseRequestLine.Montant);
                                  PurchaseRequestLine."Solde budget" := PurchaseRequestLine."Budget initial" - encours;
                                  PurchaseRequestLine.MODIFY;
                          END;
                        END;
                        */
                        UNTIL PurchaseRequestLine.NEXT = 0;
                        
                        
                        
                        IF "Dépassement Budget" =  '' THEN
                          BEGIN
                            VALIDATE(Status, Status::Released);
                            "D.A pour app Budget" := InclureBud;
                            MODIFY;
                            COMMIT;
                          END;

                    end;
                }
                action("Réouvrir")
                {
                    Caption = 'Réouvrir';
                    Image = ReOpen;
                    Visible = Allusers;

                    trigger OnAction();
                    begin


                        IF "Approvée par la D.C.G" THEN
                          ERROR(CstGText009);
                        //>> END TRIUM RAD addin

                        IF (Status = Status::Refused) OR (Status = Status::Released) THEN
                          VALIDATE(Status,Status::Open)
                        ELSE
                          ERROR(CstGText001);
                        MODIFY;
                    end;
                }
                action("Créer Commande")
                {
                    Caption = 'Créer Commande';
                    Image = "Order";
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    Visible = Allusers;

                    trigger OnAction();
                    begin
                        
                        RecGUserSetup.GET(USERID);
                        
                        IF NOT RecGUserSetup."Transf. Demande --> Commande" THEN
                          ERROR(CstGText025);
                        
                        /*
                        IF Status <> Status::Released THEN
                          ERROR(CstGText014);
                        */
                        
                        
                        
                        
                        
                        ExclureControleBudgetaire := TRUE;
                        CLEAR(PurchaseRequestLine);
                        PurchaseRequestLine.SETFILTER(PurchaseRequestLine."Request No.",'%1',"No.");
                        PurchaseRequestLine.FINDFIRST;
                        REPEAT
                          CLEAR(GLAccount);
                          IF GLAccount.GET(PurchaseRequestLine."No. compte comptable") THEN
                             BEGIN
                              IF GLAccount."Exclure Budget" = FALSE THEN ExclureControleBudgetaire := FALSE;
                             END;
                        UNTIL PurchaseRequestLine.NEXT = 0;
                        
                        IF NOT ExclureControleBudgetaire THEN
                        //IF NOT "Approvée par la D.C.G" THEN
                        //  ERROR(CstGText008);
                        
                        IF NOT "Approvée par la D.F" THEN
                          ERROR(CstGText008);
                        
                        IF NOT CONFIRM(CstGText022) THEN
                          EXIT;
                        
                        CreatePurchaseDocument(Rec,2);
                        
                        
                        VALIDATE(Status, Status::Ordered);
                        MODIFY;

                    end;
                }
                action("Créer devis")
                {
                    Image = Quote;
                    Visible = Allusers;

                    trigger OnAction();
                    begin
                        RecGUserSetup.GET(USERID);

                        IF NOT RecGUserSetup."Transf. Demande --> Commande" THEN
                          ERROR(CstGText025);

                        IF Status <> Status::Released THEN
                          ERROR(CstGText014);

                        IF NOT "Approvée par la D.C.G" THEN
                          ERROR(CstGText008);

                        IF NOT CONFIRM(CstGText022) THEN
                          EXIT;

                        CreatePurchaseDocument(Rec,1);
                        VALIDATE(Status, Status::Ordered);
                        MODIFY;
                    end;
                }
            }
            group(Approbation)
            {
                Caption = 'Approbation';
                action("Aprobation D.C.Gestion")
                {
                    Caption = 'Approbation D.C.G';
                    Image = Approve;
                    Visible = Allusers;

                    trigger OnAction();
                    var
                        RecLLinePurchaseRequest : Record "50008";
                    begin

                        IF Status <> Status::Released THEN
                          ERROR(CstGText004);

                        IF NOT  RecGUserSetup.GET(USERID)
                          THEN
                           ERROR(CstGText005,USERID);




                        //IF USERID <> 'BSB\CHEDLI_ELFAHEM' THEN ERROR(CstGText017);
                        IF NOT RecGUserSetup."Approuver Demande Achat" THEN
                           ERROR(CstGText006,USERID);



                        //"Approbation partielle" := FALSE;
                        //"Approbation totale"    := TRUE;

                        AppTot := TRUE;
                        CLEAR(RecLLinePurchaseRequest);
                        RecLLinePurchaseRequest.SETFILTER(RecLLinePurchaseRequest."Request No.",'%1',"No.");
                        RecLLinePurchaseRequest.FINDFIRST;
                        REPEAT
                          IF NOT RecLLinePurchaseRequest."Ligne approuvée" THEN
                             AppTot := FALSE;
                        UNTIL RecLLinePurchaseRequest.NEXT = 0;


                        IF AppTot THEN
                          BEGIN
                          "Approbation partielle" := TRUE;
                            "Approbation partielle" := FALSE;
                            END
                        ELSE
                        BEGIN

                          "Approbation totale" := FALSE;
                          "Approbation partielle" := TRUE;
                        END;


                        IF CONFIRM('ëtes vous sûre de vouloir approuver cette demande',TRUE,FALSE) THEN
                        BEGIN
                        "Approvée par la D.C.G" := TRUE;
                        "Approuvé par la DCG par" := USERID;
                        "Approuvé par la DCG le"  := WORKDATE;
                        "Temp d'approbation DCG" := TIME;
                        MODIFY;
                            PurchaseRequestLine.RESET;
                            PurchaseRequestLine.SETFILTER("Request No.","No.");
                            PurchaseRequestLine.FIND('-');
                              REPEAT
                                 PurchaseRequestLine."Approvée par la D.C.G" := TRUE;
                                PurchaseRequestLine.MODIFY;
                              UNTIL PurchaseRequestLine.NEXT = 0;

                        END;



                        //approbation DA: lors de lapprobation sur entête toute les lignes seront aprouvées
                        //si une ligne est refusée : l'approbation sera refusée, il faut supprimer la ou les lignes supprimées et refaire l'approbation
                    end;
                }
                action("D.C.G Uncheck")
                {
                    Caption = 'Annuler ApprobationD.C.G';
                    Image = Undo;
                    Visible = Allusers;

                    trigger OnAction();
                    begin

                        IF Status <> Status::Released THEN
                          ERROR(CstGText004);

                        IF NOT RecGUserSetup.GET(USERID) THEN
                           ERROR(CstGText005,USERID);

                        IF NOT RecGUserSetup."Approuver Demande Achat" THEN
                          ERROR(CstGText006,USERID);

                        IF CONFIRM(CstGText011, FALSE) THEN
                          BEGIN
                            "Approvée par la D.C.G" := FALSE;
                            "Approbation partielle":= FALSE;
                            "Approbation totale" := FALSE;
                            MODIFY;
                          END;
                    end;
                }
                action(Refuser)
                {
                    Caption = 'Refuser';
                    Image = Cancel;
                    Visible = Allusers;

                    trigger OnAction();
                    begin


                        IF NOT ((RecGUserSetup."Refuser Demande Achat") OR (UPPERCASE(USERID) = "Approval UserID")  )THEN
                          ERROR(CstGText025);

                        IF (Status = Status::Ordered)  THEN
                          ERROR(CstGText026);

                        IF Status <> Status::Released THEN
                          ERROR(CstGText004);

                        IF NOT RecGUserSetup.GET(USERID) THEN
                           ERROR(CstGText005,USERID);

                        //TESTFIELD("Code Motif Refus");
                        IF NOT CONFIRM(CstGText020) THEN
                          EXIT;

                        VALIDATE(Status, Status::Refused);
                        "Date Refus" := CREATEDATETIME(TODAY,TIME);
                        "Refused by":=USERID;
                        MODIFY;
                    end;
                }
                action("Approbation D.Financier")
                {
                    Image = Approve;
                    Visible = Allusers;

                    trigger OnAction();
                    begin
                        
                        
                        IF Status <> Status::Released THEN
                          ERROR(CstGText004);
                        
                        
                        
                        ExclureControleBudgetaire := TRUE;
                        
                        CLEAR(PurchaseRequestLine);
                        PurchaseRequestLine.SETFILTER(PurchaseRequestLine."Request No.",'%1',"No.");
                        PurchaseRequestLine.FINDFIRST;
                        REPEAT
                          CLEAR(GLAccount);
                          IF GLAccount.GET(PurchaseRequestLine."No. compte comptable") THEN
                             BEGIN
                              IF GLAccount."Exclure Budget" = FALSE THEN ExclureControleBudgetaire := FALSE;
                             END;
                        UNTIL PurchaseRequestLine.NEXT = 0;
                        
                        /*
                        IF NOT "Approvée par la D.C.G" THEN
                          BEGIN
                                IF NOT ExclureControleBudgetaire THEN
                                  BEGIN
                                        ERROR('D.A soumise a un contrôle budgetaire, veuillez attendre l''approbation de le DCG');
                                  END;
                          END;
                        */
                        
                        
                        
                        IF NOT RecGUserSetup."Admin Finance NAV" THEN
                           ERROR(CstGText006,USERID);
                        IF CONFIRM('ëtes vous sûre de vouloir approuver cette demande',TRUE,FALSE) THEN
                        BEGIN
                        "Approvée par la D.F" := TRUE;
                        "Approuvé par la DF par" := USERID;
                        "Approuvé par la DF le"  := WORKDATE;
                        "Temp d'approbation Finance" := TIME;
                        MODIFY;
                        
                        END;

                    end;
                }
            }
            group(Imprimer)
            {
                Caption = 'Imprimer';
                action("Demande Achat")
                {
                    Caption = 'Demande Achat';
                    Image = Purchase;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Visible = Allusers;

                    trigger OnAction();
                    begin

                        RecGPurch.RESET;
                        RecGPurch.COPY(Rec);
                        CurrPage.SETSELECTIONFILTER(RecGPurch);
                        REPORT.RUN(REPORT::"Purchase Request",TRUE,FALSE,RecGPurch);
                    end;
                }
                action("Bordereaux Carte grise")
                {
                    RunObject = Page 60074;
                    RunPageLink = Purchase Request No.=FIELD(No.);
                    Visible = Allusers;
                }
                action("Importer lignes autre demande")
                {
                    Image = Copy;
                    Visible = Allusers;

                    trigger OnAction();
                    var
                        LPagePurchaseRequestList : Page "50006";
                        LRecPurchaseRequestHeader : Record "50005";
                        LRecPurchaseRequestLine : Record "50008";
                        LRecPurchaseRequestLine_insert : Record "50008";
                        LRecPaymentLine : Record "10866";
                    begin
                        LRecPurchaseRequestHeader.RESET;
                        LRecPurchaseRequestHeader.FILTERGROUP(2);
                        LRecPurchaseRequestHeader.SETRANGE("Request User ID",USERID);
                        LRecPurchaseRequestHeader.FILTERGROUP(0);
                        IF LRecPurchaseRequestHeader.FINDSET THEN BEGIN
                          CLEAR(LPagePurchaseRequestList);
                          LPagePurchaseRequestList.SETRECORD(LRecPurchaseRequestHeader);
                          LPagePurchaseRequestList.SETTABLEVIEW(LRecPurchaseRequestHeader);
                          LPagePurchaseRequestList.LOOKUPMODE(TRUE);
                          IF LPagePurchaseRequestList.RUNMODAL=ACTION::LookupOK THEN BEGIN
                            LPagePurchaseRequestList.GETRECORD(LRecPurchaseRequestHeader);
                            LRecPurchaseRequestLine.RESET;
                            LRecPurchaseRequestLine.SETRANGE("Request No.",LRecPurchaseRequestHeader."No.");
                            LRecPurchaseRequestLine.SETRANGE("Ligne approuvée",FALSE);
                            IF LRecPurchaseRequestLine.FINDSET THEN BEGIN
                              REPEAT
                                LRecPurchaseRequestLine_insert.INIT;
                                LRecPurchaseRequestLine_insert.TRANSFERFIELDS(LRecPurchaseRequestLine);
                                LRecPurchaseRequestLine_insert.VALIDATE("Request No.","No.");
                                LRecPurchaseRequestLine_insert.INSERT(TRUE);
                                LRecPaymentLine.RESET;
                                LRecPaymentLine.SETRANGE("No. D.A",LRecPurchaseRequestLine."Request No.");
                                LRecPaymentLine.SETRANGE("No. Ligne D.A",LRecPurchaseRequestLine."Line No.");
                                IF LRecPaymentLine.FINDSET THEN
                                  REPEAT
                                    LRecPaymentLine."No. D.A":="No.";
                                    LRecPaymentLine."No. Ligne D.A":=LRecPurchaseRequestLine_insert."Line No.";
                                  //  LRecPaymentLine.MODIFY;
                                  UNTIL LRecPaymentLine.NEXT=0;
                              UNTIL LRecPurchaseRequestLine.NEXT=0;
                            END;
                          END;
                        END;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        BoolVisible := "Source Type" = "Source Type"::Customer ;

        MontantHT:= 0;
        MontantHT:= GetTotal;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin

        IF USERID = 'BSB\AMENI_JELAIEL' THEN  MESSAGE('ici 2');
        //"Request User ID":=USERID ;
    end;

    trigger OnOpenPage();
    begin
        //RAD ADDINS -
        // - Restriction de consulter les demandes par droit utilisateur
        //FILTERGROUP(2);
        RecGUserSetup.GET(USERID);
        //IF NOT RecGUser."Show all Request" THEN
        //    SETRANGE("Request User ID",USERID);
        //FILTERGROUP(0);
        // END RAD ADDINS

        BoolVisible := "Source Type" = "Source Type"::Customer ;

        PopAllFiledUsers := TRUE;

        AllUsers := TRUE;
        UserDirGene := FALSE;

        RecGUserSetup.GET(USERID);
        IF RecGUserSetup."Profil Directeur Général" THEN
        BEGIN
           AllUsers := FALSE;
           UserDirGene := TRUE;
           PopAllFiledUsers := FALSE;
        END;
    end;

    var
        BoolVisible : Boolean;
        CstGText014 : TextConst ENU='Status must be "released"',FRA='Le statut de la commande doit être "Lancé"';
        CstGText019 : TextConst ENU='Do you want to appove this purchase request?',FRA='Voulez-vous approuver la demande achat ?';
        CstGText020 : TextConst ENU='Do you want to refuse this purchase request?',FRA='Voulez-vous refuser la demande achat ?';
        CstGText021 : TextConst ENU='Do you confirm quote creation?',FRA='Confirmez-vous la création de(s) devis pour cette demande ? ';
        CstGText022 : TextConst ENU='Do you confirm order creation?',FRA='Confirmez-vous la création de(s) commande pour cette demande ? ';
        CstGText025 : TextConst ENU='Current user is not allwed to do this operation',FRA='L''utilisateur courant n''est  pas autorisé à faire cette opération';
        CstGText026 : TextConst ENU='It is not ossible to refuse an ordered purchase request',FRA='Impossible de refuser une demande au statut commandée';
        CstGText029 : TextConst ENU='status request  must be "open"',FRA='Le statut de la demande doit être "Ouvert".';
        CstGText032 : TextConst ENU='There is  no line in the request',FRA='Il n''y a pas des lignes dans la demande';
        CstGText001 : TextConst ENU='Status must be "released" or "Refused"',FRA='Le statut de la commande doit être "Lancé" Or "Refusé"';
        CstGText002 : TextConst ENU='Archive Request No. %1 ?',FRA='Confirmez-vous l''archivage la demande  %1? ';
        CstGText003 : TextConst ENU='Le type de la ligne doit être spécifié',FRA='Le type de la ligne doit être spécifié';
        CstGText004 : TextConst ENU='The document status must be : released',FRA='Le statut du documet doit être : Lancé';
        CstGText005 : TextConst ENU='The user : %1 , is not correctly setup, contact your system administrator',FRA='L''utilisateur : %1 n''st pas configuré correctement, veuillez contacter votre administrateur système';
        CstGText006 : TextConst ENU='The user : %1, is not allowed to make finance check',FRA='L''utilisateur :%1, n''est pas autorisé à faire une verification financière';
        CstGText007 : TextConst ENU='The request can not cover Fixed assets, and items at the same time please split the request',FRA='La demande ne peut pas contenir des immobilisations et des articles en même temps veuillez à faire deux demandes séparées';
        CstGText008 : TextConst ENU='The request must be Checked by finance',FRA='Une approbation manquante pour cette Demande';
        CstGText009 : TextConst ENU='You can not reopen this document because it is already Checked by finance, Please contact your Finance for rhe uncheck',FRA='On ne peut pas reouvrir cette demande car elle est déja approvée par la D.C.G, veuillez contacter votre le D.C.G pour l''annulation de la vérification';
        CstGText010 : TextConst ENU='Please enter the unit Price for the line : %1 corresponding to the Item : %2',FRA='Veuillez saisir le prix unitaire au niveau de la ligne : %1, correspondant à l''article : %2';
        CstGText011 : TextConst ENU='Are you sure to cancel the ckeck of this document?',FRA='Etes-vous sûre de voiloir annuler la verification de ce document?';
        RecGUserSetup : Record "91";
        MontantHT : Decimal;
        RecGPurch : Record "50005";
        RecGBudget : Record "50001";
        RecGPagePropArticle : Page "60010";
        RscGRequestCode : Code[20];
        RecGTypeDoc : Integer;
        CstGText012 : TextConst ENU='Please enter the unit Price for the line : %1 corresponding to the Item : %2',FRA='Veuillez saisir la quantité au niveau de la ligne : %1, correspondant à l''article : %2';
        AppTot : Boolean;
        AppPPart : Boolean;
        GLBudgetEntry : Record "96";
        PurchaseRequestLine : Record "50008";
        MontantBudgetLigne : Decimal;
        GLAccount : Record "15";
        GLAccount1 : Record "15";
        DateDebBud : Date;
        DateFinBud : Date;
        GLBudgetName : Record "95";
        CstGText013 : TextConst ENU='Please enter the unit Price for the line : %1 corresponding to the Item : %2',FRA='Attention pour le compte %1 dépassement de budget de %2 ,  Budget  %3  consommé %4  Cette demande ne peut pas être approver';
        encours : Decimal;
        CstGText015 : Label 'Dépassement du budget ! Veuillez contacter le D.C.G';
        CstGText016 : Label 'La ou les commande(s) déja créées !';
        CurrPurchNo : Code[20];
        ExclureControleBudgetaire : Boolean;
        CstGText017 : TextConst ENU='The user : %1, is not allowed to make finance check',FRA='Vous  n''est pas autorisé à approuver cette D.A';
        InclureBud : Boolean;
        UserDirGene : Boolean;
        AllUsers : Boolean;
        PopAllFiledUsers : Boolean;
        GeneralLedgerSetup : Record "98";

    procedure updateAmount();
    begin
        CALCFIELDS("Montant HT");
        CurrPage.UPDATE;
    end;

    procedure CreatePurchaseDocument(var RecLPurchaseRequest : Record "50005";DocType : Integer);
    var
        RecLLinePurchaseRequest : Record "50008";
        PurchaseHeader : Record "38";
        Vide : Text;
    begin
        //TESTFIELD("Purchaseperson Code");
        //OLD TESTFIELD("Vendor No.");
        //TESTFIELD("Purchase Type");
        RecGUserSetup.GET(USERID);
        
        
        //IF CONFIRM('Il existe des lignes non approuvée',TRUE,FALSE) THEN
        //BEGIN
          RecLLinePurchaseRequest.RESET;
          RecLLinePurchaseRequest.SETFILTER(RecLLinePurchaseRequest."Request No.",RecLPurchaseRequest."No.");
          RecLLinePurchaseRequest.SETFILTER("Ligne approuvée",'%1',TRUE);
          //KT 13032019
          RecLLinePurchaseRequest.SETFILTER("Order No.",'%1',Vide);
          //END KT
          IF RecLLinePurchaseRequest.COUNT = 0  THEN
              ERROR(CstGText032)
            ELSE BEGIN
              RecLLinePurchaseRequest.FINDSET ;
              REPEAT
                IF RecLLinePurchaseRequest.Type <> RecLLinePurchaseRequest.Type::" "THEN
                  BEGIN
                     RecLLinePurchaseRequest.TESTFIELD("Item No.");
                     RecLLinePurchaseRequest.TESTFIELD("Location Code");
                     RecLLinePurchaseRequest.TESTFIELD("Vendor No.");
                     RecLLinePurchaseRequest.TESTFIELD("Code Activité");
                     RecLLinePurchaseRequest.TESTFIELD("Centre de gestion");
        
                    /* //si nouvel Immobilisation ou immobilisation existante alors tester dépassement Budget
                     IF ( RecLLinePurchaseRequest.Type = RecLLinePurchaseRequest.Type::"Fixed Asset" ) OR
                        ( RecLLinePurchaseRequest.Type = RecLLinePurchaseRequest.Type::"Existing Fixed Asset" ) THEN
                     BEGIN
                       RecLLinePurchaseRequest.TESTFIELD("FA Posting Group");
                       RecLLinePurchaseRequest.TESTFIELD ("N° budget d'investissement");
                       //IF RecGUserSetup."Allow Budget overtaking" = FALSE THEN
                         //RecGBudget.ControleDepassementBudget(RecLLinePurchaseRequest."N° budget d'investissement");
                     END;
                     // fin test immobilisation
                     */
                     IF RecLLinePurchaseRequest.Type = RecLLinePurchaseRequest.Type::Item THEN
                       RecLLinePurchaseRequest.TESTFIELD("Unit of Measure Code");
        
                     RecLLinePurchaseRequest.TESTFIELD(Quantity);
                     //RecLLinePurchaseRequest.TESTFIELD("Approved quantity");
                     RecLLinePurchaseRequest.TESTFIELD("Unit Cost");
                  END;
        
                  PurchaseHeader.RESET;
                  PurchaseHeader.SETRANGE("Document Type",PurchaseHeader."Document Type"::Order);
                  PurchaseHeader.SETRANGE("Buy-from Vendor No.",RecLLinePurchaseRequest."Vendor No.");
                  PurchaseHeader.SETRANGE("Request No.",RecLPurchaseRequest."No.");
                  IF PurchaseHeader.FINDFIRST THEN
                    InsertLine2(RecLLinePurchaseRequest,PurchaseHeader,FALSE,'')
                  ELSE
                    BEGIN
                      CurrPurchNo := InsertHeader2(RecLPurchaseRequest, DocType, RecLLinePurchaseRequest."Vendor No.");
                      PurchaseHeader.GET(PurchaseHeader."Document Type"::Order,CurrPurchNo);
                      InsertLine2(RecLLinePurchaseRequest,PurchaseHeader,FALSE,'');
                      RecLPurchaseRequest.MODIFY;
                    END;
        
              UNTIL RecLLinePurchaseRequest.NEXT=0;
        
              //OLD InsertHeader(RecLPurchaseRequest, DocType, "Vendor No.");
              //OLD RecLPurchaseRequest.MODIFY;
             END;
        //END;
        RecLLinePurchaseRequest.RESET;
        RecLLinePurchaseRequest.SETFILTER(RecLLinePurchaseRequest."Request No.",RecLPurchaseRequest."No.");
        RecLLinePurchaseRequest.SETFILTER("Ligne approuvée",'%1',FALSE);
        IF RecLLinePurchaseRequest.COUNT <> 0  THEN
           MESSAGE('Attention il existe des lignes D.A non encores approuvée');

    end;

    procedure SetNumPurchaseRequest(var Num : Code[20]);
    begin
           RscGRequestCode:=Num;
    end;
}

