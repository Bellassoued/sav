table 70039 "Simulation Droits Douanes"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"No. Expédition";Code[20])
        {
        }
        field(3;"Libellé";Code[100])
        {
        }
        field(4;"Total Mnt en Devise";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Mnt en EURO" WHERE (No. Document=FIELD(No.),
                                                                                No. Expédition=FIELD(No. Expédition)));
            Description = 'a supprimer';
            FieldClass = FlowField;
        }
        field(5;"% DC";Decimal)
        {
            FieldClass = Normal;
        }
        field(6;"% TVA";Decimal)
        {
            FieldClass = Normal;
        }
        field(7;"% RDP";Decimal)
        {
            FieldClass = Normal;
        }
        field(8;"Quantité";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".Quantité WHERE (No. Document=FIELD(No.),
                                                                           No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(9;"Mnt en EURO /SMino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Mnt en EURO" WHERE (No. Document=FIELD(No.),
                                                                                No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(10;"Mnt TND /SMino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Mnt TND" WHERE (No. Document=FIELD(No.),
                                                                            No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(11;FRET;Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".FRET WHERE (No. Document=FIELD(No.),
                                                                       No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(12;"ASSURANCE Av-Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".ASSURANCE-Av-Mino WHERE (No. Document=FIELD(No.),
                                                                                    No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(13;"MT à déclarer";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Valeur en Douane-Av-Mino" WHERE (No. Document=FIELD(No.),
                                                                                             No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(14;"Droit Douane";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Droit Douane-Av-Mino" WHERE (No. Document=FIELD(No.),
                                                                                         No. Expédition=FIELD(No. Expédition)));
            Description = 'a supprimer unitil';
            FieldClass = FlowField;
        }
        field(16;"TVA/Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".TVA-Av-Mino WHERE (No. Document=FIELD(No.),
                                                                              No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(17;"RDP/Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".RDP-Av-Mino WHERE (No. Document=FIELD(No.),
                                                                              No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(18;"Interêt / OB/ Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."INT /OC-Av-Mino" WHERE (No. Document=FIELD(No.),
                                                                                    No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(19;"Remise / OB /Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".REM/OC-Av-Mino WHERE (No. Document=FIELD(No.),
                                                                                 No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(21;"Total Obligation";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Total Obligation" WHERE (No. Document=FIELD(No.),
                                                                                     No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(45;"T.P/Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".T.P WHERE (No. Document=FIELD(No.),
                                                                      No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(46;"No. Series";Code[20])
        {
        }
        field(47;"Date Simulation";Date)
        {
        }
        field(48;"Taux change";Decimal)
        {
        }
        field(49;"Code devise";Code[10])
        {
        }
        field(50;"No. Fournisseur";Code[20])
        {
        }
        field(51;"Taux Achat à Terme";Decimal)
        {

            trigger OnValidate();
            begin
                CALCFIELDS("Mnt en EURO /SMino","Mnt en EURO / Mino");
                "Ecart sans mino 1" := ("Taux Achat à Terme"-"Taux change")*"Mnt en EURO /SMino";
                "Ecart avec mino 2" := ("Taux Achat à Terme"-"Taux change")*"Mnt en EURO / Mino";
            end;
        }
        field(53;"Mnt en EURO / Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Mnt en EURO Remisé" WHERE (No. Document=FIELD(No.),
                                                                                       No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(54;"Ecart sans mino 1";Decimal)
        {
        }
        field(55;"Ecart avec mino 2";Decimal)
        {
        }
        field(56;"Mnt TND /Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Mnt TND Remisé" WHERE (No. Document=FIELD(No.),
                                                                                   No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(57;"Taux Calc. Assurance";Decimal)
        {
            DecimalPlaces = 3:5;
        }
        field(58;"Mnt. D.Consomation/Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Droit de consommation-Av-Mino" WHERE (No. Document=FIELD(No.),
                                                                                                  No. Expédition=FIELD(No. Expédition)));
            Description = 'Droit de conso ou droit de douane';
            FieldClass = FlowField;
        }
        field(108;"Total DD/Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Total DD/Mino" WHERE (No. Document=FIELD(No.),
                                                                                  No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(109;"Total Obligation/Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Total Obligation/Mino" WHERE (No. Document=FIELD(No.),
                                                                                          No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(110;"ASSURANCE Sans-Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes".ASSURANCE WHERE (No. Document=FIELD(No.),
                                                                            No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(111;"MT à declarer /Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Valeur en Douane-Av-Mino" WHERE (No. Document=FIELD(No.),
                                                                                             No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(113;"Total Obligation/Comptant";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Total Obligation/Comptant" WHERE (No. Document=FIELD(No.),
                                                                                              No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        ParametrageAutomobile.GET;
        IF "No." = '' THEN
          NoSeriesMgt.InitSeries(ParametrageAutomobile."Souche Simulation",xRec."No. Series","Date Simulation","No.","No. Series");
    end;

    var
        Item : Record "27";
        ParametrageAutomobile : Record "70029";
        NoSeriesMgt : Codeunit "396";
}

