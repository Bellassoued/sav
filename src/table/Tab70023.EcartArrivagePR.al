table 70023 "Ecart Arrivage PR"
{
    DrillDownPageID = 70057;
    LookupPageID = 70057;

    fields
    {
        field(1;"entry No.";Integer)
        {
        }
        field(2;"No. Arrivage PR";Code[20])
        {
        }
        field(3;"Item No";Code[20])
        {
        }
        field(4;"Qty Ecrat";Decimal)
        {
        }
        field(5;Statut;Option)
        {
            OptionCaptionML = ENU=' ,Créer Transfert,Créer Commande Achat,Ignorer Écart',
                              FRA=' ,Créer Transfert,Créer Commande Achat,Ignorer Écart';
            OptionMembers = " ","Créer Transfert","Créer Commande Achat","Ignorer Écart";
        }
        field(6;Designation;Text[30])
        {
        }
        field(7;"No. Commande";Code[20])
        {
        }
        field(8;"No. Dossier Import";Code[20])
        {
        }
        field(9;Traiter;Boolean)
        {
        }
        field(10;"Qty Traiter";Decimal)
        {
        }
        field(11;"A Traiter";Boolean)
        {
        }
        field(12;"Qty Théorique";Decimal)
        {
        }
        field(13;"Qty Physique";Decimal)
        {

            trigger OnValidate();
            begin
                //IF "Qty Physique" <> 0 THEN
                //  BEGIN

                    "Qty Ecrat" := "Qty Physique" - "Qty Théorique";
                     IF "Qty Ecrat"  = 0 THEN
                          Statut := Statut::" ";
                      IF "Qty Ecrat"  < 0 THEN
                          Statut := Statut::"Créer Transfert";
                      IF "Qty Ecrat"  > 0 THEN
                          Statut := Statut::"Créer Commande Achat";

                //  END;
            end;
        }
        field(14;"No. Colis";Code[20])
        {
        }
        field(15;"No. Facture";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"entry No.","No. Dossier Import")
        {
        }
    }

    fieldgroups
    {
    }
}

