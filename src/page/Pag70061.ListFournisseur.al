page 70061 "List Fournisseur"
{
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field(CdeVendor;CdeVendor)
            {
                CaptionML = ENU='Vendor No.',
                            FRA='No. Fournisseur';
                TableRelation = Vendor;

                trigger OnValidate();
                begin
                    Recvendor.RESET;
                    Recvendor.GET(CdeVendor);
                    NomVendo:= Recvendor.Name;
                end;
            }
            field(NomVendo;NomVendo)
            {
                CaptionML = ENU='Name',
                            FRA='Nom';
            }
            field("Date Document";DatDocCmdAchat)
            {
            }
            field(OptTypeCmdAchat;OptTypeCmdAchat)
            {
                Caption = 'Type Commande Achat';
                Visible = false;
            }
            field("Code Motif";CdeCodeModif)
            {
                TableRelation = "Reason Code";
            }
            field(BlnPromotion;BlnPromotion)
            {
                Caption = 'Promotion';
                Visible = false;
            }
            field(BlnDGX;BlnDGX)
            {
                CaptionML = ENU='DGX',
                            FRA='DGX';
                Visible = false;
            }
            field(BlnNonDGX;BlnNonDGX)
            {
                CaptionML = ENU='Non DGX',
                            FRA='Non DGX';
                Visible = false;
            }
            field(BlnUrgent;BlnUrgent)
            {
                CaptionML = ENU='urgent',
                            FRA='urgent';
                Visible = false;
            }
            field(BlnStock;BlnStock)
            {
                CaptionML = ENU='Inventory',
                            FRA='Stock';
                Visible = false;
            }
            field("Type Commande";OptTypeCommande)
            {
            }
            field("Type Transport";OptTypeTransport)
            {
            }
            field("Type Order";OptTypeOrder)
            {
            }
            field("Type FD";OptTypeFD)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        Recvendor.RESET;
        RecPurchasesPayablesSetup.GET;
        RecPurchasesPayablesSetup.TESTFIELD("Default PR Vendor");
        Recvendor.GET(RecPurchasesPayablesSetup."Default PR Vendor");
        CdeVendor := Recvendor."No.";
        NomVendo := Recvendor.Name;
        DatDocCmdAchat := WORKDATE;
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
}

