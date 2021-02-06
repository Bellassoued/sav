table 60055 "Entête Règle Répartion Ana."
{
    // version DM V1

    DrillDownPageID = 50084;
    LookupPageID = 50084;

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Désignation";Text[50])
        {
        }
        field(3;Statut;Option)
        {
            OptionCaption = 'En Attente,Validé';
            OptionMembers = "En Attente","Validé";

            trigger OnValidate();
            begin
                IF Statut = Statut::Validé THEN BEGIN
                  RecLigneRepartion.RESET;
                  RecLigneRepartion.SETRANGE(Code,Code);
                  IF RecLigneRepartion.ISEMPTY THEN
                    ERROR(TXT50000);

                  RecLigneRepartion.SETRANGE(Percent,0);
                  IF NOT RecLigneRepartion.ISEMPTY THEN
                    ERROR(TXT50001);
                  RecLigneRepartion.SETRANGE(Percent);

                  RecLigneRepartion.SETFILTER("Dimension Code",'''''');
                  IF NOT RecLigneRepartion.ISEMPTY THEN
                    ERROR(TXT50003);
                  RecLigneRepartion.SETRANGE("Dimension Code");

                  RecLigneRepartion.SETFILTER("Dimension Value Code",'''''');
                  IF NOT RecLigneRepartion.ISEMPTY THEN
                    ERROR(TXT50004);
                  RecLigneRepartion.SETRANGE("Dimension Value Code");


                  IF RecLigneRepartion.FINDSET THEN
                    REPEAT
                      RecLigneRepartion2.RESET;
                      RecLigneRepartion2.SETRANGE(Code,Code);
                      RecLigneRepartion2.SETRANGE("Dimension Code",RecLigneRepartion."Dimension Code");
                      RecLigneRepartion2.CALCSUMS(Percent);
                      IF RecLigneRepartion2.Percent <> 100 THEN
                        ERROR(TXT50002,RecLigneRepartion."Dimension Code");

                      RecLigneRepartion2.SETRANGE("Dimension Value Code",RecLigneRepartion."Dimension Value Code");
                      IF RecLigneRepartion2.COUNT > 1 THEN
                        ERROR(TXT50005,RecLigneRepartion."Dimension Value Code");
                    UNTIL RecLigneRepartion.NEXT = 0;
                END;
            end;
        }
        field(4;"Date Création";DateTime)
        {
        }
        field(5;"Créer Par";Code[50])
        {
        }
        field(6;"Date Modification";DateTime)
        {
        }
        field(7;"Modifié Par";Code[50])
        {
        }
        field(8;"Axes Principal 1";Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(9;"Type Répartition";Option)
        {
            OptionCaption = '" ,Petite dépense,Comptabilité"';
            OptionMembers = " ","Petite dépense","Comptabilité";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        RecLigneRepartition : Record "60056";
    begin
        RecLigneRepartition.RESET;
        RecLigneRepartition.SETRANGE(Code,Code);
        IF NOT RecLigneRepartition.ISEMPTY THEN
          RecLigneRepartition.DELETEALL;

        //TODO
        //parcourir table affectation par par défaut
    end;

    var
        RecLigneRepartion : Record "60056";
        RecLigneRepartion2 : Record "60056";
        TXT50000 : Label 'Aucune Ligne n''existe.';
        TXT50001 : Label 'Une ligne répartition avec poucentage 0.';
        TXT50002 : Label 'Somme des pourcentages de l''axe %1 différent de 100.';
        TXT50003 : Label 'Ligne Avec Code axes Vide.';
        TXT50004 : Label 'Ligne Avec Code section Vide.';
        TXT50005 : Label 'Code Section %  insérer plusieurs fois';
}

