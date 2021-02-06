table 70002 "Archive Recvrment Entete"
{
    // version CT16V002

    CaptionML = ENU='Archived Header Recovery',
                FRA='Archive Recvrment Entete';
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
        field(6;"Date imprission";Date)
        {
            CaptionML = ENU='Printed Date',
                        FRA='Date Imprission';
            Editable = false;
        }
        field(7;"Nbre imprission";Integer)
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
        }
        field(9;"Nom coursier";Text[80])
        {
            CaptionML = ENU='steed Name',
                        FRA='Nom Coursier';
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
        RecArchiveRecvmentLine.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
        IF RecArchiveRecvmentLine.FINDSET THEN
          REPEAT
            RecArchiveRecvmentLine.DELETE(TRUE);
          UNTIL RecArchiveRecvmentLine.NEXT = 0 ;
    end;

    var
        RecArchiveRecvmentLine : Record "70003";

    local procedure FctInitRecord();
    begin
    end;
}

