table 50119 "Paramètres et Valuers Recap"
{
    // version DELTASOFT- MT DecEmp

    // // DELTA 01 MC (23/02/2015) : Mises à jour déclaration employeur 2014


    fields
    {
        field(10;"Code Ligne Recap";Code[10])
        {
        }
        field(11;"Code Retenue à la source";Code[10])
        {
            NotBlank = true;
        }
        field(12;"Type Source";Option)
        {
            OptionMembers = " ","Non Résident physique","Non Résident Morale","Résident Morale","Résident Physique","Régime réel";
        }
        field(13;Designation;Text[250])
        {
        }
        field(14;"Total Assiette";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(15;"% Retenue Opérée";Decimal)
        {
        }
        field(16;"Total Retenues Opérées";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(17;Quittance_Date;Date)
        {
            Description = 'Pour l''état des quittances';
        }
        field(18;Quittance_Num;Code[50])
        {
            Description = 'Pour l''état des quittances';
        }
        field(19;Quittance_AdminFiscale;Code[50])
        {
            Description = 'Pour l''état des quittances';
        }
        field(20;FRNSNNPAI_CodeFrns;Code[20])
        {
            Description = 'Pour ajouter les fournisseurs non payés aux annexes';
            TableRelation = Vendor;
        }
        field(21;FRNSNNPAI_CodeRet;Code[10])
        {
            Description = 'Pour ajouter les fournisseurs non payés aux annexes';
            TableRelation = "Groupe Retenue".Code WHERE (Activé=FILTER(Yes));
        }
        field(22;"Total Montant RCGC";Decimal)
        {
            Description = 'DECEMP2014';
        }
        field(23;"Totat Montant Contri. conj.";Decimal)
        {
            Description = 'DECEMP2014';
        }
        field(24;"Tot.Mont. Base Ret. Autre";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'DeltaSoft Achour 08/02/2016';
        }
        field(25;"Tot.Mont. Ret.Autre";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'DeltaSoft Achour 08/02/2016';
        }
        field(26;"RS DVD";Boolean)
        {
        }
        field(27;"Tota. C.S.P";Decimal)
        {
            Description = 'SBS';
        }
    }

    keys
    {
        key(Key1;"Code Ligne Recap","Type Source","Code Retenue à la source")
        {
            SumIndexFields = "Total Retenues Opérées","Total Assiette";
        }
    }

    fieldgroups
    {
    }
}

