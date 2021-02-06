table 60011 "Nomenclature Service Rapide"
{
    // version SAV Automobile


    fields
    {
        field(1;"Item No.";Code[30])
        {
            CaptionML = ENU='Fréquences',
                        FRA='Code Entretient';
            Description = 'NM190419';
        }
        field(2;"Vehicule No.";Code[20])
        {
            CaptionML = ENU='Vehicule No.',
                        FRA='Modèle Vehicule';
        }
        field(3;"Kit No.";Code[30])
        {
            CaptionML = ENU='Kit No.',
                        FRA='Kit No.';
            Description = 'NM190419';
            TableRelation = "Rapid service BOM Header".No.;

            trigger OnValidate();
            begin
                RecBomHeader.GET("Kit No.");
                RecBomHeader.CALCFIELDS(Prix);
                "Prix estimatif" := RecBomHeader.Prix;
            end;
        }
        field(4;"Nbre de Km";Integer)
        {
        }
        field(5;"Prix estimatif";Decimal)
        {
            CalcFormula = Sum("Rapide service BOM Line".Prix WHERE (Rapid Service BOM No.=FIELD(Kit No.)));
            FieldClass = FlowField;
        }
        field(6;"Description modéle";Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'NM190419';
            Enabled = false;
        }
    }

    keys
    {
        key(Key1;"Item No.","Vehicule No.")
        {
        }
        key(Key2;"Nbre de Km")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RecItem : Record "27";
        RecBomHeader : Record "60013";
}

