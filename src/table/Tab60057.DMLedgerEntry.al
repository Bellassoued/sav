table 60057 "DM Ledger Entry"
{
    // version DM V1

    CaptionML = ENU='Dimension Set Entry',
                FRA='Écriture DM';
    DrillDownPageID = 479;
    LookupPageID = 479;
    Permissions = TableData 480=ri,
                  TableData 481=rim;

    fields
    {
        field(1;"Dimension Set ID";Code[50])
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
        }
        field(2;"Line No.";Integer)
        {
            Caption = 'No Ligne';
        }
        field(7;Share;Decimal)
        {
            CaptionML = ENU='Share',
                        FRA='Part';
            DecimalPlaces = 2:5;
            MinValue = 0;
        }
        field(8;Percent;Decimal)
        {
            CaptionML = ENU='Percent',
                        FRA='Pour cent';
            DecimalPlaces = 2:5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(9;Comment;Text[50])
        {
            CaptionML = ENU='Comment',
                        FRA='Commentaire';
        }
        field(10;"Last Date Modified";Date)
        {
            CaptionML = ENU='Last Date Modified',
                        FRA='Date dern. modification';
            Editable = false;
        }
        field(11;"User ID";Code[50])
        {
            CaptionML = ENU='User ID',
                        FRA='Code utilisateur';
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup();
            var
                UserMgt : Codeunit "418";
            begin
            end;
        }
        field(12;"Global Percent";Decimal)
        {
            CaptionML = ENU='Percent',
                        FRA='Pour cent Global';
            DecimalPlaces = 2:5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(13;"Previous Dimension Set ID";Code[50])
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions Pré-attribué';
        }
        field(14;"Base Amount";Decimal)
        {
            Caption = 'Montant Base';
        }
        field(100;"Cost Type No.";Code[20])
        {
            CaptionML = ENU='Cost Type No.',
                        FRA='N° type coût';
            TableRelation = "Cost Type";
        }
        field(101;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
            ClosingDates = true;
        }
        field(102;Description;Text[80])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(103;Amount;Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Amount',
                        FRA='Montant';
        }
        field(104;"Debit Amount";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Debit Amount',
                        FRA='Montant débit';
        }
        field(105;"Credit Amount";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Credit Amount',
                        FRA='Montant crédit';
        }
        field(106;"Cost Center Code";Code[20])
        {
            CaptionML = ENU='Cost Center Code',
                        FRA='Code centre de coûts';
            TableRelation = "Cost Center";
        }
        field(107;"Cost Object Code";Code[20])
        {
            CaptionML = ENU='Cost Object Code',
                        FRA='Code coûts associés';
            TableRelation = "Cost Object";
        }
        field(108;"Reason Code";Code[10])
        {
            CaptionML = ENU='Reason Code',
                        FRA='Code motif';
            TableRelation = "Reason Code";
        }
        field(109;"G/L Account";Code[20])
        {
            CaptionML = ENU='G/L Account',
                        FRA='Compte général';
            TableRelation = "G/L Account";
        }
        field(110;"G/L Entry No.";Integer)
        {
            CaptionML = ENU='G/L Entry No.',
                        FRA='N° séquence compta.';
            Editable = false;
            TableRelation = "G/L Entry";
        }
        field(111;"Source Code";Code[10])
        {
            CaptionML = ENU='Source Code',
                        FRA='Code journal';
            TableRelation = "Source Code";
        }
        field(112;"System-Created Entry";Boolean)
        {
            CaptionML = ENU='System-Created Entry',
                        FRA='Écriture système';
            Editable = false;
        }
        field(200;"Dimension 1 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 1';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(201;"Dimension 1 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 1';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 1 Code));
        }
        field(202;"Dimension 1  Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 1 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 1';
            Editable = false;
            FieldClass = FlowField;
        }
        field(203;"Dimension 1 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 1 Code),
                                                               Code=FIELD(Dimension 1 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe 1';
            Editable = false;
            FieldClass = FlowField;
        }
        field(204;"Dimension 2 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 2';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(205;"Dimension 2 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 2';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 2 Code));
        }
        field(206;"Dimension 2  Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 2 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(207;"Dimension 2 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 2 Code),
                                                               Code=FIELD(Dimension 2 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(208;"Dimension 3 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 3';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(209;"Dimension 3 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 3';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 3 Code));
        }
        field(210;"Dimension 3 Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 3 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 3';
            Editable = false;
            FieldClass = FlowField;
        }
        field(211;"Dimension 3 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 3 Code),
                                                               Code=FIELD(Dimension 3 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe 3';
            Editable = false;
            FieldClass = FlowField;
        }
        field(212;"Dimension 4 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 4';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(213;"Dimension 4 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 4';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 4 Code));
        }
        field(214;"Dimension 4 Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 4 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 4';
            Editable = false;
            FieldClass = FlowField;
        }
        field(215;"Dimension 4 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 4 Code),
                                                               Code=FIELD(Dimension 4 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe 4';
            Editable = false;
            FieldClass = FlowField;
        }
        field(216;"Dimension 5 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 5';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(217;"Dimension 5 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 5';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 5 Code));
        }
        field(218;"Dimension 5 Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 5 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(219;"Dimension 5 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 5 Code),
                                                               Code=FIELD(Dimension 5 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe 5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(220;"Dimension 6 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 6';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(221;"Dimension 6 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 6';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 6 Code));
        }
        field(222;"Dimension 6 Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 6 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 6';
            Editable = false;
            FieldClass = FlowField;
        }
        field(223;"Dimension 6 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 6 Code),
                                                               Code=FIELD(Dimension 6 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe 6';
            Editable = false;
            FieldClass = FlowField;
        }
        field(224;"Dimension 7 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 7';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(225;"Dimension 7 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 7';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 7 Code));
        }
        field(226;"Dimension 7 Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 7 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 7';
            Editable = false;
            FieldClass = FlowField;
        }
        field(227;"Dimension 7 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 7 Code),
                                                               Code=FIELD(Dimension 7 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe 7';
            Editable = false;
            FieldClass = FlowField;
        }
        field(228;"Dimension 8 Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe 8';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(229;"Dimension 8 Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe 8';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension 8 Code));
        }
        field(230;"Dimension 8 Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension 8 Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique 8';
            Editable = false;
            FieldClass = FlowField;
        }
        field(231;"Dimension 8 Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension 8 Code),
                                                               Code=FIELD(Dimension 8 Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe 8';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1000;"Table ID";Integer)
        {
            CaptionML = ENU='Table ID',
                        FRA='ID table';
            NotBlank = true;
            TableRelation = Object.ID WHERE (Type=CONST(Table));
        }
        field(1001;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            Description = 'Pour les tables maîtres';
            TableRelation = IF (Table ID=CONST(13)) Salesperson/Purchaser
                            ELSE IF (Table ID=CONST(15)) "G/L Account"
                            ELSE IF (Table ID=CONST(18)) Customer
                            ELSE IF (Table ID=CONST(23)) Vendor
                            ELSE IF (Table ID=CONST(27)) Item
                            ELSE IF (Table ID=CONST(152)) "Resource Group"
                            ELSE IF (Table ID=CONST(156)) Resource
                            ELSE IF (Table ID=CONST(167)) Job
                            ELSE IF (Table ID=CONST(270)) "Bank Account"
                            ELSE IF (Table ID=CONST(406)) "IC Partner"
                            ELSE IF (Table ID=CONST(5071)) Campaign
                            ELSE IF (Table ID=CONST(5200)) Employee
                            ELSE IF (Table ID=CONST(5600)) "Fixed Asset"
                            ELSE IF (Table ID=CONST(5628)) Insurance
                            ELSE IF (Table ID=CONST(5903)) "Service Order Type"
                            ELSE IF (Table ID=CONST(5904)) "Service Item Group"
                            ELSE IF (Table ID=CONST(5940)) "Service Item";
        }
        field(1003;"Journal Template Name";Code[10])
        {
            CaptionML = ENU='Journal Template Name',
                        FRA='Nom modèle feuille';
            Description = 'Pour les journaux';
            TableRelation = IF (Table ID=FILTER(81|221)) "Gen. Journal Template".Name
                            ELSE IF (Table ID=CONST(83)) "Item Journal Template".Name
                            ELSE IF (Table ID=CONST(207)) "Res. Journal Template".Name
                            ELSE IF (Table ID=CONST(210)) "Job Journal Template".Name
                            ELSE IF (Table ID=CONST(246)) "Req. Wksh. Template".Name
                            ELSE IF (Table ID=CONST(5621)) "FA Journal Template".Name
                            ELSE IF (Table ID=CONST(5635)) "Insurance Journal Template".Name;
        }
        field(1004;"Journal Batch Name";Code[10])
        {
            CaptionML = ENU='Journal Batch Name',
                        FRA='Nom feuille';
            Description = 'Pour les journaux';
            TableRelation = IF (Table ID=FILTER(81|221)) "Gen. Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(83)) "Item Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(207)) "Res. Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(210)) "Job Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(246)) "Requisition Wksh. Name".Name WHERE (Worksheet Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(5621)) "FA Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(5635)) "Insurance Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name));
        }
        field(1005;"Journal Line No.";Integer)
        {
            CaptionML = ENU='Journal Line No.',
                        FRA='N° ligne feuille';
            Description = 'Pour les journaux';
        }
        field(1006;"Allocation Line No.";Integer)
        {
            CaptionML = ENU='Allocation Line No.',
                        FRA='N° ligne ventilation';
        }
        field(1007;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            Description = 'Pour les documents';
            OptionCaptionML = ENU='Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order, ',
                              FRA='Devis,Commande,Facture,Avoir,Commande ouverte,Retour, ';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"," ";
        }
        field(1008;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
            Description = 'Pour les documents';
        }
        field(1009;"Document Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne document';
            Description = 'Pour les documents';
        }
        field(2000;"Posted Table ID";Integer)
        {
            CaptionML = ENU='Table ID',
                        FRA='ID table';
            NotBlank = true;
            TableRelation = Object.ID WHERE (Type=CONST(Table));
        }
        field(2001;"Posted Entry No.";Integer)
        {
            CaptionML = ENU='Entry No.',
                        FRA='N° séquence';
            Description = 'Pour les écritures enregistrées';
        }
        field(2002;"Posted Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document validé';
            Description = 'Pour les documents enregistrés';
        }
        field(2003;"Posted Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne validé';
            Description = 'Pour les documents enregistrés';
        }
        field(3000;"Count";Integer)
        {
            Description = 'To delete';
        }
        field(5000;"Entry No.";Integer)
        {
            CaptionML = ENU='Entry No.',
                        FRA='N° séquence';
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        DimVal : Record "349";
        DimMgt : Codeunit "408";
        TXT50000 : Label 'Section %1 existe déjà !';
        GeneralLedgerSetup : Record "98";
        NoSeriesMgt : Codeunit "396";
        TXT50001 : Label 'Total Axe %1 égale à %2 ID %3 ! Total des section Analytique d''un même axe doit être égla à 100%.';
}

