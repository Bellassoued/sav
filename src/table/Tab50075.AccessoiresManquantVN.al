table 50075 "Accessoires Manquant VN"
{
    // version Acc VN manquant


    fields
    {
        field(1;"N°Seq";Integer)
        {
        }
        field(2;"N°BLIV";Code[20])
        {
        }
        field(3;VIN;Code[20])
        {
        }
        field(4;Ref;Code[20])
        {
        }
        field(5;Designation;Text[50])
        {
        }
        field(6;"Quantité";Decimal)
        {
        }
        field(7;"Livrée";Boolean)
        {
        }
        field(8;"Date B_Livraison";Date)
        {
        }
        field(9;"Campaign No.";Code[20])
        {
        }
        field(10;"Sélectionné";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Ordre de préparation VN";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Facturé";Boolean)
        {
            CalcFormula = Exist("Service Invoice Header" WHERE (Reception No=FIELD(Ordre de préparation VN),
                                                                Type Reception=CONST(VN)));
            FieldClass = FlowField;
        }
        field(13;"N° facture";Code[20])
        {
            CalcFormula = Lookup("Service Invoice Header".No. WHERE (Reception No=FIELD(Ordre de préparation VN),
                                                                     Type Reception=CONST(VN)));
            FieldClass = FlowField;
        }
        field(14;"Date facture";Date)
        {
            CalcFormula = Lookup("Service Invoice Header"."Posting Date" WHERE (Reception No=FIELD(Ordre de préparation VN),
                                                                                Type Reception=CONST(VN)));
            FieldClass = FlowField;
        }
        field(15;"Date rendez-vous";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"N°Seq","N°BLIV",VIN)
        {
        }
    }

    fieldgroups
    {
    }
}

