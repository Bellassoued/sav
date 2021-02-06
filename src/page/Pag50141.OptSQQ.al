page 50141 "Opt SQQ"
{
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field("SQ > 0";BlnSQsupZero)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin

        BlnSQsupZero := TRUE;
    end;

    var
        CdeVendor : Code[20];
        NomVendo : Text[100];
        Recvendor : Record "23";
        BlnPromotion : Boolean;
        OptTypeCmdAchat : Option " ","Réappro","Préconisation",Compagne,Outillage,Ferme;
        BlnDGX : Boolean;
        BlnNonDGX : Boolean;
        BlnUrgent : Boolean;
        BlnStock : Boolean;
        RecPurchasesPayablesSetup : Record "312";
        RecReasonCode : Record "231";
        CdeCodeModif : Code[10];
        DatDocCmdAchat : Date;
        OptTypeCommande : Option " ",CVS,SVS,SNS;
        OptTypeTransport : Option " ",VOR,SEA;
        OptTypeOrder : Option "9",V,C,N,S,ACC,M,"5","3",G,P,A;
        OptTypeFD : Option "50","01 Glass","02 Eur1","51 DMREHTT","53 GPGHTT";
        BlnSQsupZero : Boolean;

    procedure FctGetVendorNo() : Code[20];
    begin
        EXIT(CdeVendor);
    end;

    procedure FctGetTypecmdAchat() : Text;
    begin
        EXIT(FORMAT(OptTypeCmdAchat));
    end;

    procedure FctGetPromo() : Boolean;
    begin
        EXIT(BlnPromotion);
    end;

    procedure FctGetDGX() : Boolean;
    begin
        EXIT(BlnDGX);
    end;

    procedure FctGetNonDGX() : Boolean;
    begin
        EXIT(BlnNonDGX);
    end;

    procedure FctGetUrgent() : Boolean;
    begin
        EXIT(BlnUrgent);
    end;

    procedure FctGetStock() : Boolean;
    begin
        EXIT(BlnStock);
    end;

    procedure FctGetCodeMotif() : Code[10];
    begin
        EXIT(CdeCodeModif);
    end;

    procedure FctGetDateDocument() : Date;
    begin
        EXIT(DatDocCmdAchat);
    end;

    procedure FctGetTypeDocument() : Text;
    begin
        EXIT(FORMAT(OptTypeCommande));
    end;

    procedure FctGetTypeTransport() : Text;
    begin
        EXIT(FORMAT(OptTypeTransport));
    end;

    procedure FctGetTypeOrder() : Text;
    begin
        EXIT(FORMAT(OptTypeOrder));
    end;

    procedure FctGetTypeFD() : Text;
    begin
        EXIT(FORMAT(OptTypeFD));
    end;

    procedure FctGetOptSQ() : Boolean;
    begin
        EXIT(BlnSQsupZero);
    end;
}

