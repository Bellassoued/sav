table 50064 "Ligne Dossier D'import"
{
    // version ETRANGER


    fields
    {
        field(1;"Type Document";Option)
        {
            OptionCaption = '" ,Expédition,Assurance,Obligation"';
            OptionMembers = " ","Expédition",Assurance,Obligation;
        }
        field(2;"No. Document";Code[10])
        {
        }
        field(3;"No. Ligne";Integer)
        {
        }
        field(4;"No. Titre d'importation";Code[20])
        {
        }
        field(5;"No. Domicilaition";Code[30])
        {
        }
        field(6;"Ref. article";Code[20])
        {
            TableRelation = Item.No.;
        }
        field(7;"Désignation Article";Code[100])
        {
        }
        field(8;"Prix Unitaire";Decimal)
        {
        }
        field(9;"Prix Unitaire D.S";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(10;"Quantité";Decimal)
        {

            trigger OnValidate();
            begin
                /*"Montant Devise" := "Prix Unitaire" * Quantité;
                "Montant TND" := "Prix Unitaire D.S" * Quantité;
                IF Quantité > "Quantité Origine" THEN
                ERROR(Txt0001);
                 */

            end;
        }
        field(11;"Montant Devise";Decimal)
        {
        }
        field(12;"Ref. article Fournisseur";Code[30])
        {
        }
        field(13;"Montant TND";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(14;"Quantité Origine";Decimal)
        {
            Editable = false;

            trigger OnValidate();
            begin
                /*"Montant Devise" := "Prix Unitaire" * Quantité;
                "Montant TND" := "Prix Unitaire D.S" * Quantité;
                 */

            end;
        }
        field(15;"N° Expédition";Code[30])
        {
        }
    }

    keys
    {
        key(Key1;"Type Document","No. Document","No. Ligne")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Type Document","No. Document","No. Titre d'importation","No. Domicilaition")
        {
        }
    }

    var
        Txt0001 : Label 'La quantité expédié doit être inférieur à la quantité saisie dans le Titre';
}

