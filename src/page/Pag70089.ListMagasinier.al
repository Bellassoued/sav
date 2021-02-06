page 70089 "List Magasinier"
{
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field("Code utilisateur";CdeUserCode)
            {
                TableRelation = "User Setup"."User ID";

                trigger OnValidate();
                begin
                    RecUserSetup.GET(CdeUserCode);
                end;
            }
            field(Nom;TxtNom)
            {
                Editable = false;
            }
        }
    }

    actions
    {
    }

    var
        CdeUserCode : Code[50];
        TxtNom : Text[100];
        RecUserSetup : Record "91";

    procedure FctGetMagasinier() : Code[50];
    begin
        EXIT(CdeUserCode);
    end;

    procedure FctUpdateAfftectationAMB(var PRecAffectationTransferAMB : Record "70054");
    var
        LRecAffectationTransferAMB : Record "70054";
    begin
        WITH PRecAffectationTransferAMB  DO
          BEGIN
             IF FINDSET THEN
               REPEAT
                   LRecAffectationTransferAMB.SETRANGE("Document No.","Document No.");
                   LRecAffectationTransferAMB.SETRANGE("Line No.","Line No.");
                   IF LRecAffectationTransferAMB.FINDFIRST THEN
                     BEGIN
                      LRecAffectationTransferAMB."Code Pickeur AMB" := CdeUserCode;
                      LRecAffectationTransferAMB.MODIFY(TRUE);
                     END;
                UNTIL PRecAffectationTransferAMB.NEXT = 0;
          END;
    end;
}

