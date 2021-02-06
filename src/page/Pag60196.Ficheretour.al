page 60196 "Fiche retour"
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
                field("Workshop chief comment";"Workshop chief comment")
                {
                }
                field("Team chief comment";"Team chief comment")
                {
                }
                field("Workshop chief approval";"Workshop chief approval")
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        UserSetup.TESTFIELD("Chef atelier",TRUE);
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
                field("Service manager approval";"Service manager approval")
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        UserSetup.TESTFIELD("Responsable SAV",TRUE);
                    end;
                }
                field("Approval Return Pick Request";"Approval Return Pick Request")
                {
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

