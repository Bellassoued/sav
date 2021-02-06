table 50085 "Direct. Finance Cue"
{
    // version NAVW19.00

    CaptionML = ENU='Finance Cue',
                FRA='Pile finance';

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            CaptionML = ENU='Primary Key',
                        FRA='Clé primaire';
        }
        field(2;"Overdue Sales Documents";Integer)
        {
            CalcFormula = Count("Cust. Ledger Entry" WHERE (Document Type=FILTER(Invoice|Credit Memo),
                                                            Due Date=FIELD(Overdue Date Filter),
                                                            Open=CONST(Yes)));
            CaptionML = ENU='Overdue Sales Documents',
                        FRA='Documents vente échus';
            FieldClass = FlowField;
        }
        field(3;"Purchase Invoices Due Today";Integer)
        {
            CalcFormula = Count("Vendor Ledger Entry" WHERE (Document Type=FILTER(Invoice|Credit Memo),
                                                             Due Date=FIELD(Due Date Filter),
                                                             Open=CONST(Yes)));
            CaptionML = ENU='Purchase Invoices Due Today',
                        FRA='Factures achat échues aujourd''hui';
            FieldClass = FlowField;
        }
        field(4;"POs Pending Approval";Integer)
        {
            AccessByPermission = TableData 120=R;
            CalcFormula = Count("Purchase Header" WHERE (Document Type=CONST(Order),
                                                         Status=FILTER(Pending Approval)));
            CaptionML = ENU='POs Pending Approval',
                        FRA='Approbation suspendue cdes achat';
            FieldClass = FlowField;
        }
        field(5;"SOs Pending Approval";Integer)
        {
            AccessByPermission = TableData 110=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Order),
                                                      Status=FILTER(Pending Approval)));
            CaptionML = ENU='SOs Pending Approval',
                        FRA='Approbation suspendue cdes vente';
            FieldClass = FlowField;
        }
        field(6;"Approved Sales Orders";Integer)
        {
            AccessByPermission = TableData 110=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Order),
                                                      Status=FILTER(Released|Pending Prepayment)));
            CaptionML = ENU='Approved Sales Orders',
                        FRA='Commandes vente approuvées';
            FieldClass = FlowField;
        }
        field(7;"Approved Purchase Orders";Integer)
        {
            AccessByPermission = TableData 120=R;
            CalcFormula = Count("Purchase Header" WHERE (Document Type=CONST(Order),
                                                         Status=FILTER(Released|Pending Prepayment)));
            CaptionML = ENU='Approved Purchase Orders',
                        FRA='Commandes achat approuvées';
            FieldClass = FlowField;
        }
        field(8;"Vendors - Payment on Hold";Integer)
        {
            CalcFormula = Count(Vendor WHERE (Blocked=FILTER(Payment)));
            CaptionML = ENU='Vendors - Payment on Hold',
                        FRA='Fournisseurs - Paiement en attente';
            FieldClass = FlowField;
        }
        field(9;"Purchase Return Orders";Integer)
        {
            AccessByPermission = TableData 6650=R;
            CalcFormula = Count("Purchase Header" WHERE (Document Type=CONST(Return Order)));
            CaptionML = ENU='Purchase Return Orders',
                        FRA='Retours achat';
            FieldClass = FlowField;
        }
        field(10;"Sales Return Orders - All";Integer)
        {
            AccessByPermission = TableData 6660=R;
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Return Order)));
            CaptionML = ENU='Sales Return Orders - All',
                        FRA='Retours vente - Tous';
            FieldClass = FlowField;
        }
        field(11;"Customers - Blocked";Integer)
        {
            CalcFormula = Count(Customer WHERE (Blocked=FILTER(<>' ')));
            CaptionML = ENU='Customers - Blocked',
                        FRA='Clients - Bloqués';
            FieldClass = FlowField;
        }
        field(20;"Due Date Filter";Date)
        {
            CaptionML = ENU='Due Date Filter',
                        FRA='Filtre échéance';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21;"Overdue Date Filter";Date)
        {
            CaptionML = ENU='Overdue Date Filter',
                        FRA='Filtre échus';
            FieldClass = FlowFilter;
        }
        field(22;"New Incoming Documents";Integer)
        {
            CalcFormula = Count("Incoming Document" WHERE (Status=CONST(New)));
            CaptionML = ENU='New Incoming Documents',
                        FRA='Nouveaux documents entrants';
            FieldClass = FlowField;
        }
        field(23;"Approved Incoming Documents";Integer)
        {
            CalcFormula = Count("Incoming Document" WHERE (Status=CONST(Released)));
            CaptionML = ENU='Approved Incoming Documents',
                        FRA='Documents entrants approuvés';
            FieldClass = FlowField;
        }
        field(24;"OCR Pending";Integer)
        {
            CalcFormula = Count("Incoming Document" WHERE (OCR Status=FILTER(Ready|Sent|Awaiting Verification)));
            CaptionML = ENU='OCR Pending',
                        FRA='OCR suspendu';
            FieldClass = FlowField;
        }
        field(25;"OCR Completed";Integer)
        {
            CalcFormula = Count("Incoming Document" WHERE (OCR Status=CONST(Success)));
            CaptionML = ENU='OCR Completed',
                        FRA='OCR terminé';
            FieldClass = FlowField;
        }
        field(26;"Requests to Approve";Integer)
        {
            CalcFormula = Count("Approval Entry" WHERE (Approver ID=FIELD(User ID Filter),
                                                        Status=FILTER(Open)));
            CaptionML = ENU='Requests to Approve',
                        FRA='Demandes à approuver';
            FieldClass = FlowField;
        }
        field(27;"Requests Sent for Approval";Integer)
        {
            CalcFormula = Count("Approval Entry" WHERE (Sender ID=FIELD(User ID Filter),
                                                        Status=FILTER(Open)));
            CaptionML = ENU='Requests Sent for Approval',
                        FRA='Demandes envoyées pour approbation';
            FieldClass = FlowField;
        }
        field(28;"User ID Filter";Code[50])
        {
            CaptionML = ENU='User ID Filter',
                        FRA='Filtre code utilisateur';
            FieldClass = FlowFilter;
        }
        field(50000;"Nbre appel offre ouverts";Integer)
        {
            CalcFormula = Count(Caution WHERE (Statut=CONST(Ouvert)));
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50002;"Nbre Cautions Prov.Ouver";Integer)
        {
            CalcFormula = Count("Payment Header" WHERE (Payment Class Name=CONST(CAUTION PROV),
                                                        Status No.=CONST(20000)));
            Caption = 'Cautions provisoires ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50003;"Nbre Cautions Prov.Appur";Integer)
        {
            CalcFormula = Count("Payment Header" WHERE (Payment Class Name=CONST(CAUTION PROV),
                                                        Status No.=CONST(40000)));
            Caption = 'Cautions provisoires appurées';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50004;"Nbre Cautions Def.Ouver";Integer)
        {
            CalcFormula = Count("Payment Header" WHERE (Payment Class Name=CONST(CAUTION DEFINITIVE),
                                                        Status No.=CONST(20000)));
            Caption = 'Cautions définitives ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50005;"Nbre Cautions Def.Appur";Integer)
        {
            CalcFormula = Count("Payment Header" WHERE (Payment Class Name=CONST(CAUTION DEFINITIVE),
                                                        Status No.=CONST(40000)));
            Caption = 'Cautions définitives appurées';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50006;"Nbre Cautions Gar.Appur";Integer)
        {
            CalcFormula = Count("Payment Header" WHERE (Payment Class Name=CONST(CAUTION GARANTIE),
                                                        Status No.=CONST(40000)));
            Caption = 'Cautions de retenue garantie Apurées';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50007;"Nbre Cautions Gar.Ouver";Integer)
        {
            CalcFormula = Count("Payment Header" WHERE (Payment Class Name=CONST(CAUTION GARANTIE),
                                                        Status No.=CONST(20000)));
            Caption = 'Cautions de retenue garantie ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50008;"Bord. rec. En cours";Integer)
        {
            CalcFormula = Count("Recouvrement Entete" WHERE (Etape=CONST(En Cours)));
            Caption = 'Bordereaux de recouvrement en cours';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50009;"Bord. rec. Clôturés";Integer)
        {
            CalcFormula = Count("Recouvrement Entete" WHERE (Etape=CONST(Cloturer),
                                                             Status=CONST(Released)));
            Caption = 'Bordereaux de recouvrement clôturés';
            Description = 'KT13022017                    : Recovrement';
            FieldClass = FlowField;
        }
        field(50010;"Bord. rec. Archivés";Integer)
        {
            CalcFormula = Count("Recouvrement Entete" WHERE (Etape=CONST(Archiver),
                                                             Status=CONST(Released)));
            Caption = 'Bordereaux de recouvrement archivés';
            Description = 'KT13022017                   : Recovrement';
            FieldClass = FlowField;
        }
        field(50011;"Bord. rec. Ouverts";Integer)
        {
            CalcFormula = Count("Recouvrement Entete" WHERE (Status=CONST(Open)));
            Caption = 'Bordereaux de recouvrement ouverts';
            Description = 'KT13022017                   : Recovrement';
            FieldClass = FlowField;
        }
        field(50012;"Lignes Rec Chez Coursier";Integer)
        {
            CalcFormula = Count("Recouvrement Line" WHERE (Remis Coursier=CONST(Yes),
                                                           Réception Décharge=CONST(No)));
            Caption = 'Factures remises coursier';
            Description = 'KT13022017                   : Recovrement';
            FieldClass = FlowField;
        }
        field(50013;"Nbre Decharges Reçues";Integer)
        {
            CalcFormula = Count("Recouvrement Line" WHERE (Réception Décharge=CONST(Yes),
                                                           Mnt Ouvert=FILTER(>0)));
            Caption = 'Décharges reçues';
            Description = 'KT13022017                   : Recovrement';
            FieldClass = FlowField;
        }
        field(50014;"Date Filter Jour";Date)
        {
            Description = 'KT13022017';
            FieldClass = FlowFilter;
        }
        field(50015;"Factures Echues Non Livrees";Integer)
        {
            CalcFormula = Count("Recouvrement Line" WHERE (Date Echéance=FIELD(Date Filter Jour),
                                                           Réception Décharge=CONST(No),
                                                           Remis Coursier=CONST(Yes),
                                                           Mnt Ouvert=FILTER(>0)));
            Caption = 'Factures échues non livrées';
            Description = 'KT13022017                   : Facture Client';
            FieldClass = FlowField;
        }
        field(50016;"Factures Echues Non Remises Co";Integer)
        {
            CalcFormula = Count("Recouvrement Line" WHERE (Date Echéance=FIELD(Date Filter Jour),
                                                           Réception Décharge=CONST(No),
                                                           Remis Coursier=CONST(No),
                                                           Mnt Ouvert=FILTER(>0)));
            Caption = 'Factures échues non remises coursier';
            Description = 'KT13022017                   : Facture Client';
            FieldClass = FlowField;
        }
        field(50017;"Factures Echues Non Reglees";Integer)
        {
            CalcFormula = Count("Recouvrement Line" WHERE (Date Echéance=FIELD(Date Filter Jour),
                                                           Réception Décharge=CONST(Yes),
                                                           Remis Coursier=CONST(Yes),
                                                           Reglé=CONST(No),
                                                           Mnt Ouvert=FILTER(>0)));
            Caption = 'Factures échues livrées non réglées';
            Description = 'KT13022017                   : Facture Client';
            FieldClass = FlowField;
        }
        field(50018;"Solde chèques en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(20000|236875|226875),
                                                                    Coffre=FIELD(FiltreCoffre)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50019;"Nombre chèques en coffre";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-CH-CLT),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(20000),
                                                      Coffre=FIELD(FiltreCoffre)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50020;"Solde effets en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(20000),
                                                                    Coffre=FIELD(FiltreCoffre)));
            Description = '                                       : Effet  Client';
            FieldClass = FlowField;
        }
        field(50021;"Nombre effets en coffre";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(20000),
                                                      Coffre=FIELD(FiltreCoffre)));
            Description = '                                       : Effet  Client';
            FieldClass = FlowField;
        }
        field(50022;"Versement chèques";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Coffre=FIELD(FiltreCoffre),
                                                                    Status No.=FILTER(92500),
                                                                    Copied To No.=FILTER(''),
                                                                    Payment Class=FILTER(ENC-Ch-CLT)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50023;"Versement effets";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(TRAITE),
                                                                   En Banque=FILTER(Yes),
                                                                   Posting Date=FIELD(Date Filter Jour),
                                                                   Coffre=FIELD(FiltreCoffre)));
            Description = '                                       : Effet   Client';
            FieldClass = FlowField;
        }
        field(50024;"Versement espèce";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(ESPÈCE),
                                                                   En Banque=FILTER(Yes),
                                                                   Posting Date=FIELD(Date Filter Jour),
                                                                   Coffre=FIELD(FiltreCoffre)));
            Description = '                                       : Espèce';
            FieldClass = FlowField;
        }
        field(50025;FiltreCoffre;Code[20])
        {
        }
        field(50026;"Mnt Chèq. Impay. Client Grp";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(116875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50027;"Nbr. Chèq. Impay. Client Grp";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(116875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50028;"Mnt Effets Impayés Client Grp";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(50029;"Nbr Effets Impayés Client Grp";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(50030;"Solde Clients";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)");
            FieldClass = FlowField;
        }
        field(50031;"Solde Fournisseurs";Decimal)
        {
            CalcFormula = -Sum("Detailed Vendor Ledg. Entry"."Amount (LCY)");
            FieldClass = FlowField;
        }
        field(50032;"Acheteurs Bloqués";Integer)
        {
            CalcFormula = Count(Customer WHERE (Blocked=FILTER(<>' ')));
            FieldClass = FlowField;
        }
        field(50033;"Fournisseurs Bloqués";Integer)
        {
            CalcFormula = Count(Vendor WHERE (Blocked=FILTER(<>' ')));
            FieldClass = FlowField;
        }
        field(50034;"Lettres de Crédit Ouvertes";Integer)
        {
            CalcFormula = Count("Lettre de crédit L.C" WHERE (Statut=CONST(Ouvert)));
            FieldClass = FlowField;
        }
        field(50035;"Lettres de Crédit Lancées";Integer)
        {
            CalcFormula = Count("Lettre de crédit L.C" WHERE (Statut=CONST(Lancer)));
            FieldClass = FlowField;
        }
        field(50036;"Lettres de Crédit Clôturées";Integer)
        {
            CalcFormula = Count("Lettre de crédit L.C" WHERE (Statut=CONST(Clôturer)));
            FieldClass = FlowField;
        }
        field(50037;"Montant L.C. Ouvertes";Decimal)
        {
            CalcFormula = Sum("Détail L.C"."Montant Tnd" WHERE (Statut=CONST(Ouvert)));
            FieldClass = FlowField;
        }
        field(50038;"Montant L.C. Lancées";Decimal)
        {
            CalcFormula = Sum("Détail L.C"."Montant Tnd" WHERE (Statut=CONST(Lancer)));
            FieldClass = FlowField;
        }
        field(50039;"Montant L.C. Clôturées";Decimal)
        {
            CalcFormula = Sum("Détail L.C"."Montant Tnd" WHERE (Statut=CONST(Clôturé)));
            FieldClass = FlowField;
        }
        field(50040;"Quantité L.C. Ouvertes";Decimal)
        {
            CalcFormula = Sum("Détail L.C".Quantité WHERE (Statut=CONST(Ouvert)));
            FieldClass = FlowField;
        }
        field(50041;"Quantité L.C. Lancées";Decimal)
        {
            CalcFormula = Sum("Détail L.C".Quantité WHERE (Statut=CONST(Lancer)));
            FieldClass = FlowField;
        }
        field(50042;"Quantité L.C. Clôturées";Decimal)
        {
            CalcFormula = Sum("Détail L.C".Quantité WHERE (Statut=CONST(Clôturé)));
            FieldClass = FlowField;
        }
        field(50043;"Négotiations Court à Terme";Integer)
        {
            CalcFormula = Count("Lettre de crédit L.C" WHERE (Négociation Court à Terme=CONST(Yes)));
            FieldClass = FlowField;
        }
        field(50044;"Financement Devise";Integer)
        {
            CalcFormula = Count("Lettre de crédit L.C" WHERE (Financement devise=CONST(Yes)));
            FieldClass = FlowField;
        }
        field(50045;"Montant Chèques Imp. Frn";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-CHQ),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875),
                                                                    Coffre=FIELD(FiltreCoffre)));
            Caption = 'Montant Chèques Fournisseurs Impayés';
            FieldClass = FlowField;
        }
        field(50046;"Nombre Chèques Imp. Frn";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(DEC-CHQ),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875),
                                                      Coffre=FIELD(FiltreCoffre)));
            Caption = 'Nombre  Chèques Fournisseurs Impayés';
            FieldClass = FlowField;
        }
        field(50047;"Montant Effets Imp. Frn";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875),
                                                                    Coffre=FIELD(FiltreCoffre)));
            Caption = 'Montant Effets Fournisseurs Impayés';
            FieldClass = FlowField;
        }
        field(50049;"Nombre Effets Imp. Frn";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(DEC-EFF),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875),
                                                      Coffre=FIELD(FiltreCoffre)));
            Caption = 'Nombre Effets Fournisseurs Impayés';
            FieldClass = FlowField;
        }
        field(50050;"Montant Cautions Prov.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION PROV),
                                                                   Status No.=CONST(20000)));
            Caption = 'Montant cautions provisoires ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50051;"Montant Cautions Prov.Appur";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION PROV),
                                                                   Status No.=CONST(40000)));
            Caption = 'Montant cautions provisoires appurées';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50052;"Montant Cautions Def.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION DEFINITIVE),
                                                                   Status No.=CONST(20000)));
            Caption = 'Montant cautions définitives ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50053;"Montant Cautions Def.Appur";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION DEFINITIVE),
                                                                   Status No.=CONST(40000)));
            Caption = 'Montant cautions définitives appurées';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50054;"Montant Cautions Gar.Appur";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION GARANTIE),
                                                                   Status No.=CONST(40000)));
            Caption = 'Montant cautions de retenue garantie Apurées';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50055;"Montant Cautions Gar.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION GARANTIE),
                                                                   Status No.=CONST(20000)));
            Caption = 'Montant cautions de retenue garantie ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(50056;"Big Service - in Process";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Big Service),
                                                       Status SR=FILTER(<>Facturée)));
            FieldClass = FlowField;
        }
        field(50057;"Rapid Service - in Process";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(<>Facturée)));
            FieldClass = FlowField;
        }
        field(50058;"Dossier d'import P.R";Integer)
        {
            CalcFormula = Count("Entête Facture P.R / Colis");
            FieldClass = FlowField;
        }
        field(50059;"Facture Garantie";Integer)
        {
            CalcFormula = Count("Service Invoice Header" WHERE (Warranty=CONST(Yes)));
            FieldClass = FlowField;
        }
        field(50060;"Commande achat lancer VN";Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE (Document Type=CONST(Order),
                                                         Order Type=CONST(VN),
                                                         Status=CONST(Released)));
            FieldClass = FlowField;
        }
        field(50061;"Devis lancer VN";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Quote),
                                                      Order Type=CONST(VN),
                                                      Status=CONST(Released)));
            FieldClass = FlowField;
        }
        field(50062;"Commande lancer VN";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Document Type=CONST(Order),
                                                      Order Type=CONST(VN),
                                                      Status=CONST(Released)));
            FieldClass = FlowField;
        }
        field(50063;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(50064;"Rapid Service - Solder";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(Facturée),
                                                       Creation date=FIELD(Date Filter)));
            CaptionML = ENU='Rapid Service - in Process',
                        FRA='Chrono - Soldé';
            FieldClass = FlowField;
        }
        field(50065;"chèques Frs en signature";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-CHQ),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(40000)));
            FieldClass = FlowField;
        }
        field(50066;"chèques Frs en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-CHQ),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(70000)));
            FieldClass = FlowField;
        }
        field(50067;"chèques Frs Remis";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-CHQ),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(90000)));
            FieldClass = FlowField;
        }
        field(50068;"Effets Frs en signature";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(40000)));
            FieldClass = FlowField;
        }
        field(50069;"Effets Frs en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(70000)));
            FieldClass = FlowField;
        }
        field(50070;"Effets Frs Remis";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(90000)));
            FieldClass = FlowField;
        }
        field(70029;"Obligations Annulées";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(OBLIG-CAUT),
                                                                    Status No.=FILTER(90000),
                                                                    Copied To No.=FILTER(''),
                                                                    Coffre=FIELD(FiltreCoffre)));
            FieldClass = FlowField;
        }
        field(70030;"Obligations Validées";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(OBLIG-CAUT),
                                                                    Status No.=FILTER(110000),
                                                                    Copied To No.=FILTER(''),
                                                                    Coffre=FILTER(FIL)));
            FieldClass = FlowField;
        }
        field(70031;"Mnt Chèq. Impay. Client H.G";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(70032;"Nbr. Chèq. Impay. Client H.G";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(70033;"Mnt Effets Impayés Client H.G";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(70034;"Nbr Effets Impayés Client H.G";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(70035;"Mnt Cautions Prov.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=CONST(CAUTION PROV),
                                                           Status No.=CONST(20000),
                                                           Coffre=FIELD(FiltreCoffre)));
            Caption = 'Cautions provisoires ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(70036;"Mnt Cautions Def.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=CONST(CAUTION DEFINITIVE),
                                                           Status No.=CONST(20000),
                                                           Coffre=FIELD(FiltreCoffre)));
            Caption = 'Cautions définitives ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(70037;"Mnt Cautions Gar.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION GARANTIE),
                                                                   Status No.=CONST(20000),
                                                                   Coffre=FIELD(FiltreCoffre)));
            Caption = 'Cautions de retenue garantie ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(70040;"Chèque en transit";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(226875)));
            Description = 'Chèue en transit';
            FieldClass = FlowField;
        }
        field(70041;"Effet en transit";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(191875)));
            Description = 'Effet en transit';
            FieldClass = FlowField;
        }
        field(70042;"Demandes d'exonération";Integer)
        {
            CalcFormula = Count("Sales Header" WHERE (Demande exonération=CONST(Yes),
                                                      Exonération validée=CONST(No)));
            FieldClass = FlowField;
        }
        field(70043;"Virement frs signé";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-VIR),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(50000)));
            FieldClass = FlowField;
        }
        field(70044;"Virement en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(DEC-VIR),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(60000)));
            FieldClass = FlowField;
        }
        field(70045;"Commande Achat";Decimal)
        {
            CalcFormula = Sum("Purchase Line".Amount WHERE (Order Type=CONST(PR),
                                                            Document Type=CONST(Order),
                                                            Outstanding Quantity=FILTER(<>0)));
            FieldClass = FlowField;
        }
        field(70046;"Facture Achat";Decimal)
        {
            CalcFormula = Sum("Purchase Line".Amount WHERE (Order Type=CONST(PR),
                                                            Document Type=CONST(Invoice)));
            FieldClass = FlowField;
        }
        field(70047;"Dossier Import";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Montant Devise");
            FieldClass = FlowField;
        }
        field(70048;"Avoir Achat";Decimal)
        {
            CalcFormula = Sum("Purchase Line".Amount WHERE (Order Type=CONST(PR),
                                                            Document Type=CONST(Credit Memo)));
            FieldClass = FlowField;
        }
        field(70049;"Retour Achat";Decimal)
        {
            CalcFormula = Sum("Purchase Line".Amount WHERE (Order Type=CONST(PR),
                                                            Document Type=CONST(Return Order)));
            FieldClass = FlowField;
        }
        field(70050;"Commande Vente En Cours";Decimal)
        {
            CalcFormula = Sum("Sales Line".Amount WHERE (Order Type=CONST(PR),
                                                         Document Type=CONST(Order),
                                                         Outstanding Quantity=FILTER(<>0)));
            FieldClass = FlowField;
        }
        field(70051;"Comd Vente Livrée Non Facturée";Decimal)
        {
            CalcFormula = Sum("Sales Line".Amount WHERE (Order Type=CONST(PR),
                                                         Document Type=CONST(Order),
                                                         Qty. Shipped Not Invoiced=FILTER(<>0)));
            FieldClass = FlowField;
        }
        field(70052;"Facture Vente Enreg";Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Amount WHERE (Order Type=CONST(PR)));
            FieldClass = FlowField;
        }
        field(70053;"Avoirs Vente Enreg";Decimal)
        {
            CalcFormula = Sum("Sales Cr.Memo Line".Amount WHERE (Order Type=CONST(PR)));
            FieldClass = FlowField;
        }
        field(70054;"Devis En Cours";Decimal)
        {
            CalcFormula = Sum("Sales Line".Amount WHERE (Document Type=CONST(Quote),
                                                         Order Type=CONST(PR)));
            FieldClass = FlowField;
        }
        field(70055;"Facture Vente En Cours";Decimal)
        {
            CalcFormula = Sum("Sales Line".Amount WHERE (Order Type=CONST(PR),
                                                         Document Type=CONST(Invoice)));
            FieldClass = FlowField;
        }
        field(70056;"Cmd Service";Decimal)
        {
            CalcFormula = Sum("Service Line".Amount WHERE (Document Type=CONST(Order),
                                                           Outstanding Quantity=FILTER(<>0)));
            FieldClass = FlowField;
        }
        field(70057;"Devis Service";Decimal)
        {
            CalcFormula = Sum("Service Line".Amount WHERE (Document Type=CONST(Quote)));
            FieldClass = FlowField;
        }
        field(70058;"Facture Service Enreg.";Decimal)
        {
            CalcFormula = Sum("Service Invoice Line".Amount);
            FieldClass = FlowField;
        }
        field(70059;"Avoir Service Enreg.";Decimal)
        {
            CalcFormula = Sum("Service Cr.Memo Line".Amount);
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

