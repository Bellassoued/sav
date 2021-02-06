table 50101 "Customer Tmp"
{
    // version NAVW111.00.00.24232,NAVFR11.00.00.24232,T180001

    // T180001 ZM 05/10/2018 : upgrade

    CaptionML = ENU='Customer',
                FRA='Client';
    DataCaptionFields = "No.",Name;
    DataPerCompany = true;
    DrillDownPageID = 22;
    LookupPageID = 22;
    Permissions = TableData 21=r,
                  TableData 167=r,
                  TableData 249=rd,
                  TableData 5900=r,
                  TableData 5940=rm,
                  TableData 5965=rm,
                  TableData 7002=rd,
                  TableData 7004=rd;

    fields
    {
        field(1;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            NotBlank = true;
        }
        field(2;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
        }
        field(3;"Search Name";Code[50])
        {
            CaptionML = ENU='Search Name',
                        FRA='Nom de recherche';
        }
        field(4;"Name 2";Text[50])
        {
            CaptionML = ENU='Name 2',
                        FRA='Nom 2';
        }
        field(5;Address;Text[100])
        {
            CaptionML = ENU='Address',
                        FRA='Adresse';
        }
        field(6;"Address 2";Text[50])
        {
            CaptionML = ENU='Address 2',
                        FRA='Adresse (2ème ligne)';
        }
        field(7;City;Text[30])
        {
            CaptionML = ENU='City',
                        FRA='Ville';
            TableRelation = IF (Country/Region Code=CONST()) "Post Code".City
                            ELSE IF (Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8;Contact;Text[50])
        {
            CaptionML = ENU='Contact',
                        FRA='Contact';

            trigger OnLookup();
            var
                ContactBusinessRelation : Record "5054";
                Cont : Record "5050";
                TempCust : Record "18" temporary;
            begin
            end;
        }
        field(9;"Phone No.";Text[30])
        {
            CaptionML = ENU='Phone No.',
                        FRA='N° téléphone';
            ExtendedDatatype = PhoneNo;
        }
        field(10;"Telex No.";Text[20])
        {
            CaptionML = ENU='Telex No.',
                        FRA='N° télex';
        }
        field(11;"Document Sending Profile";Code[20])
        {
            CaptionML = ENU='Document Sending Profile',
                        FRA='Profil d''envoi de documents';
            TableRelation = "Document Sending Profile".Code;
        }
        field(14;"Our Account No.";Text[20])
        {
            CaptionML = ENU='Our Account No.',
                        FRA='Notre n° cpte/fourn.';
        }
        field(15;"Territory Code";Code[15])
        {
            CaptionML = ENU='Territory Code',
                        FRA='Code secteur';
            TableRelation = Territory;
        }
        field(16;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            CaptionML = ENU='Global Dimension 1 Code',
                        FRA='Code axe principal 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(17;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            CaptionML = ENU='Global Dimension 2 Code',
                        FRA='Code axe principal 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(18;"Chain Name";Code[20])
        {
            CaptionML = ENU='Chain Name',
                        FRA='Nom du groupe';
        }
        field(19;"Budgeted Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Budgeted Amount',
                        FRA='Montant budgété';
        }
        field(20;"Credit Limit (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Credit Limit (LCY)',
                        FRA='Crédit autorisé DS';
        }
        field(21;"Customer Posting Group";Code[20])
        {
            CaptionML = ENU='Customer Posting Group',
                        FRA='Groupe compta. client';
            TableRelation = "Customer Posting Group";
        }
        field(22;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(23;"Customer Price Group";Code[10])
        {
            CaptionML = ENU='Customer Price Group',
                        FRA='Groupe prix client';
            TableRelation = "Customer Price Group";
        }
        field(24;"Language Code";Code[10])
        {
            CaptionML = ENU='Language Code',
                        FRA='Code langue';
            TableRelation = Language;
        }
        field(26;"Statistics Group";Integer)
        {
            CaptionML = ENU='Statistics Group',
                        FRA='Groupe statistiques';
        }
        field(27;"Payment Terms Code";Code[10])
        {
            CaptionML = ENU='Payment Terms Code',
                        FRA='Code conditions paiement';
            TableRelation = "Payment Terms";
        }
        field(28;"Fin. Charge Terms Code";Code[10])
        {
            CaptionML = ENU='Fin. Charge Terms Code',
                        FRA='Code condition intérêts';
            TableRelation = "Finance Charge Terms";
        }
        field(29;"Salesperson Code";Code[20])
        {
            CaptionML = ENU='Salesperson Code',
                        FRA='Code vendeur';
            TableRelation = Salesperson/Purchaser;
        }
        field(30;"Shipment Method Code";Code[10])
        {
            CaptionML = ENU='Shipment Method Code',
                        FRA='Code condition livraison';
            TableRelation = "Shipment Method";
        }
        field(31;"Shipping Agent Code";Code[10])
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Agent Code',
                        FRA='Code transporteur';
            TableRelation = "Shipping Agent";
        }
        field(32;"Place of Export";Code[20])
        {
            CaptionML = ENU='Place of Export',
                        FRA='Lieu d''exportation';
        }
        field(33;"Invoice Disc. Code";Code[20])
        {
            CaptionML = ENU='Invoice Disc. Code',
                        FRA='Code remise facture';
            TableRelation = Customer;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(34;"Customer Disc. Group";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group',
                        FRA='Groupe rem. client';
            TableRelation = "Customer Discount Group";
        }
        field(35;"Country/Region Code";Code[10])
        {
            CaptionML = ENU='Country/Region Code',
                        FRA='Code pays/région';
            TableRelation = Country/Region;
        }
        field(36;"Collection Method";Code[20])
        {
            CaptionML = ENU='Collection Method',
                        FRA='Mode de recouvrement';
        }
        field(37;Amount;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Amount',
                        FRA='Montant';
        }
        field(38;Comment;Boolean)
        {
            CalcFormula = Exist("Comment Line" WHERE (Table Name=CONST(Customer),
                                                      No.=FIELD(No.)));
            CaptionML = ENU='Comment',
                        FRA='Commentaires';
            Editable = false;
            FieldClass = FlowField;
        }
        field(39;Blocked;Option)
        {
            CaptionML = ENU='Blocked',
                        FRA='Bloqué';
            OptionCaptionML = ENU=' ,Ship,Invoice,All',
                              FRA=' ,Livrer,Facturer,Tous';
            OptionMembers = " ",Ship,Invoice,All;

            trigger OnValidate();
            var
                CustLedgerEntry : Record "21";
                AccountingPeriod : Record "50";
                IdentityManagement : Codeunit "9801";
            begin
            end;
        }
        field(40;"Invoice Copies";Integer)
        {
            CaptionML = ENU='Invoice Copies',
                        FRA='Nombre exemplaires facture';
        }
        field(41;"Last Statement No.";Integer)
        {
            CaptionML = ENU='Last Statement No.',
                        FRA='N° dern. relevé';
        }
        field(42;"Print Statements";Boolean)
        {
            CaptionML = ENU='Print Statements',
                        FRA='Imprimer relevés';
        }
        field(45;"Bill-to Customer No.";Code[20])
        {
            CaptionML = ENU='Bill-to Customer No.',
                        FRA='N° client facturé';
            TableRelation = Customer;
        }
        field(46;Priority;Integer)
        {
            CaptionML = ENU='Priority',
                        FRA='Priorité';
        }
        field(47;"Payment Method Code";Code[10])
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
        field(53;"Last Modified Date Time";DateTime)
        {
            CaptionML = ENU='Last Modified Date Time',
                        FRA='Date-heure dernière modification';
            Editable = false;
        }
        field(54;"Last Date Modified";Date)
        {
            CaptionML = ENU='Last Date Modified',
                        FRA='Date dern. modification';
            Editable = false;
        }
        field(55;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            FieldClass = FlowFilter;
        }
        field(56;"Global Dimension 1 Filter";Code[20])
        {
            CaptionClass = '1,3,1';
            CaptionML = ENU='Global Dimension 1 Filter',
                        FRA='Filtre axe principal 1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(57;"Global Dimension 2 Filter";Code[20])
        {
            CaptionClass = '1,3,2';
            CaptionML = ENU='Global Dimension 2 Filter',
                        FRA='Filtre axe principal 2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(58;Balance;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Customer No.=FIELD(No.),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Balance',
                        FRA='Solde';
            Editable = false;
            FieldClass = FlowField;
        }
        field(59;"Balance (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Balance (LCY)',
                        FRA='Solde DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(60;"Net Change";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Customer No.=FIELD(No.),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Posting Date=FIELD(Date Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Net Change',
                        FRA='Solde période';
            Editable = false;
            FieldClass = FlowField;
        }
        field(61;"Net Change (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Posting Date=FIELD(Date Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Net Change (LCY)',
                        FRA='Solde période DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(62;"Sales (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Cust. Ledger Entry"."Sales (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                        Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                        Global Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                        Posting Date=FIELD(Date Filter),
                                                                        Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Sales (LCY)',
                        FRA='Ventes DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(63;"Profit (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Cust. Ledger Entry"."Profit (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                         Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                         Global Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                         Posting Date=FIELD(Date Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Profit (LCY)',
                        FRA='Marge DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(64;"Inv. Discounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Cust. Ledger Entry"."Inv. Discount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                Global Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                                Global Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                                Posting Date=FIELD(Date Filter),
                                                                                Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Inv. Discounts (LCY)',
                        FRA='Remises facture DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65;"Pmt. Discounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                  Entry Type=FILTER(Payment Discount..'Payment Discount (VAT Adjustment)'),
                                                                                  Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                  Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                  Posting Date=FIELD(Date Filter),
                                                                                  Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Pmt. Discounts (LCY)',
                        FRA='Escomptes DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66;"Balance Due";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Customer No.=FIELD(No.),
                                                                         Initial Entry Due Date=FIELD(UPPERLIMIT(Date Filter)),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Balance Due',
                        FRA='Solde dû';
            Editable = false;
            FieldClass = FlowField;
        }
        field(67;"Balance Due (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                 Initial Entry Due Date=FIELD(UPPERLIMIT(Date Filter)),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Balance Due (LCY)',
                        FRA='Solde dû DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(69;Payments;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Initial Document Type=CONST(Payment),
                                                                          Entry Type=CONST(Initial Entry),
                                                                          Customer No.=FIELD(No.),
                                                                          Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                          Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                          Posting Date=FIELD(Date Filter),
                                                                          Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Payments',
                        FRA='Paiements';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70;"Invoice Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Initial Document Type=CONST(Invoice),
                                                                         Entry Type=CONST(Initial Entry),
                                                                         Customer No.=FIELD(No.),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Posting Date=FIELD(Date Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Invoice Amounts',
                        FRA='Montants factures';
            Editable = false;
            FieldClass = FlowField;
        }
        field(71;"Cr. Memo Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Initial Document Type=CONST(Credit Memo),
                                                                          Entry Type=CONST(Initial Entry),
                                                                          Customer No.=FIELD(No.),
                                                                          Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                          Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                          Posting Date=FIELD(Date Filter),
                                                                          Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Cr. Memo Amounts',
                        FRA='Montants avoirs';
            Editable = false;
            FieldClass = FlowField;
        }
        field(72;"Finance Charge Memo Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Initial Document Type=CONST(Finance Charge Memo),
                                                                         Entry Type=CONST(Initial Entry),
                                                                         Customer No.=FIELD(No.),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Posting Date=FIELD(Date Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Finance Charge Memo Amounts',
                        FRA='Montants intérêts de retard';
            Editable = false;
            FieldClass = FlowField;
        }
        field(74;"Payments (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Initial Document Type=CONST(Payment),
                                                                                  Entry Type=CONST(Initial Entry),
                                                                                  Customer No.=FIELD(No.),
                                                                                  Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                  Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                  Posting Date=FIELD(Date Filter),
                                                                                  Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Payments (LCY)',
                        FRA='Paiements DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(75;"Inv. Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Initial Document Type=CONST(Invoice),
                                                                                 Entry Type=CONST(Initial Entry),
                                                                                 Customer No.=FIELD(No.),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Posting Date=FIELD(Date Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Inv. Amounts (LCY)',
                        FRA='Montants factures DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(76;"Cr. Memo Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Initial Document Type=CONST(Credit Memo),
                                                                                  Entry Type=CONST(Initial Entry),
                                                                                  Customer No.=FIELD(No.),
                                                                                  Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                  Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                  Posting Date=FIELD(Date Filter),
                                                                                  Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Cr. Memo Amounts (LCY)',
                        FRA='Montants avoirs DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(77;"Fin. Charge Memo Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Initial Document Type=CONST(Finance Charge Memo),
                                                                                 Entry Type=CONST(Initial Entry),
                                                                                 Customer No.=FIELD(No.),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Posting Date=FIELD(Date Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Fin. Charge Memo Amounts (LCY)',
                        FRA='Montants int. retard DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(78;"Outstanding Orders";Decimal)
        {
            AccessByPermission = TableData 110=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount" WHERE (Document Type=CONST(Order),
                                                                       Bill-to Customer No.=FIELD(No.),
                                                                       Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                       Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                       Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Outstanding Orders',
                        FRA='Commandes ouvertes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(79;"Shipped Not Invoiced";Decimal)
        {
            AccessByPermission = TableData 110=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Shipped Not Invoiced" WHERE (Document Type=CONST(Order),
                                                                         Bill-to Customer No.=FIELD(No.),
                                                                         Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                         Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Shipped Not Invoiced',
                        FRA='Livré non facturé';
            Editable = false;
            FieldClass = FlowField;
        }
        field(80;"Application Method";Option)
        {
            CaptionML = ENU='Application Method',
                        FRA='Mode de lettrage';
            OptionCaptionML = ENU='Manual,Apply to Oldest',
                              FRA='Manuel,Au plus ancien';
            OptionMembers = Manual,"Apply to Oldest";
        }
        field(82;"Prices Including VAT";Boolean)
        {
            CaptionML = ENU='Prices Including VAT',
                        FRA='Prix TTC';
        }
        field(83;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));
        }
        field(84;"Fax No.";Text[30])
        {
            CaptionML = ENU='Fax No.',
                        FRA='N° télécopie';
        }
        field(85;"Telex Answer Back";Text[20])
        {
            CaptionML = ENU='Telex Answer Back',
                        FRA='Télex retour';
        }
        field(86;"VAT Registration No.";Text[20])
        {
            CaptionML = ENU='VAT Registration No.',
                        FRA='N° identif. intracomm.';

            trigger OnValidate();
            var
                LRecCustomer : Record "18";
            begin
            end;
        }
        field(87;"Combine Shipments";Boolean)
        {
            AccessByPermission = TableData 110=R;
            CaptionML = ENU='Combine Shipments',
                        FRA='Regroupement B.L.';
        }
        field(88;"Gen. Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='Gen. Bus. Posting Group',
                        FRA='Groupe compta. marché';
            TableRelation = "Gen. Business Posting Group";
        }
        field(89;Picture;BLOB)
        {
            CaptionML = ENU='Picture',
                        FRA='illustration';
            SubType = Bitmap;
        }
        field(90;GLN;Code[13])
        {
            CaptionML = ENU='GLN',
                        FRA='GLN';
            Numeric = true;

            trigger OnValidate();
            var
                GLNCalculator : Codeunit "1607";
            begin
                IF GLN <> '' THEN
                  GLNCalculator.AssertValidCheckDigit13(GLN);
            end;
        }
        field(91;"Post Code";Code[20])
        {
            CaptionML = ENU='Post Code',
                        FRA='Code postal';
            TableRelation = IF (Country/Region Code=CONST()) "Post Code"
                            ELSE IF (Country/Region Code=FILTER(<>'')) "Post Code" WHERE (Country/Region Code=FIELD(Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(92;County;Text[30])
        {
            CaptionML = ENU='County',
                        FRA='Gouvernorat';
            TableRelation = Région.Code;
            ValidateTableRelation = false;

            trigger OnValidate();
            var
                LRecRegion : Record "50025";
            begin
            end;
        }
        field(97;"Debit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Debit Amount" WHERE (Customer No.=FIELD(No.),
                                                                                 Entry Type=FILTER(<>Application),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Posting Date=FIELD(Date Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Debit Amount',
                        FRA='Montant débit';
            Editable = false;
            FieldClass = FlowField;
        }
        field(98;"Credit Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Credit Amount" WHERE (Customer No.=FIELD(No.),
                                                                                  Entry Type=FILTER(<>Application),
                                                                                  Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                  Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                  Posting Date=FIELD(Date Filter),
                                                                                  Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Credit Amount',
                        FRA='Montant crédit';
            Editable = false;
            FieldClass = FlowField;
        }
        field(99;"Debit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Debit Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                       Entry Type=FILTER(<>Application),
                                                                                       Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                       Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                       Posting Date=FIELD(Date Filter),
                                                                                       Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Debit Amount (LCY)',
                        FRA='Montant débit DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(100;"Credit Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Credit Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                        Entry Type=FILTER(<>Application),
                                                                                        Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                        Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                        Posting Date=FIELD(Date Filter),
                                                                                        Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Credit Amount (LCY)',
                        FRA='Montant crédit DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(102;"E-Mail";Text[80])
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
        field(103;"Home Page";Text[80])
        {
            CaptionML = ENU='Home Page',
                        FRA='Page d''accueil';
            ExtendedDatatype = URL;
        }
        field(104;"Reminder Terms Code";Code[10])
        {
            CaptionML = ENU='Reminder Terms Code',
                        FRA='Code condition relance';
            TableRelation = "Reminder Terms";
        }
        field(105;"Reminder Amounts";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Initial Document Type=CONST(Reminder),
                                                                         Entry Type=CONST(Initial Entry),
                                                                         Customer No.=FIELD(No.),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Posting Date=FIELD(Date Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Reminder Amounts',
                        FRA='Montants relances';
            Editable = false;
            FieldClass = FlowField;
        }
        field(106;"Reminder Amounts (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Initial Document Type=CONST(Reminder),
                                                                                 Entry Type=CONST(Initial Entry),
                                                                                 Customer No.=FIELD(No.),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Posting Date=FIELD(Date Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Reminder Amounts (LCY)',
                        FRA='Montants relances DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(107;"No. Series";Code[20])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(108;"Tax Area Code";Code[20])
        {
            CaptionML = ENU='Tax Area Code',
                        FRA='Code zone recouvrement';
            TableRelation = "Tax Area";
        }
        field(109;"Tax Liable";Boolean)
        {
            CaptionML = ENU='Tax Liable',
                        FRA='Soumis à recouvrement';
        }
        field(110;"VAT Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='VAT Bus. Posting Group',
                        FRA='Groupe compta. marché TVA';
        }
        field(111;"Currency Filter";Code[10])
        {
            CaptionML = ENU='Currency Filter',
                        FRA='Filtre devise';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }
        field(113;"Outstanding Orders (LCY)";Decimal)
        {
            AccessByPermission = TableData 110=R;
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount (LCY)" WHERE (Document Type=CONST(Order),
                                                                             Bill-to Customer No.=FIELD(No.),
                                                                             Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                             Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                             Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Outstanding Orders (LCY)',
                        FRA='Commandes ouvertes DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(114;"Shipped Not Invoiced (LCY)";Decimal)
        {
            AccessByPermission = TableData 110=R;
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Shipped Not Invoiced (LCY)" WHERE (Document Type=CONST(Order),
                                                                               Bill-to Customer No.=FIELD(No.),
                                                                               Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                               Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                               Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Shipped Not Invoiced (LCY)',
                        FRA='Livré non facturé DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(115;Reserve;Option)
        {
            AccessByPermission = TableData 110=R;
            CaptionML = ENU='Reserve',
                        FRA='Réserver';
            InitValue = Optional;
            OptionCaptionML = ENU='Never,Optional,Always',
                              FRA='Jamais,Manuel,Toujours';
            OptionMembers = Never,Optional,Always;
        }
        field(116;"Block Payment Tolerance";Boolean)
        {
            CaptionML = ENU='Block Payment Tolerance',
                        FRA='Bloquer écart de règlement';
        }
        field(117;"Pmt. Disc. Tolerance (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                  Entry Type=FILTER(Payment Discount Tolerance|'Payment Discount Tolerance (VAT Adjustment)'|'Payment Discount Tolerance (VAT Excl.)'),
                                                                                  Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                  Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                  Posting Date=FIELD(Date Filter),
                                                                                  Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Pmt. Disc. Tolerance (LCY)',
                        FRA='Validation écart d''escompte DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(118;"Pmt. Tolerance (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Customer No.=FIELD(No.),
                                                                                  Entry Type=FILTER(Payment Tolerance|'Payment Tolerance (VAT Adjustment)'|'Payment Tolerance (VAT Excl.)'),
                                                                                  Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                  Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                  Posting Date=FIELD(Date Filter),
                                                                                  Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Pmt. Tolerance (LCY)',
                        FRA='Écart de règlement DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(119;"IC Partner Code";Code[20])
        {
            CaptionML = ENU='IC Partner Code',
                        FRA='Code du partenaire IC';
            TableRelation = "IC Partner";

            trigger OnValidate();
            var
                CustLedgEntry : Record "21";
                AccountingPeriod : Record "50";
                ICPartner : Record "413";
            begin
            end;
        }
        field(120;Refunds;Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Initial Document Type=CONST(Refund),
                                                                         Entry Type=CONST(Initial Entry),
                                                                         Customer No.=FIELD(No.),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Posting Date=FIELD(Date Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Refunds',
                        FRA='Remboursements';
            FieldClass = FlowField;
        }
        field(121;"Refunds (LCY)";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Initial Document Type=CONST(Refund),
                                                                                 Entry Type=CONST(Initial Entry),
                                                                                 Customer No.=FIELD(No.),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Posting Date=FIELD(Date Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Refunds (LCY)',
                        FRA='Remboursements DS';
            FieldClass = FlowField;
        }
        field(122;"Other Amounts";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Initial Document Type=CONST(" "),
                                                                         Entry Type=CONST(Initial Entry),
                                                                         Customer No.=FIELD(No.),
                                                                         Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                         Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                         Posting Date=FIELD(Date Filter),
                                                                         Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Other Amounts',
                        FRA='Autres montants';
            FieldClass = FlowField;
        }
        field(123;"Other Amounts (LCY)";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE (Initial Document Type=CONST(" "),
                                                                                 Entry Type=CONST(Initial Entry),
                                                                                 Customer No.=FIELD(No.),
                                                                                 Initial Entry Global Dim. 1=FIELD(Global Dimension 1 Filter),
                                                                                 Initial Entry Global Dim. 2=FIELD(Global Dimension 2 Filter),
                                                                                 Posting Date=FIELD(Date Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Other Amounts (LCY)',
                        FRA='Autres montants DS';
            FieldClass = FlowField;
        }
        field(124;"Prepayment %";Decimal)
        {
            CaptionML = ENU='Prepayment %',
                        FRA='% acompte';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(125;"Outstanding Invoices (LCY)";Decimal)
        {
            AccessByPermission = TableData 110=R;
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount (LCY)" WHERE (Document Type=CONST(Invoice),
                                                                             Bill-to Customer No.=FIELD(No.),
                                                                             Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                             Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                             Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Outstanding Invoices (LCY)',
                        FRA='Factures en attente DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(126;"Outstanding Invoices";Decimal)
        {
            AccessByPermission = TableData 110=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Sales Line"."Outstanding Amount" WHERE (Document Type=CONST(Invoice),
                                                                       Bill-to Customer No.=FIELD(No.),
                                                                       Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                       Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                       Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Outstanding Invoices',
                        FRA='Factures en attente';
            Editable = false;
            FieldClass = FlowField;
        }
        field(130;"Bill-to No. Of Archived Doc.";Integer)
        {
            CalcFormula = Count("Sales Header Archive" WHERE (Document Type=CONST(Order),
                                                              Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-to No. Of Archived Doc.',
                        FRA='Facturation - Nbre de doc. archivés';
            FieldClass = FlowField;
        }
        field(131;"Sell-to No. Of Archived Doc.";Integer)
        {
            CalcFormula = Count("Sales Header Archive" WHERE (Document Type=CONST(Order),
                                                              Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Sell-to No. Of Archived Doc.',
                        FRA='Vente - Nbre de doc. archivés';
            FieldClass = FlowField;
        }
        field(132;"Partner Type";Option)
        {
            CaptionML = ENU='Partner Type',
                        FRA='Type partenaire';
            OptionCaptionML = ENU=' ,Company,Person',
                              FRA=' ,Société,Personne';
            OptionMembers = " ",Company,Person;
        }
        field(140;Image;Media)
        {
            CaptionML = ENU='Image',
                        FRA='Image';
            ExtendedDatatype = Person;
        }
        field(150;"Privacy Blocked";Boolean)
        {
            CaptionML = ENU='Privacy Blocked',
                        FRA='Confidentialité bloquée';
        }
        field(288;"Preferred Bank Account Code";Code[20])
        {
            CaptionML = ENU='Preferred Bank Account Code',
                        FRA='Code de compte bancaire préféré';
            TableRelation = "Customer Bank Account".Code WHERE (Customer No.=FIELD(No.));
        }
        field(840;"Cash Flow Payment Terms Code";Code[10])
        {
            CaptionML = ENU='Cash Flow Payment Terms Code',
                        FRA='Code modalités de paiement de trésorerie';
            TableRelation = "Payment Terms";
        }
        field(5049;"Primary Contact No.";Code[20])
        {
            CaptionML = ENU='Primary Contact No.',
                        FRA='N° contact principal';
            TableRelation = Contact;

            trigger OnLookup();
            var
                Cont : Record "5050";
                ContBusRel : Record "5054";
                TempCust : Record "18" temporary;
            begin
            end;

            trigger OnValidate();
            var
                Cont : Record "5050";
                ContBusRel : Record "5054";
            begin
            end;
        }
        field(5050;"Contact Type";Option)
        {
            CaptionML = ENU='Contact Type',
                        FRA='Type de contact';
            OptionCaptionML = ENU='Company,Person',
                              FRA='Société,Personne';
            OptionMembers = Company,Person;
        }
        field(5700;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            TableRelation = "Responsibility Center";
        }
        field(5750;"Shipping Advice";Option)
        {
            AccessByPermission = TableData 110=R;
            CaptionML = ENU='Shipping Advice',
                        FRA='Option d''expédition';
            OptionCaptionML = ENU='Partial,Complete',
                              FRA='Partielle,Totale';
            OptionMembers = Partial,Complete;
        }
        field(5790;"Shipping Time";DateFormula)
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Time',
                        FRA='Délai d''expédition';
        }
        field(5792;"Shipping Agent Service Code";Code[10])
        {
            CaptionML = ENU='Shipping Agent Service Code',
                        FRA='Code prestation transporteur';
            TableRelation = "Shipping Agent Services".Code WHERE (Shipping Agent Code=FIELD(Shipping Agent Code));
        }
        field(5900;"Service Zone Code";Code[10])
        {
            CaptionML = ENU='Service Zone Code',
                        FRA='Code zone service';
            TableRelation = "Service Zone";
        }
        field(5902;"Contract Gain/Loss Amount";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Contract Gain/Loss Entry".Amount WHERE (Customer No.=FIELD(No.),
                                                                       Ship-to Code=FIELD(Ship-to Filter),
                                                                       Change Date=FIELD(Date Filter)));
            CaptionML = ENU='Contract Gain/Loss Amount',
                        FRA='Montant gain/perte contrat';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5903;"Ship-to Filter";Code[10])
        {
            CaptionML = ENU='Ship-to Filter',
                        FRA='Filtre destinataire';
            FieldClass = FlowFilter;
            TableRelation = "Ship-to Address".Code WHERE (Customer No.=FIELD(No.));
        }
        field(5910;"Outstanding Serv. Orders (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Service Line"."Outstanding Amount (LCY)" WHERE (Document Type=CONST(Order),
                                                                               Bill-to Customer No.=FIELD(No.),
                                                                               Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                               Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                               Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Outstanding Serv. Orders (LCY)',
                        FRA='Commandes serv. ouvertes DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5911;"Serv Shipped Not Invoiced(LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Service Line"."Shipped Not Invoiced (LCY)" WHERE (Document Type=CONST(Order),
                                                                                 Bill-to Customer No.=FIELD(No.),
                                                                                 Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                                 Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                                 Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Serv Shipped Not Invoiced(LCY)',
                        FRA='Serv. livré non facturé DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5912;"Outstanding Serv.Invoices(LCY)";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Service Line"."Outstanding Amount (LCY)" WHERE (Document Type=CONST(Invoice),
                                                                               Bill-to Customer No.=FIELD(No.),
                                                                               Shortcut Dimension 1 Code=FIELD(Global Dimension 1 Filter),
                                                                               Shortcut Dimension 2 Code=FIELD(Global Dimension 2 Filter),
                                                                               Currency Code=FIELD(Currency Filter)));
            CaptionML = ENU='Outstanding Serv.Invoices(LCY)',
                        FRA='Factures service en attente DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7001;"Allow Line Disc.";Boolean)
        {
            CaptionML = ENU='Allow Line Disc.',
                        FRA='Autoriser remise ligne';
            InitValue = true;
        }
        field(7171;"No. of Quotes";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Quote),
                                                      Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Quotes',
                        FRA='Nbre de devis';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7172;"No. of Blanket Orders";Integer)
        {
            AccessByPermission = TableData 110=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Blanket Order),
                                                      Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Blanket Orders',
                        FRA='Nbre de commandes ouvertes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7173;"No. of Orders";Integer)
        {
            AccessByPermission = TableData 110=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Order),
                                                      Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Orders',
                        FRA='Nbre de commandes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7174;"No. of Invoices";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Invoice),
                                                      Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Invoices',
                        FRA='Nbre de factures';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7175;"No. of Return Orders";Integer)
        {
            AccessByPermission = TableData 6660=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Return Order),
                                                      Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Return Orders',
                        FRA='Nbre de retours';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7176;"No. of Credit Memos";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Credit Memo),
                                                      Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Credit Memos',
                        FRA='Nbre d''avoirs';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7177;"No. of Pstd. Shipments";Integer)
        {
            CalcFormula = Count("Sales Shipment Header" WHERE (Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Pstd. Shipments',
                        FRA='Nbre d''expéditions enregistrées';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7178;"No. of Pstd. Invoices";Integer)
        {
            CalcFormula = Count("Sales Invoice Header" WHERE (Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Pstd. Invoices',
                        FRA='Nbre de factures enregistrées';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7179;"No. of Pstd. Return Receipts";Integer)
        {
            CalcFormula = Count("Return Receipt Header" WHERE (Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Pstd. Return Receipts',
                        FRA='Nbre de réceptions retour enregistrées';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7180;"No. of Pstd. Credit Memos";Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Header" WHERE (Sell-to Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Pstd. Credit Memos',
                        FRA='Nbre d''avoirs enregistrés';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7181;"No. of Ship-to Addresses";Integer)
        {
            CalcFormula = Count("Ship-to Address" WHERE (Customer No.=FIELD(No.)));
            CaptionML = ENU='No. of Ship-to Addresses',
                        FRA='Nbre d''adresses destinataire';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7182;"Bill-To No. of Quotes";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Quote),
                                                      Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Quotes',
                        FRA='Facturation - Nbre de devis';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7183;"Bill-To No. of Blanket Orders";Integer)
        {
            AccessByPermission = TableData 110=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Blanket Order),
                                                      Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Blanket Orders',
                        FRA='Facturation - Nbre de commandes ouvertes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7184;"Bill-To No. of Orders";Integer)
        {
            AccessByPermission = TableData 110=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Order),
                                                      Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Orders',
                        FRA='Facturation - Nbre de commandes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7185;"Bill-To No. of Invoices";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Invoice),
                                                      Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Invoices',
                        FRA='Facturation - Nbre de factures';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7186;"Bill-To No. of Return Orders";Integer)
        {
            AccessByPermission = TableData 6660=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Return Order),
                                                      Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Return Orders',
                        FRA='Facturation - Nbre de retours';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7187;"Bill-To No. of Credit Memos";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Credit Memo),
                                                      Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Credit Memos',
                        FRA='Facturation - Nbre d''avoirs';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7188;"Bill-To No. of Pstd. Shipments";Integer)
        {
            CalcFormula = Count("Sales Shipment Header" WHERE (Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Pstd. Shipments',
                        FRA='Facturation - Nbre d''expéditions enregistrées';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7189;"Bill-To No. of Pstd. Invoices";Integer)
        {
            CalcFormula = Count("Sales Invoice Header" WHERE (Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Pstd. Invoices',
                        FRA='Facturation - Nbre de factures enregistrées';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7190;"Bill-To No. of Pstd. Return R.";Integer)
        {
            CalcFormula = Count("Return Receipt Header" WHERE (Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Pstd. Return R.',
                        FRA='Facturation - Nbre de réceptions retour enregistrées';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7191;"Bill-To No. of Pstd. Cr. Memos";Integer)
        {
            CalcFormula = Count("Sales Cr.Memo Header" WHERE (Bill-to Customer No.=FIELD(No.)));
            CaptionML = ENU='Bill-To No. of Pstd. Cr. Memos',
                        FRA='Facturation - Nbre d''avoirs enregistrés';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7600;"Base Calendar Code";Code[10])
        {
            CaptionML = ENU='Base Calendar Code',
                        FRA='Code calendrier principal';
            TableRelation = "Base Calendar";
        }
        field(7601;"Copy Sell-to Addr. to Qte From";Option)
        {
            AccessByPermission = TableData 5050=R;
            CaptionML = ENU='Copy Sell-to Addr. to Qte From',
                        FRA='Copier adr donn ordre => devis';
            OptionCaptionML = ENU='Company,Person',
                              FRA='Société,Personne';
            OptionMembers = Company,Person;
        }
        field(7602;"Validate EU Vat Reg. No.";Boolean)
        {
            CaptionML = ENU='Validate EU Vat Reg. No.',
                        FRA='Valider N° id. intracomm. Union européenne';
        }
        field(8000;Id;Guid)
        {
            CaptionML = ENU='Id',
                        FRA='Id';
        }
        field(8001;"Currency Id";Guid)
        {
            CaptionML = ENU='Currency Id',
                        FRA='ID Devise';
            TableRelation = Currency.Id;
        }
        field(8002;"Payment Terms Id";Guid)
        {
            CaptionML = ENU='Payment Terms Id',
                        FRA='ID Conditions de paiement';
            TableRelation = "Payment Terms".Id;
        }
        field(8003;"Shipment Method Id";Guid)
        {
            CaptionML = ENU='Shipment Method Id',
                        FRA='ID Conditions de livraison';
            TableRelation = "Shipment Method".Id;
        }
        field(8004;"Payment Method Id";Guid)
        {
            CaptionML = ENU='Payment Method Id',
                        FRA='ID mode de règlement';
            TableRelation = "Payment Method".Id;
        }
        field(9003;"Tax Area ID";Guid)
        {
            CaptionML = ENU='Tax Area ID',
                        FRA='ID zone de recouvrement';
        }
        field(9004;"Tax Area Display Name";Text[50])
        {
            CalcFormula = Lookup("Tax Area".Description WHERE (Code=FIELD(Tax Area Code)));
            CaptionML = ENU='Tax Area Display Name',
                        FRA='Nom d''affichage de zone de recouvrement';
            FieldClass = FlowField;
            ObsoleteReason = 'This field is not needed and it should not be used.';
            ObsoleteState = Pending;
        }
        field(9005;"Contact ID";Guid)
        {
            CaptionML = ENU='Contact ID',
                        FRA='ID contact';
        }
        field(9006;"Contact Graph Id";Text[250])
        {
            CaptionML = ENU='Contact Graph Id',
                        FRA='ID Graph Contact';
        }
        field(10860;"Payment in progress (LCY)";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Account Type=CONST(Customer),
                                                                    Account No.=FIELD(No.),
                                                                    Copied To Line=CONST(0),
                                                                    Payment in Progress=CONST(Yes)));
            CaptionML = ENU='Payment in progress (LCY)',
                        FRA='Règlement en cours DS';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10880;"Exclude from Payment Reporting";Boolean)
        {
            CaptionML = ENU='Exclude from Payment Reporting',
                        FRA='Exclure de l''état règlement';
            DataClassification = SystemMetadata;
        }
        field(50000;Statut;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            OptionCaptionML = ENU='Waiting,Validated',
                              FRA='En Attente,Validé';
            OptionMembers = Waiting,Validated;
        }
        field(50025;Activity;Text[40])
        {
            Description = 'RS & KK DEC EMP V2015';
        }
        field(50026;"Type du Client";Option)
        {
            Description = 'RS & KK DEC EMP V2015';
            OptionMembers = " ","Non Resident physique","Non Resident Morale","Resident Morale","Resident Physique","Regime reel";
        }
        field(50027;"No. CIN";Text[8])
        {
            Caption = 'N° CIN';
            Description = 'RS & KK DEC EMP V2015';

            trigger OnValidate();
            var
                LRecCustomer : Record "18";
            begin
            end;
        }
        field(60000;"Ancien Code Client";Code[20])
        {
        }
        field(60001;"No Autorisation administrative";Code[20])
        {
        }
        field(60002;"Date debut Autorisation Admin.";Date)
        {
        }
        field(60003;"Date fin Autorisation Admin.";Date)
        {
        }
        field(60004;"Type Client";Option)
        {
            OptionCaption = ',Revendeur,Etatique,Particulier Assujitti,Particulier non Assujitti';
            OptionMembers = ,Revendeur,Etatique,"Particulier Assujitti","Particulier non Assujitti";
        }
        field(60005;"Chèques en coffre";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                           Status No.=FILTER(20000|226875|186875|196875|216875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            Description = '// Ajouter par Gmed => Demander par Tarek Boughanmi > 24/03/2014';
            FieldClass = FlowField;
        }
        field(60006;"Chèques versés à l'enaci";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                           Status No.=FILTER(92500|80000|90000),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            FieldClass = FlowField;
        }
        field(60007;"Chèques retournés impayés";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                           Status No.=FILTER(116875|126875|131875|134875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            Description = '// Ajouter par Gmed => Demander par Tarek Boughanmi > 24/03/2014';
            FieldClass = FlowField;
        }
        field(60008;"Chèques de garantie";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Type Règlement=FILTER(CHÈQUE),
                                                           Situation=FILTER(Garantie),
                                                           Account No.=FIELD(No.),
                                                           Account Type=FILTER(Customer),
                                                           Copied To No.=FILTER('')));
            Description = '// Ajouter par Gmed => Demander par Tarek Boughanmi > 24/03/2014';
            FieldClass = FlowField;
        }
        field(60009;"Effets en coffre";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-EFF),
                                                           Status No.=FILTER(20000|206875|191875|194375|186875|196875|216875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER(''),
                                                           Transfert BR/Siège No=FILTER('')));
            Description = '// Ajouter par Gmed => Demander par Tarek Boughanmi > 24/03/2014';
            FieldClass = FlowField;
        }
        field(60010;"Effets remis à l'encaissement";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-EFF),
                                                           Status No.=FILTER(92500|80000|100000),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            Description = '// Ajouter par Gmed => Demander par Tarek Boughanmi > 24/03/2014';
            FieldClass = FlowField;
        }
        field(60011;"Effets remis à l'escompte";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-EFF),
                                                           Status No.=FILTER(50000|30000|60000),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            Description = '// Ajouter par Gmed => Demander par Tarek Boughanmi > 24/03/2014';
            FieldClass = FlowField;
        }
        field(60012;"Effets impayés";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-EFF),
                                                           Status No.=FILTER(126875|116875|12687|131875|146875|236875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            FieldClass = FlowField;
        }
        field(60013;Caution;Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Situation=FILTER(Caution),
                                                           Account No.=FIELD(No.),
                                                           Account Type=FILTER(Customer),
                                                           Copied To No.=FILTER('')));
            Description = '// Ajouter par Gmed => Demander par Tarek Boughanmi > 24/03/2014';
            FieldClass = FlowField;
        }
        field(60014;"De la part de";Code[250])
        {
            Description = 'SM';
        }
        field(60015;"Type Contact";Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU='Company,Person',
                              FRA='Société,Personne';
            OptionMembers = Company,Person;
        }
        field(60016;"Région";Code[20])
        {
            CalcFormula = Lookup("Default Dimension"."Dimension Value Code" WHERE (Table ID=CONST(18),
                                                                                   No.=FIELD(No.),
                                                                                   Dimension Code=CONST(REGION)));
            FieldClass = FlowField;
        }
        field(60017;"Catégorie";Code[20])
        {
            CalcFormula = Lookup("Default Dimension"."Dimension Value Code" WHERE (Table ID=CONST(18),
                                                                                   No.=FIELD(No.),
                                                                                   Dimension Code=CONST(CATEGORIE)));
            FieldClass = FlowField;
        }
        field(60018;"Bloqué SAV";Boolean)
        {
            Caption = 'Bloqué SAV';
            Description = 'SM MAZDA316';
        }
        field(60019;"Lettrage Obligatoire";Boolean)
        {
            Description = 'SM MAZDA976';
        }
        field(60020;"Client CS";Boolean)
        {
            Description = 'SM MAZDA1003';
        }
        field(60021;"Code Utilisateur recouvrement";Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(60022;"Groupe Client";Code[20])
        {
            Description = 'Ajouter a partir de INCADEA, beoisn pour l''import,Voir l''utilité ?';
            TableRelation = "Groupe Client".Code;
        }
        field(60023;"Customer Type";Option)
        {
            CaptionML = ENU='Customer Type',
                        FRA='Type Client';
            OptionCaptionML = ENU='Male,Female,Business',
                              FRA='Homme,Femme,Société';
            OptionMembers = Homme,Femme,"Société";
        }
        field(60024;"Customer Disc. Group MO";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group',
                        FRA='Groupe rem. client MO';
            Description = 'SM040717';
            TableRelation = "Customer Discount Group MO";
        }
        field(60025;"Comentaire démarage";Text[50])
        {
        }
        field(60026;"Type Service";Option)
        {
            OptionCaption = 'Externe,Garantie,Iterne';
            OptionMembers = Externe,Garantie,Iterne;
        }
        field(60027;"Code Titre";Code[20])
        {
            Description = 'SM 180717';
            TableRelation = Titre;

            trigger OnValidate();
            var
                LRecSalesLine : Record "37";
                RESEXISTSERROR : Label 'Vous devez supprimer la ligne %1 du document  %2  %3 avant modification du code titre';
            begin
            end;
        }
        field(60028;"Phone No. 2";Text[30])
        {
            CaptionML = ENU='Phone No.',
                        FRA='N° téléphone';
            Description = 'SM 270717';
            ExtendedDatatype = PhoneNo;
        }
        field(60029;"Type Identifiant";Option)
        {
            OptionCaption = '" ,C.I.N,M.F"';
            OptionMembers = " ","C.I.N","M.F";
        }
        field(60030;"Date création client";DateTime)
        {
            Description = 'KT 020817';
        }
        field(60031;"Date validation client";DateTime)
        {
            Description = 'KT 020817';
        }
        field(60032;"Apply Stamp fiscal";Boolean)
        {
            Caption = 'Appliquer Timbre fiscal';
        }
        field(60033;"Appliquer frais dossier OR";Boolean)
        {
        }
        field(60034;"Traitement Spécific TVA";Boolean)
        {
            Description = 'SM 290917';
        }
        field(60035;"Dérogation CG";Boolean)
        {
            Description = 'SM 161017';
        }
        field(60036;"B. Transfert chèque";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                           Status No.=FILTER(226875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            Description = '226875';
            FieldClass = FlowField;
        }
        field(60037;"B. Transfert effet";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-EFF),
                                                           Status No.=FILTER(206875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            Description = '226875';
            FieldClass = FlowField;
        }
        field(60038;"B. Echange Chq";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                           Status No.=FILTER(286875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            FieldClass = FlowField;
        }
        field(60039;"B. Echange Effet";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(ENC-EFF),
                                                           Status No.=FILTER(216875),
                                                           Account No.=FIELD(No.),
                                                           Copied To No.=FILTER('')));
            FieldClass = FlowField;
        }
        field(60040;"Nbr Effet Impayé";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Status No.=FILTER(126875),
                                                      Account No.=FIELD(No.),
                                                      Copied To No.=FILTER('')));
            FieldClass = FlowField;
        }
        field(60041;"Nbr chèque Impayé";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                      Status No.=FILTER(116875|126875),
                                                      Account No.=FIELD(No.),
                                                      Copied To No.=FILTER('')));
            FieldClass = FlowField;
        }
        field(60042;"Ancticédent Eff Impayé";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Status No.=FILTER(126875),
                                                      Account No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(60043;"AncticédentChq Impayé";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                      Status No.=FILTER(116875|126875),
                                                      Account No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(60044;"En-Cours";Decimal)
        {
        }
        field(60045;"Effet Notifié non Echu";Decimal)
        {
        }
        field(60046;"Correspondance AUTO";Code[20])
        {
        }
        field(60047;"Time of Update";Time)
        {
            Description = 'KT 290118 CRM';
        }
        field(60048;"Home Mobile Phone No_";Text[30])
        {
            Description = 'KT 290118 CRM';
        }
        field(60049;"Home E-Mail";Text[80])
        {
            Description = 'KT 290118 CRM';
        }
        field(60050;Traiter;Boolean)
        {
            Description = 'KT 290118 CRM';
        }
        field(60051;"Code CLT CRM";Text[100])
        {
            Description = 'KT 290118 CRM';
        }
        field(60052;"Address Salutation Code";Option)
        {
            Description = 'KT 290118 CRM';
            OptionMembers = Soc,"Mr.",Mme,Melle,"Min";
        }
        field(60053;"No. 2";Code[20])
        {
            Description = 'SM 311018';
        }
        field(60054;"Type BOF";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 07022019';
            OptionMembers = " ",Banque,"Banque Islamique",Leasing;
        }
        field(60055;"Customer Disc. Group PR SAV";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group AF',
                        FRA='Groupe rem. client PR SAV';
            DataClassification = ToBeClassified;
            Description = 'SM 250419';
            TableRelation = "Customer Discount Group";
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
        key(Key2;"Search Name")
        {
        }
        key(Key3;"Customer Posting Group")
        {
        }
        key(Key4;"Currency Code")
        {
        }
        key(Key5;"Country/Region Code")
        {
        }
        key(Key6;"Gen. Bus. Posting Group")
        {
        }
        key(Key7;Name,Address,City)
        {
        }
        key(Key8;"VAT Registration No.")
        {
        }
        key(Key9;Name)
        {
        }
        key(Key10;City)
        {
        }
        key(Key11;"Post Code")
        {
        }
        key(Key12;"Phone No.")
        {
        }
        key(Key13;Contact)
        {
        }
        key(Key14;"Salesperson Code")
        {
        }
        key(Key15;"No. CIN")
        {
        }
        key(Key16;"No. 2")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"No.","No. 2",Name,City,"Post Code","Phone No.",Contact)
        {
        }
        fieldgroup(Brick;"No.",Name,"Balance (LCY)",Contact,"Balance Due (LCY)",Image)
        {
        }
    }

    trigger OnDelete();
    var
        CampaignTargetGr : Record "7030";
        ContactBusRel : Record "5054";
        Job : Record "167";
        SocialListeningSearchTopic : Record "871";
        StdCustSalesCode : Record "172";
        CustomReportSelection : Record "9657";
        MyCustomer : Record "9150";
        ServHeader : Record "5900";
        CampaignTargetGrMgmt : Codeunit "7030";
        VATRegistrationLogMgt : Codeunit "249";
        CustLedgEntry : Record "21";
    begin

    end;

    trigger OnInsert();
    var
        UserSetupMgt : Codeunit "5700";
        RecGUserSetup : Record "91";
    begin
    end;

    trigger OnRename();
    var
        CustomerTemplate : Record "5105";
        SkipRename : Boolean;
    begin


    end;

    var
        Text000 : TextConst ENU='You cannot delete %1 %2 because there is at least one outstanding Sales %3 for this customer.',FRA='Vous ne pouvez pas supprimer %1 %2 car il existe encore au moins une %3 vente ouverte pour ce client.';
        Text002 : TextConst ENU='Do you wish to create a contact for %1 %2?',FRA='Souhaitez-vous créer un contact pour %1 %2 ?';
        SalesSetup : Record "311";
        CommentLine : Record "97";
        SalesOrderLine : Record "37";
        CustBankAcc : Record "287";
        ShipToAddr : Record "222";
        PostCode : Record "225";
        GenBusPostingGrp : Record "250";
        ShippingAgentService : Record "5790";
        ItemCrossReference : Record "5717";
        RMSetup : Record "5079";
        SalesPrice : Record "7002";
        SalesLineDisc : Record "7004";
        SalesPrepmtPct : Record "459";
        ServContract : Record "5965";
        ServiceItem : Record "5940";
        SalespersonPurchaser : Record "13";
        CustomizedCalendarChange : Record "7602";
        PaymentToleranceMgt : Codeunit "426";
        NoSeriesMgt : Codeunit "396";
        MoveEntries : Codeunit "361";
        UpdateContFromCust : Codeunit "5056";
        DimMgt : Codeunit "408";
        ApprovalsMgmt : Codeunit "1535";
        CalendarManagement : Codeunit "7600";
        InsertFromContact : Boolean;
        Text003 : TextConst ENU='Contact %1 %2 is not related to customer %3 %4.',FRA='Le contact %1 %2 n''est pas associé au client %3 %4.';
        Text004 : TextConst ENU='post',FRA='valider';
        Text005 : TextConst ENU='create',FRA='créer';
        Text006 : TextConst ENU='You cannot %1 this type of document when Customer %2 is blocked with type %3',FRA='Vous ne pouvez pas %1 ce type de document lorsque le client %2 est bloqué avec le type %3';
        Text007 : TextConst ENU='You cannot delete %1 %2 because there is at least one not cancelled Service Contract for this customer.',FRA='Vous ne pouvez pas supprimer l''enregistrement %1 %2 car il existe au moins un contrat service qui n''a pas été annulé pour ce client.';
        Text008 : TextConst ENU='Deleting the %1 %2 will cause the %3 to be deleted for the associated Service Items. Do you want to continue?',FRA='Supprimer l''enregistrement %1 %2 va entraîner la suppression de la valeur %3 pour les articles de service associés. Souhaitez-vous continuer ?';
        Text009 : TextConst ENU='Cannot delete customer.',FRA='Impossible de supprimer ce client.';
        Text010 : TextConst ENU='The %1 %2 has been assigned to %3 %4.\The same %1 cannot be entered on more than one %3. Enter another code.',FRA='La valeur %1 %2 a été affectée à %3 %4.\La même valeur %1 ne peut pas être entrée sur plus d''un/une %3. Entrez un autre code.';
        Text011 : TextConst ENU='Reconciling IC transactions may be difficult if you change IC Partner Code because this %1 has ledger entries in a fiscal year that has not yet been closed.\ Do you still want to change the IC Partner Code?',FRA='Le rapprochement des transactions IC risque de poser problème si vous modifiez le code partenaire IC car ce/cette %1 comporte des écritures comptables appartenant à un exercice comptable qui n''a pas encore été clôturé.\ Souhaitez-vous quand même modifier le code partenaire IC ?';
        Text012 : TextConst ENU='You cannot change the contents of the %1 field because this %2 has one or more open ledger entries.',FRA='Vous ne pouvez pas modifier la valeur du champ %1 car ce/cette %2 comporte une ou plusieurs écritures comptables ouvertes.';
        Text013 : TextConst ENU='You cannot delete %1 %2 because there is at least one outstanding Service %3 for this customer.',FRA='Vous ne pouvez pas supprimer %1 %2 car il existe encore au moins un(e) %3 service ouvert(e) pour ce client.';
        Text014 : TextConst ENU='Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.',FRA='Avant de pouvoir utiliser Online Map, vous devez compléter la fenêtre Configuration Online Map.\Consultez la section Configuration d''Online Map dans l''Aide.';
        Text015 : TextConst ENU='You cannot delete %1 %2 because there is at least one %3 associated to this customer.',FRA='Vous ne pouvez pas supprimer %1 %2 car au moins un/une %3 est associé(e) à ce client.';
        AllowPaymentToleranceQst : TextConst ENU='Do you want to allow payment tolerance for entries that are currently open?',FRA='Souhaitez-vous autoriser les écarts de règlement pour les écritures actuellement ouvertes ?';
        RemovePaymentRoleranceQst : TextConst ENU='Do you want to remove payment tolerance from entries that are currently open?',FRA='Souhaitez-vous supprimer les écarts de règlement pour les écritures actuellement ouvertes ?';
        CreateNewCustTxt : TextConst Comment='%1 is the name to be used to create the customer. ',ENU='Create a new customer card for %1',FRA='Créer une fiche client pour %1';
        SelectCustErr : TextConst ENU='You must select an existing customer.',FRA='Vous devez sélectionner un client existant.';
        CustNotRegisteredTxt : TextConst ENU='This customer is not registered. To continue, choose one of the following options:',FRA='Ce client n''est pas enregistré. Pour continuer, sélectionnez l''une des options suivantes :';
        SelectCustTxt : TextConst ENU='Select an existing customer',FRA='Sélectionner un client existant';
        InsertFromTemplate : Boolean;
        LookupRequested : Boolean;
        OverrideImageQst : TextConst ENU='Override Image?',FRA='Remplacer l''image ?';
        CannotDeleteBecauseInInvErr : TextConst Comment='%1 = the object to be deleted (example: Item, Customer).',ENU='You cannot delete %1 because it has open invoices.',FRA='Vous ne pouvez pas supprimer %1 car il y a des factures ouvertes.';
        PrivacyBlockedActionErr : TextConst Comment='%1 = action (create or post), %2 = customer code.',ENU='You cannot %1 this type of document when Customer %2 is blocked for privacy.',FRA='Vous ne pouvez pas %1 ce type de document lorsque le client %2 est bloqué pour des raisons de confidentialité.';
        PrivacyBlockedGenericTxt : TextConst Comment='%1 = customer code',ENU='Privacy Blocked must not be true for customer %1.',FRA='Le champ Confidentialité bloquée ne doit pas avoir la valeur true pour le client %1.';
        ConfirmBlockedPrivacyBlockedQst : TextConst ENU='If you change the Blocked field, the Privacy Blocked field is changed to No. Do you want to continue?',FRA='Si vous modifiez le champ Bloqué, le champ Confidentialité bloquée prend la valeur Non. Voulez-vous continuer ?';
        CanNotChangeBlockedDueToPrivacyBlockedErr : TextConst ENU='The Blocked field cannot be changed because the user is blocked for privacy reasons.',FRA='Le champ Bloqué ne peut pas être modifié, car l''utilisateur est bloqué pour des raisons de confidentialité.';
        TXT50000 : Label 'Vous n''avez pas le droit de renommer. Merci de voir avec l''administrateur système.';
        UserSetup : Record "91";
        TXT50001 : Label 'Vous n''avez pas le droit de modifier le champ Bloqué de  Client N° : %1.';
        TXT50002 : Label 'Vous n''avez pas le droit de modifier ce champs.';
        GRecTitre : Record "60085";
        InventorySetup : Record "313";
        Customer : Record "18";
        TXT50003 : Label 'Vous ne pouvez pas supprimer 0le client %1 car il existe des mouvements compatbles reratif a ce compte';
}

