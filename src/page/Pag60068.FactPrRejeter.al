page 60068 "Fact. Pr Rejeter"
{
    // version SAV Automobile

    CardPageID = "Fiche Reception Rapide";
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = Table60010;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Reception No.";"Reception No.")
                {
                    Editable = false;
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Inserrer ligne")
            {
                Image = PostApplication;
                InFooterBar = false;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;

                trigger OnAction();
                var
                    RecLigneReceptionServ : Record "60010";
                    IntLineNo : Integer;
                begin

                      // Inserer ligne des article rejeté dans la fiche réception courante
                      Boolsuccess := TRUE ;

                      CurrPage.SETSELECTIONFILTER(Rec);
                      IF FINDFIRST THEN
                        REPEAT
                          RecLigneReceptionServ.TRANSFERFIELDS(Rec);
                          RecLigneReceptionServ."Reception No.":=NoFicheRcp;
                          RecLigneReceptionServ."Copied To Doc No.":='';
                          RecLigneReceptionServ.status:=RecLigneReceptionServ.status::Approved;
                          RecLigneReceptionServ."Copied From Doc No." := "Reception No." ;
                          RecLigneReceptionServ."copied From Line No." := "Line No." ;

                          IF RecLigneReceptionServ.INSERT(TRUE) THEN
                           Boolsuccess := TRUE
                           ELSE Boolsuccess := FALSE ;
                            //----> Update
                        UNTIL NEXT=0;

                      IF Boolsuccess THEN
                        BEGIN
                        // mettre à jour les lignes des anciennes fiches
                        CurrPage.SETSELECTIONFILTER(Rec);
                        IF FINDFIRST THEN
                          REPEAT
                          IF RecLigneReceptionServ.GET("Reception No.","Line No.") THEN
                            BEGIN
                              RecLigneReceptionServ."Copied To Doc No.":= NoFicheRcp ;
                              RecLigneReceptionServ.MODIFY;
                            END;
                          UNTIL NEXT=0;
                        END;

                     CLEAR(Rec);
                     FillTable;
                end;
            }
        }
    }

    trigger OnInit();
    begin
        DELETEALL;
        FillTable;
    end;

    trigger OnOpenPage();
    begin
        DELETEALL;
        FillTable;
    end;

    var
        RecLigneRcpSevRapid : Record "60010";
        NoFicheRcp : Code[20];
        CustomerNoRcp : Code[20];
        ServiceItemNoRcp : Code[20];
        Boolsuccess : Boolean;

    procedure InitFilter("No Fiche" : Code[20];"Customer No" : Code[20];"Service Item No" : Code[20]);
    begin
           DELETEALL;
           NoFicheRcp := "No Fiche";
           CustomerNoRcp := "Customer No";
           ServiceItemNoRcp := "Service Item No";
    end;

    procedure FillTable();
    begin

           Rec.DELETEALL;
           RecLigneRcpSevRapid.SETCURRENTKEY("Service Item No.",status);
           RecLigneRcpSevRapid.SETFILTER("Reception No.",'<>%1',NoFicheRcp);
           RecLigneRcpSevRapid.SETFILTER("Service Item No.",'=%1',ServiceItemNoRcp);
           RecLigneRcpSevRapid.SETRANGE(status,RecLigneRcpSevRapid.status::Rejected);
           RecLigneRcpSevRapid.SETRANGE("Copied To Doc No.",'');
           RecLigneRcpSevRapid.SETRANGE(RecLigneRcpSevRapid."Type opération",RecLigneRcpSevRapid."Type opération"::"rapid service");
           IF RecLigneRcpSevRapid.FINDFIRST THEN
           REPEAT
                 Rec.INIT;
                 TRANSFERFIELDS(RecLigneRcpSevRapid);
                 INSERT;
           UNTIL RecLigneRcpSevRapid.NEXT=0;

         //CurrPage.UPDATE;
    end;
}

