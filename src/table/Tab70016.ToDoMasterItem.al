table 70016 "To - Do Master Item"
{

    fields
    {
        field(1;"Enty No.";Integer)
        {
        }
        field(2;"No. Document ADDIN";Code[20])
        {
        }
        field(3;"No. Document CDR";Code[20])
        {
        }
        field(4;"Date Creation";Date)
        {
        }
        field(5;Description;Text[100])
        {
        }
        field(6;"Wizard Step";Option)
        {
            CaptionML = ENU='Wizard Step',
                        FRA='Étape Assistant';
            Editable = true;
            OptionCaptionML = ENU=' ,1,2,3,4,5,6,7',
                              FRA=' ,1,2,3,4,5,6,7';
            OptionMembers = " ","1","2","3","4","5","6","7";
        }
        field(7;"No. Master Item";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
        }
        field(8;"DirectoryPath ADDIN";Text[250])
        {
        }
        field(9;"DirectoryPath CDR";Text[250])
        {
        }
        field(10;"Import Article Master";Text[250])
        {
        }
        field(11;"Update Item Sales Price";Text[250])
        {
        }
        field(12;"Staut Step";Option)
        {
            OptionCaptionML = ENU=' ,Début,Import ADDIN,Import CDR,Import Pre Master,Import Master,Terminé',
                              FRA=' ,Début,Import ADDIN,Import CDR,Import Pre Master,Import Master,Terminé';
            OptionMembers = " ","Début","Import ADDIN","Import CDR","Import Pre Master","Import Master","Terminé";
        }
        field(13;"Import Article Pre Master";Text[250])
        {
        }
        field(14;"Consulter Pre Master";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Enty No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Text50000 : TextConst ENU='You must fill in the %1 field.',FRA='Vous devez renseigner le champ %1.';

    procedure StartWizard();
    var
        RecToDoMasterItem : Record "70016";
    begin
        "Date Creation" := WORKDATE;
        "Wizard Step" := "Wizard Step"::"1";

        INSERT;
        PAGE.RUNMODAL(PAGE::"To - Do Master Item",Rec);
    end;

    procedure PerformNextWizardStatus();
    var
        Cont : Record "5050";
    begin
        "Wizard Step" := "Wizard Step" + 1;

        IF "Wizard Step" = "Wizard Step"::"2" THEN BEGIN
        END;
        IF "Wizard Step" = "Wizard Step"::"3" THEN BEGIN
          "Wizard Step" := "Wizard Step" + 2;
        END;
    end;

    procedure PerformPrevWizardStatus();
    begin
        "Wizard Step" := "Wizard Step" - 1;
    end;

    procedure CheckStatus();
    begin
        CASE "Wizard Step" OF
          "Wizard Step"::"1":
            BEGIN
              IF "Date Creation" = 0D THEN
                ErrorMessage(FIELDCAPTION("Date Creation"));
              IF Description = '' THEN
                ErrorMessage(FIELDCAPTION(Description));
            END;
          "Wizard Step"::"2":
            BEGIN
              IF "DirectoryPath ADDIN" = '' THEN
                ErrorMessage(FIELDCAPTION("DirectoryPath ADDIN"));
            END;
          /*
          "Wizard Step"::"3":
            BEGIN
              IF "DirectoryPath CDR" = '' THEN
                ErrorMessage(FIELDCAPTION("DirectoryPath CDR"));
            END;
            */
        END;

    end;

    procedure FinishWizard() : Boolean;
    var
        ActivateFirstStage : Boolean;
    begin
        InsertTodoMasteritem(Rec);
        //DELETE;
    end;

    local procedure ErrorMessage(FieldName : Text[1024]);
    begin
        ERROR(Text50000,FieldName);
    end;

    local procedure InsertTodoMasteritem(PRecToDoMasterItem : Record "70016");
    var
        RecToDoMasterItem : Record "70016";
    begin
        RecToDoMasterItem.INIT;
        RecToDoMasterItem."Enty No.":=GetLastEntry+1;
        RecToDoMasterItem."DirectoryPath ADDIN":=PRecToDoMasterItem."DirectoryPath ADDIN";
        RecToDoMasterItem."DirectoryPath CDR":=PRecToDoMasterItem."DirectoryPath CDR";
        RecToDoMasterItem."Import Article Master":=PRecToDoMasterItem."Import Article Master";
        RecToDoMasterItem."Update Item Sales Price":=PRecToDoMasterItem."Update Item Sales Price";
        RecToDoMasterItem."Wizard Step" :=PRecToDoMasterItem."Wizard Step" ;
        RecToDoMasterItem."Date Creation":=PRecToDoMasterItem."Date Creation";
        CASE PRecToDoMasterItem."Wizard Step" OF
          PRecToDoMasterItem."Wizard Step"::"1":
            BEGIN
                RecToDoMasterItem."Staut Step":=RecToDoMasterItem."Staut Step"::Début;
            END;
          PRecToDoMasterItem."Wizard Step"::"2":
            BEGIN
                RecToDoMasterItem."Staut Step":=RecToDoMasterItem."Staut Step"::"Import ADDIN";
            END;
          /*
          PRecToDoMasterItem."Wizard Step"::"3":
            BEGIN
                RecToDoMasterItem."Staut Step":=RecToDoMasterItem."Staut Step"::"Import CDR";
            END;
            */
              PRecToDoMasterItem."Wizard Step"::"4":
            BEGIN
                RecToDoMasterItem."Staut Step":=RecToDoMasterItem."Staut Step"::"Import Pre Master";
            END;
              PRecToDoMasterItem."Wizard Step"::"5":
            BEGIN
                RecToDoMasterItem."Staut Step":=RecToDoMasterItem."Staut Step"::"Import Master";
            END;
                PRecToDoMasterItem."Wizard Step"::"6":
            BEGIN
                RecToDoMasterItem."Staut Step":=RecToDoMasterItem."Staut Step"::Terminé;
            END;
        
        END;
        //RecToDoMasterItem."Staut Step":=PRecToDoMasterItem."Staut Step";
        RecToDoMasterItem.Description:=PRecToDoMasterItem.Description;
        RecToDoMasterItem.INSERT;

    end;

    local procedure GetLastEntry() : Integer;
    var
        RecToDoMasterItem : Record "70016";
    begin
        RecToDoMasterItem.RESET;
        IF RecToDoMasterItem.FINDLAST THEN
           EXIT(RecToDoMasterItem."Enty No.")
          ELSE
              EXIT(0);
    end;
}

