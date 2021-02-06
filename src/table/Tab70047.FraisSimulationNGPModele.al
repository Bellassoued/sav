table 70047 "Frais Simulation - NGP/Modele"
{

    fields
    {
        field(1;"Item No.";Code[20])
        {
            TableRelation = Item WHERE (Base Unit of Measure=FILTER(VEH));

            trigger OnValidate();
            begin
                CLEAR(Item);
                Item.GET("Item No.");
                NGP := Item."Code NGP";
                Désignation := Item.Description;
                CLEAR(FicheTechnique);
                FicheTechnique.GET("Item No.");
                Modele := FicheTechnique."Model Code";
                Marque := FicheTechnique."Make Code";
            end;
        }
        field(2;"Désignation";Code[100])
        {
        }
        field(3;NGP;Code[50])
        {
            TableRelation = "Code NGP";
        }
        field(4;Marque;Code[20])
        {
        }
        field(5;"Port de provenance";Code[50])
        {
            TableRelation = "Origine d'embarquement";
        }
        field(6;"Mnt FRET";Decimal)
        {
        }
        field(7;"Frais Avis";Decimal)
        {
        }
        field(8;ISPS;Decimal)
        {
        }
        field(9;"Frais Débarquement";Decimal)
        {
        }
        field(10;"% HAM F-Débarq.(10%)";Decimal)
        {
        }
        field(11;Modele;Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Item No.",NGP,"Port de provenance")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Item : Record "27";
        FicheTechnique : Record "50032";
}

