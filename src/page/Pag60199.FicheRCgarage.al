page 60199 "Fiche RC garage"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    SourceTable = Table60008;

    layout
    {
        area(content)
        {
            group(Retour)
            {
                Caption = 'Retour';
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Editable = false;
                }
                field("Reception Date";"Reception Date")
                {
                    CaptionML = ENU='Receive Date',
                                FRA='Date Réception OR';
                    Editable = false;
                }
                field("No Réception Origine";"No Réception Origine")
                {
                    Caption = 'No OR Origine';
                    Editable = false;
                }
                field(GRecServiceInvoiceHeader."No.";GRecServiceInvoiceHeader."No.")
                {
                    CaptionML = ENU='Last invoice No.',
                                FRA='N° dernière facture';
                    Editable = false;
                }
                field(GRecServiceInvoiceHeader."Posting Date";GRecServiceInvoiceHeader."Posting Date")
                {
                    CaptionML = ENU='Invoice date',
                                FRA='Date facture';
                    Editable = false;
                }
                field("Team chief comment";"Team chief comment")
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        IF NOT UserSetup."Chef équipe atelier" THEN
                          ERROR('Utilisateur non autorisé');
                    end;
                }
                field("Workshop chief comment";"Workshop chief comment")
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        IF NOT UserSetup."Responsable SAV" THEN
                          ERROR('Utilisateur non autorisé');
                    end;
                }
                field("Team chief approval";"Team chief approval")
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        UserSetup.TESTFIELD("Chef équipe atelier",TRUE);
                    end;
                }
                field("Workshop chief approval";"Workshop chief approval")
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        UserSetup.TESTFIELD("Chef atelier",TRUE);
                    end;
                }
                field("Service manager approval";"Service manager approval")
                {
                    CaptionML = ENU='Service manager approval',
                                FRA='Approbation Responsable Garantie ou Relais Garantie';

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        UserSetup.TESTFIELD("Relais garantie",TRUE);
                    end;
                }
                field("Approval Return Pick Request";"Approval Return Pick Request")
                {
                    Caption = 'Approbation RC garage';
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            part(;9084)
            {
                SubPageLink = No.=FIELD(Customer No.);
            }
            part(;69086)
            {
                SubPageLink = Id=FIELD(Reception No);
            }
            part("Détails Véhicule";9088)
            {
                Caption = 'Détails Véhicule';
                Provider = "46";
                SubPageLink = Serial No.=CONST(VIN);
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Imprimer confirmation retour")
            {
                Image = print;

                trigger OnAction();
                begin
                    IF "Workshop chief approval" AND "Service manager approval" AND "Team chief approval" THEN BEGIN
                      CLEAR(GRepConfirmationretourSAV);
                      GRecReceptionSAV.RESET;
                      GRecReceptionSAV.SETRANGE("Reception No","Reception No");
                      GRecReceptionSAV.FINDFIRST;
                      GRepConfirmationretourSAV.SETTABLEVIEW(GRecReceptionSAV);
                      GRepConfirmationretourSAV.RUN;
                    END ELSE
                      MESSAGE(ERROR0001,FIELDCAPTION("Workshop chief approval"),FIELDCAPTION("Team chief approval"),FIELDCAPTION("Service manager approval"));
                end;
            }
            action("Refuser retour")
            {
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    UserSetup.GET(USERID);
                    IF NOT(UserSetup."Chef atelier" OR UserSetup."Chef équipe atelier" OR UserSetup."Responsable SAV") THEN
                      ERROR('Utilisateur non autorisé');
                    Retour:=FALSE;
                    "Team chief approval"       :=FALSE;
                    "Workshop chief approval"   :=FALSE;
                    "Service manager approval"  :=FALSE;
                    "Approval Return Pick Request":="Approval Return Pick Request"::Refuser;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        GetLastInvoiceNo;
        SetEditability;
    end;

    trigger OnAfterGetRecord();
    begin
        GetLastInvoiceNo;
        SetEditability;
    end;

    trigger OnOpenPage();
    begin
        //SetEditability;
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF "Team chief approval" AND "Workshop chief approval" AND "Service manager approval" THEN BEGIN
          "Approval Return Pick Request":="Approval Return Pick Request"::Approuver;
          MODIFY;
          END
    end;

    var
        GRepConfirmationretourSAV : Report "70054";
        GRecReceptionSAV : Record "60008";
        ERROR0001 : Label 'Vous ne pouvez pas imprimer la confirmation sans %1, %2 et %3';
        GRecServiceInvoiceHeader : Record "5992";
        GBoolDocIsStillEditable : Boolean;
        UserSetup : Record "91";

    local procedure GetLastInvoiceNo();
    begin
        GRecServiceInvoiceHeader.RESET;
        GRecReceptionSAV.SETRANGE("Reception No","No Réception Origine");
        GRecServiceInvoiceHeader.FINDLAST;
    end;

    local procedure SetEditability();
    begin
        GBoolDocIsStillEditable:=TRUE;
        CASE "Status SR" OF
          "Status SR"::Annulé:
            GBoolDocIsStillEditable:=FALSE;
          "Status SR"::Facturée:
            GBoolDocIsStillEditable:=FALSE;
          END;
    end;
}

