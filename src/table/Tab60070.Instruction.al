table 60070 "Instruction"
{
    DrillDownPageID = 60194;
    LookupPageID = 60194;

    fields
    {
        field(1;"Make Code";Code[10])
        {
            CaptionML = ENU='Maker Code',
                        FRA='Code Marque';
            TableRelation = Manufacturer.Code WHERE (Code=FIELD(Make Code));
        }
        field(2;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
        }
        field(21;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(22;"Search Description";Code[30])
        {
            CaptionML = ENU='Search Description',
                        FRA='Désignation Recherche';
        }
        field(23;"Description 2";Text[50])
        {
            CaptionML = ENU='Description 2',
                        FRA='Désignation 2';
        }
        field(24;"Main Group Code";Code[10])
        {
            CaptionML = ENU='Main Group Code',
                        FRA='Code Groupe Principal';
        }
        field(25;"Subgroup Code";Code[10])
        {
            CaptionML = ENU='Subgroup Code',
                        FRA='Code Sous-Groupe';
        }
        field(26;"Line Group Code";Code[10])
        {
            CaptionML = ENU='Line Group Code',
                        FRA='Code Groupe Ligne';
        }
        field(27;"Scheduled Time";Decimal)
        {
            CaptionML = ENU='Scheduled Time',
                        FRA='Heure Planifiée';
        }
        field(28;"Make Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Make Unit of Measure Code',
                        FRA='Code Unité de Mesure Marque';
        }
        field(29;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souche de N°';
            TableRelation = "No. Series";
        }
        field(30;"Labor No.";Code[20])
        {
            CaptionML = ENU='Labor No.',
                        FRA='N° Main d''Oeuvre';
        }
        field(31;"Package No.";Code[20])
        {
            CaptionML = ENU='Package No.',
                        FRA='N° Paquet';
        }
        field(32;"Package Version No.";Integer)
        {
            CaptionML = ENU='Package Version No.',
                        FRA='N° Version Paquet';
        }
        field(33;"Serv. Qualification Code";Code[20])
        {
            CaptionML = ENU='Serv. Qualification Code',
                        FRA='Code Qualification Atelier';
        }
        field(34;"Instruction Type";Option)
        {
            CaptionML = ENU='Instruction Type',
                        FRA='Type Instruction';
            OptionCaptionML = ENU=' ,Reception,Mobility,Hand-Over',
                              FRA=' ,Réception,Mobilité,Hand-Over';
            OptionMembers = " ",Reception,Mobility,"Hand-Over";
        }
        field(35;"Required Capacity";Decimal)
        {
            CaptionML = ENU='Required Capacity',
                        FRA='Capacité Nécessaire';
        }
        field(36;"Mobility Resource Type";Option)
        {
            CaptionML = ENU='Mobility Resource Type',
                        FRA='Type Ressource Mobilité';
            OptionCaptionML = ENU=' ,Person,Vehicle',
                              FRA=' ,Personne,Véhicule';
            OptionMembers = " ",Person,Vehicle;
        }
        field(37;"Labor Make Code";Code[10])
        {
            CaptionML = ENU='Labor MAke Code',
                        FRA='Code Main d''Oeuvre Marque';
        }
        field(38;"Package Make Code";Code[10])
        {
            CaptionML = ENU='Package Make Code',
                        FRA='Code Paquet Marque';
        }
        field(39;"Schedule Order Time Completely";Boolean)
        {
            CaptionML = ENU='Schedule Order Time Completely',
                        FRA='Planifier Heure Cde Complètement';
        }
        field(40;"Task Type Code";Code[10])
        {
            CaptionML = ENU='Task Type Code',
                        FRA='Code Type Tâche';
        }
    }

    keys
    {
        key(Key1;"Make Code","No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        IF "No." = '' THEN BEGIN
          ServiceMgtSetup.GET;
          ServiceMgtSetup.TESTFIELD("Instruction Nos.");
          NoSeriesManagement.InitSeries(ServiceMgtSetup."Instruction Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;
    end;

    var
        ServiceMgtSetup : Record "5911";
        NoSeriesManagement : Codeunit "396";
}

