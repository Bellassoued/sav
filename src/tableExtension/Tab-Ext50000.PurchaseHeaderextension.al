tableextension 50000 "Purchase Headerextension" extends "Purchase Header"
{
    fields
    {
        Field(50003; "No dossier"; Code[20])
        {
            TableRelation = "Entête Facture P.R / Colis" WHERE(Statut = FILTER(<> Cloturer));
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                //-cmt mar:UpdateLineDossierInfo;
            end;
        }


    var
        myInt: Integer;
}