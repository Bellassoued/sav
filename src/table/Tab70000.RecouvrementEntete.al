table 70000 "Recouvrement Entete"
{
    // version CT16V002

    CaptionML = ENU='Header Recovery',
                FRA='Entête Recouvrement';
    DrillDownPageID = 70002;
    LookupPageID = 70002;

    fields
    {
        field(1;"No. Bord. Recouvrement";Code[20])
        {
            CaptionML = ENU='No. Slip Cover',
                        FRA='No. Bordereau Recouvrement';
        }
        field(2;"Date Creation";Date)
        {
            CaptionML = ENU='Date Creation',
                        FRA='Date Création';
            Editable = false;
        }
        field(3;"Crée par";Code[50])
        {
            CaptionML = ENU='Created by',
                        FRA='Crée par';
            Editable = false;
        }
        field(4;"Date Modification";Date)
        {
            CaptionML = ENU='Modification Date',
                        FRA='Date Modification';
            Editable = false;
        }
        field(5;"Modifier par";Code[50])
        {
            CaptionML = ENU='Modified by',
                        FRA='Modifier Par';
            Editable = false;
        }
        field(6;"Date impression";Date)
        {
            CaptionML = ENU='Printed Date',
                        FRA='Date Imprission';
            Editable = false;
        }
        field(7;"Nbre impression";Integer)
        {
            CaptionML = ENU='Number of printed',
                        FRA='Nombre Imprission';
            Editable = false;
        }
        field(8;"Code coursier";Code[20])
        {
            CaptionML = ENU='Steed Code',
                        FRA='Code coursier';
            TableRelation = Employee;

            trigger OnValidate();
            begin
                TESTFIELD(Status,Status::Open);
                RecEmployee.GET("Code coursier");"Nom coursier":= RecEmployee."First Name" + RecEmployee."Last Name";
            end;
        }
        field(9;"Nom coursier";Text[80])
        {
            CaptionML = ENU='steed Name',
                        FRA='Nom Coursier';

            trigger OnValidate();
            begin
                TESTFIELD(Status,Status::Open);
            end;
        }
        field(10;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            Editable = false;
            OptionCaptionML = ENU='Open,Released',
                              FRA='Ouvert,Lancé';
            OptionMembers = Open,Released;
        }
        field(11;"Date Remis Coursier";Date)
        {
            CaptionML = ENU='Delivered Messenger Date',
                        FRA='Date Remis Coursier';

            trigger OnValidate();
            begin
                TESTFIELD(Status,Status::Open);
            end;
        }
        field(12;Etape;Option)
        {
            CaptionML = ENU='Steep',
                        FRA='Etape';
            Editable = false;
            OptionCaptionML = ENU=' ,In Progress, Closed, Archived',
                              FRA=' ,En Cours,Cloturer,Archiver',
                              FRB=' ,En Cours,Cloturer,Archiver';
            OptionMembers = " ","En Cours",Cloturer,Archiver;
        }
        field(13;"Code client";Code[20])
        {
            TableRelation = Customer.No.;

            trigger OnValidate();
            begin
                Customer.GET("Code client");
                "Nom client"  := Customer.Name;
            end;
        }
        field(14;"Souches de No";Code[20])
        {
        }
        field(15;"Nom client";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50000;"Type recouvrement";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Client,Recouvreur;
        }
        field(50001;Mois;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Janvier,"Février",Mars,Avril,Mai,Juin,Juillet,"Août",Septembre,Octobre,Novembre,"Décembre";
        }
        field(50002;"Année";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50003;"Commission proposée";Decimal)
        {
            CalcFormula = Sum("Recouvrement Line"."Commission calculée" WHERE (No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement),
                                                                               Commission payée=CONST(No),
                                                                               Commission à payer=CONST(Yes)));
            FieldClass = FlowField;
        }
        field(50004;"Commission payée";Decimal)
        {
            CalcFormula = Sum("Recouvrement Line"."Commission calculée" WHERE (No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement),
                                                                               Commission payée=CONST(Yes),
                                                                               Commission à payer=CONST(Yes)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. Bord. Recouvrement")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        RecRecouvrementLine.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
        IF RecRecouvrementLine.FINDSET THEN
          REPEAT
            RecRecouvrementLine.DELETE(TRUE);
          UNTIL RecRecouvrementLine.NEXT = 0 ;
    end;

    trigger OnInsert();
    begin
        /*
        IF "No. Bord. Recouvrement" = '' THEN BEGIN
          RecGeneralLedgerSetup.GET;
          RecGeneralLedgerSetup.TESTFIELD("Recouvrement Nos.");
          NoSeriesMgt.InitSeries(RecGeneralLedgerSetup."Recouvrement Nos.",RecGeneralLedgerSetup."Recouvrement Nos.",WORKDATE,"No. Bord. Recouvrement",RecGeneralLedgerSetup."Recouvrement Nos.");
        END;
        
        */
        
        
        IF "No. Bord. Recouvrement" = '' THEN
        BEGIN
          RecGeneralLedgerSetup.GET;
          RecGeneralLedgerSetup.TESTFIELD("Recouvrement Nos.");
          NoSeriesMgt.InitSeries(RecGeneralLedgerSetup."Recouvrement Nos.",xRec."Souches de No",WORKDATE,"No. Bord. Recouvrement","Souches de No");
        END;
        
        
        
        
        FctInitRecord;

    end;

    trigger OnModify();
    begin
        "Date Modification" := WORKDATE;
        "Modifier par" := USERID;
    end;

    var
        RecGeneralLedgerSetup : Record "98";
        NoSeriesMgt : Codeunit "396";
        RecEmployee : Record "5200";
        RecRecouvrementLine : Record "70001";
        Customer : Record "18";

    local procedure FctInitRecord();
    begin
        "Date Creation" := WORKDATE;
        "Crée par" := USERID;
    end;
}

