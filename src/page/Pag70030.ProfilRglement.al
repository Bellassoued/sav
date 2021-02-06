page 70030 "Profil Réglement"
{
    Editable = true;
    PageType = Card;
    SourceTable = Table70031;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Code Profil";"Code Profil")
                {
                }
                field("Centre de Gestion";"Centre de Gestion")
                {
                }
                field(Coffre;Coffre)
                {
                }
                field("Description coffre";"Description coffre")
                {
                }
                field("Etape réglement";"Etape réglement")
                {
                    Caption = 'Filter type de réglement';
                    TableRelation = "Payment Class" WHERE (Enable=FILTER(Yes));
                }
            }
            part(;70031)
            {
                SubPageLink = Code profil réglement=FIELD(Code Profil),
                              Type de réglement=FIELD(FILTER(Etape réglement)),
                              Coffre=FIELD(Coffre);
                UpdatePropagation = Both;
            }
        }
        area(factboxes)
        {
            systempart(;Notes)
            {
            }
            systempart(;MyNotes)
            {
            }
            systempart(;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Affecter Type de réglement")
            {
                Image = Add;

                trigger OnAction();
                begin
                    TESTFIELD("Code Profil");
                    TESTFIELD(Coffre);
                    TESTFIELD("Centre de Gestion");
                    CLEAR(PaymentClassCushMgt);
                    PaymentClassCushMgt.SetParameters(Rec);
                    TESTFIELD(Coffre);
                    PaymentClassCushMgt.RUNMODAL;
                end;
            }
            action(DuplicateParameter)
            {
                Caption = 'Dupliquer le paramétrage';
                Image = CopySerialNo;

                trigger OnAction();
                begin
                    IF "Code Profil" <> '' THEN
                      BEGIN
                      ProfilReglement.SETRANGE("Code Profil","Code Profil");
                      ProfilReglement.SETRANGE(Coffre,Coffre);
                      DupliquerParamTres.SETTABLEVIEW(ProfilReglement);
                      DupliquerParamTres.InitParameter("Code Profil",Coffre);
                      DupliquerParamTres.RUNMODAL;
                      END;
                end;
            }
            action("M.A.J Paramètre")
            {

                trigger OnAction();
                begin

                    IF "Code Profil" <> '' THEN
                      BEGIN
                      ProfilReglement.SETRANGE("Code Profil","Code Profil");
                      ProfilReglement.SETRANGE(Coffre,Coffre);
                      DupliquerParamTres2.SETTABLEVIEW(ProfilReglement);
                      DupliquerParamTres2.InitParameter("Code Profil",Coffre);
                      DupliquerParamTres2.RUNMODAL;
                      END;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        //RM 020817
        UserSetup.GET(USERID);
        IF NOT UserSetup.DAF  THEN
          ERROR('Vous n avez pas le droit');
        //END RM
    end;

    var
        PaymentClassCushMgt : Page "70032";
        MgtAuresFinance : Codeunit "70006";
        DupliquerParamTres : Report "70061";
        ProfilReglement : Record "70031";
        DupliquerParamTres2 : Report "70066";
        UserSetup : Record "91";
}

