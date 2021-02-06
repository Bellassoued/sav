table 50003 "Purchase Request Vendor"
{
    // version DEM ACHAT

    Caption = 'Fournisseurs consultés';
    DataPerCompany = false;
    //- cmt mar: LookupPageID = 50009;

    fields
    {
        field(1; "Request No."; Code[20])
        {
            CaptionML = ENU = 'Request No.',
                        FRA = 'N° Demande';
        }
        field(2; "Vendor No."; Code[20])
        {
            CaptionML = ENU = 'Vendor No.',
                        FRA = 'N° fournisseur';
            NotBlank = true;
            TableRelation = Vendor."No.";
        }
        field(3; "Vendor Name"; Text[100])
        {
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Vendor No.")));
            Caption = 'Nom fournisseur';
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                ControleModif("Request No.");
            end;
        }
        field(4; IsSelected; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Request No.", "Vendor No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        ControleModif("Request No.");
    end;

    trigger OnInsert();
    begin
        ControleModif("Request No.");
    end;

    trigger OnModify();
    begin
        ControleModif("Request No.");
    end;

    procedure ControleModif(NumDemande: Code[20]);
    var
        RecL50005: Record 50005;
        RecGUserSetup: Record 91;
        Error001: Label 'Le statut de la demande ne permet plus sa modification';
    begin
        RecL50005.GET(NumDemande);
        /*RecGUser.GET(UPPERCASE(USERID));
        IF RecL50005.Status = RecL50005.Status::"5" THEN
         IF RecGUser."Valider Direction Générale" = FALSE  THEN
           ERROR(Error001);
        
        
        IF RecL50005.Status = RecL50005.Status::"6" THEN
           ERROR(Error001);
        
        
        
        IF RecL50005.Status = RecL50005.Status::"7" THEN
           ERROR(Error001);
        */

    end;
}

