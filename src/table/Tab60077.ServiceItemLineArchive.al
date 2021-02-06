table 60077 "Service Item Line Archive"
{
    // version NAVW111.00,T180001

    //  T180001 ZM 05/10/2018 : upgrade
    //  décommenter ERROR(Text023,ServItem.TABLECAPTION);

    CaptionML = ENU='Service Item Line',
                FRA='Ligne article de service';
    DrillDownPageID = 5903;
    LookupPageID = 5903;
    Permissions = TableData 5914=rimd,
                  TableData 5950=rimd;

    fields
    {
        field(1;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
            Editable = false;
            TableRelation = "Service Header".No. WHERE (Document Type=FIELD(Document Type));
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(3;"Service Item No.";Code[20])
        {
            CaptionML = ENU='Service Item No.',
                        FRA='N° article de service';
            TableRelation = "Service Item".No.;

            trigger OnValidate();
            var
                Cust : Record "18";
                ServContractList : Page "6075";
            begin

            end;
        }
        field(4;"Service Item Group Code";Code[10])
        {
            CaptionML = ENU='Service Item Group Code',
                        FRA='Code gpe articles de service';
            TableRelation = "Service Item Group".Code;
        }
        field(5;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
            TableRelation = Item.No. WHERE (Statut=FILTER(Validated));
        }
        field(6;"Serial No.";Code[20])
        {
            CaptionML = ENU='Serial No.',
                        FRA='N° de série';
        }
        field(7;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Description';
        }
        field(8;"Description 2";Text[50])
        {
            CaptionML = ENU='Description 2',
                        FRA='Description 2';
        }
        field(9;"Repair Status Code";Code[10])
        {
            CaptionML = ENU='Repair Status Code',
                        FRA='Code état réparation';
            TableRelation = "Repair Status";
        }
        field(10;Priority;Option)
        {
            CaptionML = ENU='Priority',
                        FRA='Priorité';
            OptionCaptionML = ENU='Low,Medium,High',
                              FRA='Faible,Moyenne,Haute';
            OptionMembers = Low,Medium,High;
        }
        field(11;"Response Time (Hours)";Decimal)
        {
            CaptionML = ENU='Response Time (Hours)',
                        FRA='Délai de réponse (heures)';
            DecimalPlaces = 0:5;
        }
        field(12;"Response Date";Date)
        {
            CaptionML = ENU='Response Date',
                        FRA='Date de réponse';
        }
        field(13;"Response Time";Time)
        {
            CaptionML = ENU='Response Time',
                        FRA='Délai de réponse';
        }
        field(14;"Starting Date";Date)
        {
            CaptionML = ENU='Starting Date',
                        FRA='Date début';
        }
        field(15;"Starting Time";Time)
        {
            CaptionML = ENU='Starting Time',
                        FRA='Heure début';
        }
        field(16;"Finishing Date";Date)
        {
            CaptionML = ENU='Finishing Date',
                        FRA='Date fin';
        }
        field(17;"Finishing Time";Time)
        {
            CaptionML = ENU='Finishing Time',
                        FRA='Heure fin';
        }
        field(18;"Service Shelf No.";Code[10])
        {
            CaptionML = ENU='Service Shelf No.',
                        FRA='N° rayon service';
            TableRelation = "Service Shelf";
        }
        field(19;"Warranty Starting Date (Parts)";Date)
        {
            CaptionML = ENU='Warranty Starting Date (Parts)',
                        FRA='Date début garantie (pièces)';
        }
        field(20;"Warranty Ending Date (Parts)";Date)
        {
            CaptionML = ENU='Warranty Ending Date (Parts)',
                        FRA='Date fin garantie (pièces)';
        }
        field(21;Warranty;Boolean)
        {
            CaptionML = ENU='Warranty',
                        FRA='Garantie';
            Editable = false;
        }
        field(22;"Warranty % (Parts)";Decimal)
        {
            CaptionML = ENU='Warranty % (Parts)',
                        FRA='% garantie (pièces)';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(23;"Warranty % (Labor)";Decimal)
        {
            CaptionML = ENU='Warranty % (Labor)',
                        FRA='% garantie (M.O.)';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(24;"Warranty Starting Date (Labor)";Date)
        {
            CaptionML = ENU='Warranty Starting Date (Labor)',
                        FRA='Date début garantie (M.O.)';

            trigger OnValidate();
            begin
                /*TMP KAIS 170917IF "Service Item No." <> '' THEN BEGIN
                  ServItem.GET("Service Item No.");
                  IF "Warranty Starting Date (Labor)" <> ServItem."Warranty Starting Date (Labor)" THEN;
                    ERROR(Text023,ServItem.TABLECAPTION);
                END;
                
                IF "Warranty Starting Date (Labor)" <> 0D THEN BEGIN
                  ServMgtSetup.GET;
                  "Warranty Ending Date (Labor)" := CALCDATE(ServMgtSetup."Default Warranty Duration","Warranty Starting Date (Labor)");
                  "Warranty % (Parts)" := ServMgtSetup."Warranty Disc. % (Parts)";
                  "Warranty % (Labor)" := ServMgtSetup."Warranty Disc. % (Labor)";
                END ELSE BEGIN
                  "Warranty Ending Date (Labor)" := 0D;
                  "Warranty % (Labor)" := 0;
                END;
                */

            end;
        }
        field(25;"Warranty Ending Date (Labor)";Date)
        {
            CaptionML = ENU='Warranty Ending Date (Labor)',
                        FRA='Date fin garantie (M.O.)';
        }
        field(26;"Contract No.";Code[20])
        {
            CaptionML = ENU='Contract No.',
                        FRA='N° contrat';
            TableRelation = "Service Contract Header"."Contract No." WHERE (Contract Type=CONST(Contract));

            trigger OnLookup();
            var
                ServHeader : Record "5900";
                ServContractLine : Record "5964";
                ServContractList : Page "6075";
            begin
            end;
        }
        field(27;"Location of Service Item";Text[30])
        {
            CalcFormula = Lookup("Service Item"."Location of Service Item" WHERE (No.=FIELD(Service Item No.)));
            CaptionML = ENU='Location of Service Item',
                        FRA='Magasin article de service';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28;"Loaner No.";Code[20])
        {
            CaptionML = ENU='Loaner No.',
                        FRA='N° article de prêt';
            TableRelation = Loaner.No.;

            trigger OnValidate();
            var
                LoanerEntry : Record "5914";
            begin
            end;
        }
        field(29;"Vendor No.";Code[20])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° fournisseur';
            TableRelation = Vendor;
        }
        field(30;"Vendor Item No.";Text[20])
        {
            CaptionML = ENU='Vendor Item No.',
                        FRA='Référence fournisseur';
        }
        field(31;"Fault Reason Code";Code[10])
        {
            CaptionML = ENU='Fault Reason Code',
                        FRA='Code motif panne';
            TableRelation = "Fault Reason Code";

            trigger OnValidate();
            var
                FaultReasonCode : Record "5917";
                RecR : RecordRef;
                TypeR : FieldRef;
                TypeStr : Text[50];
            begin
            end;
        }
        field(32;"Service Price Group Code";Code[10])
        {
            CaptionML = ENU='Service Price Group Code',
                        FRA='Code groupe tarifs service';
            TableRelation = "Service Price Group";

            trigger OnValidate();
            var
                ServPriceGrSetup : Record "6081";
                ServPriceMgmt : Codeunit "6080";
            begin
            end;
        }
        field(33;"Fault Area Code";Code[10])
        {
            CaptionML = ENU='Fault Area Code',
                        FRA='Code zone panne';
            TableRelation = "Fault Area";

            trigger OnValidate();
            var
                ServPriceMgmt : Codeunit "6080";
            begin
            end;
        }
        field(34;"Symptom Code";Code[10])
        {
            CaptionML = ENU='Symptom Code',
                        FRA='Code symptôme';
            TableRelation = "Symptom Code";
        }
        field(35;"Fault Code";Code[10])
        {
            CaptionML = ENU='Fault Code',
                        FRA='Code panne';
            TableRelation = "Fault Code".Code WHERE (Fault Area Code=FIELD(Fault Area Code),
                                                     Symptom Code=FIELD(Symptom Code));
        }
        field(36;"Resolution Code";Code[10])
        {
            CaptionML = ENU='Resolution Code',
                        FRA='Code solution';
            TableRelation = "Resolution Code";
        }
        field(37;"Fault Comment";Boolean)
        {
            CalcFormula = Exist("Service Comment Line" WHERE (Table Name=CONST(Service Header),
                                                              Table Subtype=FIELD(Document Type),
                                                              No.=FIELD(Document No.),
                                                              Type=CONST(Fault),
                                                              Table Line No.=FIELD(Line No.)));
            CaptionML = ENU='Fault Comment',
                        FRA='Commentaire panne';
            Editable = false;
            FieldClass = FlowField;
        }
        field(38;"Resolution Comment";Boolean)
        {
            CalcFormula = Exist("Service Comment Line" WHERE (Table Name=CONST(Service Header),
                                                              Table Subtype=FIELD(Document Type),
                                                              No.=FIELD(Document No.),
                                                              Type=CONST(Resolution),
                                                              Table Line No.=FIELD(Line No.)));
            CaptionML = ENU='Resolution Comment',
                        FRA='Commentaire solution';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(Item No.));
        }
        field(41;"Service Item Loaner Comment";Boolean)
        {
            CalcFormula = Exist("Service Comment Line" WHERE (Table Name=CONST(Service Header),
                                                              Table Subtype=FIELD(Document Type),
                                                              No.=FIELD(Document No.),
                                                              Type=CONST(Service Item Loaner),
                                                              Table Line No.=FIELD(Line No.)));
            CaptionML = ENU='Service Item Loaner Comment',
                        FRA='Commentaire service article de prêt';
            Editable = false;
            FieldClass = FlowField;
        }
        field(42;"Actual Response Time (Hours)";Decimal)
        {
            CaptionML = ENU='Actual Response Time (Hours)',
                        FRA='Délai de réponse réel (heures)';
            DecimalPlaces = 0:5;
        }
        field(43;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            Editable = false;
            OptionCaptionML = ENU='Quote,Order',
                              FRA='Devis,Commande';
            OptionMembers = Quote,"Order";
        }
        field(44;"Serv. Price Adjmt. Gr. Code";Code[10])
        {
            CaptionML = ENU='Serv. Price Adjmt. Gr. Code',
                        FRA='Code groupe ajust. prix serv.';
            Editable = false;
            TableRelation = "Service Price Adjustment Group";
        }
        field(45;"Adjustment Type";Option)
        {
            CaptionML = ENU='Adjustment Type',
                        FRA='Type ajustement';
            Editable = false;
            OptionCaptionML = ENU='Fixed,Maximum,Minimum',
                              FRA='Fixe,Maximum,Minimum';
            OptionMembers = "Fixed",Maximum,Minimum;
        }
        field(46;"Base Amount to Adjust";Decimal)
        {
            CaptionML = ENU='Base Amount to Adjust',
                        FRA='Montant base à ajuster';
            Editable = false;
        }
        field(60;"No. of Active/Finished Allocs";Integer)
        {
            CalcFormula = Count("Service Order Allocation" WHERE (Document Type=FIELD(Document Type),
                                                                  Document No.=FIELD(Document No.),
                                                                  Service Item Line No.=FIELD(Line No.),
                                                                  Resource No.=FIELD(Resource Filter),
                                                                  Resource Group No.=FIELD(Resource Group Filter),
                                                                  Allocation Date=FIELD(Allocation Date Filter),
                                                                  Status=FILTER(Active|Finished)));
            CaptionML = ENU='No. of Active/Finished Allocs',
                        FRA='Nbre affect. actives/terminées';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61;"No. of Allocations";Integer)
        {
            CalcFormula = Count("Service Order Allocation" WHERE (Status=FIELD(Allocation Status Filter),
                                                                  Resource No.=FIELD(Resource Filter),
                                                                  Resource Group No.=FIELD(Resource Group Filter),
                                                                  Document Type=FIELD(Document Type),
                                                                  Document No.=FIELD(Document No.),
                                                                  Service Item Line No.=FIELD(Line No.)));
            CaptionML = ENU='No. of Allocations',
                        FRA='Nbre affectations';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62;"No. of Previous Services";Integer)
        {
            CalcFormula = Count("Service Shipment Item Line" WHERE (Item No.=FIELD(Item No.),
                                                                    Serial No.=FIELD(Serial No.)));
            CaptionML = ENU='No. of Previous Services',
                        FRA='N° services précédents';
            Editable = false;
            FieldClass = FlowField;
        }
        field(63;"Contract Line No.";Integer)
        {
            CaptionML = ENU='Contract Line No.',
                        FRA='N° ligne contrat';
            TableRelation = "Service Contract Line"."Line No." WHERE (Contract Type=CONST(Contract),
                                                                      Contract No.=FIELD(Contract No.));
        }
        field(64;"Ship-to Code";Code[10])
        {
            CaptionML = ENU='Ship-to Code',
                        FRA='Code destinataire';
            Editable = false;
            TableRelation = "Ship-to Address".Code WHERE (Customer No.=FIELD(Customer No.));
        }
        field(65;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='N° client';
            Editable = false;
            TableRelation = Customer.No.;
        }
        field(91;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            FieldClass = FlowFilter;
        }
        field(92;"Resource Filter";Code[20])
        {
            CaptionML = ENU='Resource Filter',
                        FRA='Filtre ressource';
            FieldClass = FlowFilter;
            TableRelation = Resource;
        }
        field(93;"Allocation Date Filter";Date)
        {
            CaptionML = ENU='Allocation Date Filter',
                        FRA='Filtre date affectation';
            FieldClass = FlowFilter;
        }
        field(94;"Repair Status Code Filter";Code[10])
        {
            CaptionML = ENU='Repair Status Code Filter',
                        FRA='Filtre code état réparation';
            FieldClass = FlowFilter;
            TableRelation = "Repair Status".Code;
        }
        field(96;"Allocation Status Filter";Option)
        {
            CaptionML = ENU='Allocation Status Filter',
                        FRA='Filtre état affectation';
            FieldClass = FlowFilter;
            OptionCaptionML = ENU='Nonactive,Active,Finished,Canceled,Reallocation Needed',
                              FRA='Non active,Active,Terminée,Annulée,Réaffectation nécessaire';
            OptionMembers = Nonactive,Active,Finished,Canceled,"Reallocation Needed";
        }
        field(97;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            Editable = false;
            TableRelation = "Responsibility Center";
        }
        field(98;"Service Order Filter";Code[20])
        {
            CaptionML = ENU='Service Order Filter',
                        FRA='Filtre commande service';
            FieldClass = FlowFilter;
            TableRelation = "Service Header".No.;
        }
        field(99;"Resource Group Filter";Code[20])
        {
            CaptionML = ENU='Resource Group Filter',
                        FRA='Filtre gpe ressources';
            FieldClass = FlowFilter;
            TableRelation = "Resource Group";
        }
        field(100;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1),
                                                          Blocked=CONST(No));
        }
        field(101;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2),
                                                          Blocked=CONST(No));
        }
        field(130;"Release Status";Option)
        {
            CaptionML = ENU='Release Status',
                        FRA='Statut de lancement';
            OptionCaptionML = ENU='Open,Released to Ship',
                              FRA='Ouvert,Lancer pour expédition';
            OptionMembers = Open,"Released to Ship";
        }
        field(480;"Dimension Set ID";Integer)
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(60000;"Reception No";Code[20])
        {
            CaptionML = ENU='Receive No.',
                        FRA='Reception N°';
        }
        field(60001;"No. Version";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.","No. Version")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        LoanerEntry : Record "5914";
    begin
    end;

    var
        Text000 : TextConst ENU='The %1 allows only one %2 in each %3.',FRA='%1 ne permet de définir qu''une %2 par %3.';
        Text001 : TextConst ENU='You cannot insert %1, because %2 is missing in %3 %4.\\You can create a customer by clicking Functions,Create Customer.',FRA='Vous ne pouvez pas insérer de %1, car il manque un %2 dans une %3 %4.\\Vous pouvez créer un client en cliquant sur Fonctions, Créer client.';
        Text002 : TextConst ENU='You cannot insert %1, because %2 is missing in %3 %4.',FRA='Vous ne pouvez pas insérer de %1, car il manque un %2 dans une %3 %4.';
        Text003 : TextConst ENU='You have changed one of the fault reporting codes on the %1, but it has not been changed on the existing service lines. You must update the existing service lines manually.',FRA='Vous avez modifié un des codes reporting panne dans le/la %1, mais il ne l''a pas été dans les lignes service existantes. Vous devez mettre à jour les lignes service existantes manuellement.';
        Text006 : TextConst ENU='You cannot delete %1 %2,%3, because %4 %5 has not been received.',FRA='Vous ne pouvez pas supprimer la %1 %2, %3, car l''%4 %5 n''a pas été réceptionné.';
        Text008 : TextConst ENU='You cannot delete %1 %2,%3, because %4 is attached to it.',FRA='Vous ne pouvez pas supprimer la %1 %2, %3, car il existe une %4 liée.';
        Text010 : TextConst ENU='You cannot rename a %1.',FRA='Vous ne pouvez pas renommer l''enregistrement %1.';
        Text011 : TextConst ENU='You cannot change the %1 on the %2, because %3 is attached to it.',FRA='Vous ne pouvez pas modifier le %1 sur la %2, car il existe une %3 liée.';
        Text012 : TextConst ENU='%1 %2 does not belong to %3 %4.',FRA='L''%1 %2 n''appartient pas au %3 %4.';
        Text016 : TextConst ENU='You cannot change the %1 field because it is linked to the %2 specified on the line.',FRA='Vous ne pouvez pas modifier le champ %1, car il est lié au %2 spécifié sur la ligne.';
        Text018 : TextConst ENU='The %1 cannot be greater than the %2 %3.',FRA='%1 doit être inférieur(e) à %3 dans %2.';
        Text019 : TextConst ENU='The %1 cannot be earlier than the %2.',FRA='%2 doit être antérieur(e) à %1.';
        Text020 : TextConst ENU='The %1 cannot be greater than the %2.',FRA='%2 doit être inférieur(e) à %1.';
        Text022 : TextConst ENU='The %1 cannot be earlier than the %2 %3.',FRA='%1 doit être antérieure à %2 dans %3.';
        Text023 : TextConst ENU='You cannot change the warranty information because %1 is selected.',FRA='Vous ne pouvez pas modifier les informations de la garantie car %1 est sélectionné.';
        Text024 : TextConst ENU='Do you want to activate a warranty for this service item line?',FRA='Souhaitez-vous définir une garantie pour cette ligne article de service ?';
        Text025 : TextConst ENU='Do you want to deactivate the warranty for this service item line?',FRA='Souhaitez-vous supprimer la garantie pour cette ligne article de service ?';
        Text026 : TextConst ENU='You cannot reset the %1 field.\You can receive it by clicking Functions, Receive Loaner.',FRA='Vous ne pouvez pas supprimer la valeur du champ %1.\Vous pouvez la recevoir en cliquant sur Fonctions, Réceptionner article de prêt.';
        Text028 : TextConst Comment='1%=FIELDCAPTION("Loaner No."); 2%=FORMAT(ServHeader."Document Type"); 3%=ServHeader.FIELDCAPTION("No."); 4%=ServHeader."No.");',ENU='You cannot change the %1, because it has been lent in connection with %2 %3 %4.\\You can receive it by clicking Functions, Receive Loaner.',FRA='Vous ne pouvez pas modifier la valeur de %1, car elle a été prêtée via %2 %3 %4.\\ Vous pouvez la recevoir en cliquant sur Fonctions, Réceptionner article de prêt.';
        Text029 : TextConst ENU='Do you want to lend %1 %2?',FRA='Souhaitez-vous prêter %1 %2 ?';
        Text030 : TextConst Comment='1%=TempServItemLine.FIELDCAPTION("Loaner No."); 2%=TempServItemLine."Loaner No."; 3%=FORMAT(ServHeader."Document Type"); 4%=ServHeader.FIELDCAPTION("No."); 5%=ServHeader."No.");',ENU='%1 %2 has already been lent within %3 %4 %5.',FRA='%1 %2 a déjà été prêté dans %3 %4 %5.';
        ServMgtSetup : Record "5911";
        ServOrderAlloc : Record "5950";
        ServItem : Record "5940";
        ServContract : Record "5965";
        ServLine : Record "5902";
        ServItemLine : Record "5901";
        ServHour : Record "5910";
        ServHour2 : Record "5910";
        ServHeader : Record "5900";
        ServHeader2 : Record "5900";
        ServHeader3 : Record "5900";
        ServCommentLine : Record "5906";
        ServItemGr : Record "5904";
        RepairStatus : Record "5927";
        RepairStatus2 : Record "5927";
        Loaner : Record "5913";
        ServContractLine : Record "5964";
        Item : Record "27";
        ServLogMgt : Codeunit "5906";
        ServOrderAllocMgt : Codeunit "5930";
        ServOrderMgt : Codeunit "5900";
        SegManagement : Codeunit "5051";
        ServLoanerMgt : Codeunit "5901";
        DimMgt : Codeunit "408";
        NoOfRec : Integer;
        TempDay : Integer;
        FirstServItemLine : Boolean;
        TempDate : Date;
        Text033 : TextConst ENU='A service item line cannot belong to a service contract and to a service price group at the same time.',FRA='Il n''est pas possible de sélectionner une ligne article de service appartenant à la fois à un contrat service et à un groupe tarifs service.';
        Text035 : TextConst ENU='The %1 %2 cannot be used in service orders.',FRA='Le %1 %2 ne peut pas être utilisé dans les commandes service.';
        Text036 : TextConst ENU='The %1 %2 cannot be used in service quotes.',FRA='Le %1 %2 ne peut pas être utilisé dans les devis service.';
        RepairStatusPriority : Integer;
        UseLineNo : Integer;
        Text037 : TextConst ENU='It is not possible to select %1 because some linked service lines have been posted.',FRA='Il n''est pas possible de sélectionner %1 car certaines lignes service associées ont été validées.';
        LoanerLent : Boolean;
        ServContractExist : Boolean;
        Text038 : TextConst ENU='Price adjustment on each existing %1 will be cancelled. Continue?',FRA='L''ajustement des prix sur chaque %1 existant(e) sera annulé. Souhaitez-vous continuer ?';
        Text039 : TextConst ENU='The update has been interrupted to respect the warning.',FRA='La mise à jour a été interrompue pour respecter l''alerte.';
        HideDialogBox : Boolean;
        Text040 : TextConst ENU='The selected %1 has a different %2 for this %3.\\Do you want to continue?',FRA='L''%1 a un %2 différent pour ce %3.\\Souhaitez-vous continuer ?';
        Text041 : TextConst Comment='1%=ServHour.FIELDCAPTION("Starting Time"); 2%=ServHour.Day; 3%=Text058=''Service Hours''; %4=ServHour.FIELDCAPTION("Service Contract No.");%5="Contract No.");',ENU='You must specify %1 on %2 in the %3 window for the %4 %5.',FRA='Vous devez spécifier une valeur %1 dans le champ %2 de la fenêtre %3 pour l''enregistrement %4 %5.';
        Text042 : TextConst ENU='You must specify %1 on %2 in the %3 window.',FRA='Vous devez spécifier une valeur %1 dans le champ %2 de la fenêtre %3.';
        Text043 : TextConst Comment='3%=FIELDCAPTION("Starting Date"); 4%=ServHour."Starting Date"; 6%=ServHour.FIELDCAPTION("Service Contract No."); 7%="Contract No.");',ENU='You must specify %1 on %2, %3 %4 in the %5 window for the %6 %7.',FRA='Vous devez spécifier une %1 pour %2, %3 %4 dans la fenêtre %5 pour le %6 %7.';
        Text044 : TextConst Comment='1%=ServHour.FIELDCAPTION("Starting Time"); 2%=ServHour.Day; 3%=ServHour.FIELDCAPTION("Starting Date"); 4%=ServHour."Starting Date"; 5%=Text057=''Default Service Hours'';',ENU='You must specify %1 on %2, %3 %4 in the %5 window.',FRA='Vous devez spécifier une %1 pour %2, %3 %4 dans la fenêtre %5.';
        Text045 : TextConst ENU='The %1 for this %2 occurs in more than 1 year. Please verify the setting for service hours and the %3 for the %4.',FRA='La %1 de cette %2 fait référence à une date à plus d''un an. Vérifiez la configuration des heures de service et de %3 pour %4.';
        Text047 : TextConst ENU='Service item %1 is included in more than one contract.\\Do you want to assign a contract number to the service order line?',FRA='L''article de service %1 est inclus dans plusieurs contrats.\\Souhaitez-vous affecter un numéro de contrat à la ligne commande service ?';
        Text048 : TextConst ENU='You cannot change the %1 because it has already been set on the header.',FRA='Vous ne pouvez pas modifier la valeur %1 car elle a déjà été paramétrée dans l''en-tête.';
        Text049 : TextConst ENU='Contract %1 does not include service item %2.',FRA='Le contrat %1 n''inclut pas l''article de service %2.';
        Text050 : TextConst ENU='Service contract %1 specified on the service order header does not include service item %2.',FRA='Le contrat de service %1 spécifié dans l''en-tête commande service n''inclut pas l''article de service %2.';
        Text051 : TextConst ENU='You cannot select contract %1 because it is owned by another customer.',FRA='Vous ne pouvez pas sélectionner le contrat %1 car il appartient à un autre client.';
        Text052 : TextConst ENU='Contract %1 is not signed.',FRA='Le contrat %1 n''a pas été signé.';
        Text053 : TextConst ENU='You cannot change the contract number because some of the service lines have already been posted.',FRA='Vous ne pouvez pas modifier le numéro de contrat car certaines lignes service ont déjà été validées.';
        Text054 : TextConst ENU='If you change the contract number, the existing service lines for this order line will be re-created.\Do you want to continue?',FRA='Si vous modifiez le numéro de contrat, les lignes service existantes de cette ligne commande vont être recréées.\Souhaitez-vous continuer ?';
        UseServItemLineAsxRec : Boolean;
        SkipResponseTimeHrsUpdate : Boolean;
        Text055 : TextConst Comment='2%=FIELDCAPTION("Loaner No."); 3%="Loaner No.";',ENU='You cannot change the %1 because %2 %3 has not been received.',FRA='Vous ne pouvez pas modifier l''/le/la %1, car %2 %3 n''a pas été reçu.';
        Text056 : TextConst ENU='One or more service lines of %6 %7 and/or %8 exist for %1, %2 %3, %4 %5. There is a check mark in the %9 field of %10 %11, therefore %10 %11 cannot be applied to service line of %6 %7 and/or %8.\\ Do you want to apply it for other service lines?',FRA='Une ou plusieurs lignes service de %6 %7 et/ou %8 existent pour %1, %2 %3, %4 %5. Le champ %9 de %10 %11 étant activé, %10 %11 ne peut pas être lettré avec la ligne service de %6 %7 et/ou %8.\\ Souhaitez-vous le/la lettrer pour d''autres lignes service ?';
        Text057 : TextConst ENU='Default Service Hours',FRA='Heures de service par défaut';
        Text058 : TextConst ENU='Service Hours',FRA='Heures de service';
        Text059 : TextConst ENU='Default warranty duration is negative. The warranty cannot be activated.',FRA='La durée de garantie par défaut est négative. La garantie ne peut pas être activée.';
        Text060 : TextConst ENU='You may have changed a dimension.\\Do you want to update the lines?',FRA='Vous avez probablement modifié un axe analytique.\\Souhaitez-vous mettre à jour les lignes ?';
}

