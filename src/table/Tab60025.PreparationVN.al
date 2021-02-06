table 60025 "Preparation VN"
{
    // version Preparation VN,MAZDA301,MAZDA456

    DrillDownPageID = 60137;
    LookupPageID = 60137;

    fields
    {
        field(1;"Preparation No";Code[20])
        {
            CaptionML = ENU='Preparation No',
                        FRA='Préparation N°';
            Editable = true;
        }
        field(2;"Vehicle No.";Code[20])
        {
            CaptionML = ENU='Vehicle No.',
                        FRA='Vehicule numero';
            TableRelation = Item.No.;
        }
        field(3;VIN;Code[20])
        {
            CaptionML = ENU='VIN',
                        FRA='Num Chassis';

            trigger OnValidate();
            var
                RecItemService : Record "5940";
                RecCarteGriseLigne : Record "60016";
                RecCarteGriseEntete : Record "60015";
            begin

                //IF STRLEN(VIN) <> 17 THEN
                // ERROR('La longeur du numérode chassis doit être égale à 17 caractères');

                CLEAR( RecItemService );
                RecItemService.SETRANGE("Serial No.",VIN);
                IF RecItemService.FINDFIRST THEN
                BEGIN
                  // Cas véh chez client
                  IF RecItemService.Emplacement = RecItemService.Emplacement::"Chez client" THEN
                    IF NOT GBoolAncientManquant THEN
                     ERROR('Véhicule déja livrer au client');

                  // Cas véh chez economique auto et préparer
                  IF ("Service Type"= "Service Type"::Préparation) AND (RecItemService."Préparation/Livraison" <> RecItemService."Préparation/Livraison"::" ") THEN
                    IF NOT GBoolAncientManquant THEN
                     ERROR('Véhicule déja préparer');

                  // Cas véh chez economique auto et non préparer
                  IF ("Service Type"= "Service Type"::Livraison) AND (RecItemService."Préparation/Livraison" <> RecItemService."Préparation/Livraison"::Préparer) THEN
                    IF NOT GBoolAncientManquant THEN
                     ERROR('Véhicule doit être préparer');

                  VALIDATE("Service Item No.",RecItemService."No.");
                  "Service Item Description" := RecItemService.Description;
                  VALIDATE("Vehicle No." ,RecItemService."Item No.");
                  "Variant Code" := RecItemService."Variant Code" ;
                  //SM MAZDA301 OLD Matricule := RecItemService.Matricule;
                  "Installation Date" := RecItemService."Installation Date" ;
                  IF RecItemService."Customer No." <> '' THEN
                    VALIDATE("Customer No.",RecItemService."Customer No.")
                  ELSE BEGIN
                    RecServiceMgtSetup.GET;
                    RecServiceMgtSetup.TESTFIELD("Client Facturation Interne");
                    VALIDATE("Customer No.",RecServiceMgtSetup."Client Facturation Interne");
                  END;


                END
                  ELSE ERROR(Text0002,VIN);

                //SM MAZDA301
                RecCarteGriseLigne.RESET;
                RecCarteGriseLigne.SETRANGE(VIN,VIN);
                IF RecCarteGriseLigne.FINDFIRST THEN BEGIN
                  RecCarteGriseEntete.GET(RecCarteGriseLigne."N° Bordereau");
                  "Date Envoie Bor. Carte Grise"  := RecCarteGriseEntete."Date Emission";
                END;
                //END SM MAZDA301


                //KK__2809
                ItemLedgerEntry.RESET;
                ItemLedgerEntry.SETRANGE("Entry Type",ItemLedgerEntry."Entry Type"::Sale);
                ItemLedgerEntry.SETRANGE("Serial No.",VIN);
                IF ItemLedgerEntry.FINDFIRST THEN
                  "Salesperson No" := ItemLedgerEntry."Salesperson Code";
            end;
        }
        field(4;"Variant Code";Code[20])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code Variante';
        }
        field(6;Priority;Option)
        {
            CaptionML = ENU='Priority',
                        FRA='Priorité';
            OptionCaptionML = ENU='Normal,Medium,Hight',
                              FRA='Normale,Moyenne,Haute';
            OptionMembers = Normale,Moyenne,Haute;
        }
        field(7;"Service Item No.";Code[20])
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
        field(8;"Service Item Description";Text[100])
        {
            CaptionML = ENU='Service Item Description',
                        FRA='désignation article de service';
        }
        field(9;"Unit of measure code";Code[20])
        {
            CaptionML = ENU='Unit of measure code',
                        FRA='Code Unité';
        }
        field(10;"Location of service item";Code[20])
        {
            CaptionML = ENU='Location of service item',
                        FRA='Magasin artile de service';
        }
        field(11;"Warranty Starting Date (Labor)";Date)
        {
            CaptionML = ENU='Warranty Starting Date (Labor)',
                        FRA='Date Début garantie (M.O.)';
        }
        field(12;"Warranty Ending Date (Labor)";Date)
        {
            CaptionML = ENU='Warranty Ending Date (Labor)',
                        FRA='Date Fin garantie ( M.O.)';
        }
        field(13;"Warranty Starting Date (Parts)";Date)
        {
            CaptionML = ENU='Warranty Starting Date (Parts)',
                        FRA='Date début garantie (pièces)';
        }
        field(14;"Warranty Ending Date (Parts)";Date)
        {
            CaptionML = ENU='Warranty Ending Date (Parts)',
                        FRA='Date fin garantie (pièces)';
        }
        field(15;"Warranty % (Parts)";Decimal)
        {
            CaptionML = ENU='Warranty % (Parts)',
                        FRA='% garantie (pièces)';
        }
        field(16;"Warranty % (Labor)";Decimal)
        {
            CaptionML = ENU='Warranty % (Labor)',
                        FRA='% garantie (M.O.)';
        }
        field(17;"Response Time (Hours)";Decimal)
        {
            CaptionML = ENU='Response Time (Hours)',
                        FRA='Délai de réponse (heures)';
        }
        field(18;"Installation Date";Date)
        {
            CaptionML = ENU='Installation Date',
                        FRA='Date d''installation';
        }
        field(19;"Sales Date";Date)
        {
            CaptionML = ENU='Sales Date',
                        FRA='Date vente';
        }
        field(20;"Last Service Date";Date)
        {
            CaptionML = ENU='Last Service Date',
                        FRA='Date dernier service';
        }
        field(21;"No. Series";Code[20])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
        }
        field(22;"Vendor No.";Code[10])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° fournisseur';
        }
        field(23;"Vendor Item No.";Code[10])
        {
            CaptionML = ENU='Vendor Item No.',
                        FRA='Référence fournisseur';
        }
        field(24;"Vendor Item Name";Text[50])
        {
            CaptionML = ENU='Vendor Item Name',
                        FRA='Nom fournisseur article';
        }
        field(25;"Vendor Name";Text[50])
        {
            CaptionML = ENU='Vendor Name',
                        FRA='Nom fournisseur';
        }
        field(26;"Vendor Warranty Date";Date)
        {
            CaptionML = ENU='Vendor Warranty Date',
                        FRA='Date Garantie Fournisseur';
        }
        field(27;"Purchase invoice No.";Code[20])
        {
            CaptionML = ENU='Purchase invoice No.',
                        FRA='N° Facture Fournisseur';
        }
        field(28;"Purchase invoice Date";Date)
        {
            CaptionML = ENU='Purchase invoice Date',
                        FRA='Date Facture Achat';
        }
        field(29;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='Client N°';
            TableRelation = Customer.No.;

            trigger OnValidate();
            var
                RecCustomer : Record "18";
            begin
                 CLEAR(RecCustomer);
                 RecCustomer.GET("Customer No.");
                 Name:=RecCustomer.Name;
                 "Name 2":=RecCustomer."Name 2";
                 Address:=RecCustomer.Address;
                 "Address 2":=RecCustomer."Address 2";
                 "Post Code":=RecCustomer."Post Code";
                 City:=RecCustomer.City;
                 County:=RecCustomer.County;
                 "Country/Region Code":=RecCustomer."Country/Region Code";
                 Contact:=RecCustomer.Contact;
                  "Phone No.":=RecCustomer."Phone No.";
            end;
        }
        field(30;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
        }
        field(31;"Name 2";Text[50])
        {
            CaptionML = ENU='Name 2',
                        FRA='Nom 2';
        }
        field(32;Address;Text[50])
        {
            CaptionML = ENU='Address',
                        FRA='Addresse';
        }
        field(33;"Address 2";Text[50])
        {
            CaptionML = ENU='Address 2',
                        FRA='Addresse 2';
        }
        field(34;"Post Code";Code[20])
        {
            CaptionML = ENU='Post Code',
                        FRA='Code Postal';
        }
        field(35;City;Text[50])
        {
            CaptionML = ENU='City',
                        FRA='Vile';
        }
        field(36;County;Text[50])
        {
            CaptionML = ENU='County',
                        FRA='Gouvernorat';
        }
        field(37;"Country/Region Code";Code[10])
        {
            CaptionML = ENU='Country/Region Code',
                        FRA='Pays/code Région';
        }
        field(38;Contact;Text[50])
        {
            CaptionML = ENU='Contact',
                        FRA='Contact';
        }
        field(39;"Phone No.";Text[50])
        {
            CaptionML = ENU='Phone No.',
                        FRA='Telephone';
        }
        field(40;"Owner Code";Code[20])
        {
            CaptionML = ENU='Owner Code',
                        FRA='Code Propriétaire';
        }
        field(41;"Owner Name";Text[50])
        {
            CaptionML = ENU='Owner Name',
                        FRA='Nom Propriétaire';
        }
        field(42;"Owner Address";Text[50])
        {
            CaptionML = ENU='Owner Address',
                        FRA='Addresse Propriétaire';
        }
        field(43;"Owner Address 2";Text[50])
        {
            CaptionML = ENU='Owner Address 2',
                        FRA='Address 2 propriétaire';
        }
        field(44;"Owner Post Code";Code[20])
        {
            CaptionML = ENU='Owner Post Code',
                        FRA='Code Postale propriétaire';
        }
        field(45;"Owner City";Text[50])
        {
            CaptionML = ENU='Owner City',
                        FRA='Vile propriétaire';
        }
        field(46;"Owner County";Text[50])
        {
            CaptionML = ENU='Owner County',
                        FRA='Gouvernorat propriétaire';
        }
        field(47;"Owner Country/Region Code";Code[20])
        {
            CaptionML = ENU='Owner Country/Region Code',
                        FRA='Code Pays/ Region Propriétaire';
        }
        field(48;"Owner Contact";Code[20])
        {
            CaptionML = ENU='Owner Contact',
                        FRA='Contact du Propriétaire';
        }
        field(49;"Owner Phone No.";Text[30])
        {
            CaptionML = ENU='Owner Phone No.',
                        FRA='Téléphonne du propriétaire';
        }
        field(50;"Assigned to";Code[20])
        {
            CaptionML = ENU='Assigned to',
                        FRA='Affecté à';
        }
        field(51;Comment;Boolean)
        {
            CaptionML = ENU='Comment',
                        FRA='Commentaire';
        }
        field(52;"Service Item Components";Boolean)
        {
            CaptionML = ENU='Service Item Components',
                        FRA='Composant article de service';
        }
        field(53;"Preferred Resource";Code[20])
        {
            CaptionML = ENU='Preferred Resource',
                        FRA='ressource préféré';
        }
        field(54;"Service Price Group Code";Code[20])
        {
            CaptionML = ENU='Service Price Group Code',
                        FRA='Code Groupe Prix de Service';
        }
        field(55;"Service Contracts";Boolean)
        {
            CaptionML = ENU='Service Contracts',
                        FRA='Contrat de service';
        }
        field(56;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre Date';
            FieldClass = FlowFilter;
        }
        field(57;"Type Filter";Text[30])
        {
            CaptionML = ENU='Type Filter',
                        FRA='Filtre Type';
        }
        field(58;"Contact Filter";Code[20])
        {
            CaptionML = ENU='Contact Filter',
                        FRA='Filtre contact';
            FieldClass = FlowFilter;
        }
        field(59;"Service Order Filter";Code[20])
        {
            CaptionML = ENU='Service Order Filter',
                        FRA='Filtre Ordre de Service';
        }
        field(60;"Sales/Serv. Shpt. Document No.";Code[20])
        {
            CaptionML = ENU='Sales/Serv. Shpt. Document No.',
                        FRA='No Document Expédi. Vente/service';
        }
        field(61;"Sales/Serv. Shpt. Line No.";Integer)
        {
            CaptionML = ENU='Sales/Serv. Shpt. Line No.',
                        FRA='No Ligne Expédit. Vente/srvice';
        }
        field(62;"Shipment Type";Text[30])
        {
            CaptionML = ENU='Shipment Type',
                        FRA='type Expédition';
        }
        field(63;"Global Dimension 1 Code";Code[20])
        {
            CaptionML = ENU='Global Dimension 1 Code',
                        FRA='Global Dimension 1 Code';
        }
        field(64;"Global Dimension 2 Code";Code[20])
        {
            CaptionML = ENU='Global Dimension 2 Code',
                        FRA='Global Dimension 2 Code';
        }
        field(65;"Service Item Group Code";Code[20])
        {
            CaptionML = ENU='Service Item Group Code',
                        FRA='Code Groupe Article de service';
        }
        field(66;"Created By";Code[50])
        {
            CaptionML = ENU='Created By',
                        FRA='Crée par';
        }
        field(67;"Creation date";Date)
        {
            CaptionML = ENU='Creation date',
                        FRA='Date de Création';
            Editable = false;
        }
        field(68;"Original Invoice No";Code[20])
        {
            CaptionML = ENU='Original Invoice No',
                        FRA='No Facture d''origine';
        }
        field(69;"Invoice Date";Date)
        {
            CaptionML = ENU='Invoice Date',
                        FRA='Date Facture';
        }
        field(70;Warranty;Boolean)
        {
            CaptionML = ENU='Warranty',
                        FRA='Garantie';
        }
        field(71;"Warranty End Date";Date)
        {
            CaptionML = ENU='Warranty End Date',
                        FRA='Date Fin de garantie';
        }
        field(72;"Reception Date";Date)
        {
            CaptionML = ENU='Receive Date',
                        FRA='Date Réception';
        }
        field(73;"Shipment date Request";Date)
        {
            CaptionML = ENU='Shipment date Request',
                        FRA='Date demande Livraison';
        }
        field(74;"Sell-to Contact No.";Code[20])
        {
            CaptionML = ENU='Sell-to Contact No.',
                        FRA='No Contact Client Facturé';
        }
        field(75;"Order No";Code[20])
        {
            CaptionML = ENU='Order N°',
                        FRA='Commande N°';
        }
        field(76;"Shipment No";Code[20])
        {
            CaptionML = ENU='Shipment N°',
                        FRA='Expédition N°';
        }
        field(77;"Salesperson No";Code[20])
        {
            CaptionML = ENU='Salesperson N°',
                        FRA='Code Vendeur';
            TableRelation = Salesperson/Purchaser;
        }
        field(78;"Salesperson Name";Text[100])
        {
            CaptionML = ENU='Salesperson Name',
                        FRA='Nom Vendeur';
        }
        field(79;"Livré au client";Boolean)
        {
            CaptionML = ENU='shipped to Customer',
                        FRA='Livré au client';
        }
        field(80;"Date Livraison";DateTime)
        {
            CaptionML = ENU='Shipping Date',
                        FRA='Date Livraison';
        }
        field(81;"Total Work Hour";Decimal)
        {
            CaptionML = ENU='Total Work Hour',
                        FRA='Nombre total Heure travaillé';
        }
        field(82;"Block/cancel reason";Text[100])
        {
            CaptionML = ENU='Block/cancel reason',
                        FRA='Motif Annulation';
        }
        field(83;"Block/cancel Date";DateTime)
        {
            CaptionML = ENU='Block/cancel Date',
                        FRA='Date Annulation';
        }
        field(84;"unblock/reactivate Date";DateTime)
        {
            CaptionML = ENU='unblock/reactivate Date',
                        FRA='Date de réactivation';
        }
        field(85;"Responsibility Center";Code[20])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de Gestion';
            TableRelation = "Responsibility Center".Code;
        }
        field(86;"Date Validation Devis";DateTime)
        {
            Caption = 'Date Validation Devis';
        }
        field(87;"Devis Validé";Boolean)
        {
            Caption = 'Devis Validé';
        }
        field(88;Invoiced;Boolean)
        {
            CaptionML = ENU='Invoiced',
                        FRA='Facturé';
        }
        field(89;"Motif Hors garantie";Text[100])
        {
            Caption = 'Motif Hors garantie';
        }
        field(91;"Nom Personne Livré";Text[50])
        {
            CaptionML = ENU='Name shipped Person',
                        FRA='Nom Personne Livré';
        }
        field(92;"CIN Personne Livré";Text[10])
        {
            CaptionML = ENU='CIN Person Shipped',
                        FRA='CIN Personne Livré';
        }
        field(93;"Date devis";DateTime)
        {
            CaptionML = ENU='Quote Date',
                        FRA='Date devis';
        }
        field(94;"Date Réparation";DateTime)
        {
            CaptionML = ENU='Repair Date',
                        FRA='Date Réparation';
        }
        field(95;"Service Type";Option)
        {
            CaptionML = ENU='Service Type',
                        FRA='Type de Service';
            Description = 'SM MAZDA456';
            OptionCaptionML = ENU='Préparation,Livraison',
                              FRA='Préparation,Livraison,Transfert';
            OptionMembers = "Préparation",Livraison,Transfert;
        }
        field(96;Matricule;Code[20])
        {
            CalcFormula = Lookup("Service Item".Matricule WHERE (Serial No.=FIELD(VIN)));
            Caption = 'Matricule';
            Editable = false;
            FieldClass = FlowField;
        }
        field(97;"Status Livraison";Option)
        {
            Caption = 'Status SR';
            Editable = true;
            OptionCaption = 'Fiche Crée,Rendez-Vous crée,Livrée';
            OptionMembers = "Fiche Crée","Rendez-Vous crée","Livrée";

            trigger OnValidate();
            var
                RecLItemService : Record "5940";
            begin
                IF "Status Livraison" = "Status Livraison"::Livrée THEN
                BEGIN
                // Modif date Livraison
                   "Date Livraison" := CURRENTDATETIME;
                   MODIFY;
                   CLEAR(RecLItemService);
                   RecLItemService.SETRANGE(RecLItemService."Serial No.",VIN);
                   // Modif Service Item ; chez client ; status : livrée
                   IF RecLItemService.FINDFIRST THEN
                   BEGIN
                       RecLItemService."Préparation/Livraison" := RecLItemService."Préparation/Livraison"::Livrer;
                       RecLItemService.Emplacement := RecLItemService.Emplacement::"Chez client";
                       RecLItemService."Date Livraison" := CURRENTDATETIME;
                       RecLItemService.MODIFY;
                   END;

                END;
            end;
        }
        field(99;Fax;Integer)
        {
        }
        field(100;"Heure creation";Time)
        {
        }
        field(101;"Model Code";Text[50])
        {
            CaptionML = ENU='Model Code',
                        FRA='Code Modèle';
        }
        field(102;"Status Préparation";Option)
        {
            OptionCaption = 'Fiche Crée,commande Crée,Véhicule Préparée';
            OptionMembers = "Fiche Crée","commande Crée","Véhicule Préparée";

            trigger OnValidate();
            var
                RecLItemService : Record "5940";
            begin
                // Mise a jour article de service (véhicule préparer);
                IF "Status Préparation"="Status Préparation"::"Véhicule Préparée" THEN
                BEGIN
                    CLEAR(RecLItemService);
                    RecLItemService.SETRANGE(RecLItemService."Serial No.",VIN);
                    IF RecLItemService.FINDFIRST THEN
                    BEGIN

                        RecLItemService."Préparation/Livraison" := RecLItemService."Préparation/Livraison"::Préparer;
                        RecLItemService.MODIFY;
                    END;
                END;
            end;
        }
        field(103;"CheckListe Validée";Boolean)
        {
        }
        field(104;"Date rendez vous";DateTime)
        {
            Description = 'SM MAZDA301';

            trigger OnValidate();
            begin
                //KT 281117
                GRecServiceItem.RESET;
                GRecServiceItem.SETRANGE("Serial No.",VIN);
                IF GRecServiceItem.FINDFIRST THEN BEGIN
                  GRecServiceItem."Date rendez vous":="Date rendez vous";
                  GRecServiceItem.MODIFY;
                END;
                //END KT
            end;
        }
        field(105;"Date de préparation souhaité";Date)
        {
            Description = 'SM MAZDA301';
            Editable = false;
        }
        field(106;"Date de préparation prévu";Date)
        {
            Description = 'SM MAZDA301';
            Editable = false;
        }
        field(107;"Date Envoie Bor. Carte Grise";Date)
        {
            Description = 'SM MAZDA301';
            Editable = false;
        }
        field(108;"Accessoires Montés";Boolean)
        {
            Description = 'SM MAZDA301';
        }
        field(109;"Plaque Monté";Boolean)
        {
            Description = 'SM MAZDA301';

            trigger OnValidate();
            begin
                //SM MAZDA301
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Approbation Livraison VN" THEN
                  ERROR(TXT50001);
                //SM MAZDA301
            end;
        }
        field(110;Carburant;Boolean)
        {
            Description = 'SM MAZDA301';
        }
        field(111;Lavage;Boolean)
        {
            Description = 'SM MAZDA301';

            trigger OnValidate();
            begin
                //SM MAZDA301
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Approbation Livraison VN" THEN
                  ERROR(TXT50001);
                //SM MAZDA301
            end;
        }
        field(112;"Accepté";Boolean)
        {
            Description = 'SM MAZDA301';

            trigger OnValidate();
            begin
                //SM OLD 200717 TESTFIELD("CheckListe Validée",TRUE);
                //SM MAZDA301
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Approbation Livraison VN" THEN
                  ERROR(TXT50001);

                "Date acceptation PVN" := CURRENTDATETIME;
                //SM MAZDA301
            end;
        }
        field(113;"From Preparation No";Code[20])
        {
            Caption = 'Depuis Préparation VN No';
            Description = 'SM MAZDA301';
            TableRelation = Table600025;
        }
        field(114;"Acceptation Financière";Boolean)
        {
            Description = 'SM MAZDA301';

            trigger OnValidate();
            begin
                //SM MAZDA301
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Approbation Livraison Finan VN" THEN
                  ERROR(TXT50000);
                //SM MAZDA301
            end;
        }
        field(115;"Existe Fiche Livraison";Boolean)
        {
            CalcFormula = Exist("Preparation VN" WHERE (From Preparation No=FIELD(Preparation No)));
            Description = 'SM MAZDA301.2';
            FieldClass = FlowField;
        }
        field(116;"Statut Transfert";Option)
        {
            Description = 'SM MAZDA456';
            OptionMembers = "Fiche Crée","Commande Crée","Transféré";
        }
        field(117;"N° Matriculation";Code[20])
        {
            CalcFormula = Lookup("Carte Grise Ligne"."N° Matriculation" WHERE (VIN=FIELD(VIN)));
            Description = 'SM';
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate();
            var
                RecServiceItem : Record "5940";
            begin
            end;
        }
        field(118;"Demandé";Boolean)
        {
            Description = 'SM';

            trigger OnValidate();
            begin

                //SM
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Approbation Livraison VN" THEN
                  ERROR(TXT50002);

                IF Demandé THEN
                  "Date Demande" := CURRENTDATETIME
                ELSE
                  "Date Demande" := 0DT
                //END SM
            end;
        }
        field(119;"Date Demande";DateTime)
        {
            Description = 'SM';
            Editable = false;
        }
        field(120;"No Demande VIN";Code[20])
        {
            Description = 'SM';
        }
        field(121;"Refusé";Boolean)
        {
            Description = 'SM';
        }
        field(122;"Réserve";Option)
        {
            Description = 'SM';
            OptionCaption = '" ,Accessoires,Carosserie,Intérieur,Carburant"';
            OptionMembers = " ",Accessoires,Carosserie,"Intérieur",Carburant;
        }
        field(123;"Num BL";Code[20])
        {
            CalcFormula = Lookup("Service Item"."Sales/Serv. Shpt. Document No." WHERE (Serial No.=FIELD(VIN)));
            Description = 'KK';
            FieldClass = FlowField;
        }
        field(124;"Num PV";Code[20])
        {
            Description = 'KK';
        }
        field(125;"Nombre d'impression";Integer)
        {
            Description = 'KK';
        }
        field(126;"Type Client";Code[20])
        {
            CalcFormula = Lookup("Default Dimension"."Dimension Value Code" WHERE (Table ID=CONST(18),
                                                                                   No.=FIELD(Customer No.)));
            Description = 'KK';
            FieldClass = FlowField;
        }
        field(127;"Date acceptation PVN";DateTime)
        {
        }
        field(128;"Date préparation véhicule";DateTime)
        {
        }
        field(129;"Date remise véhicule";DateTime)
        {
        }
        field(130;"Date livraison prévue";Date)
        {
            Description = 'ADD KK';
        }
        field(131;"N contrat 3GAA";Code[20])
        {
            CalcFormula = Lookup("Service Item"."N contrat 3GAA" WHERE (Serial No.=FIELD(VIN)));
            FieldClass = FlowField;
        }
        field(132;Livreur;Code[20])
        {
            TableRelation = Salesperson/Purchaser.Code WHERE (Job Title=CONST(Livreur));
        }
        field(133;"Autre manquant";Text[150])
        {
        }
        field(134;Date;Date)
        {
        }
        field(135;"Aire de livraision";Code[20])
        {
            CaptionML = ENU='Shipment space',
                        FRA='Aire de livraision';
            TableRelation = "Responsibility Center".Code;
        }
        field(136;"Dérogation DC";Boolean)
        {
            Description = 'SM070917';

            trigger OnValidate();
            begin
                //SM 070917
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Direction Commercial" THEN
                  ERROR('Vous n avez pas le droit');
                //END SM
            end;
        }
        field(5050;"Campaign No.";Code[20])
        {
            CaptionML = ENU='Campaign No.',
                        FRA='N° campagne';
            TableRelation = Campaign;

            trigger OnValidate();
            var
                Campaign : Record "5071";
            begin
                /*CreateDim(
                  DATABASE::Campaign,"Campaign No.",
                  DATABASE::Customer,"Bill-to Customer No.",
                  DATABASE::"Salesperson/Purchaser","Salesperson Code",
                  DATABASE::"Responsibility Center","Responsibility Center",
                  DATABASE::"Customer Template","Bill-to Customer Template Code");
                //SM 170817
                IF Campaign.GET("Campaign No.") THEN BEGIN
                  IF ("Document Date" > Campaign."Ending Date") OR ("Document Date" < Campaign."Starting Date") THEN
                    ERROR('Date Document hors date validité de la compagne!');
                  IF (Campaign."Client Leasing" <> '') AND (Campaign."Client Leasing" <> "Bill-to Customer No.") THEN
                    ERROR('Client Leasing doit être %1 pour la compagne %2',Campaign."Client Leasing","Campaign No.");
                  "Entretien 10 000" := Campaign."Entretien 10 000";
                  "Entretien 20 000" := Campaign."Entretien 20 000";
                  "Entretien 30 000" := Campaign."Entretien 30 000";
                  "Carte Carburant"  := Campaign."Carte Carburant";
                END ELSE BEGIN
                  "Entretien 10 000" := FALSE;
                  "Entretien 20 000" := FALSE;
                  "Entretien 30 000" := FALSE;
                  "Carte Carburant"  := '';
                END;*/
                
                //END SM

            end;
        }
        field(60003;"Préparation/Livraison";Option)
        {
            CalcFormula = Lookup("Service Item".Préparation/Livraison WHERE (Serial No.=FIELD(VIN)));
            Description = 'SM 151117';
            FieldClass = FlowField;
            OptionMembers = " ","Préparer",Livrer;
        }
        field(70120;"Entretien 10 000";Boolean)
        {
            Description = 'KT 130418';
        }
        field(70121;"Entretien 20 000";Boolean)
        {
            Description = 'KT 130418';
        }
        field(70122;"Entretien 30 000";Boolean)
        {
            Description = 'KT 130418';
        }
        field(70123;"Carte Carburant";Code[20])
        {
            Description = 'KT 130418';
            TableRelation = "Carte Carburant Offerte";
        }
        field(70124;"Carte Carburant livrée";Boolean)
        {
            Description = 'KT 130418';

            trigger OnValidate();
            begin
                //KT 130418
                GRecServiceItem.RESET;
                GRecServiceItem.SETRANGE("Serial No.",VIN);
                IF GRecServiceItem.FINDFIRST THEN BEGIN
                  GRecServiceItem."Carte Carburant livrée":="Carte Carburant livrée";
                  GRecServiceItem.MODIFY;
                END;
            end;
        }
    }

    keys
    {
        key(Key1;"Preparation No")
        {
        }
        key(Key2;VIN)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        RecLigneRapide : Record "60010";
        RecLigneGrandR : Record "60012";
    begin


        IF ("Status Livraison" <> "Status Livraison"::"Fiche Crée") OR ("Status Préparation"<>"Status Préparation"::"Fiche Crée") THEN
         BEGIN
            ERROR('Suppression impossible, Status est différent de Fiche Crée');
         END;
    end;

    trigger OnInsert();
    var
        NoSeriesMgt : Codeunit "396";
        ServiceSetup : Record "5911";
        ServicesItem : Record "5940";
        ItemLedgerEntry : Record "32";
        RecSalesShipmentHeader : Record "110";
        RecSalesInvoiceHeader : Record "112";
    begin
        CLEAR(ServiceSetup);
        ServiceSetup.GET;
        IF "Preparation No" = '' THEN BEGIN
          NoSeriesMgt.InitSeries(ServiceSetup."No Preparation",xRec."No. Series","Creation date","Preparation No","No. Series");
        END;
        "Created By"  := USERID ;
        "Creation date" := TODAY ;
        "Heure creation" := TIME;


        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
            "Responsibility Center" := UserMgt.GetServiceFilter;
        END;
        //SM MAZDA301
        "Date de préparation prévu" := CALCDATE(ServiceSetup."Délai Préparation Livraison","Creation date");
         ServicesItem.SETRANGE(ServicesItem."Serial No.",VIN);
         ServicesItem.FINDFIRST;
         CLEAR(ItemLedgerEntry);
         ItemLedgerEntry.SETCURRENTKEY("Document No.","Document Type","Document Line No.");
         ItemLedgerEntry.SETRANGE("Document No.",ServicesItem."Sales/Serv. Shpt. Document No.");
         IF ItemLedgerEntry.FINDFIRST THEN
           IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Shipment" THEN BEGIN
             RecSalesShipmentHeader.GET(ItemLedgerEntry."Document No.");
             "Date de préparation souhaité" := RecSalesShipmentHeader."Shipment Date";
           END ELSE IF ItemLedgerEntry."Document Type" = ItemLedgerEntry."Document Type"::"Sales Invoice" THEN BEGIN
             RecSalesInvoiceHeader.GET(ItemLedgerEntry."Document No.");
             "Date de préparation souhaité" := RecSalesInvoiceHeader."Shipment Date";
           END;
        IF NOT RecControle.GET("Preparation No") THEN
          BEGIN
            RecControle.INIT;
            RecControle.Id:="Preparation No";
            RecControle."Cree par":=USERID;
            RecControle."Date de Creation":=WORKDATE;
            RecControle.INSERT(TRUE);
          END;
        //END SM MAZDA301
    end;

    var
        Text0001 : Label 'Véhicule avec Immatricule N° %1 n''existe pas,\Essayer de rechercher par N° Chassis.';
        Text0002 : Label 'Véhicule avec Chassi N° %1 n''existe pas.';
        UserMgt : Codeunit "5700";
        RecUserSetup : Record "91";
        TXT50000 : Label 'Vous n''avez pas le droit de l''acception Financière';
        TXT50001 : Label '"Vous n''avez pas le droit de l''acception "';
        TXT50002 : Label 'Vous n''avez pas le droit de demander Véhicule';
        RecControle : Record "60009";
        RecServiceMgtSetup : Record "5911";
        ItemLedgerEntry : Record "32";
        GRecServiceItem : Record "5940";
        GBoolAncientManquant : Boolean;

    procedure CreateCustomer();
    var
        RecCustomer : Record "18";
    begin
    end;

    procedure CreateServiceItem();
    var
        RecServiceItem : Record "5940";
    begin
    end;

    procedure ValiderControlLine();
    var
        ControlVenteVN : Record "60026";
        BoolValider : Boolean;
        ServiceItem : Record "5940";
    begin
         BoolValider := FALSE;
         IF CONFIRM('Voulez vous valider le checkliste !') THEN
         BEGIN
           CLEAR(ControlVenteVN);
           ControlVenteVN.SETRANGE("Document No","Preparation No");
           ControlVenteVN.SETRANGE("No Chassis",VIN);
           ControlVenteVN.SETRANGE(ControlVenteVN.ShowDetail,TRUE);
           IF ControlVenteVN.FINDFIRST THEN
           REPEAT
               IF ControlVenteVN.Valider = TRUE THEN ERROR('Checkliste est déja valider');
               // Vérifier que Oui/No ou NA est coché
               IF (ControlVenteVN.Oui = TRUE) OR (ControlVenteVN.Non = TRUE) OR (ControlVenteVN.NA = TRUE) THEN
                  ControlVenteVN.Valider := TRUE
               ELSE ERROR('La ligne suivante  : %1 doit être coché (Oui / Non ou NA )',ControlVenteVN.Description);

               IF ControlVenteVN.MODIFY THEN BoolValider:=TRUE
               ELSE BoolValider := FALSE;

           UNTIL ControlVenteVN.NEXT = 0;
         END;
         IF BoolValider = TRUE THEN
         BEGIN
             "CheckListe Validée" := TRUE;
             "Date préparation véhicule" := CURRENTDATETIME;

             //ADD KK
             UpdateServItemStatusAndBordPVN;
             //END KK

             IF MODIFY THEN MESSAGE('Check liste a été validé');
         END;
    end;

    procedure CreateControl(TypeControl : Integer);
    var
        RecControlGroup : Record "60027";
        RecLineControl : Record "60028";
        ControlVenteVN : Record "60026";
        IntLineNo : Integer;
    begin
        // TYPE CONTROL
          // 0: ,
          // 1: Réception VN,
          // 2: Réception VN inter Parc,
          // 3: Avant Livraison

        IntLineNo := 10000;
        CLEAR(RecControlGroup);
        RecControlGroup.SETRANGE(RecControlGroup."Type Control",TypeControl);
        IF RecControlGroup.FINDFIRST THEN
        REPEAT

              // INSERT LIGNE GROUPE;
              CLEAR(RecLineControl);
              ControlVenteVN."Document No"      := "Preparation No";
              ControlVenteVN."No Chassis"       := VIN;
              ControlVenteVN."Line No"          := IntLineNo;
              ControlVenteVN."Date de Creation" := TODAY;
              ControlVenteVN."Cree par"         := USERID;
              ControlVenteVN.Group              := RecControlGroup."Group No" ;
              ControlVenteVN."Type Control"     := TypeControl;
              ControlVenteVN.Description        := RecControlGroup."Group No";
              ControlVenteVN.Titre              := TRUE;
              ControlVenteVN.ShowDetail         := FALSE;
              IF ControlVenteVN.INSERT THEN IntLineNo+= 10000;

              // INSERT LIGNE CONTROL;
              CLEAR(RecLineControl);
              RecLineControl.SETRANGE(RecLineControl.Group,RecControlGroup."Group No");
              IF RecLineControl.FINDFIRST THEN
              REPEAT
                  CLEAR(ControlVenteVN);
                  IF RecLineControl."Titre Principale" THEN
                     ControlVenteVN."Titre Principale" := TRUE
                  ELSE ControlVenteVN.ShowDetail := TRUE;

                  ControlVenteVN."Document No"      := "Preparation No";
                  ControlVenteVN."No Chassis"       := VIN;
                  ControlVenteVN."Line No"          := IntLineNo;
                  ControlVenteVN."Date de Creation" := TODAY;
                  ControlVenteVN."Cree par"         := USERID;
                  ControlVenteVN.Group              := RecLineControl.Group ;
                  ControlVenteVN."Type Control"     := TypeControl;
                  ControlVenteVN.Description        := '  ' +RecLineControl.Description;
                  IF ControlVenteVN.INSERT THEN IntLineNo+= 10000;
              UNTIL RecLineControl.NEXT = 0;
        UNTIL RecControlGroup.NEXT = 0;
    end;

    procedure CheckVin(var NumChassis : Code[20];var CustomerNo : Code[20]) : Boolean;
    var
        CarteGriseLigne : Record "60016";
        PreparationVN : Record "60025";
        RecCustLedgerEntry : Record "21";
        DtldCustLedgEntry1 : Record "379";
        DtldCustLedgEntry2 : Record "379";
        RecGCustLE : Record "21";
        RecPaymentHeader : Record "10865";
    begin
        CarteGriseLigne.RESET;
        CarteGriseLigne.SETRANGE(VIN,NumChassis);
        IF CarteGriseLigne.FINDFIRST THEN BEGIN
          //Approbation Finance OK
          PreparationVN.RESET;
          PreparationVN.SETCURRENTKEY(VIN);
          PreparationVN.SETRANGE(VIN,NumChassis);
            IF PreparationVN."Acceptation Financière" THEN
              EXIT(TRUE);
          //Leasing

          IF (CarteGriseLigne."Type Paiement" = 'LEAS') THEN
            EXIT(TRUE);
          // AO
          IF (CarteGriseLigne."Type Paiement" = 'AO') THEN BEGIN
            PreparationVN.RESET;
            PreparationVN.SETCURRENTKEY(VIN);
            PreparationVN.SETRANGE(VIN,NumChassis);
            IF PreparationVN.FINDFIRST THEN
              IF PreparationVN."Acceptation Financière" THEN
                EXIT(TRUE)
              ELSE EXIT(FALSE);
          END;
          // BANQUE
          IF (CarteGriseLigne."Type Paiement" = 'BANK') OR (CarteGriseLigne."Type Paiement" = 'SS') THEN BEGIN
            RecCustLedgerEntry.RESET;
            RecCustLedgerEntry.SETCURRENTKEY("Document No.");
            RecCustLedgerEntry.SETRANGE("Document No.",CarteGriseLigne."Source ID");
            IF RecCustLedgerEntry.FINDFIRST THEN BEGIN
               //Lettré
               RecCustLedgerEntry.CALCFIELDS("Remaining Amt. (LCY)");
               IF ((RecCustLedgerEntry."Remaining Amt. (LCY)" < 10) AND (RecCustLedgerEntry."Remaining Amt. (LCY)" > -10))THEN
                  EXIT(TRUE);
        //*******************
              DtldCustLedgEntry1.SETCURRENTKEY("Cust. Ledger Entry No.");
              DtldCustLedgEntry1.SETRANGE("Cust. Ledger Entry No.",RecCustLedgerEntry."Entry No.");
              DtldCustLedgEntry1.SETRANGE(Unapplied,FALSE);
              IF DtldCustLedgEntry1.FIND('-') THEN
                REPEAT
                  IF DtldCustLedgEntry1."Cust. Ledger Entry No." =
                     DtldCustLedgEntry1."Applied Cust. Ledger Entry No."
                  THEN BEGIN
                    DtldCustLedgEntry2.INIT;
                    DtldCustLedgEntry2.SETCURRENTKEY("Applied Cust. Ledger Entry No.","Entry Type");
                    DtldCustLedgEntry2.SETRANGE(
                      "Applied Cust. Ledger Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    DtldCustLedgEntry2.SETRANGE("Entry Type",DtldCustLedgEntry2."Entry Type"::Application);
                    DtldCustLedgEntry2.SETRANGE(Unapplied,FALSE);
                    IF DtldCustLedgEntry2.FIND('-') THEN
                      REPEAT
                        IF DtldCustLedgEntry2."Cust. Ledger Entry No." <>
                           DtldCustLedgEntry2."Applied Cust. Ledger Entry No."
                        THEN BEGIN
                          RecGCustLE.SETCURRENTKEY("Entry No.");
                          RecGCustLE.SETRANGE("Entry No.",DtldCustLedgEntry2."Cust. Ledger Entry No.");
                          IF RecGCustLE.FIND('-') THEN
                            BEGIN
                            //TODO
                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                               AND (RecPaymentHeader.Certified) THEN BEGIN
                                EXIT(TRUE);
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                               AND (NOT RecPaymentHeader.Certified)
                               //OLD AND (RecPaymentHeader."Status No." >= 90000) THEN BEGIN
                               AND CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,95000) THEN BEGIN
                                 EXIT(TRUE);
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-VIR')
                               AND (CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,80000)) THEN BEGIN
                                 EXIT(TRUE);
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-ESP') THEN BEGIN
                                EXIT(TRUE);
                              END;

                           END;
                            //END TODO
                        END;
                      UNTIL DtldCustLedgEntry2.NEXT = 0;
                  END ELSE BEGIN
                    RecGCustLE.SETCURRENTKEY("Entry No.");
                    RecGCustLE.SETRANGE("Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    IF RecGCustLE.FIND('-') THEN
                      //TODO
                      BEGIN
                      //TODO
                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                         AND (RecPaymentHeader.Certified) THEN BEGIN
                          EXIT(TRUE);
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                         AND (NOT RecPaymentHeader.Certified)
                         //OLD AND (RecPaymentHeader."Status No." > 90000) THEN BEGIN
                         AND (CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,90000)) THEN BEGIN
                           EXIT(TRUE);
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-VIR')
                         AND (CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,80000)) THEN BEGIN
                           EXIT(TRUE);
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-ESP') THEN BEGIN
                          EXIT(TRUE);
                        END;
                      //END TODO
                      END;
                      //END TODO
                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-RS') THEN BEGIN
                          EXIT(TRUE);
                        END;

                   END;
                UNTIL DtldCustLedgEntry1.NEXT = 0;
              //*******************
            END;
          END;
        END;
    end;

    procedure CheckLastPaymentStatus(var RecPaymentHeader : Record "10865";var CustomerNo : Code[20];StatutNo : Integer) : Boolean;
    var
        RecPaymentLine : Record "10866";
        RecPaymentLine2 : Record "10866";
        PaymentCheked : Boolean;
    begin
        //ADD KK 04022016
        PaymentCheked := FALSE;
        RecPaymentLine.RESET;
        RecPaymentLine.SETRANGE("No.",RecPaymentHeader."No.");
        RecPaymentLine.SETRANGE("Account Type",RecPaymentLine."Account Type"::Customer);
        RecPaymentLine.SETRANGE("Account No.",CustomerNo);
        IF RecPaymentLine.FINDFIRST THEN
          REPEAT
            RecPaymentLine2.GET(RecPaymentLine."No.",RecPaymentLine."Line No.");
            WHILE RecPaymentLine2."Copied To No." <> '' DO BEGIN
              RecPaymentLine2.GET(RecPaymentLine2."Copied To No.",RecPaymentLine2."Copied To Line");
            END;
            IF RecPaymentLine2."Status No." = StatutNo THEN BEGIN
              PaymentCheked := TRUE;
            END ELSE BEGIN
              EXIT(FALSE);
            END;
          UNTIL RecPaymentLine.NEXT=0;
        EXIT(PaymentCheked);
        //END KK 04022016
    end;

    procedure CheckVinForPrepayment(var NumChassis : Code[20];var CustomerNo : Code[20]) : Boolean;
    var
        CarteGriseLigne : Record "60016";
        PreparationVN : Record "60025";
        RecCustLedgerEntry : Record "21";
        DtldCustLedgEntry1 : Record "379";
        DtldCustLedgEntry2 : Record "379";
        RecGCustLE : Record "21";
        RecPaymentHeader : Record "10865";
    begin
        CarteGriseLigne.RESET;
        CarteGriseLigne.SETRANGE(VIN,NumChassis);
        IF CarteGriseLigne.FINDFIRST THEN BEGIN
          //Approbation Finance OK
          PreparationVN.RESET;
          PreparationVN.SETCURRENTKEY(VIN);
          PreparationVN.SETRANGE(VIN,NumChassis);
            IF PreparationVN."Acceptation Financière" THEN
              EXIT(TRUE);
          //Leasing

          IF (CarteGriseLigne."Type Paiement" = 'LEAS') THEN
            EXIT(TRUE);
          // AO
          IF (CarteGriseLigne."Type Paiement" = 'AO') THEN
            EXIT(TRUE);

          // BANQUE
          IF (CarteGriseLigne."Type Paiement" = 'BANK') OR (CarteGriseLigne."Type Paiement" = 'SS') THEN BEGIN
            RecCustLedgerEntry.RESET;
            RecCustLedgerEntry.SETCURRENTKEY("Document No.");
            RecCustLedgerEntry.SETRANGE("Document No.",CarteGriseLigne."Source ID");
            IF RecCustLedgerEntry.FINDFIRST THEN BEGIN
               //Lettré
               RecCustLedgerEntry.CALCFIELDS("Remaining Amt. (LCY)");
               IF ((RecCustLedgerEntry."Remaining Amt. (LCY)" < 10) AND (RecCustLedgerEntry."Remaining Amt. (LCY)" > -10))THEN
                  EXIT(TRUE);
        //*******************
              DtldCustLedgEntry1.SETCURRENTKEY("Cust. Ledger Entry No.");
              DtldCustLedgEntry1.SETRANGE("Cust. Ledger Entry No.",RecCustLedgerEntry."Entry No.");
              DtldCustLedgEntry1.SETRANGE(Unapplied,FALSE);
              IF DtldCustLedgEntry1.FIND('-') THEN
                REPEAT
                  IF DtldCustLedgEntry1."Cust. Ledger Entry No." =
                     DtldCustLedgEntry1."Applied Cust. Ledger Entry No."
                  THEN BEGIN
                    DtldCustLedgEntry2.INIT;
                    DtldCustLedgEntry2.SETCURRENTKEY("Applied Cust. Ledger Entry No.","Entry Type");
                    DtldCustLedgEntry2.SETRANGE(
                      "Applied Cust. Ledger Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    DtldCustLedgEntry2.SETRANGE("Entry Type",DtldCustLedgEntry2."Entry Type"::Application);
                    DtldCustLedgEntry2.SETRANGE(Unapplied,FALSE);
                    IF DtldCustLedgEntry2.FIND('-') THEN
                      REPEAT
                        IF DtldCustLedgEntry2."Cust. Ledger Entry No." <>
                           DtldCustLedgEntry2."Applied Cust. Ledger Entry No."
                        THEN BEGIN
                          RecGCustLE.SETCURRENTKEY("Entry No.");
                          RecGCustLE.SETRANGE("Entry No.",DtldCustLedgEntry2."Cust. Ledger Entry No.");
                          IF RecGCustLE.FIND('-') THEN
                            BEGIN
                            //TODO
                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                               AND (RecPaymentHeader.Certified) THEN BEGIN
                                EXIT(TRUE);
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                               AND (NOT RecPaymentHeader.Certified)
                               //OLD AND (RecPaymentHeader."Status No." >= 90000) THEN BEGIN
                               AND CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,95000) THEN BEGIN
                                 EXIT(TRUE);
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-VIR')
                               AND (CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,80000)) THEN BEGIN
                                 EXIT(TRUE);
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-ESP') THEN BEGIN
                                EXIT(TRUE);
                              END;

                           END;
                            //END TODO
                        END;
                      UNTIL DtldCustLedgEntry2.NEXT = 0;
                  END ELSE BEGIN
                    RecGCustLE.SETCURRENTKEY("Entry No.");
                    RecGCustLE.SETRANGE("Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    IF RecGCustLE.FIND('-') THEN
                      //TODO
                      BEGIN
                      //TODO
                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                         AND (RecPaymentHeader.Certified) THEN BEGIN
                          EXIT(TRUE);
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                         AND (NOT RecPaymentHeader.Certified)
                         //OLD AND (RecPaymentHeader."Status No." > 90000) THEN BEGIN
                         AND (CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,90000)) THEN BEGIN
                           EXIT(TRUE);
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-VIR')
                         AND (CheckLastPaymentStatus(RecPaymentHeader,CustomerNo,80000)) THEN BEGIN
                           EXIT(TRUE);
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-ESP') THEN BEGIN
                          EXIT(TRUE);
                        END;
                      //END TODO
                      END;
                      //END TODO
                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-RS') THEN BEGIN
                          EXIT(TRUE);
                        END;

                   END;
                UNTIL DtldCustLedgEntry1.NEXT = 0;
              //*******************
            END;
          END;
        END;
    end;

    local procedure UpdateServItemStatusAndBordPVN();
    var
        ServiceItem : Record "5940";
        BordereauPVN : Record "70021";
        LignebordereauPVN : Record "70022";
        LigneEncours : Boolean;
    begin
        ServiceItem.RESET;
        ServiceItem.SETCURRENTKEY("Item No.","Serial No.");
        ServiceItem.SETRANGE("Serial No.",VIN);
        ServiceItem.FINDFIRST;
        ServiceItem.TESTFIELD("Statut PVN",ServiceItem."Statut PVN"::"Encours de préparation");
        ServiceItem."Statut PVN" := ServiceItem."Statut PVN"::"Véhicule préparé";
        ServiceItem.MODIFY;

        LignebordereauPVN.RESET;
        LignebordereauPVN.SETRANGE("N° Bordereau",ServiceItem."No. Bord. PVN");
        LignebordereauPVN.SETRANGE(VIN,VIN);
        LignebordereauPVN.FINDFIRST;
        LignebordereauPVN.Statut:=LignebordereauPVN.Statut::Terminé;
        LignebordereauPVN.MODIFY;

        LigneEncours := FALSE;
        LignebordereauPVN.RESET;
        LignebordereauPVN.SETRANGE("N° Bordereau",ServiceItem."No. Bord. PVN");
        LignebordereauPVN.FINDSET;
        REPEAT
          IF LignebordereauPVN.Statut = LignebordereauPVN.Statut::"Encours de préparation" THEN
            LigneEncours := TRUE;
        UNTIL (LignebordereauPVN.NEXT=0) OR (LigneEncours=TRUE);

        IF NOT LigneEncours THEN BEGIN
          BordereauPVN.GET(ServiceItem."No. Bord. PVN");
          BordereauPVN.Statut := BordereauPVN.Statut::Terminé;
          BordereauPVN.MODIFY;
        END;
    end;

    procedure FctSetAncientManquant(LboolAncientManquant : Boolean);
    begin
        GBoolAncientManquant:=LboolAncientManquant;
    end;
}

