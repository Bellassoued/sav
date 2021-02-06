page 50110 "Payment Lines List1"
{
    // version NAVFR7.10,CT16V001

    //  CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Payment Lines List',
                FRA='Liste des lignes règlement';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table10866;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Currency Code";"Currency Code")
                {
                    Visible = false;
                }
                field(Amount;Amount)
                {
                    DecimalPlaces = 3:5;
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                    Visible = false;
                }
                field("Account Type";"Account Type")
                {
                }
                field("Account No.";"Account No.")
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Payment Class";"Payment Class")
                {
                }
                field("Status Name";"Status Name")
                {
                }
                field("Status No.";"Status No.")
                {
                    Visible = false;
                }
                field("Acceptation Code";"Acceptation Code")
                {
                }
                field(Coffre;Coffre)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Coffre Origine";"Coffre Origine")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Drawee Reference";"Drawee Reference")
                {
                }
                field("Bank Account Name";"Bank Account Name")
                {
                    Visible = false;
                }
                field("Bank Branch No.";"Bank Branch No.")
                {
                    Visible = false;
                }
                field("Agency Code";"Agency Code")
                {
                    Visible = false;
                }
                field(IBAN;IBAN)
                {
                }
                field("SWIFT Code";"SWIFT Code")
                {
                }
                field("Bank Account No.";"Bank Account No.")
                {
                    Visible = false;
                }
                field("RIB Key";"RIB Key")
                {
                    Visible = false;
                }
                field("Payment in Progress";"Payment in Progress")
                {
                    Visible = false;
                }
                field("Header Account No.";"Header Account No.")
                {
                }
                field("No. Salarié";"No. Salarié")
                {
                }
                field(Compte_Entête;Compte_Entête)
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Copied To No.";"Copied To No.")
                {
                }
                field(Type_ED;Type_ED)
                {
                }
                field(Libellé;Libellé)
                {
                }
                field(Header_status;Header_status)
                {
                }
                field("Type Règlement";"Type Règlement")
                {
                }
                field(Situation;Situation)
                {
                }
                field(Commentaires;Commentaires)
                {
                }
                field("Num Cession";"Num Cession")
                {
                }
                field("Created from No.";"Created from No.")
                {
                }
                field(Controle_Statut;Controle_Statut)
                {
                }
                field("Exporter vers siège";"Exporter vers siège")
                {
                }
                field("Importer d'un site";"Importer d'un site")
                {
                }
                field("Num Br Origine Site";"Num Br Origine Site")
                {
                }
                field("Num Line Br Site";"Num Line Br Site")
                {
                }
                field("Transfert BR/Siège No";"Transfert BR/Siège No")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                CaptionML = ENU='&Payment',
                            FRA='&Règlement';
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    var
                        Statement : Record "10865";
                        StatementForm : Page "10868";
                    begin
                        IF Statement.GET("No.") THEN BEGIN
                          Statement.SETRANGE("No.","No.");
                          StatementForm.SETTABLEVIEW(Statement);
                          StatementForm.RUN;
                        END;
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions2")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(Modify)
                {
                    CaptionML = ENU='Modify',
                                FRA='Modifier';
                    Image = EditFilter;

                    trigger OnAction();
                    var
                        PaymentLine : Record "10866";
                        Consult : Page "10871";
                    begin
                        PaymentLine.COPY(Rec);
                        PaymentLine.SETRANGE("No.","No.");
                        PaymentLine.SETRANGE("Line No.","Line No.");
                        Consult.SETTABLEVIEW(PaymentLine);
                        Consult.RUNMODAL;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        /*
        //<<CT16V001 ZM 15/05/2016 Gestion de Coffre par Site
        IF UserMgt.GetCoffreFilter(UPPERCASE(USERID)) <> '' THEN BEGIN
          FILTERGROUP(2);
            SETRANGE(Coffre,UserMgt.GetCoffreFilter(UPPERCASE(USERID)));
          FILTERGROUP(0);
        END;
        //>>CT16V001 ZM 15/05/2016 Gestion de Coffre par Site
        */
        
        
         CLEAR(UserSetup);
          IF UserSetup.GET(USERID) THEN
          BEGIN
           CLEAR(ProfilReglement);
           //ProfilReglement.SETRANGE("Code Profil",UserSetup."Profil Réglement");
           ProfilReglement.SETRANGE(Coffre,UserSetup."Filtre coffre");
           ProfilReglement.SETRANGE("Centre de Gestion",UserSetup."Tréso Resp. Ctr. Filter");
           ProfilReglement.FIND('-');
           BEGIN
               IF ProfilReglement."Filter par Coffre" THEN
                 BEGIN
        
                   FILTERGROUP(2);
                   SETRANGE(Coffre,UserMgt.GetCoffreFilter(UPPERCASE(USERID)));
                   FILTERGROUP(0);
        
                 END
                 ELSE
                 BEGIN
                   FILTERGROUP(2);
                   SETRANGE("Centre de gestion Tréso.",UserMgt.GetCentreGestFilter(UPPERCASE(USERID)));
                   FILTERGROUP(0);
        
                 END;
        
            END;
          END;

    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF CloseAction = ACTION::LookupOK THEN
          LookupOKOnPush;
    end;

    var
        Steps : Integer;
        PayNum : Code[20];
        UserMgt : Codeunit "5700";
        UserSetup : Record "91";
        ProfilReglement : Record "70031";

    procedure SetSteps(Step : Integer);
    begin
        Steps := Step;
    end;

    procedure SetNumBor(N : Code[20]);
    begin
        PayNum := N;
    end;

    procedure GetNumBor() N : Code[20];
    begin
        N := PayNum;
    end;

    local procedure LookupOKOnPush();
    var
        StatementLine : Record "10866";
        PostingStatement : Codeunit "10860";
    begin
        CurrPage.SETSELECTIONFILTER(StatementLine);
        PostingStatement.CopyLigBor(StatementLine,Steps,PayNum);
        CurrPage.CLOSE;
    end;
}

