table 70046 "Paramètre Simulation NGP"
{

    fields
    {
        field(1;"Code NGP";Code[20])
        {
            TableRelation = "Code NGP";
        }
        field(2;"Désignation";Text[250])
        {
        }
        field(3;"Taux Droit Douane";Decimal)
        {
        }
        field(4;"Taux D. Conso";Decimal)
        {
        }
        field(5;"Taux Fodec";Decimal)
        {
        }
        field(6;"Taux TVA";Decimal)
        {
        }
        field(7;"Taux RDP";Decimal)
        {
        }
        field(8;Assurance;Decimal)
        {
            DecimalPlaces = 3:5;
        }
        field(9;"Taux DC";Decimal)
        {

            trigger OnValidate();
            begin
                "Taux ASS DD" := ("Taux DC" * 0.035)/100;
                VALIDATE("Risque de guerre");
            end;
        }
        field(10;"Taux ASS DD";Decimal)
        {
            DecimalPlaces = 3:10;
            Editable = false;
        }
        field(11;"Risque de guerre";Decimal)
        {
            DecimalPlaces = 3:5;

            trigger OnValidate();
            begin

                VALIDATE(Taxe,(Assurance + "Taux ASS DD" + "Risque de guerre" )*0.05);
                VALIDATE(Taxe);
            end;
        }
        field(12;"Frais Quittance Taxé";Decimal)
        {
        }
        field(13;Taxe;Decimal)
        {
            DecimalPlaces = 3:10;

            trigger OnValidate();
            begin
                "Total Assurance" :=  Taxe + Assurance + "Taux ASS DD" + "Risque de guerre" ;//+ "Frais Fixe";
            end;
        }
        field(14;"Taux Frais Fixe";Decimal)
        {
        }
        field(15;"Total Assurance";Decimal)
        {
            DecimalPlaces = 3:10;
            Editable = false;
        }
        field(16;CARB_VN;Decimal)
        {
        }
        field(17;FR_HOMOLOG;Decimal)
        {
        }
        field(18;GARD_VN;Decimal)
        {
        }
        field(19;HON_VN;Decimal)
        {
        }
        field(20;MAG_VN;Decimal)
        {
        }
        field(21;PENAL_VN;Decimal)
        {
        }
        field(22;TRANSIT_VN;Decimal)
        {
        }
        field(23;TRANSP_VN;Decimal)
        {
        }
        field(24;Convoyage;Decimal)
        {
        }
        field(25;"% interêt / Obligation";Decimal)
        {
        }
        field(26;"Période Obligation";Integer)
        {
        }
        field(27;"% remise / Obligation";Decimal)
        {
        }
        field(28;"Type VN";Option)
        {
            OptionMembers = " ",VP,VU,Mixte,Taxi;
        }
        field(29;"Code article";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item.No.;

            trigger OnValidate();
            begin
                CLEAR(Item);
                Item.GET("Code article");
                "Désignation article" := Item.Description;
            end;
        }
        field(30;"Désignation article";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Mnt Frais de transit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code article","Code NGP")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Item : Record "27";
}

