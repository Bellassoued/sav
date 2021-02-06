page 60311 "Service Item List Filtrée"
{
    // version NAVW18.00,CT16V001

    //  CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Service Item List',
                FRA='Liste des articles de service';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Table5940;
    SourceTableView = SORTING(Item No.,Serial No.)
                      WHERE(Serial No.=FILTER(VF7*));

    layout
    {
        area(content)
        {
            repeater()
            {
                Editable = false;
                field(Famille;Famille)
                {
                }
                field(Description;Description)
                {
                }
                field("Serial No.";"Serial No.")
                {
                    CaptionML = ENU='Serial No.',
                                FRA='No Chassis (VIN)';
                }
                field(Matricule;Matricule)
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("No. Facture";"No. Facture")
                {
                }
                field("Date Embarquement";"Date Embarquement")
                {
                }
                field(Emplacement;GetBin("Serial No."))
                {
                }
                field(AI;AI)
                {
                }
                field("Date AI";"Date AI")
                {
                }
                field(DateCmde;DateCmde)
                {
                }
                field("Date Confirma Cde";"Date Confirma Cde")
                {
                }
                field(Justificatif;Justificatif)
                {
                }
                field("Date Justificatif";"Date Justificatif")
                {
                }
                field("Date Recep Dossier";"Date Recep Dossier")
                {
                }
                field("Date Heure Reception Dossier";"Date Heure Reception Dossier")
                {
                }
                field("Date  Dossier Complet";"Date  Dossier Complet")
                {
                }
                field("Dossier Validé";"Dossier Validé")
                {
                }
                field("Date Dossier Validé";"Date Dossier Validé")
                {
                }
                field("Date Time Emission Bord. PVN";"Date Time Emission Bord. PVN")
                {
                }
                field("Date Heure Envoie PVN";"Date Heure Envoie PVN")
                {
                }
                field("Date Heure Réception PVN";"Date Heure Réception PVN")
                {
                }
                field("Date Facuration OR PVN";"Date Facuration OR PVN")
                {
                }
                field("Début PVN";"Début PVN")
                {
                }
                field("Date preparation";"Date preparation")
                {
                }
                field("Date Acceptation Facturation";"Date Acceptation Facturation")
                {
                }
                field("Date Facturation Vente VN";"Date Facturation Vente VN")
                {
                }
                field("date réglement";"date réglement")
                {
                }
                field("Depot C.Grise";"Depot C.Grise")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("Recept C.Grise";"Recept C.Grise")
                {
                }
                field("Date rendez vous";"Date rendez vous")
                {
                }
                field("Date Livraison";"Date Livraison")
                {
                }
                field(Accepté;Accepté)
                {
                }
                field("Centre de gestion";"Centre de gestion")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field(VendeurLiv;VendeurLiv)
                {
                }
                field(Finition;Finition)
                {
                }
                field("Désignation couleur";"Désignation couleur")
                {
                }
                field("Date de réservation";"Date de réservation")
                {
                }
                field("N° expédition";GCdeNoExpedition)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        GRecDétailVNArrivage.RESET;
        GRecDétailVNArrivage.SETRANGE(VIN,"Serial No.");
        GRecDétailVNArrivage.SETFILTER("No. Expédition",'<>%1','');
        IF GRecDétailVNArrivage.FINDFIRST THEN
          GCdeNoExpedition:=GRecDétailVNArrivage."No. Expédition";
    end;

    trigger OnAfterGetRecord();
    begin
        GRecDétailVNArrivage.RESET;
        GRecDétailVNArrivage.SETRANGE(VIN,"Serial No.");
        GRecDétailVNArrivage.SETFILTER("No. Expédition",'<>%1','');
        IF GRecDétailVNArrivage.FINDFIRST THEN
          GCdeNoExpedition:=GRecDétailVNArrivage."No. Expédition";
    end;

    trigger OnOpenPage();
    begin
        //SM 171017
        FILTERGROUP(2);
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup.Admin_Vente_VN AND (NOT RecGUserSetup."Responsable agence VN") THEN BEGIN
          IF UserSetupManagement.GetSalesFilter <> '' THEN BEGIN
            SETRANGE("Centre de gestion",UserSetupManagement.GetSalesFilter);
          END;
        END;

        IF (NOT RecGUserSetup.Admin_Vente_VN) AND (NOT RecGUserSetup."Responsable agence VN") THEN BEGIN
          SETRANGE("Salesperson Code",RecGUserSetup."Salespers./Purch. Code");
        END;
        FILTERGROUP(0);
        //SM
    end;

    var
        ResourceSkill : Record "5956";
        SkilledResourceList : Page "6023";
        RecGUserSetup : Record "91";
        UserSetupManagement : Codeunit "5700";
        GCdeNoExpedition : Code[20];
        "GRecDétailVNArrivage" : Record "70015";
}

