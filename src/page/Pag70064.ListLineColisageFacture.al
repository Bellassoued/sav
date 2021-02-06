page 70064 "List Line Colisage Facture"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = Table70017;

    layout
    {
        area(content)
        {
            group()
            {
                field(TxtfilterDossierImport;TxtfilterDossierImport)
                {
                    CaptionML = ENU='No. Dossier Import',
                                FRA='No. Dossier Import';

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        CLEAR(PagListesDossiers);
                        PagListesDossiers.LOOKUPMODE(TRUE);
                        IF PagListesDossiers.RUNMODAL = ACTION::LookupOK THEN BEGIN
                          Text := PagListesDossiers.GetSelectionFiltersDossierImport;
                          EXIT(TRUE);
                        END;
                    end;

                    trigger OnValidate();
                    begin
                        SETFILTER("No. Dossier Import",TxtfilterDossierImport);
                        TxtfilterDossierImport := GETFILTER("No. Dossier Import");
                        CurrPage.UPDATE;
                    end;
                }
            }
            repeater(Group)
            {
                field("Numero UT";"Numero UT")
                {
                }
                field("Date UT";"Date UT")
                {
                }
                field(Mag;Mag)
                {
                }
                field("Numero Colis";"Numero Colis")
                {
                }
                field("Poids Brut Colis";"Poids Brut Colis")
                {
                }
                field("Poids Net Colis";"Poids Net Colis")
                {
                }
                field("Dimension Colis";"Dimension Colis")
                {
                }
                field("No. Client DPR";"No. Client DPR")
                {
                }
                field("No. Facture";"No. Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field(CR;CR)
                {
                }
                field(Type;Type)
                {
                }
                field("No. Article";"No. Article")
                {
                }
                field(Designation;Designation)
                {
                }
                field("Poid Unitaire Piece";"Poid Unitaire Piece")
                {
                }
                field("No. Commande";"No. Commande")
                {
                }
                field("Date Commande";"Date Commande")
                {
                }
                field("Prix unitaire LCY";"Prix unitaire LCY")
                {
                }
                field("Qte Servie";"Qte Servie")
                {
                }
                field("Tp commande";"Tp commande")
                {
                }
                field("No. Piece servie";"No. Piece servie")
                {
                }
                field(Rp;Rp)
                {
                }
                field(Prix;Prix)
                {
                }
                field("Commande Devise";"Commande Devise")
                {
                }
                field(D;D)
                {
                }
                field(F;F)
                {
                }
                field("No. Arrivage";"No. Arrivage")
                {
                }
                field("No. Dossier Import";"No. Dossier Import")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calcule Ecrat")
            {
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    RecEcartArrivagePR : Record "70023";
                    LRecArrivagePR : Record "70017";
                    RepTraiterEcartArrivage : Report "70010";
                    PagEcartArrivagePR : Page "70057";
                begin
                    /*
                    TESTFIELD(Statut,Statut::Cloturer);
                    DecNbreColisnontraiter := 0;
                    RecCheckArrivagePR.SETRANGE("No. Arrivage","No. Arrivage");
                    IF RecCheckArrivagePR.FINDSET THEN
                      REPEAT
                        RecCABMouvement.RESET;
                        RecCABMouvement.SETRANGE("No. Colis",RecCheckArrivagePR."Numero Colis");
                        IF NOT RecCABMouvement.FINDFIRST THEN
                          DecNbreColisnontraiter := DecNbreColisnontraiter + 1;
                      UNTIL RecCheckArrivagePR.NEXT = 0;
                    IF DecNbreColisnontraiter <> 0 THEN
                      BEGIN
                        IF NOT CONFIRM(Text001,FALSE) THEN+
                    
                          EXIT
                        ELSE
                          BEGIN
                            */
                    
                            //LRecArrivagePR:= Rec;
                            CLEAR(RepTraiterEcartArrivage);
                            //CurrPage.SETSELECTIONFILTER(LRecArrivagePR);
                            LRecArrivagePR.SETRANGE("No. Dossier Import","No. Dossier Import");
                            IF LRecArrivagePR.FINDFIRST THEN
                            BEGIN
                              RepTraiterEcartArrivage.SETTABLEVIEW(LRecArrivagePR);
                              RepTraiterEcartArrivage.RUN//RUNMODAL();
                            END;
                    
                    
                            RecEcartArrivagePR.SETRANGE("No. Dossier Import","No. Dossier Import");
                            IF RecEcartArrivagePR.FINDFIRST THEN
                              BEGIN
                                PagEcartArrivagePR.SETTABLEVIEW(RecEcartArrivagePR);
                                PagEcartArrivagePR.SETRECORD(RecEcartArrivagePR);
                                PagEcartArrivagePR.RUN;
                              END;
                              /*
                          END;
                        END ELSE
                          BEGIN
                            RecEnteteArrivagePR := Rec;
                            CLEAR(RepTraiterEcartArrivage);
                            CurrPage.SETSELECTIONFILTER(RecEnteteArrivagePR);
                            RecArrivagePR.SETRANGE("No. Arrivage",RecEnteteArrivagePR."No. Arrivage");
                            RepTraiterEcartArrivage.SETTABLEVIEW(RecArrivagePR);
                            RepTraiterEcartArrivage.RUNMODAL();
                            RecEcartArrivagePR.SETRANGE("No. Arrivage PR","No. Arrivage");
                            IF RecEcartArrivagePR.FINDFIRST THEN
                              BEGIN
                                PagEcartArrivagePR.SETTABLEVIEW(RecEcartArrivagePR);
                                PagEcartArrivagePR.SETRECORD(RecEcartArrivagePR);
                                PagEcartArrivagePR.RUN;
                              END;
                          END;
                          */

                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        CLEAR(TxtfilterDossierImport);
    end;

    var
        TxtfilterDossierImport : Text[250];
        PagListesDossiers : Page "50019";
}

