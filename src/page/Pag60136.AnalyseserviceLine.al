page 60136 "Analyse service Line"
{
    // version NAVW17.00

    CaptionML = ENU='Lines',
                FRA='Lignes';
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table2000000007;

    layout
    {
        area(content)
        {
            repeater()
            {
                Editable = false;
                field("Period Start";"Period Start")
                {
                    CaptionML = ENU='Period Start',
                                FRA='Début période';
                }
                field("Period Name";"Period Name")
                {
                    CaptionML = ENU='Period Name',
                                FRA='Nom période';
                }
                field(NbrReceptionRp;NbrReceptionRp)
                {
                    Caption = 'Nombre totale de fiches Service Rapide';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(NbrReceptionRpd;NbrReceptionRpdnew)
                {
                    Caption = 'Nombre de service Rapide - Crée';
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field(NbrReceptionRpdInvoiced;NbrReceptionRpdInvoiced)
                {
                    Caption = 'Nombre de service Rapide - Facturé';
                }
                field(NbrReceptionGRD;NbrReceptionGRD)
                {
                    Caption = 'Nombre totale de fiches Grand Réparation';
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(NbrReceptionGRDNew;NbrReceptionGRDNew)
                {
                    Caption = 'Nombre de Grand service - Crée';
                }
                field(NbrReceptionGRDInv;NbrReceptionGRDInv)
                {
                    Caption = 'Nombre de Grand service - Facturé';
                }
                field(NbreFactService;NbreFactService)
                {
                    Caption = 'Nobre total factures de service';
                }
                field(NbreFactServiceRapid;NbreFactServiceRapid)
                {
                    Caption = 'Nobre total factures de service Rapide';
                }
                field(NbreFactServiceGrand;NbreFactServiceGrand)
                {
                    Caption = 'Nobre total factures de Grand Service';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin

        RecGReceptSAV.RESET;
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Service Type",RecGReceptSAV."Service Type"::"Rapid Service");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Creation date","Period Start","Period End");
        IF CentreGestion <> '' THEN
          RecGReceptSAV.SETRANGE(RecGReceptSAV."Responsibility Center",CentreGestion);

        NbrReceptionRp := RecGReceptSAV.COUNT;

        RecGReceptSAV.RESET;
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Service Type",RecGReceptSAV."Service Type"::"Big Service");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Creation date","Period Start","Period End");
        IF CentreGestion <> '' THEN
          RecGReceptSAV.SETRANGE(RecGReceptSAV."Responsibility Center",CentreGestion);

        NbrReceptionGRD := RecGReceptSAV.COUNT;

        RecGReceptSAV.RESET;
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Service Type",RecGReceptSAV."Service Type"::"Rapid Service");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Creation date","Period Start","Period End");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Status SR",RecGReceptSAV."Status SR"::"Fiche Crée");
        IF CentreGestion <> '' THEN
          RecGReceptSAV.SETRANGE(RecGReceptSAV."Responsibility Center",CentreGestion);

        NbrReceptionRpdnew := RecGReceptSAV.COUNT ;

        RecGReceptSAV.RESET;
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Service Type",RecGReceptSAV."Service Type"::"Rapid Service");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Creation date","Period Start","Period End");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Status SR",RecGReceptSAV."Status SR"::Facturée);
        IF CentreGestion <> '' THEN
          RecGReceptSAV.SETRANGE(RecGReceptSAV."Responsibility Center",CentreGestion);

        NbrReceptionRpdInvoiced := RecGReceptSAV.COUNT ;

        //<< TRIUM RAD 24/06/2014 - Ajout Champ reception grand service facturé
        RecGReceptSAV.RESET;
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Service Type",RecGReceptSAV."Service Type"::"Big Service");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Creation date","Period Start","Period End");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Status SR",RecGReceptSAV."Status SR"::"Fiche Crée");

        IF CentreGestion <> '' THEN
          RecGReceptSAV.SETRANGE(RecGReceptSAV."Responsibility Center",CentreGestion);

        NbrReceptionGRDNew := RecGReceptSAV.COUNT;


        //<< TRIUM RAD 24/06/2014 - Ajout Champ reception grand service facturé
        RecGReceptSAV.RESET;
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Service Type",RecGReceptSAV."Service Type"::"Big Service");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Creation date","Period Start","Period End");
        RecGReceptSAV.SETRANGE(RecGReceptSAV."Status SR",RecGReceptSAV."Status SR"::Facturée);

        IF CentreGestion <> '' THEN
          RecGReceptSAV.SETRANGE(RecGReceptSAV."Responsibility Center",CentreGestion);

        NbrReceptionGRDInv := RecGReceptSAV.COUNT;

        //<< End TRIUM RAD Addin

        //<< TRIUM RAD 28/08/2014 - Ajout nbre factures de service

        RecGServiceInvHdr.RESET;
        RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Posting Date","Period Start","Period End");
        IF CentreGestion <> '' THEN
          RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Responsibility Center",CentreGestion);

        NbreFactService  := RecGServiceInvHdr.COUNT;

        RecGServiceInvHdr.RESET;
        RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Posting Date","Period Start","Period End");
        IF CentreGestion <> '' THEN
          RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Responsibility Center",CentreGestion);

        RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Type Reception",RecGServiceInvHdr."Type Reception"::"Reception Rapide");

        NbreFactServiceRapid  := RecGServiceInvHdr.COUNT;

        RecGServiceInvHdr.RESET;
        RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Posting Date","Period Start","Period End");
        IF CentreGestion <> '' THEN
          RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Responsibility Center",CentreGestion);

        RecGServiceInvHdr.SETRANGE(RecGServiceInvHdr."Type Reception",RecGServiceInvHdr."Type Reception"::"Reception Grand Reparation");

        NbreFactServiceGrand  := RecGServiceInvHdr.COUNT;

        //>> End TRIUM RAD Addin
    end;

    trigger OnFindRecord(Which : Text) : Boolean;
    begin
        EXIT(PeriodFormMgt.FindDate(Which,Rec,ItemPeriodLength));
    end;

    trigger OnNextRecord(Steps : Integer) : Integer;
    begin
        EXIT(PeriodFormMgt.NextDate(Steps,Rec,ItemPeriodLength));
    end;

    trigger OnOpenPage();
    begin
        RESET;
    end;

    var
        Item : Record "27";
        PeriodFormMgt : Codeunit "359";
        ItemPeriodLength : Option Day,Week,Month,Quarter,Year,Period;
        NbrReceptionRpdnew : Integer;
        RecGReceptSAV : Record "60008";
        NbrReceptionRpdInvoiced : Integer;
        NbrReceptionRp : Integer;
        NbrReceptionGRD : Integer;
        CentreGestion : Code[20];
        NbrReceptionGRDInv : Integer;
        NbrReceptionGRDNew : Integer;
        NbreFactService : Integer;
        NbreFactServiceRapid : Integer;
        NbreFactServiceGrand : Integer;
        RecGServiceInvHdr : Record "5992";

    procedure Set(NewItemPeriodLength : Integer;"New Centre de gestion" : Code[20]);
    begin
        ItemPeriodLength := NewItemPeriodLength;
        CentreGestion := "New Centre de gestion" ;
        CurrPage.UPDATE(FALSE);
    end;
}

