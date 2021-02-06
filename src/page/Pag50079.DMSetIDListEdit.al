page 50079 "DM Set ID List Edit"
{
    // version DM V1

    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = List;
    SourceTable = Table60059;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group()
            {
                field(ShareOrPercent;ShareOrPercent)
                {
                    Caption = 'Pourcentage\Part';

                    trigger OnValidate();
                    begin
                        //SM 04022016
                        ShowPercent := ShareOrPercent = ShareOrPercent::Pourcent;
                        ShowShare := ShareOrPercent = ShareOrPercent::Part;
                        CurrPage.UPDATE(TRUE);

                        //END SM 04022016
                    end;
                }
            }
            repeater(Group)
            {
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Dimension Code";"Dimension Code")
                {
                }
                field("Dimension Value Code";"Dimension Value Code")
                {

                    trigger OnValidate();
                    begin
                        DMDimMgt.CheckDimensionValueExist(Rec);
                    end;
                }
                field("Dimension Name";"Dimension Name")
                {
                }
                field("Dimension Value Name";"Dimension Value Name")
                {
                }
                field(Share;Share)
                {
                    Visible = ShowShare;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE(TRUE);
                        DMDimMgt.CalcPercent(Rec);
                        CurrPage.ACTIVATE(TRUE);
                    end;
                }
                field(Pourcent;Share)
                {
                    CaptionML = ENU='Share',
                                FRA='Pourcent';
                    Visible = ShowPercent;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE(TRUE);
                        DMDimMgt.CalcPercent(Rec);
                        CurrPage.ACTIVATE(TRUE);
                    end;
                }
                field(Percent;Percent)
                {
                    Visible = false;
                }
                field(Comment;Comment)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Insérer Règle Répartition")
            {
                RunPageMode = View;

                trigger OnAction();
                var
                    "PageListRépartitions" : Page "50084";
                    "RecRépartion" : Record "60055";
                    "RecLigneRépartion" : Record "60056";
                    RecCoffre : Record "60021";
                begin
                    RecRépartion.RESET;
                    RecRépartion.SETRANGE(Statut,RecRépartion.Statut::Validé);

                    RecUserSetup.GET(USERID);
                    RecRépartion.SETRANGE("Type Répartition",RecUserSetup."Type Règle Répartition");
                    //TODO FILTER CENTRE FOR OTHER ACTIVITY

                    IF RecUserSetup."Filtre coffre" <> '' THEN BEGIN
                      IF RecCoffre.GET(RecUserSetup."Filtre coffre") THEN
                        RecRépartion.SETRANGE("Axes Principal 1",RecCoffre."Centre de Gestion");
                    END;

                    CLEAR(PageListRépartitions);
                    PageListRépartitions.SETRECORD(RecRépartion);
                    PageListRépartitions.SETTABLEVIEW(RecRépartion);
                    PageListRépartitions.LOOKUPMODE(TRUE);
                    IF PageListRépartitions.RUNMODAL = ACTION::LookupOK THEN BEGIN
                      PageListRépartitions.GETRECORD(RecRépartion);
                      RecLigneRépartion.RESET;
                      RecLigneRépartion.SETRANGE(Code,RecRépartion.Code);
                      IF RecLigneRépartion.FINDSET THEN BEGIN        //CONTROLE
                        REPEAT
                          SETRANGE("Dimension Code",RecLigneRépartion."Dimension Code");
                          IF NOT ISEMPTY THEN BEGIN
                            SETRANGE("Dimension Code");
                            ERROR(TXT50000,RecRépartion.Code,RecLigneRépartion."Dimension Code");
                          END;
                        UNTIL RecLigneRépartion.NEXT = 0;
                        SETRANGE("Dimension Code");
                      END;
                      IF RecLigneRépartion.FINDSET THEN BEGIN         //INSERT
                        IF FINDLAST THEN
                          LineNo := "Line No." + 10000
                        ELSE
                          LineNo := 10000;
                        REPEAT
                          "Dimension Set ID"     := DimSetID;
                          "Line No."             := LineNo;
                          VALIDATE("Dimension Code",RecLigneRépartion."Dimension Code");
                          VALIDATE("Dimension Value Code",RecLigneRépartion."Dimension Value Code");
                          INSERT(TRUE);
                          VALIDATE(Share,RecLigneRépartion.Percent);
                          MODIFY(TRUE);
                          DMDimMgt.CalcPercent(Rec);
                          LineNo += 10000;
                        UNTIL RecLigneRépartion.NEXT = 0;
                      END;

                    END;
                end;
            }
        }
    }

    trigger OnClosePage();
    var
        DMDimensionSetNew : Record "60059";
    begin
        /*REMOVE to queryclose
        //ToDo Tous les controle possible et imaginable
        
        
        
        IF FINDFIRST THEN BEGIN
          CalcGlobalPercent(Rec);
          DMDimensionSetNew.RESET;
          DMDimensionSetNew.SETRANGE("Dimension Set ID",DMDimMgt.GetDimensionSetID(Rec));
          DMDimensionSetNew.DELETEALL;
          FINDFIRST;
          REPEAT
            DMDimensionSetNew := Rec;
            DMDimensionSetNew.INSERT;
          UNTIL NEXT = 0;
        
          DimSetID := DMDimMgt.GetDimensionSetID(Rec);
        END ELSE BEGIN
          DimSetID := '';
        END;
        */

    end;

    trigger OnOpenPage();
    var
        NoSeriesMgt : Codeunit "396";
    begin
        //IF GETFILTER("Dimension Set ID") <> '' THEN

        DimSetID := GETRANGEMIN("Dimension Set ID");

        IF DimSetID = '' THEN BEGIN
          GeneralLedgerSetup.GET;
          NoSeriesMgt.InitSeries(GeneralLedgerSetup."Souche No DM",GeneralLedgerSetup."Souche No DM",TODAY,DimSetID,GeneralLedgerSetup."Souche No DM");
          FILTERGROUP(2);
          SETRANGE("Dimension Set ID",DimSetID);
          FILTERGROUP(0);
        END;
        DMDimMgt.GetDimensionSet(Rec,DimSetID);
        IF FormCaption <> '' THEN
          CurrPage.CAPTION := FormCaption;

        //SM 04022016
        ShowPercent := ShareOrPercent = ShareOrPercent::Pourcent;
        ShowShare := ShareOrPercent = ShareOrPercent::Part;
        //END SM 04022016
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    var
        DMDimensionSetNew : Record "60059";
    begin
        //ToDo Tous les controle possible et imaginable



        IF FINDFIRST THEN BEGIN
          IF ShareOrPercent = ShareOrPercent::Pourcent THEN
            DMDimMgt.CalcGlobalShare(Rec);

          DMDimMgt.CalcGlobalPercent(Rec);
          DMDimensionSetNew.RESET;
          DMDimensionSetNew.SETRANGE("Dimension Set ID",DMDimMgt.GetDimensionSetID(Rec));
          DMDimensionSetNew.DELETEALL;
          FINDFIRST;
          REPEAT
            DMDimensionSetNew := Rec;
            DMDimensionSetNew.INSERT;
          UNTIL NEXT = 0;

          DimSetID := DMDimMgt.GetDimensionSetID(Rec);
        END ELSE BEGIN
          DimSetID := '';
        END;
    end;

    var
        DimSetID : Code[50];
        FormCaption : Text[250];
        DMDimMgt : Codeunit "50005";
        GeneralLedgerSetup : Record "98";
        LineNo : Integer;
        TXT50000 : Label 'Des lignes de la répartition %1 contienne l''axe %2. Il faut supprimer les lignes de l''axe %2 pour insérer la nouvelle répartition.';
        ShareOrPercent : Option Pourcent,"Part";
        RecUserSetup : Record "91";
        ShowPercent : Boolean;
        ShowShare : Boolean;

    procedure SetSources(var DMDimensionSet : Record "60059");
    var
        xEntrySummary : Record "338";
        RecLigneCarteExistVIN : Record "60016";
    begin
        /*TempReservEntry.RESET;
        TempReservEntry.DELETEALL;
        IF ReservEntry.FIND('-') THEN
          REPEAT
            TempReservEntry := ReservEntry;
            TempReservEntry.INSERT;
          UNTIL ReservEntry.NEXT = 0;
        
        xEntrySummary.SETVIEW(GETVIEW);
        RESET;
        DELETEALL;
        IF EntrySummary.FINDSET THEN
          REPEAT
            RecLigneCarteExistVIN.RESET;
            RecLigneCarteExistVIN.SETRANGE(VIN,EntrySummary."Serial No.");
            IF RecLigneCarteExistVIN.ISEMPTY THEN BEGIN
              Rec := EntrySummary;
              INSERT;
            END;
          UNTIL EntrySummary.NEXT = 0;
        SETVIEW(xEntrySummary.GETVIEW);
        */

    end;

    procedure GetDimensionID() : Code[50];
    begin
        EXIT(DimSetID);
    end;

    procedure SetFormCaption(NewFormCaption : Text[250]);
    begin
        FormCaption := COPYSTR(NewFormCaption + ' - ' + CurrPage.CAPTION,1,MAXSTRLEN(FormCaption));
    end;
}

