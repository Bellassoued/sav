page 60321 "List Tranfert Retour"
{
    // version RT001

    CardPageID = "Tranfert Retour";
    PageType = List;
    SourceTable = Table60073;
    SourceTableView = SORTING(No.)
                      ORDER(Ascending)
                      WHERE(Réceptionné=FILTER(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Receipt Date";"Receipt Date")
                {
                }
                field(Status;Status)
                {
                }
                field("No Service Order";"No Service Order")
                {
                }
                field(Retour;Retour)
                {
                }
                field(InterCompany;InterCompany)
                {
                }
                field("Traité par";"Traité par")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Source No";"Source No")
                {
                }
            }
        }
    }

    actions
    {
    }
}

