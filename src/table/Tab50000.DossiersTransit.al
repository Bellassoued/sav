table 50000 "Dossiers Transit"
{
    // version ETRANGER,LC

    CaptionML = ENU = 'Transit Folder',
                FRA = 'Dossier Transit';
    //DrillDownPageID = 69085;
    //LookupPageID = 69085;
    Permissions = TableData 122 = rm,
                  TableData 123 = rm,
                  TableData 5802 = rm;

    fields
    {
        field(1; "No Dossier"; Code[20])
        {
        }
        field(3; "Date d'ouverture"; Date)
        {
            CaptionML = ENU = 'Opening Date',
                        FRA = 'Date d''ouverture';
            Editable = false;
        }
        field(4; "Date de cloture"; Date)
        {
            Editable = true;
        }
        field(5; "No Fournisseur"; Code[20])
        {
            CaptionML = ENU = 'Vendor No.',
                        FRA = 'No Fournisseur';
            Editable = true;
            TableRelation = Vendor."No.";

            trigger OnValidate()

            begin

                IF Frs.GET("No Fournisseur") THEN BEGIN
                    "Nom fournisseur" := Frs.Name;
                    "Adresse Fournisseur" := Frs.Address;
                    "Adresse Fournisseur 2" := Frs."Address 2";
                    "Code Post Fournisseur" := Frs."Post Code";
                    "Ville Fournisseur" := Frs.City;
                    "Code Pays Fournisseur" := Frs."Country/Region Code"
                END;
            end;
        }
        field(6; "Souches de No"; Code[10])
        {
            CaptionML = ENU = 'Series No.',
                        FRA = 'Souches de NŽ©';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(13; "Nom fournisseur"; Text[60])
        {
            CaptionML = ENU = 'Vendor Name',
                        FRA = 'Nom fournisseur';
            FieldClass = Normal;
        }
        field(14; statut; Option)
        {
            CaptionML = ENU = 'Status',
                        FRA = 'Statut';
            Editable = true;
            OptionMembers = " ","En attente de facturation","Facturation","ClÔÇ£turÔÇÜ";

            trigger OnValidate();
            var
                Br: Record 120;
            begin
                /*IF xRec.Etat <> Etat THEN BEGIN
                  // Si on clÔÇ£ture le dossier
                  IF Etat = Etat::ClÔÇ£turÔÇÜ THEN
                      IF NOT CONFIRM('Voulez-vous clÔÇ£turer ce dossier d''arrivage ?') THEN BEGIN
                      ERROR('Changement d''ÔÇÜtat annulÔÇÜ');
                    END ELSE BEGIN
                    CALCFIELDS("Frais Financiers en instance","Assurances en Instance","Magasinage en Instance","Transit en instance",
                         "Douane en Instance","F. d'emb./ mise ÔÇª FOB en inst.","Frát en instance","Frais D'acconage en Instance",
                         "Dif. Change en Instance","Transport en Instance","Frais Bancaires en Instance","Etat et taxes en Instance",
                         "Autres Frais en Instance");
                         IF ("Frais Financiers en instance"+"Assurances en Instance"+"Magasinage en Instance"+"Transit en instance"+
                         "Douane en Instance"+"F. d'emb./ mise ÔÇª FOB en inst."+"Frát en instance"+"Frais D'acconage en Instance"+
                         "Dif. Change en Instance"+"Transport en Instance"+"Frais Bancaires en Instance"+"Etat et taxes en Instance"+
                         "Autres Frais en Instance")<>0 THEN
                           ERROR('Vous devez Valider Les Factures Des Frais de ce Dossier !!!');
                
                          recalculercout;
                      //CalculerPR.CalculerPRRViaDossier(Rec,TRUE);
                      //REPORT.RUN(50169,FALSE,FALSE,Rec);
                      "Date de clÔÇ£ture" := WORKDATE;
                      Etat :=0;
                      LigTmp.RESET;
                      LigTmp.SETFILTER("NŽ© dossier","NŽ© Dossier");
                      LigTmp.MODIFYALL("Date DÔÇÜclaration","Date DÔÇÜclaration");
                      Etat := Etat::ClÔÇ£turÔÇÜ;
                      MODIFY;
                      ActualiserLignesFactures;
                    END;
                
                  // Si on rÔÇÜ-ouvre le dossier
                  IF xRec.Etat = Etat::ClÔÇ£turÔÇÜ THEN
                    IF NOT CONFIRM('Attention : ce dossier d''arrivage est clÔÇ£turÔÇÜ. Voulez-vous changer son ÔÇÜtat ?') THEN BEGIN
                      ERROR('Changement d''ÔÇÜtat annulÔÇÜ');
                    END ELSE BEGIN
                      //* NSC1.22 PN 4/11/99
                      FactureAchat.SETRANGE("NŽ© dossier", "NŽ© Dossier");
                      //IF FactureAchat.FIND('-') THEN
                        //ERROR(STRSUBSTNO('Le dossier %1 a ÔÇÜtÔÇÜ facturÔÇÜ (facture NŽ© %2). '+
                        //                 'L''ÔÇÜtat ne peut plus ”åtre changÔÇÜ',"NŽ© dossier",FactureAchat."No."));
                      //* FIN NSC1.22 PN 4/11/99
                      AnnActualiserLignesFactures;
                
                      MODIFY;
                    END;
                END;
                */

            end;
        }
        field(15; "Mnt total lig doss (dev soc)"; Decimal)
        {
            AutoFormatType = 2;
            Editable = false;
        }
        field(16; Volume; Decimal)
        {
        }
        field(17; "Code condition livraison"; Code[10])
        {
            Editable = false;
            //- cmt mar: TableRelation = Table0;
        }
        field(30; "Date Declaration"; Date)
        {
        }
        field(50; "No dern Commande"; Code[20])
        {
            TableRelation = "Purchase Header"."No.";
            ValidateTableRelation = false;
        }
        field(100; "No Transitaire"; Code[20])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate();
            begin
                IF Frs.GET("No Transitaire") THEN BEGIN
                    "Nom Transitaire" := Frs.Name;
                    "Adresse Transitaire" := Frs.Address;
                    "Adresse Transitaire 2" := Frs."Address 2";
                    "Code Post Transitaire" := Frs."Post Code";
                    "Ville Transitaire" := Frs.City;
                    ;
                END;
            end;
        }
        field(101; "Nom Transitaire"; Text[60])
        {
            FieldClass = Normal;
        }
        field(102; "Adresse Transitaire"; Text[50])
        {
        }
        field(103; "Adresse Transitaire 2"; Text[50])
        {
        }
        field(104; "Code Post Transitaire"; Code[20])
        {
            CaptionML = ENU = 'Post Code',
                        FRA = 'Code postal';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup();
            begin
                //PostCode.LookUpPostCode("Ville Transitaire","Code Post Transitaire",TRUE);
            end;

            trigger OnValidate();
            begin
                //PostCode.ValidatePostCode("Ville Transitaire","Code Post Transitaire");
            end;
        }
        field(105; "Ville Transitaire"; Text[30])
        {
        }
        field(110; "Adresse Fournisseur"; Text[50])
        {
            CaptionML = ENU = 'Adresse',
                        FRA = 'Adress';
        }
        field(111; "Adresse Fournisseur 2"; Text[50])
        {
            CaptionML = ENU = 'Adresse 2',
                        FRA = 'Adress 2';
        }
        field(112; "Code Post Fournisseur"; Code[20])
        {
            CaptionML = ENU = 'Post Code',
                        FRA = 'Code Postal';

            trigger OnLookup();
            begin
                //PostCode.LookUpPostCode("Ville Fournisseur","Code Post Fournisseur",TRUE);
            end;

            trigger OnValidate();
            begin
                //PostCode.ValidatePostCode("Ville Fournisseur","Code Post Fournisseur");
            end;
        }
        field(113; "Ville Fournisseur"; Text[30])
        {
            CaptionML = ENU = 'City',
                        FRA = 'Ville';
        }
        field(114; "Code Pays Fournisseur"; Code[10])
        {
            CaptionML = ENU = 'Country/Region Code',
                        FRA = 'Code pays/rÔÇÜgion';
            TableRelation = "Country/Region";
        }
        field(200; "Filter Fournisseur"; Code[20])
        {
            CaptionML = ENU = 'Vendor Filter',
                        FRA = 'Filtre Fournisseur';
            FieldClass = FlowFilter;
        }
        field(201; "NŽ© Transit Externe"; Code[20])
        {
        }
        field(300; "Nbre Commandes"; Integer)
        {
            //- cmt mar:CalcFormula = Count("Purchase Header" WHERE ("No dossier"=FIELD("NŽ© Dossier"),
            //- cmt mar:                                           "Document Type"=CONST(Order)));
            CaptionML = ENU = 'Orders Number',
                        FRA = 'Nbre Commandes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(301; "No Titre importation"; Code[20])
        {
            Description = 'SM LC';
            TableRelation = "Arrivage VN";
        }
        field(302; "No Arrivage PR"; Code[20])
        {
            Description = 'ZM Achat PR';
            TableRelation = "Entete Arrivage PR";
        }
        field(303; "Nombre des Colis"; Integer)
        {
            //-cmt mr CalcFormula = Count("CAB Mouvement" WHERE (No. Dossier Import=FIELD("No Dossier"),
            //- cmt mar:                                          Type Mouvement=CONST(PColis)));
            FieldClass = FlowField;


        field(304; "No. Projetexpedition"; Code[20])
        {
            //- cmt mar:TableRelation = "Ent”åt expedition VN"."No. expedition";
        }
        field(305; "No.L.C"; Code[20])
        {
            //- cmt mar:CalcFormula = Lookup("Purch. Rcpt. Header"."No. L.C" WHERE (No. expedition=FIELD(No. Projet dexpedition),
            //- cmt mar:No.=FIELD(No. RÔÇÜception Achat VN)));
            FieldClass = FlowField;
            //- cmt mar:TableRelation = "Lettre de crÔÇÜdit L.C"."Code L.C";
        }
        field(306; "No. RÔÇÜception Achat VN"; Code[20])
        {
        }
        field(307; "No. Commande achat VN"; Code[20])
        {
        }
        field(308; "No. Bord-Obligation"; Code[20])
        {
            TableRelation = "Payment Header"."No.";
        }
        field(309; "Taux de change declaration"; Decimal)
        {
            DecimalPlaces = 3 : 8;

            trigger OnValidate();
            begin
                IF CONFIRM('Voulez vous mettre a jour le tableau de chage VIN avec le nouveau taux de change ', TRUE, FALSE) THEN BEGIN
                    CLEAR(GLigneSuivi);
                    GLigneSuivi.SETFILTER("No. Dossier", '%1', "No Dossier");
                    IF GLigneSuivi.FIND('-') THEN
                        REPEAT
                            IF "Taux de change declaration" <> 0 THEN BEGIN
                                GLigneSuivi."Taux de change Declaration" := "Taux de change declaration";
                                GLigneSuivi."Prix de revient Taux Declaration" := (ABS(GLigneSuivi."Montant Achat Unitaire") * "Taux de change dÔÇÜclaration") +
                                                                                ABS(GLigneSuivi."Frais d'approches RÔÇÜelles") + GLigneSuivi.PVN;
                                IF GLigneSuivi."Prix de revient Taux Declaration" <> 0 THEN
                                    GLigneSuivi."Marge vente % Taux Declaration" := ((GLigneSuivi."Prix de vente catalogue." - GLigneSuivi."Prix de revient Taux DÔÇÜclarati") / GLigneSuivi."Prix de revient Taux DÔÇÜclarati") * 100;
                                /*
                                IF (NOT GLigneSuivi."VIN en stock") AND (GLigneSuivi."Code Client Vente" <> '') THEN
                                 BEGIN
                                  IF GLigneSuivi."Prix de revient Taux DÔÇÜclarati" <> 0 THEN
                                   GLigneSuivi."Marge vente % Taux Declaration" := ((GLigneSuivi."Montant Facture Vente HT"-GLigneSuivi."Prix de revient Taux DÔÇÜclarati" )/GLigneSuivi."Prix de revient Taux DÔÇÜclarati")*100 ;
                                 END;
                                 */
                            END
                            ELSE BEGIN
                                GLigneSuivi."Taux de change Declaration" := 0;
                                GLigneSuivi."Prix de revient Taux Declaration" := 0;
                                GLigneSuivi."Marge vente % Taux Declaration" := 0;
                            END;
                            GLigneSuivi.MODIFY;
                        UNTIL GLigneSuivi.NEXT = 0;

                end;
        }
        field(310; "No. Borodereau L.C"; Code[20])
        {
            TableRelation = "Payment Header"."No.";
        }
        field(311; "No. Bor. Cont Finan/Bqe"; Code[20])
        {
            TableRelation = "Payment Header"."No.";
        }
        field(312; "Total en Devise"; Decimal)
        {
            //- cmt mar:CalcFormula = Sum("Purch. Rcpt. Line"."Direct Unit Cost" WHERE (No dossier VN=FIELD(NŽ© Dossier),
            //- cmt mar:     Type=CONST(Item)));
            FieldClass = FlowField;
        }
        field(313; "Dernier cours nÔÇÜgociÔÇÜ"; Decimal)
        {
            DecimalPlaces = 3 : 8;
        }
        field(314; "Date B.L"; Date)
        {

            trigger OnValidate();
            begin
                "Date EchÔÇÜance" := "Date B.L" + 180;
            end;
        }
        field(315; "Date validitÔÇÜ"; Date)
        {
        }
        field(316; "Date dÔÇÜbarquement"; Date)
        {
        }
        field(317; "Date denlevement port"; Date)
        {
        }
        field(318; "Date EchÔÇÜance"; Date)
        {
        }
        field(319; "Taux change estimatif"; Decimal)
        {
            DecimalPlaces = 3 : 8;

            trigger OnValidate();
            begin
                IF CONFIRM('Voulez vous mátre ÔÇª jour le tableau de chage VIN avec le nouvaeu taux de change estimatif ', TRUE, FALSE) THEN BEGIN
                    CLEAR(GLigneSuivi);
                    GLigneSuivi.SETFILTER("No. Dossier", '%1', "No Dossier");
                    IF GLigneSuivi.FIND('-') THEN
                        REPEAT
                            IF "Taux change estimatif" <> 0 THEN BEGIN
                                GLigneSuivi."Taux de change estimatif" := "Taux change estimatif";
                                GLigneSuivi."Prix de revien estimatif" := (ABS(GLigneSuivi."Montant Achat Unitaire") * "Taux change estimatif") +
                                                                                ABS(GLigneSuivi."Frais dapproches RÔÇÜelles") + GLigneSuivi.PVN;
                                IF GLigneSuivi."Prix de revien estimatif" <> 0 THEN
                                    GLigneSuivi."Taux Marge estimative" := ((GLigneSuivi."Prix de vente catalogue." - GLigneSuivi."Prix de revien estimatif") / GLigneSuivi."Prix de revien estimatif") * 100;
                            END
                            ELSE BEGIN
                                GLigneSuivi."Taux de change estimatif" := 0;
                                GLigneSuivi."Frais de Change" := 0;
                                GLigneSuivi."Prix de revien estimatif" := 0;
                                GLigneSuivi."Taux Marge estimative" := 0;
                            END;
                            GLigneSuivi.MODIFY;
                        UNTIL GLigneSuivi.NEXT = 0;
                END;
            end;
        }
        field(320; "No. Proforma"; Code[20])
        {
        }
        field(321; "Total QtÔÇÜ."; Decimal)
        {
            //- cmt mar:CalcFormula = Sum("Purch. Rcpt. Line".Quantity WHERE (No dossier VN=FIELD(NŽ© Dossier),
            //- cmt mar:       Type=CONST(Item)));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(322; "Nbr Obligation"; Integer)
        {
            //- cmt mar:CalcFormula = Count("Payment Header" WHERE (No. Arrivage=FIELD(NŽ© Dossier)));
            FieldClass = FlowField;
        }
        field(323; Commentaire; Text[100])
        {
        }
        field(324; "Nbr DÔÇÜclaration"; Integer)
        {
            //- cmt mar:CalcFormula = Count("DÔÇÜclaration sur arrivage VN" WHERE (No. Dossier=FIELD(NŽ© Dossier)));
            FieldClass = FlowField;
        }
        field(325; "No. LC Banque"; Code[50])
        {
            //- cmt mar:CalcFormula = Lookup("Lettre de crÔÇÜdit L.C"."No. LC / Banque" WHERE (Code L.C=FIELD(No.L.C)));
            FieldClass = FlowField;
        }
        field(326; "Banque LC"; Code[20])
        {
            // Mr :CalcFormula = Lookup("Lettre de credit L.C"."Nom de la banque" WHERE(Code L.C=FIELD(No.L.C)));
            FieldClass = FlowField;
        }
        field(327; "Date Achat ÔÇª Terme"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(328; "Frais estimatifs"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                /*TESTFIELD("Taux change estimatif");
                IF CONFIRM('Voulez vous mátre ÔÇª jour le tableau de chage VIN avec le nouvaeu taux de change estimatif ',TRUE,FALSE) THEN
                BEGIN
                CLEAR(GLigneSuivi);
                GLigneSuivi.SETFILTER("No. Dossier",'%1',"NŽ© Dossier");
                IF GLigneSuivi.FIND('-') THEN
                REPEAT
                  GLigneSuivi.CALCFIELDS("Frais dapproches RÔÇÜelles");
                  IF ("Taux change estimatif" <> 0)    THEN
                    BEGIN
                      IF GLigneSuivi."Frais dapproches RÔÇÜelles" <> 0 THEN
                        BEGIN
                            GLigneSuivi."Taux de change estimatif" := "Taux change estimatif";
                            GLigneSuivi."Prix de revien estimatif" := (ABS(GLigneSuivi."Montant Achat Unitaire")*"Taux change estimatif") +
                                                                            ABS(GLigneSuivi."Frais dapproches RÔÇÜelles")  + GLigneSuivi.PVN;
                           IF GLigneSuivi."Prix de revien estimatif" <> 0 THEN
                            GLigneSuivi."Taux Marge estimative" := ((GLigneSuivi."Montant Facture Vente HT" - GLigneSuivi."Prix de revien estimatif" )/GLigneSuivi."Prix de revien estimatif")*100 ;
                        END
                        ELSE
                        BEGIN
                            GLigneSuivi."Taux de change estimatif" := "Taux change estimatif";
                            GLigneSuivi."Prix de revien estimatif" := (ABS(GLigneSuivi."Montant Achat Unitaire")*"Taux change estimatif") +
                                                                            ABS("Frais estimatifs")  + GLigneSuivi.PVN;
                           IF GLigneSuivi."Prix de revien estimatif" <> 0 THEN
                            GLigneSuivi."Taux Marge estimative" := ((GLigneSuivi."Montant Facture Vente HT" - GLigneSuivi."Prix de revien estimatif" )/GLigneSuivi."Prix de revien estimatif")*100 ;
                        END;
                    END
                    ELSE
                    BEGIN
                      GLigneSuivi."Taux de change estimatif" := 0;
                      GLigneSuivi."Frais de Change"          := 0;
                      GLigneSuivi."Prix de revien estimatif" := 0;
                      GLigneSuivi."Taux Marge estimative"    := 0;
                    END;
                GLigneSuivi.MODIFY;
                UNTIL GLigneSuivi.NEXT  = 0 ;
                END;
                */

            end;
        }
        field(329; "Taux change PrÔÇÜvisionel"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 8;

            trigger OnValidate();
            begin
                IF CONFIRM('Voulez vous mátre ÔÇª jour le tableau de chage VIN avec le nouvaeu taux de change PrÔÇÜvisionel ', TRUE, FALSE) THEN BEGIN
                    CLEAR(GLigneSuivi);
                    GLigneSuivi.SETFILTER("No. Dossier", '%1', "NŽ© Dossier");
                    IF GLigneSuivi.FIND('-') THEN
                        REPEAT
                            IF "Taux change PrÔÇÜvisionel" <> 0 THEN BEGIN

                                IF (GLigneSuivi."Taux change Devise Paiement" = 0) AND (GLigneSuivi."Montant Facture Vente HT" <> 0) THEN BEGIN
                                    GLigneSuivi."Taux de change PrÔÇÜvisonel" := "Taux change PrÔÇÜvisionel";
                                    GLigneSuivi."Prix de revien PrÔÇÜvisonel" := (ABS(GLigneSuivi."Montant Achat Unitaire") * GLigneSuivi."Taux de change PrÔÇÜvisonel") +
                                                                                    ABS(GLigneSuivi."Frais dapproches RÔÇÜelles");
                                    IF GLigneSuivi."Prix de revien PrÔÇÜvisonel" <> 0 THEN
                                        GLigneSuivi."Taux Marge PrÔÇÜvisonel" := ((GLigneSuivi."Montant Facture Vente HT" - GLigneSuivi."Prix de revien PrÔÇÜvisonel") / GLigneSuivi."Prix de revien PrÔÇÜvisonel") * 100;
                                END;
                            END
                            ELSE BEGIN
                                GLigneSuivi."Taux de change PrÔÇÜvisonel" := 0;
                                GLigneSuivi."Prix de revien PrÔÇÜvisonel" := 0;
                                GLigneSuivi."Taux Marge PrÔÇÜvisonel" := 0;
                            END;
                            GLigneSuivi.MODIFY;
                        UNTIL GLigneSuivi.NEXT = 0;
                end;
        }
        field(330; "No. DÔÇÜclaration douane"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No Dossier")
        {
        }
        key(Key2; "Date douverture")
        {
        }
        key(Key3; "NŽ© Transitaire", "Date DÔÇÜclaration", "No Dossier")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //ERROR('Vous ne pouvez pas suprimer ce dossier');
    end;

    trigger OnInsert();
    begin

        IF "NŽ© Dossier" = '' THEN BEGIN
            RecGPurchSetup.GET;
            RecGPurchSetup.TESTFIELD("Transit Folder Nos.");
            GestionNoSouche.InitSeries(RecGPurchSetup."Transit Folder Nos.", xRec."Souches de NŽ©", WORKDATE, "NŽ© Dossier", "Souches de NŽ©");
        END;

        "Date douverture" := WORKDATE;
    end;

    var
        EnteteAchat: Record 38;
        EcrArt: Record 32;
        NDossier: Record 50000;
        RecGPurchSetup: Record 312;
        FactureAchat: Record 122;
        // Mr : GestionNoSouche : Codeunit 396;
        NoArticlePrec: Code[20];
        NoCalcul: Integer;
        BonReceptions: Record 120;
        m: Integer;
        numdoc: Code[20];
        // Mr :gestsouche : Codeunit 396;
        NomFeuilleCpta: Record 232;
        Art: Record 27;
        LigFacture: Record 123;
        EntFact: Record 122;
        VAlEntry: Record 5802;
        Frs: Record 23;
        PostCode: Record 225;
        // Mr :CuGNoSeriesMgt : Codeunit 396;
        GLigneSuivi: Record 60092;

    procedure AssistEdit(OldDossier: Record "50000"): Boolean;
    begin
        RecGPurchSetup.GET;
        RecGPurchSetup.TESTFIELD(RecGPurchSetup."Transit Folder Nos.");
        IF CuGNoSeriesMgt.SelectSeries(RecGPurchSetup."Transit Folder Nos.", "Souches de NŽ©", "Souches de NŽ©") THEN BEGIN
            RecGPurchSetup.GET;
            RecGPurchSetup.TESTFIELD("Transit Folder Nos.");
            CuGNoSeriesMgt.SetSeries(OldDossier."NŽ© Dossier");
            EXIT(TRUE);
        END;
    end;

    procedure "VÔÇÜrifEcrtCpta"();
    var
        EcrtCpta: Record "17";
        LigFscpta: Record "81";
    begin
        /*CLEAR(EcrtCpta);
          EcrtCpta.RESET;
         EcrtCpta.SETFILTER("NŽ© Dossier", "NŽ© dossier");
        IF EcrtCpta.FIND('-') THEN
          ERROR('Vous ne pouvez pas modifier l''ÔÇÜtat de dossier NŽ© %1....',"NŽ© dossier");
          CLEAR(LigFscpta);
        LigFscpta.RESET;
        LigFscpta.SETFILTER("NŽ© Dossier","NŽ© dossier");
        IF LigFscpta.FIND('-') THEN
          LigFscpta.DELETEALL;
        LigFscptaB.RESET;
        LigFscptaB.SETFILTER("NŽ© Dossier","NŽ© dossier");
        IF LigFscptaB.FIND('-') THEN
          LigFscptaB.DELETEALL;
        */

    end;

    procedure FraisApproche() Frais: Decimal;
    begin
    end;

    procedure recalculercout();
    var
        dev: Record "330";
    begin
        /*ligdoss.RESET;
         ligdoss.SETFILTER("NŽ© dossier","NŽ© Dossier");
         IF ligdoss.FIND('-') THEN
           REPEAT
               IF ligdoss."Code devise"<>'' THEN
               BEGIN
              IF FORMAT("Date DÔÇÜclaration")='' THEN
                 ERROR('Voulez devez saisir la date de dÔÇÜclaration doÔÇôane !!!');
        
              ligdoss."CoÔÇôt unitaire (dev soc)":=dev.ExchangeAmtFCYToLCY("Date DÔÇÜclaration",ligdoss."Code devise",
              ligdoss."CoÔÇôt unitaire",dev.ExchangeRate("Date DÔÇÜclaration",ligdoss."Code devise"));
              ligdoss."Montant (dev soc)":=dev.ExchangeAmtFCYToLCY("Date DÔÇÜclaration",ligdoss."Code devise",
              ligdoss.Montant,dev.ExchangeRate("Date DÔÇÜclaration",ligdoss."Code devise"));
              ligdoss."Facteur devise":=dev.ExchangeRate("Date DÔÇÜclaration",ligdoss."Code devise");
              ligdoss.MODIFY;
              END;
            UNTIL  ligdoss.NEXT=0;
        */

    end;

    procedure "%fretM"() "%f": Decimal;
    begin
    end;

    procedure CalcCout();
    begin
    end;

    procedure ActualiserLignesFactures();
    begin
        /*ligdosTmp.RESET;
        ligdosTmp.SETFILTER("NŽ© dossier","NŽ© Dossier");
        IF ligdosTmp.FIND('-') THEN
         REPEAT
           LigFacture.RESET;
           LigFacture.SETCURRENTKEY("NŽ© Bon Reception","NŽ© Ligne Bon Reception",Type,"No.");
           LigFacture.SETFILTER("NŽ© Bon Reception",ligdosTmp."NŽ© rÔÇÜception");
           LigFacture.SETRANGE("NŽ© Ligne Bon Reception",ligdosTmp."NŽ© ligne rÔÇÜception");
           IF LigFacture.FIND('-') THEN BEGIN
             LigFacture."NŽ© dossier":="NŽ© Dossier";
             EntFact.RESET;
             EntFact.GET(LigFacture."Document No.");
        
             IF LigFacture.MODIFY THEN BEGIN
                EntFact."NŽ© dossier":="NŽ© Dossier";
                EntFact."Date DÔÇÜclaration" :="Date DÔÇÜclaration";
                EntFact.MODIFY;
                END;
             VAlEntry.RESET;
             VAlEntry.SETCURRENTKEY("NŽ© RÔÇÜception","NŽ© Ligne RÔÇÜception","Entry No.");
             VAlEntry.SETFILTER("NŽ© RÔÇÜception",ligdosTmp."NŽ© rÔÇÜception");
             VAlEntry.SETRANGE("NŽ© Ligne RÔÇÜception",ligdosTmp."NŽ© ligne rÔÇÜception");
             VAlEntry.MODIFYALL("NŽ© dossier","NŽ© Dossier");
             END;
           UNTIL ligdosTmp.NEXT=0;
        */

    end;

    procedure AnnActualiserLignesFactures();
    begin
        /*ligdosTmp.RESET;
        ligdosTmp.SETFILTER("NŽ© dossier","NŽ© Dossier");
        IF ligdosTmp.FIND('-') THEN
         REPEAT
           LigFacture.RESET;
           LigFacture.SETCURRENTKEY("NŽ© Bon Reception","NŽ© Ligne Bon Reception",Type,"No.");
           LigFacture.SETFILTER("NŽ© Bon Reception",ligdosTmp."NŽ© rÔÇÜception");
           LigFacture.SETRANGE("NŽ© Ligne Bon Reception",ligdosTmp."NŽ© ligne rÔÇÜception");
           IF LigFacture.FIND('-') THEN BEGIN
             LigFacture."NŽ© dossier":='';
             EntFact.RESET;
             EntFact.GET(LigFacture."Document No.");
        
             IF LigFacture.MODIFY THEN BEGIN
                EntFact."NŽ© dossier":='';
                EntFact."Date DÔÇÜclaration" :=0D;
                EntFact.MODIFY;
                END;
             END;
           UNTIL ligdosTmp.NEXT=0;
        */

    end;

    procedure Navigate();
    var
        NavigatePage: Page 344;
    begin
        NavigatePage.SetDoc("Date douverture", "NŽ© Dossier");
        NavigatePage.RUN;

    end;
}

