table 50078 "Observations avarie"
{

    fields
    {
        field(1;"N° Constat avarie";Code[20])
        {
            CaptionML = ENU='N° Constat avarie',
                        FRA='N° Constat avarie';
            Editable = false;
        }
        field(2;"Num ligne";Integer)
        {
        }
        field(3;"Code Zone panne";Code[20])
        {
            TableRelation = "Fault Area";

            trigger OnValidate();
            begin
                FaultArea.RESET;
                IF FaultArea.GET("Code Zone panne") THEN
                "Description Zone":=FaultArea.Description;
                 IF "Num ligne"=0 THEN BEGIN
                   "Num ligne":= 10000;
                    Rec2 := Rec;
                    Rec2.RESET;
                    IF Rec2.FINDLAST THEN
                    BEGIN
                          "Num ligne" := Rec2."Num ligne" + 10000;
                    END;
                END;
            end;
        }
        field(4;"Code Symptome";Code[20])
        {
            TableRelation = "Symptom Code";

            trigger OnValidate();
            var
                RecCodeSymptome : Record "5916";
            begin
                IF RecCodeSymptome.GET("Code Symptome") THEN
                    "Description symptome":=RecCodeSymptome.Description;
            end;
        }
        field(5;"Description symptome";Text[50])
        {
        }
        field(6;Garantie;Boolean)
        {
            Description = 'SM MAZDA19';
        }
        field(7;"Description Zone";Text[50])
        {
            Description = 'SM';
        }
        field(50000;"Type Effet CLT";Option)
        {
            Description = 'NM181016';
            OptionCaption = 'EFFET CLIENT,LDT';
            OptionMembers = "EFFET CLIENT",LDT;
        }
        field(50001;ACCEPTE;Boolean)
        {
            Description = 'NM181016';
        }
        field(50002;"Nbre Heures Affecté";Decimal)
        {
            Description = 'SAV0045';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003;"Clôturés";Boolean)
        {
            Description = 'SAV0045';
        }
        field(50004;"Chef d'équipe";Code[10])
        {
            Description = 'SAV0045';
            TableRelation = "Resource Group";
        }
        field(50005;Copie;Boolean)
        {
        }
        field(50006;Statut;Option)
        {
            Description = 'KT Création,Demande Approbation,Approuvée,Refusée';
            OptionCaptionML = ENU=' ,Création,Demande Approbation,Approuvée,Refusée',
                              FRA=' ,Création,Demande Approbation,Approuvée,Refusée';
            OptionMembers = " ","Création","Demande Approbation","Approuvée","Refusée";
        }
        field(50007;"Date Décision";DateTime)
        {
            Description = 'Approbation/Refus';
            Editable = false;
        }
        field(50008;"Décision Prise Par";Code[50])
        {
            Editable = false;
        }
        field(50009;"Instruction No.";Code[20])
        {
            CaptionML = ENU='Instruction No.',
                        FRA='N° Instruction';
            TableRelation = Instruction.No.;

            trigger OnValidate();
            begin
                Instruction.RESET;
                Instruction.SETRANGE("No.","Instruction No.");
                IF Instruction.FINDFIRST THEN
                  "Instruction Description":=Instruction.Description;
            end;
        }
        field(50010;"Instruction Description";Text[50])
        {
            CaptionML = ENU='Instruction Description',
                        FRA='Désignation Instruction';
        }
        field(50011;"Complément";Boolean)
        {
            CaptionML = ENU='Complement',
                        FRA='Complément';
        }
        field(50012;"Date création";DateTime)
        {
            Editable = false;
        }
        field(50013;"Créé par";Code[50])
        {
            Editable = false;
        }
        field(50014;"Date Refus";DateTime)
        {
        }
        field(50015;"Moyen de communication";Option)
        {
            OptionMembers = " ","Téléphone",Fax,Email,SMS,"Présence sur place";
        }
        field(50016;VIN;Code[20])
        {
        }
        field(50017;"Degré de gravité";Decimal)
        {
        }
        field(50018;"Date de remise en état prévue";Date)
        {
        }
        field(50019;Traiter;Boolean)
        {
        }
        field(50020;"En cours de traitement";Boolean)
        {
            CalcFormula = Exist("Reception SAV" WHERE (VIN=FIELD(VIN),
                                                       Status SR=FILTER(<>Facturée)));
            FieldClass = FlowField;
        }
        field(50021;"Date de création";Date)
        {
        }
        field(50022;"Date de modification";DateTime)
        {
        }
    }

    keys
    {
        key(Key1;"N° Constat avarie","Num ligne")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
         "Num ligne":= 10000;
          Rec2 := Rec;
          Rec2.RESET;
          Rec2.SETRANGE("N° Constat avarie","N° Constat avarie");
          IF Rec2.FINDLAST THEN
          BEGIN
                "Num ligne" := Rec2."Num ligne" + 10000;
         END;
          /*
        RecReceptionSAV.GET("Reception No");
        IF(RecReceptionSAV."Status SR"<>RecReceptionSAV."Status SR"::"Fiche Crée") THEN
          ERROR(Text0001);
        */
        "Date de création":=TODAY;
        "Créé par":=USERID;

    end;

    var
        Rec2 : Record "50078";
        RecReceptionSAV : Record "60008";
        Instruction : Record "60070";
        FaultArea : Record "5915";
        UserSetup : Record "91";
}

