table 60010 "Ligne reception service Rapide"
{
    // version SAV Automobile


    fields
    {
        field(1;"Reception No.";Code[20])
        {
            CaptionML = ENU='Receipt No.',
                        FRA='Reception No.';
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='Ligne No.';
            Editable = false;
        }
        field(3;Type;Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU='Item,Cost,Resource',
                              FRA='Article,Coût,Ressource';
            OptionMembers = Item,Cost,Resource;

            trigger OnValidate();
            var
                WhseValidateSourceLine : Codeunit "5777";
            begin
            end;
        }
        field(4;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            TableRelation = IF (Type=CONST(Item),
                                Type opération=CONST(rapid service)) Item WHERE (Type=CONST(Inventory),
                                                                                 Additional Sales=FILTER(No),
                                                                                 Item type=FILTER(<>' '))
                                                                                 ELSE IF (Type=CONST(Item),
                                                                                          Type opération=CONST(Additional Sales)) Item WHERE (Type=CONST(Inventory),
                                                                                                                                              Additional Sales=FILTER(Yes),
                                                                                                                                              Item type=FILTER(<>' '))
                                                                                                                                              ELSE IF (Type=CONST(Cost)) "Service Cost";

            trigger OnValidate();
            var
                WhseValidateSourceLine : Codeunit "5777";
            begin
                 IF Type=Type::Item THEN
                 BEGIN
                     RecItem.GET("No.");
                     //OLD Description :=  RecItem.Description;
                      IF RecItem.Description <> '' THEN
                       Description :=  RecItem.Description
                     ELSE
                       Description := RecItem."Description 2";
                     "Unit Of Measure" := RecItem."Base Unit of Measure";
                     "Prix Estimatif":= RecItem."Unit Price";
                     //KK___Remise Compagne
                     CampaignExist := FALSE;
                     Campaign.RESET;
                     Campaign.SETFILTER("Starting Date",'<=%1',WORKDATE);
                     Campaign.SETFILTER("Ending Date",'>=%1',WORKDATE);
                     IF Campaign.COUNT > 1 THEN
                       ERROR(TxtErr001);
                     IF Campaign.FINDFIRST THEN
                       BEGIN
                         CampaignExist := TRUE;
                         CampaignDiscount := Campaign."% Remise";
                         AppliqueRemiseCompagne := FALSE;
                         IF (Campaign."Tous les Clients") THEN
                           AppliqueRemiseCompagne := TRUE;

                         IF NOT AppliqueRemiseCompagne THEN
                           BEGIN
                             //Check Customer
                             CustOk := FALSE;
                             IF Campaign."Tous les Clients" THEN
                               CustOk := TRUE
                             ELSE
                               BEGIN
                                 ReceptionSAV.GET("Reception No.");
                                 Customer.GET(ReceptionSAV."Customer No.");
                                 Customer.TESTFIELD("Customer Posting Group");

                                 ClientCompagnePromo.RESET;
                                 ClientCompagnePromo.SETRANGE("No. Compagne",Campaign."No.");
                                 ClientCompagnePromo.SETRANGE("Groupe Compta. Client",Customer."Customer Posting Group");
                                 IF ClientCompagnePromo.FINDFIRST THEN
                                   CustOk := TRUE;
                                END;

                            IF CustOk AND CampaignExist THEN
                              BEGIN
                                RecItem.TESTFIELD("Product Code");

                                NomoclatureServiceCompPromo.RESET;
                                NomoclatureServiceCompPromo.SETRANGE("No. Compagne",Campaign."No.");
                                NomoclatureServiceCompPromo.SETRANGE("Product Code",RecItem."Product Code");
                                IF NomoclatureServiceCompPromo.FINDFIRST THEN
                                  "% Remise Compagne" := CampaignDiscount;
                              END;
                           END;
                       END;
                     //END KK
                 END
                ELSE
                 BEGIN
                     RecServicesCost.GET("No.");
                     Description :=  RecServicesCost.Description;
                     "Unit Of Measure" := RecServicesCost."Unit of Measure Code";
                     "Prix Estimatif":=RecServicesCost."Default Unit Price";
                 END;
            end;
        }
        field(5;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(6;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
        }
        field(7;status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            OptionCaptionML = ENU='Approved,Rejected',
                              FRA='Accepté,Rejeté';
            OptionMembers = Approved,Rejected;
        }
        field(8;"Unit Of Measure";Code[20])
        {
            CaptionML = ENU='Unit Of Measure',
                        FRA='Unité de Mesure';
        }
        field(9;"Type opération";Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU='rapid service,Additional Sales',
                              FRA='Service Rapide,Vente Additionnelle';
            OptionMembers = "rapid service","Additional Sales";
        }
        field(10;"Copied To Doc No.";Code[20])
        {
        }
        field(11;"Service Item No.";Code[20])
        {
            CaptionML = ENU='Service Item No.',
                        FRA='Num article de service';
            TableRelation = "Service Item".No.;

            trigger OnValidate();
            var
                RecItemService : Record "5940";
            begin
            end;
        }
        field(12;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='Client N°';
            TableRelation = Customer.No.;

            trigger OnValidate();
            var
                RecCustomer : Record "18";
            begin
            end;
        }
        field(13;"Creation date";Date)
        {
            CaptionML = ENU='Creation date',
                        FRA='Date de Création';
        }
        field(14;"Copied From Doc No.";Code[20])
        {
        }
        field(15;"copied From Line No.";Integer)
        {
        }
        field(50000;"Type Effet CLT";Option)
        {
            Description = 'NM181016';
            OptionCaption = 'EFFET CLIENT,LDT';
            OptionMembers = "EFFET CLIENT",LDT;
        }
        field(50001;ACCEPTE;Boolean)
        {
            Description = 'NM181016';
        }
        field(50002;"Nbre Heures Affecté";Decimal)
        {
            CalcFormula = Sum("Service Order Allocation"."Allocated Hours" WHERE (Réception No.=FIELD(Reception No.),
                                                                                  Line No.=FIELD(Line No.)));
            Description = 'SAV0045';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003;"Clôturés";Boolean)
        {
            Description = 'SAV0045';
        }
        field(50004;"Chef d'équipe";Code[10])
        {
            Description = 'SAV0045';
            TableRelation = "Resource Group";
        }
        field(50005;Copie;Boolean)
        {
        }
        field(50006;Statut;Option)
        {
            Description = 'KT Création,Demande Approbation,Approuvée,Refusée';
            OptionCaptionML = ENU=' ,Création,Demande Approbation,Approuvée,Refusée',
                              FRA=' ,Création,Demande Approbation,Approuvée,Refusée';
            OptionMembers = " ","Création","Demande Approbation","Approuvée","Refusée";
        }
        field(50007;"Date Décision";DateTime)
        {
            Description = 'Approbation/Refus';
            Editable = false;
        }
        field(50008;"Décision Prise Par";Code[50])
        {
            Editable = false;
        }
        field(50009;"Instruction No.";Code[20])
        {
            CaptionML = ENU='Instruction No.',
                        FRA='N° Instruction';
            TableRelation = Instruction.No.;

            trigger OnValidate();
            begin
                Instruction.RESET;
                Instruction.SETRANGE("No.","Instruction No.");
                IF Instruction.FINDFIRST THEN
                  "Instruction Description":=Instruction.Description;
            end;
        }
        field(50010;"Instruction Description";Text[50])
        {
            CaptionML = ENU='Instruction Description',
                        FRA='Désignation Instruction';
        }
        field(50011;"Complément";Boolean)
        {
            CaptionML = ENU='Complement',
                        FRA='Complément';
        }
        field(50012;"Date création";DateTime)
        {
            Editable = false;
        }
        field(50013;"Créé par";Code[50])
        {
            Editable = false;
        }
        field(50014;"Date Refus";DateTime)
        {
        }
        field(50015;"Code Zone panne";Code[20])
        {
            TableRelation = "Fault Area";

            trigger OnValidate();
            begin
                FaultArea.RESET;
                IF FaultArea.GET("Code Zone panne") THEN
                "Description Zone":=FaultArea.Description;
            end;
        }
        field(50016;"Code Symptome";Code[20])
        {
            TableRelation = "Symptom Code";

            trigger OnValidate();
            var
                RecCodeSymptome : Record "5916";
            begin
                IF RecCodeSymptome.GET("Code Symptome") THEN
                    "Description symptome":=RecCodeSymptome.Description;
            end;
        }
        field(50017;"Description symptome";Text[50])
        {
        }
        field(50018;Garantie;Boolean)
        {
            Description = 'SM MAZDA19';
        }
        field(50019;"Description Zone";Text[50])
        {
            Description = 'SM';
        }
        field(50020;"Prix Estimatif";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'AK250319';
        }
        field(50021;"Prix Total";Decimal)
        {
            CalcFormula = Sum("Ligne reception service Rapide"."Prix Estimatif" WHERE (Reception No.=FIELD(Reception No.)));
            Description = 'AK250319';
            FieldClass = FlowField;
        }
        field(50022;"Code Compagne";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Campaign;
        }
        field(50023;"% Remise Compagne";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Reception No.","Line No.")
        {
        }
        key(Key2;"Service Item No.",status)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //<< update original document from

        IF "Copied From Doc No." <> '' THEN
          BEGIN
            IF RecLigneRecpServRap.GET("Copied From Doc No.","copied From Line No.") THEN
               BEGIN
                RecLigneRecpServRap."Copied To Doc No." := '';
                RecLigneRecpServRap.MODIFY;
               END;
          END;
    end;

    trigger OnInsert();
    var
        Rec2 : Record "60010";
        RecGLigRcptSrv : Record "60010";
    begin

        //----> Insertion de la N° Client, Item Service No
        IF RecReceptionSAV.GET("Reception No.") THEN
          BEGIN
            "Service Item No.":=RecReceptionSAV."Service Item No.";
            "Customer No." :=RecReceptionSAV."Customer No.";
           // "Creation date" :=RecReceptionSAV."Creation date";

              RecGLigRcptSrv.SETRANGE(RecGLigRcptSrv."Reception No.","Reception No.");

              IF RecGLigRcptSrv.FINDLAST THEN
                  "Line No." := RecGLigRcptSrv."Line No." + 10000
                ELSE
                  "Line No." := 10000 ;
          END;
    end;

    var
        RecLigneRecpServRap : Record "60010";
        RecReceptionSAV : Record "60008";
        RecItem : Record "27";
        RecServicesCost : Record "5905";
        Instruction : Record "60070";
        FaultArea : Record "5915";
        CampaignExist : Boolean;
        Campaign : Record "5071";
        TxtErr001 : Label '"Il existe plusieurs campagnes promotionnelles encours ! Veuillez contacter votre administrateur ! "';
        CampaignDiscount : Decimal;
        AppliqueRemiseCompagne : Boolean;
        CustOk : Boolean;
        ReceptionSAV : Record "60008";
        Customer : Record "18";
        ClientCompagnePromo : Record "50016";
        NomoclatureServiceCompPromo : Record "50017";

    procedure InitRecpt("No Reception" : Code[20];"Model Vehicule" : Code[20]);
    begin
    end;
}

