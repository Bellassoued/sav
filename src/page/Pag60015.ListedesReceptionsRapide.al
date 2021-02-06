page 60015 "Liste des Receptions Rapide"
{
    // version SAV Automobile

    CaptionML = ENU='Rapid Reparation List',
                FRA='liste des Réparation Rapide';
    CardPageID = "Fiche Reception CHRONO";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60008;
    SourceTableView = WHERE(Service Type=CONST(Rapid Service));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    StyleExpr = Color;
                }
                field("N° OR Archive";"N° OR Archive")
                {
                    CaptionML = ENU='N° OR Archive Incadea',
                                FRA='N° OR Archive';
                    StyleExpr = Color;
                }
                field(VIN;VIN)
                {
                    StyleExpr = Color;
                }
                field(Matricule;Matricule)
                {
                    StyleExpr = Color;
                }
                field("Status SR";"Status SR")
                {
                    Caption = 'Status OR';
                    StyleExpr = Color;
                }
                field(Priority;Priority)
                {
                    StyleExpr = Color;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    StyleExpr = Color;
                }
                field("Service Item Description";"Service Item Description")
                {
                    StyleExpr = Color;
                }
                field("Creation date";"Creation date")
                {
                }
                field("Heur creation";"Heur creation")
                {
                }
                field("No. RDV";"No. RDV")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Created By";"Created By")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Code Entretien";"Code Entretien")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Name 2";"Name 2")
                {
                }
                field(Address;Address)
                {
                }
                field("Address 2";"Address 2")
                {
                }
                field("Post Code";"Post Code")
                {
                }
                field(Contact;Contact)
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Sales Date";"Sales Date")
                {
                }
                field("Invoice Date";"Invoice Date")
                {
                }
                field(Warranty;Warranty)
                {
                }
                field("Warranty End Date";"Warranty End Date")
                {
                }
                field("Reception Date";"Reception Date")
                {
                }
                field("Shipment date Request";"Shipment date Request")
                {
                }
                field("Service Type";"Service Type")
                {
                }
                field("Date Livraison";"Date Livraison")
                {
                }
                field("Commentaire SAV";"Commentaire SAV")
                {
                }
                field(Kilométrage;Kilométrage)
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        //SM 26112020
        Color := '';
        //Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Compagne,Garantie  Constructeur+Campagne,
        IF "Type de garantie" = "Type de garantie"::"Payant par Client" THEN
          Color :='Standard';

        IF "Type de garantie" = "Type de garantie"::Compagne THEN
          Color :=  'Unfavorable';

        IF ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur") OR ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur+Campagne") OR ("Type de garantie" = "Type de garantie"::"Garantie  Prolongé")THEN
          Color := 'StandardAccent';
    end;

    trigger OnAfterGetRecord();
    begin
        //SM 26112020
        Color := '';
        //Payant par Client,Garantie  Constructeur,Garantie  Prolongé,Compagne,Garantie  Constructeur+Campagne,
        IF "Type de garantie" = "Type de garantie"::"Payant par Client" THEN
          Color :='Standard';

        IF "Type de garantie" = "Type de garantie"::Compagne THEN
          Color :=  'Ambiguous';

        IF ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur") OR ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur+Campagne") OR ("Type de garantie" = "Type de garantie"::"Garantie  Prolongé")THEN
          Color := 'Unfavorable';
    end;

    trigger OnOpenPage();
    begin

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;

        FILTERGROUP(2);
        SETRANGE("Service Type","Service Type"::"Rapid Service");
        FILTERGROUP(0);
    end;

    var
        UserMgt : Codeunit "5700";
        Color : Text;
}

