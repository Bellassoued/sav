table 60051 "Hiérarchie Pièce"
{
    DrillDownPageID = 50072;
    LookupPageID = 50072;

    fields
    {
        field(1;"Item Category Code";Code[10])
        {
            Caption = 'Code catégorie article';
            TableRelation = "Item Category";
        }
        field(2;"Product Group Code";Code[10])
        {
            Caption = 'Code groupe produits';
            TableRelation = "Product Group".Code WHERE (Item Category Code=FIELD(Item Category Code));
        }
        field(3;"Item Family";Code[30])
        {
            Caption = 'Famille Article';
        }
        field(4;"Model Code";Text[50])
        {
            Caption = 'Code Modèle';
        }
    }

    keys
    {
        key(Key1;"Item Category Code","Product Group Code","Item Family","Model Code")
        {
        }
    }

    fieldgroups
    {
    }
}

