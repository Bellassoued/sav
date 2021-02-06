page 70027 "Bordereau PVN"
{
    // version MAZDA13

    DeleteAllowed = false;
    PageType = Document;
    SourceTable = Table70021;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("N° Bordereau";"N° Bordereau")
                {
                }
                field(Statut;Statut)
                {
                }
                field("Date Création";"Date Création")
                {
                }
                field("Date Emission";"Date Emission")
                {
                    Editable = false;
                }
                field("Nbre Véhicule";"Nbre Véhicule")
                {
                }
            }
            part(;70028)
            {
                SubPageLink = N° Bordereau=FIELD(N° Bordereau);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group()
            {
                action("Extraire Véhicules")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        Rec336Temp : Record "336" temporary;
                    begin
                        TESTFIELD("N° Bordereau");
                        TESTFIELD(Statut,Statut::Ouvert);
                        ItemTrackingDataCollection.SelectVIN(Rec336Temp,TRUE,1,0,1000000,Rec);
                    end;
                }
                action("Envoyer Bordereau ")
                {

                    trigger OnAction();
                    begin

                        TESTFIELD(Statut,Statut::Ouvert);

                        RecLignePVN.RESET;
                        RecLignePVN.SETRANGE("N° Bordereau","N° Bordereau");
                        IF RecLignePVN.FINDFIRST THEN
                          REPEAT
                            ServiceItem.RESET;
                            ServiceItem.SETRANGE("Serial No.",RecLignePVN.VIN);
                            ServiceItem.FINDFIRST;
                            ServiceItem.TESTFIELD("Statut PVN",ServiceItem."Statut PVN"::"Bordereau crée");
                            ServiceItem."Statut PVN" := ServiceItem."Statut PVN"::"Préparation lancée";
                            //SM 151017
                            ServiceItem."Date Time Emission Bord. PVN" := CURRENTDATETIME;
                            //END SM
                            ServiceItem.MODIFY;

                            RecLignePVN.Statut := RecLignePVN.Statut::"Encours de préparation";
                            RecLignePVN.MODIFY;
                          UNTIL RecLignePVN.NEXT=0;

                        "Date Emission" := WORKDATE;
                        "Time Emission" := TIME;
                        Statut          := Statut::"Encours de préparation";
                        MODIFY;
                    end;
                }
                action("Imprimer Bordereau")
                {
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        BordereauPVN.RESET;
                        BordereauPVN.SETRANGE("N° Bordereau","N° Bordereau");
                        IF BordereauPVN.FINDFIRST THEN
                          REPORT.RUN(50026,TRUE,TRUE,BordereauPVN);
                    end;
                }
            }
        }
    }

    var
        RecLignePVN : Record "70022";
        TXT50000 : Label 'Il existe des lignes réceptionnés';
        ItemTrackingDataCollection : Codeunit "6501";
        TXT50001 : Label 'Il existe au moin une carte grise non encaissé.';
        ServiceItem : Record "5940";
        BordereauPVN : Record "70021";
}

