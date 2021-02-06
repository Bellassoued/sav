table 60097 "Entête planning Intervention-"
{
    // version Gestion RDV


    fields
    {
        field(1;"No. Planning";Code[20])
        {
        }
        field(2;"Désignation";Text[100])
        {
        }
        field(3;Date;Date)
        {
        }
        field(4;"Créer par";Code[50])
        {
        }
        field(5;"Temps  de création";Time)
        {
        }
        field(6;Technicien;Code[20])
        {
            TableRelation = Resource.No.;

            trigger OnValidate();
            begin
                IF Technicien  <> '' THEN BEGIN
                  CLEAR(Mecaniciens);
                  Mecaniciens.GET(Technicien);
                  "Nom Technicien" := Mecaniciens.Name;
                END
                ELSE
                  "Nom Technicien" := '';
            end;
        }
        field(7;"Nom Technicien";Code[50])
        {
        }
        field(8;"Technicien 2";Code[20])
        {
            TableRelation = Resource.No.;

            trigger OnValidate();
            begin
                IF "Technicien 2"  <> '' THEN BEGIN
                  CLEAR(Mecaniciens);
                  Mecaniciens.GET("Technicien 2");
                  "Nom Technicien 2" := Mecaniciens.Name;
                END
                ELSE
                  "Nom Technicien 2" := '';
            end;
        }
        field(9;"Nom Technicien 2";Code[50])
        {
        }
        field(10;Statut;Option)
        {
            OptionCaption = 'Lancé,Clôturé';
            OptionMembers = "Lancé","Clôturé";
        }
        field(11;"No. série";Code[20])
        {
        }
        field(12;Vehicule;Code[20])
        {
            TableRelation = "Transport Method".Code;
        }
    }

    keys
    {
        key(Key1;"No. Planning")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        IF  Rec."No. Planning" = '' THEN BEGIN
        ParamètreSAV.GET;
          NoSeriesMgt.InitSeries(ParamètreSAV."Souche Réception Client",xRec."No. série",WORKDATE,"No. Planning","No. série");
        END;
         Date    := WORKDATE;
        "Créer par"    := USERID;
        "Temps  de création" := TIME;
    end;

    var
        "ParamètreSAV" : Record "5911";
        NoSeriesMgt : Codeunit "396";
        Mecaniciens : Record "156";
}

