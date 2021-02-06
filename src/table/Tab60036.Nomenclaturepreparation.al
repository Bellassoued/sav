table 60036 "Nomenclature preparation"
{
    // version MAZDA301,MAZDA456


    fields
    {
        field(1;"Code Article";Code[20])
        {
            Caption = 'N° Articles';
            TableRelation = Item;
        }
        field(2;"Code Operation";Code[20])
        {
            Caption = 'Code opération';
            TableRelation = IF (Type Opération=CONST(Cost)) "Service Cost"
                            ELSE IF (Type Opération=CONST(Item)) Item
                            ELSE IF (Type Opération=CONST(Resource)) Resource;
        }
        field(3;Quantity;Decimal)
        {
            Caption = 'Quantités';
        }
        field(4;"Service Type";Option)
        {
            Caption = 'Type opération';
            OptionMembers = "Préparation",Livraison;
        }
        field(5;"Type Opération";Option)
        {
            OptionCaption = 'MO,Article,Sous-traitance';
            OptionMembers = Cost,Item,Resource;
        }
    }

    keys
    {
        key(Key1;"Code Article","Type Opération","Code Operation")
        {
        }
    }

    fieldgroups
    {
    }
}

