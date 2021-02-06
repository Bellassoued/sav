table 50076 "List VIN Compagne"
{
    // version SAVCompagne

    DrillDownPageID = 70285;
    LookupPageID = 70285;

    fields
    {
        field(1;VIN;Code[20])
        {

            trigger OnValidate();
            begin
                WarehouseEntry.RESET;
                ServiceItem.RESET;
                ServiceItem.SETRANGE("Serial No.",VIN);
                IF ServiceItem.FINDFIRST THEN;
                IF ServiceItem."Préparation/Livraison"<>ServiceItem."Préparation/Livraison"::Livrer THEN BEGIN
                  WarehouseEntry.SETRANGE("Serial No.",VIN);
                  IF WarehouseEntry.FINDLAST THEN BEGIN
                    "Emplacement véhicule":=WarehouseEntry."Bin Code";
                    //OLD MODIFY;  KK_19092017
                  END;
                    //Emplacement:=WarehouseEntry."Bin Code";;
                END;
            end;
        }
        field(2;"Code";Code[20])
        {
            Description = 'NM191118';
            TableRelation = Campagne.Code;

            trigger OnValidate();
            begin
                GRecCampagne.GET(Code);
                IF GRecCampagne.Bloquant THEN
                  VALIDATE("Compagne Bloquant",TRUE)
                ELSE VALIDATE("Compagne Bloquant",FALSE);
            end;
        }
        field(3;"Date Lancement Compagne";Date)
        {
            CalcFormula = Lookup(Campagne."Date de lancement" WHERE (Code=FIELD(Code)));
            FieldClass = FlowField;
        }
        field(4;Traiter;Boolean)
        {
        }
        field(5;"En cours de traitement";Boolean)
        {
            CalcFormula = Exist("Reception SAV" WHERE (VIN=FIELD(VIN),
                                                       Type de garantie=CONST(Compagne),
                                                       N° campagne=FIELD(Code)));
            FieldClass = FlowField;
        }
        field(6;"Date de création";DateTime)
        {
        }
        field(7;"Date de modification";DateTime)
        {
        }
        field(8;"Créé par";Code[50])
        {
        }
        field(9;"Compagne Bloquant";Boolean)
        {
        }
        field(10;"Reception No.";Code[20])
        {

            trigger OnValidate();
            var
                ReceptionSAV : Record "60008";
            begin
                CALCFIELDS("VIN reception");
                IF VIN<>"VIN reception" THEN BEGIN
                  "Reception No.":='';
                  MODIFY;
                END;
                IF ReceptionSAV.GET("Reception No.") THEN
                IF ReceptionSAV.VIN<> VIN THEN BEGIN
                  "Reception No.":='';
                  MODIFY;
                  END;
            end;
        }
        field(11;"Emplacement véhicule";Code[10])
        {
        }
        field(12;"VIN reception";Code[17])
        {
            CalcFormula = Lookup("Reception SAV".VIN WHERE (Reception No=FIELD(Reception No.)));
            FieldClass = FlowField;
        }
        field(13;"Type de campagne";Option)
        {
            CalcFormula = Lookup(Campagne."Type Compagne" WHERE (Code=FIELD(Code)));
            Editable = false;
            FieldClass = FlowField;
            OptionMembers = " ","4KET","5KET","15OSD";
        }
    }

    keys
    {
        key(Key1;VIN,"Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Créé par":=USERID;
        "Date de création":=CURRENTDATETIME;
    end;

    trigger OnModify();
    begin
        "Date de modification":=CURRENTDATETIME;
    end;

    var
        GRecCampagne : Record "50082";
        WarehouseEntry : Record "7312";
        ServiceItem : Record "5940";
}

