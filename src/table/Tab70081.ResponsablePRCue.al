table 70081 "Responsable  PR Cue"
{

    fields
    {
        field(1;"Primary Key";Code[50])
        {
        }
        field(2;"Commande Achat";Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE (Order Type=FILTER(PR),
                                                         Document Type=CONST(Order)));
            FieldClass = FlowField;
        }
        field(3;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(4;"Facture Achat";Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE (Document Type=CONST(Invoice),
                                                         Order Type=FILTER(PR)));
            FieldClass = FlowField;
        }
        field(5;"Reception Interpôt";Integer)
        {
            CalcFormula = Count("Warehouse Receipt Header");
            FieldClass = FlowField;
        }
        field(6;"Dossier Import";Integer)
        {
            CalcFormula = Count("Entête Facture P.R / Colis");
            FieldClass = FlowField;
        }
        field(7;"Dossier Facture Collisage";Integer)
        {
            CalcFormula = Count("Entete Arrivage PR");
            FieldClass = FlowField;
        }
        field(8;"Liste Magasinier";Integer)
        {
            CalcFormula = Count("Warehouse Employee");
            FieldClass = FlowField;
        }
        field(9;"Liste Magasin";Integer)
        {
            CalcFormula = Count(Location);
            FieldClass = FlowField;
        }
        field(10;"Ordre de Transfert Vente PR";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE (Source Type=CONST(Vente PR),
                                                         cloturer=FILTER(No),
                                                         Réservation=CONST(No),
                                                         Sur Commande=FILTER(No)));
            CaptionML = ENU='Demande de préparation Vente PR',
                        FRA='Demande de préparation Vente PR';
            FieldClass = FlowField;
        }
        field(11;"Ordre de Transfert Atelier";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE (Source Type=FILTER(Service Rapide|Grande réparation),
                                                         cloturer=FILTER(No),
                                                         Réservation=CONST(No),
                                                         Sur Commande=FILTER(No)));
            CaptionML = ENU='Demande de préparation Atelier',
                        FRA='Demande de préparation Atelier';
            FieldClass = FlowField;
        }
        field(12;"Avoir Achat";Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE (Document Type=CONST(Credit Memo),
                                                         Order Type=FILTER(PR)));
            FieldClass = FlowField;
        }
        field(13;"Retour Achat";Integer)
        {
            CalcFormula = Count("Purchase Header" WHERE (Document Type=CONST(Return Order),
                                                         Order Type=CONST(PR)));
            FieldClass = FlowField;
        }
        field(14;"Autre Ordre de Transfert";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE (Source No=FILTER(''),
                                                         Source Type=FILTER(0),
                                                         cloturer=FILTER(No)));
            CaptionML = ENU='Autre Demande de préparation',
                        FRA='Autre Demande de préparation';
            FieldClass = FlowField;
        }
        field(15;"Demandes réservation comptoir";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE (Source Type=CONST(Vente PR),
                                                         cloturer=FILTER(No),
                                                         Réservation=CONST(Yes)));
            FieldClass = FlowField;
        }
        field(16;"Demandes Réseravtion Atelier";Integer)
        {
            CalcFormula = Count("Transfer Header" WHERE (Source Type=FILTER(Service Rapide|Grande réparation),
                                                         cloturer=FILTER(No),
                                                         Réservation=CONST(Yes)));
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

