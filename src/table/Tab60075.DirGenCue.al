table 60075 "Dir.Gen Cue"
{

    fields
    {
        field(1;"Entry No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Demande achat à approuver";Integer)
        {
            CalcFormula = Count("Purchase Request Header" WHERE (Status=FILTER(Released),
                                                                 En Attente d'approbation D.G=FILTER(Yes)));
            FieldClass = FlowField;
        }
        field(3;"VN Réservée sur arrivage";Integer)
        {
            CalcFormula = Count("Détail VN Arrivage." WHERE (Sales Order No.=FILTER(<>''),
                                                             Existe en Stock=FILTER(No)));
            FieldClass = FlowField;
        }
        field(4;"Demande achat refusé D.G";Integer)
        {
            CalcFormula = Count("Purchase Request Header" WHERE (Refusé par la Dir.Genenal=FILTER(Yes)));
            FieldClass = FlowField;
        }
        field(5;"Date du Jours";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(60000;"Service Rapide : Marsa";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(MARSA)));
            CaptionML = ENU='Rapid Service - in Process',
                        FRA='Chrono  - En cours';
            FieldClass = FlowField;
        }
        field(60001;"Service Rapide : Charguia";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(CHARGUIA)));
            FieldClass = FlowField;
        }
        field(60002;"Service Rapide : Akouda";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(SOUSSE_AK)));
            FieldClass = FlowField;
        }
        field(60003;"Service Rapide : S. Abdelhamid";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(SOUSSE_SA)));
            FieldClass = FlowField;
        }
        field(60004;"Service Rapide : Sfax";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(SFAX)));
            FieldClass = FlowField;
        }
        field(70000;"S.A.V : Marsa";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=FILTER(Big Service|Internal Repair),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(MARSA)));
            CaptionML = ENU='Rapid Service - in Process',
                        FRA='Chrono  - En cours';
            FieldClass = FlowField;
        }
        field(70001;"S.A.V : Charguia";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Big Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(CHARGUIA)));
            FieldClass = FlowField;
        }
        field(70002;"S.A.V : Akouda";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Big Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(SOUSSE_AK)));
            FieldClass = FlowField;
        }
        field(70003;"S.A.V : S. Abdelhamid";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Big Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(SOUSSE_SA)));
            FieldClass = FlowField;
        }
        field(70004;"S.A.V : Sfax";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Big Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours),
                                                       Responsibility Center=FILTER(SFAX)));
            FieldClass = FlowField;
        }
        field(80000;"Total Service Rapide";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Rapid Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours)));
            CaptionML = ENU='Rapid Service - in Process',
                        FRA='Total Service Rapide';
            FieldClass = FlowField;
        }
        field(80001;"Total S.A.V";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Service Type=CONST(Big Service),
                                                       Status SR=FILTER(<>Facturée),
                                                       Creation date=FIELD(Date du Jours)));
            Caption = 'Total S.A.V';
            FieldClass = FlowField;
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
}

