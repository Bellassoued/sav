table 60012 "Ligne Reception Grand Service"
{
    // version MAZDA19

    DrillDownPageID = 60064;
    LookupPageID = 60064;

    fields
    {
        field(1;"Reception No";Code[20])
        {
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
            FieldClass = Normal;
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
            CalcFormula = Sum("Service Order Allocation"."Allocated Hours" WHERE (Réception No.=FIELD(Reception No),
                                                                                  Line No.=FIELD(Num ligne)));
            Description = 'SAV0045';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003;"Clôturés";Boolean)
        {
            Description = 'SAV0045';
        }
        field(50004;"Chef d'équipe";Code[20])
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
            CalcFormula = Lookup("Reception SAV".VIN WHERE (Reception No=FIELD(Reception No)));
            Description = 'NM170619';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Reception No","Num ligne")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code Symptome","Description symptome","Chef d'équipe")
        {
        }
    }

    trigger OnDelete();
    begin
        //<<----NM--051216--SAV-----
         /*RecReceptionSAV.GET("Reception No");
        IF(RecReceptionSAV."Status SR"<>RecReceptionSAV."Status SR"::"Fiche Crée") THEN
          ERROR(Text0002);*/
        //>>----NM--051216--SAV-----
        //KT 14032017 SAV
        UserSetup.GET(USERID);
        IF NOT UserSetup."Supprime ligne effet client" THEN
        ERROR(Text0003);

    end;

    trigger OnInsert();
    begin
         "Num ligne":= 10000;
          Rec2 := Rec;
          Rec2.SETRECFILTER;
          IF Rec2.FINDLAST() THEN
          BEGIN
              Rec2.SETRANGE("Num ligne");
              IF Rec2.FINDLAST THEN
              BEGIN
                "Num ligne" := Rec2."Num ligne" + 10000;
        
              END;
          END;
          /*
        RecReceptionSAV.GET("Reception No");
        IF(RecReceptionSAV."Status SR"<>RecReceptionSAV."Status SR"::"Fiche Crée") THEN
          ERROR(Text0001);
        */
        "Date création":=CURRENTDATETIME;
        "Créé par":=USERID;

    end;

    trigger OnModify();
    begin
        //<<----NM--051216--SAV-----
        /*kt 04032017 Temp
        RecReceptionSAV.GET("Reception No");
        IF(RecReceptionSAV."Status SR"<>RecReceptionSAV."Status SR"::"Fiche Crée") THEN
          ERROR(Text0001);
          */
        //>>----NM--051216--SAV-----

    end;

    var
        Rec2 : Record "60012";
        RecReceptionSAV : Record "60008";
        Text0001 : Label 'Impossible de modifier les symptômes!!!!';
        Text0002 : Label 'Impossible de supprimer les symptômes';
        Instruction : Record "60070";
        FaultArea : Record "5915";
        UserSetup : Record "91";
        Text0003 : Label 'Vous n''êtes pas autorisé à supprimer des lignes d''effet client';
}

