page 60197 "Ligne travaux service rapide"
{
    PageType = ListPart;
    SourceTable = Table60010;
    SourceTableView = WHERE(Type=CONST(Resource),
                            Type opération=CONST(rapid service));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reception No.";"Reception No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Code Symptome";"Code Symptome")
                {
                }
                field("Description symptome";"Description symptome")
                {
                }
                field("Instruction No.";"Instruction No.")
                {
                }
                field("Instruction Description";"Instruction Description")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        Type:=Type::Resource;
        Statut:=Statut::Approuvée;
        "Type Effet CLT":="Type Effet CLT"::LDT;
    end;
}

