table 60041 "Entete regle repartition"
{
    // version RAD

    DrillDownPageID = 60167;
    LookupPageID = 60167;

    fields
    {
        field(1;"Code Règle";Code[20])
        {
        }
        field(2;"Désignation";Text[50])
        {
        }
        field(3;"Code Axes";Code[20])
        {
            TableRelation = Dimension.Code;
        }
        field(4;Statut;Option)
        {
            OptionCaption = 'En Attente,Validé';
            OptionMembers = "En Attente","Validé";

            trigger OnValidate();
            begin

                IF Statut = Statut::Validé THEN
                  BEGIN
                  RecGLigneRegle.SETRANGE(RecGLigneRegle."Code Règle","Code Règle");
                  RecGLigneRegle.SETRANGE(RecGLigneRegle."Code Axe","Code Axes");
                  RecGLigneRegle.CALCSUMS(RecGLigneRegle.Pourcentage);
                  IF RecGLigneRegle.Pourcentage <> 100 THEN
                    ERROR(CSTTXT001);

                  END
            end;
        }
        field(5;Niveau;Option)
        {
            OptionCaption = 'Centre de Gestion,Activité,Centre de Coût';
            OptionMembers = Primaire,Secondaire,"troisième";

            trigger OnValidate();
            begin

                TESTFIELD(Statut,Statut::"En Attente");
            end;
        }
        field(6;"Date Création";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Code Règle")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin

        IF "Code Règle" = '' THEN BEGIN
          PurchaseSetup.GET;
          PurchaseSetup.TESTFIELD(PurchaseSetup."Souche Regle repartition");
          NoSeriesMgt.InitSeries(PurchaseSetup."Souche Regle repartition",PurchaseSetup."Souche Regle repartition",0D,"Code Règle",PurchaseSetup."Souche Regle repartition");
        END;

        "Date Création" := WORKDATE;
    end;

    trigger OnModify();
    begin

        //TESTFIELD(Statut,Statut::"En Attente");
    end;

    var
        PurchaseSetup : Record "312";
        NoSeriesMgt : Codeunit "396";
        RecGLigneRegle : Record "60042";
        CSTTXT001 : Label 'Vous ne pouvez pas valider Cette règle, le total n''est pas égale à 100%';
}

