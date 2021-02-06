table 60076 "Service Header Archive"
{
    // version NAVW111.00.00.23019,T180001

    // //<< RAD 01 validation axes analytiques
    // T180001 ZM 05/10/2018 : upgrade

    CaptionML = ENU='Service Header',
                FRA='En-tête service';
    DataCaptionFields = "No.",Name,Description;
    DrillDownPageID = 5901;
    LookupPageID = 5901;
    Permissions = TableData 5914=d,
                  TableData 5950=rimd;

    fields
    {
        field(1;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            OptionCaptionML = ENU='Quote,Order,Invoice,Credit Memo',
                              FRA='Devis,Commande,Facture,Avoir';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo";
        }
        field(2;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='N° client';
            TableRelation = Customer;

            trigger OnValidate();
            var
                ReLMagasinier : Record "7301";
                RecDefaultDimension : Record "352";
            begin
            end;
        }
        field(3;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
        }
        field(4;"Bill-to Customer No.";Code[20])
        {
            CaptionML = ENU='Bill-to Customer No.',
                        FRA='N° client facturé';
            NotBlank = true;
            TableRelation = Customer;

            trigger OnValidate();
            var
                PaymentTerms : Record "3";
                CustCheckCrLimit : Codeunit "312";
                LRecServiceMgtSetup : Record "5911";
                LRecServiceLine : Record "5902";
            begin
            end;
        }
        field(5;"Bill-to Name";Text[50])
        {
            CaptionML = ENU='Bill-to Name',
                        FRA='Nom client facturé';
        }
        field(6;"Bill-to Name 2";Text[50])
        {
            CaptionML = ENU='Bill-to Name 2',
                        FRA='Nom client facturé 2';
        }
        field(7;"Bill-to Address";Text[50])
        {
            CaptionML = ENU='Bill-to Address',
                        FRA='Adresse facturation';
        }
        field(8;"Bill-to Address 2";Text[50])
        {
            CaptionML = ENU='Bill-to Address 2',
                        FRA='Adresse facturation 2';
        }
        field(9;"Bill-to City";Text[30])
        {
            CaptionML = ENU='Bill-to City',
                        FRA='Ville facturation';
            TableRelation = IF (Bill-to Country/Region Code=CONST()) "Post Code".City
                            ELSE IF (Bill-to Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Bill-to Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(10;"Bill-to Contact";Text[50])
        {
            CaptionML = ENU='Bill-to Contact',
                        FRA='Contact facturation';
        }
        field(11;"Your Reference";Text[35])
        {
            CaptionML = ENU='Your Reference',
                        FRA='Votre référence';
        }
        field(12;"Ship-to Code";Code[10])
        {
            CaptionML = ENU='Ship-to Code',
                        FRA='Code destinataire';
            TableRelation = "Ship-to Address".Code WHERE (Customer No.=FIELD(Customer No.));

            trigger OnValidate();
            var
                ShipToAddr : Record "222";
            begin
            end;
        }
        field(13;"Ship-to Name";Text[50])
        {
            CaptionML = ENU='Ship-to Name',
                        FRA='Nom du destinataire';
        }
        field(14;"Ship-to Name 2";Text[50])
        {
            CaptionML = ENU='Ship-to Name 2',
                        FRA='Nom du destinataire 2';
        }
        field(15;"Ship-to Address";Text[50])
        {
            CaptionML = ENU='Ship-to Address',
                        FRA='Adresse destinataire';
        }
        field(16;"Ship-to Address 2";Text[50])
        {
            CaptionML = ENU='Ship-to Address 2',
                        FRA='Adresse destinataire 2';
        }
        field(17;"Ship-to City";Text[30])
        {
            CaptionML = ENU='Ship-to City',
                        FRA='Ville destinataire';
            TableRelation = IF (Ship-to Country/Region Code=CONST()) "Post Code".City
                            ELSE IF (Ship-to Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Ship-to Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(18;"Ship-to Contact";Text[50])
        {
            CaptionML = ENU='Ship-to Contact',
                        FRA='Contact destinataire';
        }
        field(19;"Order Date";Date)
        {
            CaptionML = ENU='Order Date',
                        FRA='Date commande';
            NotBlank = true;
        }
        field(20;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';

            trigger OnValidate();
            var
                NoSeries : Record "308";
            begin
            end;
        }
        field(22;"Posting Description";Text[50])
        {
            CaptionML = ENU='Posting Description',
                        FRA='Libellé écriture';
        }
        field(23;"Payment Terms Code";Code[10])
        {
            CaptionML = ENU='Payment Terms Code',
                        FRA='Code conditions paiement';
            TableRelation = "Payment Terms";

            trigger OnValidate();
            var
                PaymentTerms : Record "3";
            begin
            end;
        }
        field(24;"Due Date";Date)
        {
            CaptionML = ENU='Due Date',
                        FRA='Date d''échéance';
        }
        field(25;"Payment Discount %";Decimal)
        {
            CaptionML = ENU='Payment Discount %',
                        FRA='% escompte';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(26;"Pmt. Discount Date";Date)
        {
            CaptionML = ENU='Pmt. Discount Date',
                        FRA='Date d''escompte';
        }
        field(27;"Shipment Method Code";Code[10])
        {
            CaptionML = ENU='Shipment Method Code',
                        FRA='Code condition livraison';
            TableRelation = "Shipment Method";
        }
        field(28;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            TableRelation = Location;
        }
        field(29;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1),
                                                          Blocked=CONST(No));
        }
        field(30;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2),
                                                          Blocked=CONST(No));
        }
        field(31;"Customer Posting Group";Code[20])
        {
            CaptionML = ENU='Customer Posting Group',
                        FRA='Groupe compta. client';
            Editable = false;
            TableRelation = "Customer Posting Group";
        }
        field(32;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(33;"Currency Factor";Decimal)
        {
            CaptionML = ENU='Currency Factor',
                        FRA='Facteur devise';
            DecimalPlaces = 0:15;
            Editable = false;
            MinValue = 0;
        }
        field(34;"Customer Price Group";Code[10])
        {
            CaptionML = ENU='Customer Price Group',
                        FRA='Groupe prix client';
            TableRelation = "Customer Price Group";
        }
        field(35;"Prices Including VAT";Boolean)
        {
            CaptionML = ENU='Prices Including VAT',
                        FRA='Prix TTC';

            trigger OnValidate();
            var
                ServLine : Record "5902";
                Currency : Record "4";
                RecalculatePrice : Boolean;
            begin

            end;
        }
        field(37;"Invoice Disc. Code";Code[20])
        {
            CaptionML = ENU='Invoice Disc. Code',
                        FRA='Code remise facture';
        }
        field(40;"Customer Disc. Group";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group',
                        FRA='Groupe rem. client';
            TableRelation = "Customer Discount Group";
        }
        field(41;"Language Code";Code[10])
        {
            CaptionML = ENU='Language Code',
                        FRA='Code langue';
            TableRelation = Language;
        }
        field(43;"Salesperson Code";Code[20])
        {
            CaptionML = ENU='Salesperson Code',
                        FRA='Code vendeur';
            TableRelation = Salesperson/Purchaser;
        }
        field(46;Comment;Boolean)
        {
            CalcFormula = Exist("Service Comment Line" WHERE (Table Name=CONST(Service Header),
                                                              Table Subtype=FIELD(Document Type),
                                                              No.=FIELD(No.),
                                                              Type=CONST(General)));
            CaptionML = ENU='Comment',
                        FRA='Commentaires';
            Editable = false;
            FieldClass = FlowField;
        }
        field(47;"No. Printed";Integer)
        {
            CaptionML = ENU='No. Printed',
                        FRA='Nbre impressions';
            Editable = false;
        }
        field(52;"Applies-to Doc. Type";Option)
        {
            CaptionML = ENU='Applies-to Doc. Type',
                        FRA='Type doc. lettrage';
            OptionCaptionML = ENU=' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund',
                              FRA=' ,Paiement,Facture,Avoir,Intérêts,Relance,Remboursement';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(53;"Applies-to Doc. No.";Code[20])
        {
            CaptionML = ENU='Applies-to Doc. No.',
                        FRA='N° doc. lettrage';

            trigger OnLookup();
            var
                CustLedgEntry : Record "21";
                GenJnlLine : Record "81";
                GenJnlApply : Codeunit "225";
                ApplyCustEntries : Page "232";
            begin
            end;

            trigger OnValidate();
            var
                CustLedgEntry : Record "21";
            begin
            end;
        }
        field(55;"Bal. Account No.";Code[20])
        {
            CaptionML = ENU='Bal. Account No.',
                        FRA='N° compte contrepartie';
            TableRelation = IF (Bal. Account Type=CONST(G/L Account)) "G/L Account"
                            ELSE IF (Bal. Account Type=CONST(Bank Account)) "Bank Account";

            trigger OnValidate();
            var
                GLAcc : Record "15";
                BankAcc : Record "270";
            begin
            end;
        }
        field(62;"Shipping No.";Code[20])
        {
            CaptionML = ENU='Shipping No.',
                        FRA='Utiliser B.L. N°';
        }
        field(63;"Posting No.";Code[20])
        {
            CaptionML = ENU='Posting No.',
                        FRA='N° validation';
        }
        field(64;"Last Shipping No.";Code[20])
        {
            CaptionML = ENU='Last Shipping No.',
                        FRA='N° dern. bon de livraison';
            Editable = false;
            TableRelation = "Service Shipment Header";
        }
        field(65;"Last Posting No.";Code[20])
        {
            CaptionML = ENU='Last Posting No.',
                        FRA='N° dern. facture';
            Editable = false;
            TableRelation = "Service Invoice Header";
        }
        field(70;"VAT Registration No.";Text[20])
        {
            CaptionML = ENU='VAT Registration No.',
                        FRA='N° identif. intracomm.';
        }
        field(73;"Reason Code";Code[10])
        {
            CaptionML = ENU='Reason Code',
                        FRA='Code motif';
            TableRelation = "Reason Code";
        }
        field(74;"Gen. Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='Gen. Bus. Posting Group',
                        FRA='Groupe compta. marché';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate();
            var
                GenBusPostingGroup : Record "250";
            begin
            end;
        }
        field(75;"EU 3-Party Trade";Boolean)
        {
            CaptionML = ENU='EU 3-Party Trade',
                        FRA='Trans. tripartite UE';
        }
        field(76;"Transaction Type";Code[10])
        {
            CaptionML = ENU='Transaction Type',
                        FRA='Nature transaction';
            TableRelation = "Transaction Type";
        }
        field(77;"Transport Method";Code[10])
        {
            CaptionML = ENU='Transport Method',
                        FRA='Mode de transport';
            TableRelation = "Transport Method";
        }
        field(78;"VAT Country/Region Code";Code[10])
        {
            CaptionML = ENU='VAT Country/Region Code',
                        FRA='Code pays/région TVA';
            TableRelation = Country/Region;
        }
        field(79;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
        }
        field(80;"Name 2";Text[50])
        {
            CaptionML = ENU='Name 2',
                        FRA='Nom 2';
        }
        field(81;Address;Text[50])
        {
            CaptionML = ENU='Address',
                        FRA='Adresse';
        }
        field(82;"Address 2";Text[50])
        {
            CaptionML = ENU='Address 2',
                        FRA='Adresse (2ème ligne)';
        }
        field(83;City;Text[30])
        {
            CaptionML = ENU='City',
                        FRA='Ville';
            TableRelation = IF (Country/Region Code=CONST()) "Post Code".City
                            ELSE IF (Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(84;"Contact Name";Text[50])
        {
            CaptionML = ENU='Contact Name',
                        FRA='Nom contact';
        }
        field(85;"Bill-to Post Code";Code[20])
        {
            CaptionML = ENU='Bill-to Post Code',
                        FRA='Code postal facturation';
            TableRelation = IF (Bill-to Country/Region Code=CONST()) "Post Code"
                            ELSE IF (Bill-to Country/Region Code=FILTER(<>'')) "Post Code" WHERE (Country/Region Code=FIELD(Bill-to Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(86;"Bill-to County";Text[30])
        {
            CaptionML = ENU='Bill-to County',
                        FRA='Région facturation';
        }
        field(87;"Bill-to Country/Region Code";Code[10])
        {
            CaptionML = ENU='Bill-to Country/Region Code',
                        FRA='Code pays/région facturation';
            TableRelation = Country/Region;
        }
        field(88;"Post Code";Code[20])
        {
            CaptionML = ENU='Post Code',
                        FRA='Code postal';
            TableRelation = IF (Country/Region Code=CONST()) "Post Code"
                            ELSE IF (Country/Region Code=FILTER(<>'')) "Post Code" WHERE (Country/Region Code=FIELD(Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(89;County;Text[30])
        {
            CaptionML = ENU='County',
                        FRA='Région';
        }
        field(90;"Country/Region Code";Code[10])
        {
            CaptionML = ENU='Country/Region Code',
                        FRA='Code pays/région';
            TableRelation = Country/Region;
        }
        field(91;"Ship-to Post Code";Code[20])
        {
            CaptionML = ENU='Ship-to Post Code',
                        FRA='Code postal destinataire';
            TableRelation = IF (Ship-to Country/Region Code=CONST()) "Post Code"
                            ELSE IF (Ship-to Country/Region Code=FILTER(<>'')) "Post Code" WHERE (Country/Region Code=FIELD(Ship-to Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(92;"Ship-to County";Text[30])
        {
            CaptionML = ENU='Ship-to County',
                        FRA='Région destinataire';
        }
        field(93;"Ship-to Country/Region Code";Code[10])
        {
            CaptionML = ENU='Ship-to Country/Region Code',
                        FRA='Code pays/région destinataire';
            TableRelation = Country/Region;
        }
        field(94;"Bal. Account Type";Option)
        {
            CaptionML = ENU='Bal. Account Type',
                        FRA='Type compte contrepartie';
            OptionCaptionML = ENU='G/L Account,Bank Account',
                              FRA='Général,Banque';
            OptionMembers = "G/L Account","Bank Account";
        }
        field(97;"Exit Point";Code[10])
        {
            CaptionML = ENU='Exit Point',
                        FRA='Pays destination';
            TableRelation = "Entry/Exit Point";
        }
        field(98;Correction;Boolean)
        {
            CaptionML = ENU='Correction',
                        FRA='Correction';
        }
        field(99;"Document Date";Date)
        {
            CaptionML = ENU='Document Date',
                        FRA='Date document';
        }
        field(101;"Area";Code[10])
        {
            CaptionML = ENU='Area',
                        FRA='Dépt destination/provenance';
            TableRelation = Area;
        }
        field(102;"Transaction Specification";Code[10])
        {
            CaptionML = ENU='Transaction Specification',
                        FRA='Régime';
            TableRelation = "Transaction Specification";
        }
        field(104;"Payment Method Code";Code[10])
        {
            CaptionML = ENU='Payment Method Code',
                        FRA='Code mode de règlement';
            TableRelation = "Payment Method";

            trigger OnValidate();
            var
                PaymentMethod : Record "289";
            begin
            end;
        }
        field(105;"Shipping Agent Code";Code[10])
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Agent Code',
                        FRA='Code transporteur';
            TableRelation = "Shipping Agent";
        }
        field(107;"No. Series";Code[20])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108;"Posting No. Series";Code[20])
        {
            CaptionML = ENU='Posting No. Series',
                        FRA='Souches de n° validation';
            TableRelation = "No. Series";
        }
        field(109;"Shipping No. Series";Code[20])
        {
            CaptionML = ENU='Shipping No. Series',
                        FRA='Souche de n° expédition';
            TableRelation = "No. Series";
        }
        field(114;"Tax Area Code";Code[20])
        {
            CaptionML = ENU='Tax Area Code',
                        FRA='Code zone recouvrement';
            TableRelation = "Tax Area";
        }
        field(115;"Tax Liable";Boolean)
        {
            CaptionML = ENU='Tax Liable',
                        FRA='Soumis à recouvrement';
        }
        field(116;"VAT Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='VAT Bus. Posting Group',
                        FRA='Groupe compta. marché TVA';
            TableRelation = "VAT Business Posting Group";
        }
        field(117;Reserve;Option)
        {
            CaptionML = ENU='Reserve',
                        FRA='Réserver';
            OptionCaptionML = ENU='Never,Optional,Always',
                              FRA='Jamais,Manuel,Toujours';
            OptionMembers = Never,Optional,Always;
        }
        field(118;"Applies-to ID";Code[50])
        {
            CaptionML = ENU='Applies-to ID',
                        FRA='ID lettrage';

            trigger OnValidate();
            var
                CustLedgEntry : Record "21";
                TempCustLedgEntry : Record "21" temporary;
                CustEntrySetApplID : Codeunit "101";
            begin
            end;
        }
        field(119;"VAT Base Discount %";Decimal)
        {
            CaptionML = ENU='VAT Base Discount %',
                        FRA='% remise base TVA';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(120;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            OptionCaptionML = ENU='Pending,In Process,Finished,On Hold',
                              FRA='Suspendu,En cours,Terminé,En attente';
            OptionMembers = Pending,"In Process",Finished,"On Hold";

            trigger OnValidate();
            var
                JobQueueEntry : Record "472";
                RepairStatus : Record "5927";
            begin
            end;
        }
        field(121;"Invoice Discount Calculation";Option)
        {
            CaptionML = ENU='Invoice Discount Calculation',
                        FRA='Calcul remise facture';
            Editable = false;
            OptionCaptionML = ENU='None,%,Amount',
                              FRA='Aucun,%,Montant';
            OptionMembers = "None","%",Amount;
        }
        field(122;"Invoice Discount Value";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Invoice Discount Value',
                        FRA='Valeur remise facture';
            Editable = false;
        }
        field(130;"Release Status";Option)
        {
            CaptionML = ENU='Release Status',
                        FRA='Statut de lancement';
            Editable = false;
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
        field(5052;"Contact No.";Code[20])
        {
            CaptionML = ENU='Contact No.',
                        FRA='N° contact';
            TableRelation = Contact;

            trigger OnLookup();
            var
                Cont : Record "5050";
                ContBusinessRelation : Record "5054";
            begin
            end;

            trigger OnValidate();
            var
                Cont : Record "5050";
                ContBusinessRelation : Record "5054";
            begin
            end;
        }
        field(5053;"Bill-to Contact No.";Code[20])
        {
            CaptionML = ENU='Bill-to Contact No.',
                        FRA='N° contact facturation';
            TableRelation = Contact;

            trigger OnLookup();
            var
                Cont : Record "5050";
                ContBusinessRelation : Record "5054";
            begin
            end;

            trigger OnValidate();
            var
                Cont : Record "5050";
                ContBusinessRelation : Record "5054";
            begin
            end;
        }
        field(5700;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            TableRelation = "Responsibility Center";

            trigger OnValidate();
            var
                RespCenter : Record "5714";
            begin
            end;
        }
        field(5750;"Shipping Advice";Option)
        {
            CaptionML = ENU='Shipping Advice',
                        FRA='Option d''expédition';
            OptionCaptionML = ENU='Partial,Complete',
                              FRA='Partielle,Totale';
            OptionMembers = Partial,Complete;

            trigger OnValidate();
            var
                WhseValidateSourceHeader : Codeunit "5781";
            begin
            end;
        }
        field(5752;"Completely Shipped";Boolean)
        {
            CalcFormula = Min("Service Line"."Completely Shipped" WHERE (Document Type=FIELD(Document Type),
                                                                         Document No.=FIELD(No.),
                                                                         Type=FILTER(<>' '),
                                                                         Location Code=FIELD(Location Filter)));
            CaptionML = ENU='Completely Shipped',
                        FRA='Entièrement expédiée';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5754;"Location Filter";Code[10])
        {
            CaptionML = ENU='Location Filter',
                        FRA='Filtre magasin';
            FieldClass = FlowFilter;
            TableRelation = Location.Code;
        }
        field(5792;"Shipping Time";DateFormula)
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Time',
                        FRA='Délai d''expédition';
        }
        field(5794;"Shipping Agent Service Code";Code[10])
        {
            CaptionML = ENU='Shipping Agent Service Code',
                        FRA='Code prestation transporteur';
            TableRelation = "Shipping Agent Services".Code WHERE (Shipping Agent Code=FIELD(Shipping Agent Code));
        }
        field(5796;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            FieldClass = FlowFilter;
        }
        field(5902;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Description';
        }
        field(5904;"Service Order Type";Code[10])
        {
            CaptionML = ENU='Service Order Type',
                        FRA='Type commande service';
            TableRelation = "Service Order Type";
        }
        field(5905;"Link Service to Service Item";Boolean)
        {
            CaptionML = ENU='Link Service to Service Item',
                        FRA='Lier service à article de service';
        }
        field(5907;Priority;Option)
        {
            CaptionML = ENU='Priority',
                        FRA='Priorité';
            Editable = false;
            OptionCaptionML = ENU='Low,Medium,High',
                              FRA='Faible,Moyenne,Haute';
            OptionMembers = Low,Medium,High;
        }
        field(5911;"Allocated Hours";Decimal)
        {
            CalcFormula = Sum("Service Order Allocation"."Allocated Hours" WHERE (Document Type=FIELD(Document Type),
                                                                                  Document No.=FIELD(No.),
                                                                                  Allocation Date=FIELD(Date Filter),
                                                                                  Resource No.=FIELD(Resource Filter),
                                                                                  Status=FILTER(Active|Finished),
                                                                                  Resource Group No.=FIELD(Resource Group Filter)));
            CaptionML = ENU='Allocated Hours',
                        FRA='Heures affectées';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5915;"Phone No.";Text[30])
        {
            CaptionML = ENU='Phone No.',
                        FRA='N° téléphone';
            ExtendedDatatype = PhoneNo;
        }
        field(5916;"E-Mail";Text[80])
        {
            CaptionML = ENU='Email',
                        FRA='Adresse e-mail';
            ExtendedDatatype = EMail;

            trigger OnValidate();
            var
                MailManagement : Codeunit "9520";
            begin
            end;
        }
        field(5917;"Phone No. 2";Text[30])
        {
            CaptionML = ENU='Phone No. 2',
                        FRA='N° téléphone 2';
            ExtendedDatatype = PhoneNo;
        }
        field(5918;"Fax No.";Text[30])
        {
            CaptionML = ENU='Fax No.',
                        FRA='N° télécopie';
        }
        field(5921;"No. of Unallocated Items";Integer)
        {
            CalcFormula = Count("Service Item Line" WHERE (Document Type=FIELD(Document Type),
                                                           Document No.=FIELD(No.),
                                                           No. of Active/Finished Allocs=CONST(0)));
            CaptionML = ENU='No. of Unallocated Items',
                        FRA='Nbre articles non affectés';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5923;"Order Time";Time)
        {
            CaptionML = ENU='Order Time',
                        FRA='Heure commande';
            NotBlank = true;
        }
        field(5924;"Default Response Time (Hours)";Decimal)
        {
            CaptionML = ENU='Default Response Time (Hours)',
                        FRA='Délai de réponse par déf. (heures)';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(5925;"Actual Response Time (Hours)";Decimal)
        {
            CaptionML = ENU='Actual Response Time (Hours)',
                        FRA='Délai de réponse réel (heures)';
            DecimalPlaces = 0:5;
            Editable = false;
            MinValue = 0;
        }
        field(5926;"Service Time (Hours)";Decimal)
        {
            CaptionML = ENU='Service Time (Hours)',
                        FRA='Temps de service (heures)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5927;"Response Date";Date)
        {
            CaptionML = ENU='Response Date',
                        FRA='Date de réponse';
            Editable = false;
        }
        field(5928;"Response Time";Time)
        {
            CaptionML = ENU='Response Time',
                        FRA='Délai de réponse';
            Editable = false;
        }
        field(5929;"Starting Date";Date)
        {
            CaptionML = ENU='Starting Date',
                        FRA='Date début';
        }
        field(5930;"Starting Time";Time)
        {
            CaptionML = ENU='Starting Time',
                        FRA='Heure début';
        }
        field(5931;"Finishing Date";Date)
        {
            CaptionML = ENU='Finishing Date',
                        FRA='Date fin';
        }
        field(5932;"Finishing Time";Time)
        {
            CaptionML = ENU='Finishing Time',
                        FRA='Heure fin';
        }
        field(5933;"Contract Serv. Hours Exist";Boolean)
        {
            CalcFormula = Exist("Service Hour" WHERE (Service Contract No.=FIELD(Contract No.)));
            CaptionML = ENU='Contract Serv. Hours Exist',
                        FRA='Heures contrat de service définies';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5934;"Reallocation Needed";Boolean)
        {
            CalcFormula = Exist("Service Order Allocation" WHERE (Status=CONST(Reallocation Needed),
                                                                  Resource No.=FIELD(Resource Filter),
                                                                  Document Type=FIELD(Document Type),
                                                                  Document No.=FIELD(No.),
                                                                  Resource Group No.=FIELD(Resource Group Filter)));
            CaptionML = ENU='Reallocation Needed',
                        FRA='Réaffectation nécessaire';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5936;"Notify Customer";Option)
        {
            CaptionML = ENU='Notify Customer',
                        FRA='Informer client';
            OptionCaptionML = ENU='No,By Phone 1,By Phone 2,By Fax,By Email',
                              FRA='Non,Par téléphone 1,Par téléphone 2,Par télécopie,Par e-mail';
            OptionMembers = No,"By Phone 1","By Phone 2","By Fax","By Email";
        }
        field(5937;"Max. Labor Unit Price";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            BlankZero = true;
            CaptionML = ENU='Max. Labor Unit Price',
                        FRA='Prix unitaire max. M.O.';
        }
        field(5938;"Warning Status";Option)
        {
            CaptionML = ENU='Warning Status',
                        FRA='Statut alerte';
            OptionCaptionML = ENU=' ,First Warning,Second Warning,Third Warning',
                              FRA=' ,Première alerte,Deuxième alerte,Troisième alerte';
            OptionMembers = " ","First Warning","Second Warning","Third Warning";
        }
        field(5939;"No. of Allocations";Integer)
        {
            CalcFormula = Count("Service Order Allocation" WHERE (Document Type=FIELD(Document Type),
                                                                  Document No.=FIELD(No.),
                                                                  Resource No.=FIELD(Resource Filter),
                                                                  Resource Group No.=FIELD(Resource Group Filter),
                                                                  Allocation Date=FIELD(Date Filter),
                                                                  Status=FILTER(Active|Finished)));
            CaptionML = ENU='No. of Allocations',
                        FRA='Nbre affectations';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5940;"Contract No.";Code[20])
        {
            CaptionML = ENU='Contract No.',
                        FRA='N° contrat';
            TableRelation = "Service Contract Header"."Contract No." WHERE (Contract Type=CONST(Contract),
                                                                            Customer No.=FIELD(Customer No.),
                                                                            Ship-to Code=FIELD(Ship-to Code),
                                                                            Bill-to Customer No.=FIELD(Bill-to Customer No.));

            trigger OnLookup();
            var
                ServContractHeader : Record "5965";
                ServContractList : Page "6051";
            begin
            end;

            trigger OnValidate();
            var
                ServContractHeader : Record "5965";
                ServContractLine : Record "5964";
            begin


            end;
        }
        field(5951;"Type Filter";Option)
        {
            CaptionML = ENU='Type Filter',
                        FRA='Filtre type';
            FieldClass = FlowFilter;
            OptionCaptionML = ENU=' ,Resource,Item,Service Cost,Service Contract',
                              FRA=' ,Ressource,Article,Coût service,Contrat de service';
            OptionMembers = " ",Resource,Item,"Service Cost","Service Contract";
        }
        field(5952;"Customer Filter";Code[20])
        {
            CaptionML = ENU='Customer Filter',
                        FRA='Filtre client';
            FieldClass = FlowFilter;
            TableRelation = Customer.No.;
        }
        field(5953;"Resource Filter";Code[20])
        {
            CaptionML = ENU='Resource Filter',
                        FRA='Filtre ressource';
            FieldClass = FlowFilter;
            TableRelation = Resource;
        }
        field(5954;"Contract Filter";Code[20])
        {
            CaptionML = ENU='Contract Filter',
                        FRA='Filtre contrat';
            FieldClass = FlowFilter;
            TableRelation = "Service Contract Header"."Contract No." WHERE (Contract Type=CONST(Contract));
        }
        field(5955;"Ship-to Fax No.";Text[30])
        {
            CaptionML = ENU='Ship-to Fax No.',
                        FRA='N° télécopie destinataire';
        }
        field(5956;"Ship-to E-Mail";Text[80])
        {
            CaptionML = ENU='Ship-to Email',
                        FRA='E-mail destinataire';
            ExtendedDatatype = EMail;

            trigger OnValidate();
            var
                MailManagement : Codeunit "9520";
            begin
            end;
        }
        field(5957;"Resource Group Filter";Code[20])
        {
            CaptionML = ENU='Resource Group Filter',
                        FRA='Filtre gpe ressources';
            FieldClass = FlowFilter;
            TableRelation = "Resource Group";
        }
        field(5958;"Ship-to Phone";Text[30])
        {
            CaptionML = ENU='Ship-to Phone',
                        FRA='Tél. destinataire';
            ExtendedDatatype = PhoneNo;
        }
        field(5959;"Ship-to Phone 2";Text[30])
        {
            CaptionML = ENU='Ship-to Phone 2',
                        FRA='Tél. 2 destinataire';
            ExtendedDatatype = PhoneNo;
        }
        field(5966;"Service Zone Filter";Code[10])
        {
            CaptionML = ENU='Service Zone Filter',
                        FRA='Filtre zone service';
            FieldClass = FlowFilter;
            TableRelation = "Service Zone".Code;
        }
        field(5968;"Service Zone Code";Code[10])
        {
            CaptionML = ENU='Service Zone Code',
                        FRA='Code zone service';
            Editable = false;
            TableRelation = "Service Zone".Code;

            trigger OnValidate();
            var
                ShipToAddr : Record "222";
            begin
            end;
        }
        field(5981;"Expected Finishing Date";Date)
        {
            CaptionML = ENU='Expected Finishing Date',
                        FRA='Date fin prévue';
        }
        field(7001;"Allow Line Disc.";Boolean)
        {
            CaptionML = ENU='Allow Line Disc.',
                        FRA='Autoriser remise ligne';
        }
        field(9000;"Assigned User ID";Code[50])
        {
            CaptionML = ENU='Assigned User ID',
                        FRA='Code utilisateur affecté';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup";
        }
        field(9001;"Quote No.";Code[20])
        {
            CaptionML = ENU='Quote No.',
                        FRA='N° devis';
        }
        field(50000;"Appliquer Frais Dossier";Boolean)
        {
            Description = 'ZM';
        }
        field(50001;"Montant Frais Dossier";Decimal)
        {
            Description = 'ZM';
        }
        field(50006;Retour;Boolean)
        {
        }
        field(50012;Intern;Boolean)
        {
            Caption = 'Interne';
            Description = 'SM SAVF001';
        }
        field(50015;"Intern Type";Option)
        {
            Caption = 'Type Interne';
            Description = 'SM SAVF001';
            OptionMembers = " ","Voiture de Service Auto","Interne Commercial","Inerne  Atelier","Soutien commercial DG","Soutien atelier DG","Cadeau Fidélité";
        }
        field(50025;"RC Garage";Boolean)
        {
            Description = 'NM230317';
        }
        field(50032;"Assurances conventionnées";Boolean)
        {
            Description = 'NM270417';
        }
        field(50033;"Code assureur conventionné";Code[20])
        {
            Description = 'KT 28042017';
            TableRelation = "Insurance firm";
        }
        field(50034;"Nom assureur conventionné";Text[50])
        {
            Description = 'KT 28042017';
        }
        field(50038;"Assurances groupe";Boolean)
        {
            Description = 'KT 140617';
        }
        field(50039;"Type assurance groupe";Option)
        {
            Description = 'KT 140617';
            OptionMembers = " ",Avarie,"RC Garage","Sinistre RC Transport","Assurances carrosserie VS Auto","Assurances carrosserie VS Gros";
        }
        field(50041;"Personnel CITROEN";Boolean)
        {
            Caption = 'Personnel CITROËN';
        }
        field(60000;"Reception No";Code[20])
        {
            CaptionML = ENU='Receive No.',
                        FRA='Reception N°';
            Editable = false;
        }
        field(60001;"Type Reception";Option)
        {
            OptionCaption = 'Reception Rapide,Reception Grand Reparation,VN,Internal Repair,Transfert InterMag';
            OptionMembers = "Reception Rapide","Reception Grand Reparation",VN,"Internal Repair","Transfert InterMag";

            trigger OnValidate();
            var
                ServiceMgtSetup : Record "5911";
            begin
            end;
        }
        field(60002;Timbre;Boolean)
        {
            Description = 'GMED';
        }
        field(60003;"Montant Timbre";Decimal)
        {
        }
        field(60004;Matricule;Code[20])
        {
            Caption = 'Matricule';
        }
        field(60005;Reason;Text[100])
        {
            Caption = 'Motif';
            Description = 'SM';
        }
        field(60013;"Type Avoir";Option)
        {
            Description = 'Add rh';
            OptionCaption = '" ,Av. Financier,Av. Retour,Av. Correction"';
            OptionMembers = " ","Av. Financier","Av. Retour","Av. Correction";
        }
        field(60014;"Status SR";Option)
        {
            CalcFormula = Lookup("Reception SAV"."Status SR" WHERE (Reception No=FIELD(Reception No)));
            Caption = 'Status SR';
            Description = 'SM';
            Editable = false;
            FieldClass = FlowField;
            OptionMembers = "Fiche Crée","Lancée","Commande Crée","Pièces demandé","Facturée","Annulé","Livré",Suspendu;
        }
        field(60015;"Mag Réservation";Code[20])
        {
            Description = 'SM MAZDA301';
        }
        field(60016;"Sous Type Reception";Option)
        {
            Description = 'SM MAZDA444';
            OptionCaption = '" ,VA,VEA,AC"';
            OptionMembers = " ",VA,VEA,AC;
        }
        field(60019;"Compte Banque";Code[20])
        {
            Description = 'SM MAZDA1005';
            TableRelation = "Bank Account";
        }
        field(60100;"Internal Repair";Boolean)
        {
            Description = 'SM';
        }
        field(60101;"Kilométrage";Integer)
        {
            Description = 'SM MAZDA672';
        }
        field(60102;"Code Entretien";Code[30])
        {
            Description = 'SM MAZDA672';
        }
        field(60103;"Warranty Code";Option)
        {
            Caption = 'Code Type Garantie';
            Description = 'NM251116';
            OptionCaption = '0,VNE,000,030,040,150,400,500,600,800,CAMP';
            OptionMembers = "0",VNE,"000","030","040","150","400","500","600","800",CAMP;
        }
        field(60104;lib_warranty;Code[40])
        {
            Caption = 'Libelle Garantie';
            Description = 'NM251116';
        }
        field(60105;"Type de garantie";Option)
        {
            Description = 'add Gmed : 25 03 2014';
            OptionCaptionML = ENU='Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Campagne,Garantie  Constructeur+Campagne, ',
                              FRA='Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Campagne,Garantie  Constructeur+Campagne, ';
            OptionMembers = "Payant par Client","Garantie  Constructeur","Garantie  Prolongé",Compagne,"Garantie  Constructeur+Campagne"," ";

            trigger OnValidate();
            begin
                //SM MAZDA19
                //IF "Type de garantie" <>  "Type de garantie"::"Garantie  Constructeur" THEN
                //  "Sous Type de garantie" := "Sous Type de garantie"::" ";
                //EN SM
            end;
        }
        field(60106;"Created By";Code[50])
        {
            CaptionML = ENU='Created By',
                        FRA='Crée par';
            Description = 'NM030417';
        }
        field(60107;"Creation date";DateTime)
        {
            CaptionML = ENU='Creation date',
                        FRA='Date de Création';
            Description = 'NM030417';
        }
        field(60108;"Modified By";Code[50])
        {
            CaptionML = ENU='Modified By',
                        FRA='Modifié Par';
            Description = 'NM030417';
            Editable = false;
        }
        field(60109;"Last Modification Time";DateTime)
        {
            CaptionML = ENU='Last Modification Time',
                        FRA='Heure Modification';
            Description = 'NM030417';
            Editable = false;
        }
        field(60110;"Date Validation CS";DateTime)
        {
            Description = 'SM120917';
        }
        field(60111;"A retenir";Boolean)
        {
        }
        field(60112;"Client Timbre";Boolean)
        {
            CalcFormula = Lookup(Customer."Apply Stamp fiscal" WHERE (No.=FIELD(Bill-to Customer No.)));
            Description = 'SM TMP';
            FieldClass = FlowField;
        }
        field(60113;"Nbre Impressions";Integer)
        {
        }
        field(60114;Version;Integer)
        {
        }
        field(60115;"No Autorisation administrative";Code[50])
        {
            Description = 'SM 161017';
        }
        field(60116;"No. Bon de commande V. susp";Code[50])
        {
            Description = 'SM 241017';
        }
        field(60117;"Date Bon Commande V. susp";Date)
        {
            Description = 'SM 241017';
        }
        field(60118;"Forcer client facturé";Boolean)
        {
            Description = 'KT 101117 Empecher modification client facturé auto';
        }
        field(60119;"Approbation Dir. Tech/Site";Boolean)
        {
            Caption = 'Approbation Dir. Technique';
            Description = 'KT 061217 Approbation Directeur Technique/Site';
        }
        field(60120;"Approbation Chef Atelier";Boolean)
        {
            Description = 'KT 061217';
        }
        field(60121;"Ressources affectées";Boolean)
        {
            CaptionML = ENU='Facturable',
                        FRA='Facturable';
            Description = 'KT Validation chef équipe pour allocation ressources';
        }
        field(60122;"N° commande remplaçante";Code[20])
        {
            Description = 'KT 050117 annulation avoir';
        }
        field(60123;"Dérogation Taux TVA";Boolean)
        {
            Description = 'KT 090218 Facturation ancien taux';
        }
        field(60124;Commentaire;Text[250])
        {
            Description = 'KT 050318';
        }
        field(60125;"Dérogation Coût";Boolean)
        {
            Description = 'KT 220318';
        }
        field(60126;"Date Début autorisation Admin.";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(60127;"Date Fin exonération Admin.";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(60128;"Avance sur commande";Decimal)
        {
            Caption = 'Avance sur commande';
            DataClassification = ToBeClassified;
            Description = 'SM MAZDA856';
            Editable = false;
        }
        field(60129;"Type avance";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,Avance,Bon de Commande, Particulier',
                              FRA=' ,Avance,Bon de Commande, Particulier';
            OptionMembers = " ",Avance,"Bon de Commande"," Particulier";
        }
        field(70100;"Promo 20%";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SM100519';

            trigger OnValidate();
            var
                ServiceLinePromo : Record "5902";
            begin
            end;
        }
        field(70163;"Estimated Time For Delivery";Option)
        {
            CalcFormula = Max("Service Line"."Estimated Time For Delivery" WHERE (Document Type=FIELD(Document Type),
                                                                                  Document No.=FIELD(No.)));
            CaptionML = ENU='Estimated Time For Delivery',
                        FRA='Délai estimatif de livraison';
            Description = 'KT 29042019';
            FieldClass = FlowField;
            OptionCaptionML = ENU=' ,2 to 3 weeks,4 to 5 weeks,6 to 8 weeks,More than 8 weeks',
                              FRA=' ,2 à 3 semaines,4 à 5 semaines,6 à 8 semaines,Plus que 8 semaines';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9";
        }
        field(70164;"No. Version";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70165;"Archiver par";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70166;"Date archive";DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","No.","No. Version")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Document Type","No.","Customer No.","Posting Date",Status)
        {
        }
    }

    trigger OnDelete();
    var
        ServDocRegister : Record "5936";
        ServDocLog : Record "5912";
        ServOrderAlloc : Record "5950";
        ServCommentLine : Record "5906";
        WhseRequest : Record "5765";
        Loaner : Record "5913";
        LoanerEntry : Record "5914";
        ServAllocMgt : Codeunit "5930";
        ReservMgt : Codeunit "99000845";
    begin
    end;

    trigger OnInsert();
    var
        ServShptHeader : Record "5990";
    begin
    end;

    trigger OnRename();
    begin
        //ERROR(Text044,TABLECAPTION);
    end;

    var
        Text000 : TextConst Comment='%1=User management service filter;',ENU='You cannot delete this document. Your identification is set up to process from Responsibility Center %1 only.',FRA='Vous ne pouvez pas supprimer ce document. Le paramétrage de votre code utilisateur vous permet uniquement de travailler à partir du Centre de gestion %1.';
        Text001 : TextConst ENU='Changing %1 in service header %2 will not update the existing service lines.\You must update the existing service lines manually.',FRA='La modification de %1 dans l''en-tête de service %2 ne met pas à jour les lignes service existantes.\Vous devez mettre à jour les lignes service existantes manuellement.';
        Text003 : TextConst Comment='%1=Customer number field caption;%2=Document type;%3=Number field caption;%4=Number;%5=Contract number field caption;%6=Contract number; ',ENU='You cannot change the %1 because the %2 %3 %4 is associated with a %5 %6.',FRA='Vous ne pouvez pas modifier le %1, car le %2 %3 %4 est associé à un %5 %6.';
        Text004 : TextConst ENU='When you change the %1 the existing Service item line and service line will be deleted.\Do you want to change the %1?',FRA='Si vous modifiez %1, la ligne article service et la ligne service existantes seront supprimées.\Voulez-vous modifier %1 ?';
        Text005 : TextConst ENU='Do you want to change the %1?',FRA='Souhaitez-vous modifier l''enregistrement %1 ?';
        Text007 : TextConst ENU='%1 cannot be greater than %2.',FRA='L''%1 ne peut pas être supérieur à l''%2.';
        Text008 : TextConst Comment='%1=Document type format;%2=Number field caption;%3=Number;',ENU='You cannot create Service %1 with %2=%3 because this number has already been used in the system.',FRA='Vous ne pouvez pas créer de %1 Service avec %2=%3 car cette valeur a déjà été utilisée dans le système.';
        Text010 : TextConst Comment='%1=Resposibility center table caption;%2=User management service filter;',ENU='Your identification is set up to process from %1 %2 only.',FRA='Le paramétrage de votre code utilisateur ne vous permet de travailler que sur %1 %2.';
        Text011 : TextConst ENU='%1 cannot be greater than %2 in the %3 table.',FRA='%1 ne peut pas être supérieur(e) à %2 dans la table %3.';
        Text012 : TextConst ENU='If you change %1, the existing service lines will be deleted and the program will create new service lines based on the new information on the header.\Do you want to change the %1?',FRA='Si vous modifiez %1, les lignes service existantes seront supprimées et le programme créera des lignes service basées sur les nouvelles informations de l''en-tête.\Voulez-vous modifier %1 ?';
        Text013 : TextConst ENU='Deleting this document will cause a gap in the number series for posted credit memos. An empty posted credit memo %1 will be created to fill this gap in the number series.\\Do you want to continue?',FRA='La suppression de ce document va engendrer une discontinuité dans la souche d''avoirs enregistrés. Un avoir enregistré vide %1 va être créé pour éviter une discontinuité dans la souche de numéros.\\Voulez-vous continuer ?';
        Text015 : TextConst ENU='Do you want to update the exchange rate?',FRA='Souhaitez-vous mettre à jour le taux de change ?';
        Text016 : TextConst ENU='You have modified %1.\Do you want to update the service lines?',FRA='Vous avez modifié %1.\Voulez-vous mettre à jour les lignes service ?';
        Text018 : TextConst Comment='%1=Service order type field caption;%2=table caption;%3=Document type field caption;%4=Document type format;%5=Number field caption;%6=Number format;',ENU='You have not specified the %1 for %2 %3=%4, %5=%6.',FRA='Vous n''avez pas défini le %1 pour %2 %3=%4, %5=%6.';
        Text019 : TextConst ENU='You have changed %1 on the service header, but it has not been changed on the existing service lines.\The change may affect the exchange rate used in the price calculation of the service lines.',FRA='Vous avez modifié %1 dans l''en-tête service, mais il n''a pas été modifié dans les lignes service existantes.\Ce changement peut affecter le taux de change utilisé dans le calcul de prix des lignes service.';
        Text021 : TextConst ENU='You have changed %1 on the %2, but it has not been changed on the existing service lines.\You must update the existing service lines manually.',FRA='Vous avez modifié %1 du/de la %2, mais il/elle n''a pas été modifié(e) sur les lignes service existantes.\Vous devez mettre à jour les lignes service existantes manuellement.';
        ServSetup : Record "5911";
        Cust : Record "18";
        ServHeader : Record "5900";
        ServLine : Record "5902";
        ServItemLine : Record "5901";
        PostCode : Record "225";
        CurrExchRate : Record "330";
        GLSetup : Record "98";
        ServShptHeader : Record "5990";
        ServInvHeader : Record "5992";
        ServCrMemoHeader : Record "5994";
        ReservEntry : Record "337";
        TempReservEntry : Record "337" temporary;
        Salesperson : Record "13";
        ServOrderMgt : Codeunit "5900";
        DimMgt : Codeunit "408";
        NoSeriesMgt : Codeunit "396";
        ServLogMgt : Codeunit "5906";
        UserSetupMgt : Codeunit "5700";
        NotifyCust : Codeunit "5915";
        ServPost : Codeunit "5980";
        CurrencyDate : Date;
        TempLinkToServItem : Boolean;
        HideValidationDialog : Boolean;
        Text024 : TextConst ENU='The %1 cannot be greater than the minimum %1 of the\ Service Item Lines.',FRA='Le/la %1 ne peut pas être supérieur(e) au/à la %1 minimum des\ lignes article service.';
        Text025 : TextConst ENU='The %1 cannot be less than the maximum %1 of the related\ Service Item Lines.',FRA='Le/la %1 ne peut pas être inférieur(e) au/à la %1 maximum des\ lignes article service associées.';
        Text026 : TextConst ENU='%1 cannot be earlier than the %2.',FRA='%1 ne doit pas être antérieure au %2.';
        Text027 : TextConst ENU='The %1 cannot be greater than the minimum %2 of the related\ Service Item Lines.',FRA='Le/la %1 ne peut pas être supérieur(e) au/à la %2 minimum des\ lignes article service associées.';
        ValidatingFromLines : Boolean;
        LinesExist : Boolean;
        Text028 : TextConst ENU='You cannot change the %1 because %2 exists.',FRA='Vous ne pouvez pas modifier %1 parce que il existe des %2.';
        Text029 : TextConst ENU='The %1 field on the %2 will be updated if you change %3 manually.\Do you want to continue?',FRA='Le champ %1 du formulaire %2 sera mis à jour si vous modifiez manuellement la valeur %3.\Voulez-vous continuer ?';
        Text031 : TextConst Comment='%1=Status field caption;%2=Status format;%3=table caption;%4=Number;%5=ServItemLine repair status code field caption;%6=ServItemLine repair status code;%7=ServItemLine table caption;%8=ServItemLine line number;',ENU='You cannot change %1 to %2 in %3 %4.\\%5 %6 in %7 %8 line is preventing it.',FRA='Vous ne pouvez pas modifier %1 en %2 dans %3%4.\\%5%6 de la ligne %7 %8 vous empêche de le faire.';
        Text037 : TextConst Comment='%1=Contact number;%2=Contact name;%3=Customer number;',ENU='Contact %1 %2 is not related to customer %3.',FRA='Le contact %1 %2 n''est pas associé au client %3.';
        Text038 : TextConst Comment='%1=Contact number;%2=Contact name;%3=Customer number;',ENU='Contact %1 %2 is related to a different company than customer %3.',FRA='Le contact %1 %2 est associé à une société différente de celle du client %3.';
        Text039 : TextConst Comment='%1=Contact number;%2=Contact name;',ENU='Contact %1 %2 is not related to a customer.',FRA='Le contact %1 %2 n''est associé à aucun client.';
        ContactNo : Code[20];
        Text040 : TextConst Comment='%1=table caption;%2=ServItemLine document number;%3=ServItemLine line number;%4=ServItemLine loaner number field caption;%5=ServItemLine loaner number;',ENU='You cannot delete %1 %2 because the %4 %5 for Service Item Line %3 has not been received.',FRA='Vous ne pouvez pas supprimer la %1 %2, car l''%4 %5 pour la ligne article de service %3 n''a pas été réceptionné.';
        SkipContact : Boolean;
        SkipBillToContact : Boolean;
        Text041 : TextConst ENU='Contract %1 is not signed.',FRA='Le contrat %1 n''a pas été signé.';
        Text042 : TextConst ENU='The service period for contract %1 has not yet started.',FRA='La période de service du contrat %1 n''a pas encore commencé.';
        Text043 : TextConst ENU='The service period for contract %1 has expired.',FRA='La période de service du contrat %1 a expiré.';
        Text044 : TextConst ENU='You cannot rename a %1.',FRA='Vous ne pouvez pas renommer l''enregistrement %1.';
        Confirmed : Boolean;
        Text045 : TextConst Comment='%1=Posting date field caption;%2=Posting number series field caption;%3=Posting number series;%4=NoSeries date order field caption;%5=NoSeries date order;%6=Document type;%7=posting number field caption;%8=Posting number;',ENU='You can not change the %1 field because %2 %3 has %4 = %5 and the %6 has already been assigned %7 %8.',FRA='Vous ne pouvez pas modifier le champ %1 car %2 %3 a %4 = %5 et %6 a déjà été affecté(e) à %7 %8.';
        Text046 : TextConst ENU='You cannot delete invoice %1 because one or more service ledger entries exist for this invoice.',FRA='Vous ne pouvez pas supprimer la facture %1 car il existe une ou plusieurs écritures comptables service pour cette facture.';
        Text047 : TextConst ENU='You cannot change %1 because reservation, item tracking, or order tracking exists on the sales order.',FRA='Vous ne pouvez pas modifier %1 car une réservation, une traçabilité ou un chaînage existe sur la commande vente.';
        Text050 : TextConst ENU='You cannot reset %1 because the document still has one or more lines.',FRA='Impossible de réinitialiser %1 car le document contient une ou plusieurs ligne(s).';
        Text051 : TextConst Comment='%1=Document type format;%2=Number;',ENU='The service %1 %2 already exists.',FRA='Le service %1 %2 existe déjà.';
        Text053 : TextConst ENU='Deleting this document will cause a gap in the number series for shipments. An empty shipment %1 will be created to fill this gap in the number series.\\Do you want to continue?',FRA='La suppression de ce document va engendrer une discontinuité dans la souche expédition. Une expédition vide %1 va être créée pour éviter une discontinuité dans la souche de numéros.\\Voulez-vous continuer ?';
        Text054 : TextConst ENU='Deleting this document will cause a gap in the number series for posted invoices. An empty posted invoice %1 will be created to fill this gap in the number series.\\Do you want to continue?',FRA='La suppression de ce document va engendrer une discontinuité dans la souche des factures enregistrées. Une facture enregistrée vide %1 va être créée pour éviter une discontinuité dans la souche de numéros.\\Voulez-vous continuer ?';
        Text055 : TextConst ENU='You have modified the %1 field. Note that the recalculation of VAT may cause penny differences, so you must check the amounts afterwards. Do you want to update the %2 field on the lines to reflect the new value of %1?',FRA='Vous avez modifié le champ %1. Le recalcul de la TVA va provoquer de petites différences et vous devrez donc vérifier les montants par la suite. Voulez-vous mettre à jour le champ %2 sur les lignes pour refléter la nouvelle valeur de %1 ?';
        Text057 : TextConst ENU='When you change the %1 the existing service line will be deleted.\Do you want to change the %1?',FRA='Si vous modifiez %1, la ligne service existante sera supprimée.\Voulez-vous vraiment modifier %1 ?';
        Text058 : TextConst Comment='%1=Currency code field caption;%2=Document type;%3=Number;%4=Contract number;',ENU='You cannot change %1 because %2 %3 is linked to Contract %4.',FRA='Vous ne pouvez pas modifier le %1 car %2 %3 est lié(e) au contrat %4.';
        Text060 : TextConst Comment='%1=Assigned user ID;%2=User management service filter assigned user id;',ENU='Responsibility Center is set up to process from %1 %2 only.',FRA='Le Centre de gestion est paramétré pour traiter uniquement à partir de %1 %2.';
        Text061 : TextConst ENU='You may have changed a dimension.\\Do you want to update the lines?',FRA='Vous avez probablement modifié un axe analytique.\\Souhaitez-vous mettre à jour les lignes ?';
        Text062 : TextConst ENU='An open inventory pick exists for the %1 and because %2 is %3.\\You must first post or delete the inventory pick or change %2 to Partial.',FRA='Il existe un prélèvement stock ouvert pour le %1 et parce que %2 est %3.\\Vous devez tout d''abord valider ou supprimer le prélèvement stock ou changer %2 par Partielle.';
        Text063 : TextConst ENU='An open warehouse shipment exists for the %1 and %2 is %3.\\You must add the item(s) as new line(s) to the existing warehouse shipment or change %2 to Partial.',FRA='Il existe une expédition entrepôt ouverte pour le %1 et %2 est %3.\\Vous devez ajouter les articles comme nouvelles lignes à l''expédition entrepôt existante ou changer %2 par Partielle.';
        Text064 : TextConst ENU='You cannot change %1 to %2 because an open inventory pick on the %3.',FRA='Vous ne pouvez pas modifier %1 en %2 car un prélèvement stock est ouvert sur %3.';
        Text065 : TextConst ENU='You cannot change %1  to %2 because an open warehouse shipment exists for the %3.',FRA='Vous ne pouvez pas modifier %1 en %2 car il existe une expédition entrepôt ouverte pour %3.';
        Text066 : TextConst ENU='You cannot change the dimension because there are service entries connected to this line.',FRA='Vous ne pouvez pas modifier l''axe car des écritures service sont connectées à cette ligne.';
        PostedDocsToPrintCreatedMsg : TextConst ENU='One or more related posted documents have been generated during deletion to fill gaps in the posting number series. You can view or print the documents from the respective document archive.',FRA='Un ou plusieurs documents validés connexes ont été générés lors de la suppression pour éviter une discontinuité dans la souche de numéros de validation. Vous pouvez afficher ou imprimer les documents à partir de l''archive de document correspondant.';
        DocumentNotPostedClosePageQst : TextConst ENU='The document has not been posted.\Are you sure you want to exit?',FRA='Le document n''a pas été validé.\Voulez-vous vraiment quitter ?';
        RecLCustomerPostingGroup : Record "92";
        ValeurAxe : Code[20];
        RecGRespCenter : Record "5714";
        cdegarantie : Text[30];
        Text067 : Label 'Vous ne pouvez pas supprimer un devis dont le statut OR est %1';
        ServiceMgtSetup : Record "5911";
        Insurancefirm : Record "60072";
        Cust2 : Record "18";
        GRecGeneralLedgerSetup : Record "98";
        CustOrigine : Record "18";
        AttestationSuspensiondeTVA : Record "50027";
        GRecUserSetup : Record "91";
        ServOrderAlloc : Record "5950";
        RecGuserSetup : Record "91";
        GenBusinessPostingGroup : Record "250";
        Customer : Record "18";
        Text80011 : Label 'Date comptabilisation %1  est inférieur à la date de l''autositaion administratif %2';
        Text80012 : Label 'Il faut mentionner le No. de bon de commande en suspenssion si le document à valider est en suspention de la TVA, Veuillez vérifier le groupe compta marché';
        UserSetup : Record "91";
}

