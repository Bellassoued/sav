page 60156 "Warranty Card"
{
    // version CT16V002

    CaptionML = ENU='Warranty Card',
                FRA='Fiche Garantie';
    PageType = Card;
    SourceTable = Table60008;
    SourceTableView = WHERE(Warranty=CONST(Yes));

    layout
    {
        area(content)
        {
            group("Warranty Grp")
            {
                Caption = 'Garantie';
                Editable = GBoolDocEditable;
                field("<ReceptionNo>";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Warranty;Warranty)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Warranty Request By";"Warranty Request By")
                {
                    Editable = false;
                }
                field("Type de garantie";"Type de garantie")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        //SM MAZDA19

                        ShowSousTypeGarantie := ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur");
                        CurrPage.UPDATE(TRUE);
                        //END SM
                    end;
                }
                field("Sous Type de garantie";"Sous Type de garantie")
                {
                    Editable = ShowSousTypeGarantie;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Code Type Garantie";"Code Type Garantie")
                {
                    Editable = GBoolSubTypeEditable;
                    Visible = false;
                }
                field("Commentaire SAV";"Commentaire SAV")
                {
                    Caption = 'Diagnostique Atelier';
                }
                field("Etat de la réclamation";"Etat de la réclamation")
                {
                }
                field("Renoncer campagne";"Renoncer campagne")
                {
                    Visible = false;
                }
                field("Warranty End Date";"Warranty End Date")
                {
                    Editable = false;
                }
                field("Désignation Type Garantie";"Désignation Type Garantie")
                {
                    Editable = GBoolSubTypeEditable;
                    Visible = false;
                }
                field("TWC Number";"TWC Number")
                {
                }
                field("TWC Labor Hours";"TWC Labor Hours")
                {
                }
                field("TWC parts Amount";"TWC parts Amount")
                {
                }
                field("TWC Situation";"TWC Situation")
                {
                }
                group("Warranty %")
                {
                    Caption = '% Garantie';
                    Editable = false;
                    field("Warranty Starting Date (Labor)";"Warranty Starting Date (Labor)")
                    {
                        Editable = false;
                    }
                    field("Warranty Ending Date (Labor)";"Warranty Ending Date (Labor)")
                    {
                        Editable = false;
                    }
                    field("Warranty Starting Date (Parts)";"Warranty Starting Date (Parts)")
                    {
                        Editable = false;
                    }
                    field("Warranty Ending Date (Parts)";"Warranty Ending Date (Parts)")
                    {
                        Editable = false;
                    }
                    field("Warranty % (Parts)";"Warranty % (Parts)")
                    {
                        Editable = false;
                        Visible = false;
                    }
                    field("Warranty % (Labor)";"Warranty % (Labor)")
                    {
                        Editable = false;
                        Visible = false;
                    }
                }
                group("Warranty  prerequisite")
                {
                    Caption = 'Condition Garantie';
                    Editable = GBoolDocEditable;
                    field("Sales Date";"Sales Date")
                    {
                        CaptionML = ENU='Sales Date',
                                    FRA='Date de 1èr mise en circulation';
                        Editable = false;
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                    }
                    field(Kilometrage;RecControl.Kilometrage)
                    {
                        Editable = false;
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                    }
                }
                group("Appraval Warranty")
                {
                    Caption = 'Approbation Garantie';
                    Editable = GBoolDocEditable;
                    field("Approval Warranty Pick Request";"Approval Warranty Pick Request")
                    {
                        Visible = false;
                    }
                    field("Approval Warranty Service Post";"Approval Warranty Service Post")
                    {
                        Visible = false;
                    }
                    field("Warranty Status";"Warranty Status")
                    {
                        Editable = false;
                    }
                }
            }
            group(Reception)
            {
                Caption = 'Fiche OR';
                Editable = false;
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                }
                field(Matricule;Matricule)
                {
                }
                field(VIN;VIN)
                {
                }
                field("Variant Code";"Variant Code")
                {
                    Importance = Additional;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field(Priority;Priority)
                {
                }
                field("Service Item No.";"Service Item No.")
                {
                }
                field("Service Item Description";"Service Item Description")
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Creation date";"Creation date")
                {
                }
                field("Reception Date";"Reception Date")
                {
                }
                field("Shipment date Request";"Shipment date Request")
                {
                }
                field(Contact;Contact)
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Owner Code";"Owner Code")
                {
                }
                field("Owner Name";"Owner Name")
                {
                }
                field("Livré au client";"Livré au client")
                {
                }
                field("Date Livraison";"Date Livraison")
                {
                }
                field("Total Work Hour";"Total Work Hour")
                {
                }
                field("Block/cancel reason";"Block/cancel reason")
                {
                }
                field("Block/cancel Date";"Block/cancel Date")
                {
                }
                field("unblock/reactivate Date";"unblock/reactivate Date")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Date Validation Devis";"Date Validation Devis")
                {
                }
                field("Devis Validé";"Devis Validé")
                {
                }
                field(Invoiced;Invoiced)
                {
                }
                field("Motif Hors garantie";"Motif Hors garantie")
                {
                }
                field("Type d'intervention";"Type d'intervention")
                {
                }
                field("Nom Personne Livré";"Nom Personne Livré")
                {
                }
                field("CIN Personne Livré";"CIN Personne Livré")
                {
                }
                field("Date devis";"Date devis")
                {
                }
                field("Date Réparation";"Date Réparation")
                {
                }
            }
            part(Pannes;60155)
            {
                Editable = GBoolDocEditable;
                SubPageLink = Reception No=FIELD(Reception No);
                SubPageView = WHERE(Garantie=CONST(Yes));
            }
            part(WarrantyServiceLines;60154)
            {
                Editable = GBoolDocEditable;
            }
            group("Dossier Réception")
            {
                Editable = false;
                part(;60019)
                {
                    Editable = GBoolDocEditable;
                    SubPageLink = VIN=FIELD(VIN);
                }
                part(;60015)
                {
                    Editable = GBoolDocEditable;
                    SubPageLink = VIN=FIELD(VIN);
                }
                part(;60118)
                {
                    Editable = GBoolDocEditable;
                    SubPageLink = No_Chassis=FIELD(VIN);
                    SubPageView = SORTING(Date_Dos);
                }
            }
            part("Historique Mouvement VIN";5912)
            {
                Editable = GBoolDocEditable;
                SubPageLink = Serial No. (Serviced)=FIELD(VIN);
                SubPageView = WHERE(Entry Type=CONST(Usage));
            }
            part("Historique Garantie VIN";5913)
            {
                Editable = GBoolDocEditable;
                SubPageLink = Serial No. (Serviced)=FIELD(VIN);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Function")
            {
                action("Annuler Dossier Garantie")
                {
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecLUserSetup : Record "91";
                        LRecServiceLine : Record "5902";
                        LRecServiceHeader : Record "5900";
                    begin
                        //KT 080817
                        //IF ("Warranty Status"="Warranty Status"::"Fiche créée") THEN BEGIN
                        //END KT
                        //SM MAZDA19
                        RecLUserSetup.GET(USERID);
                        IF RecLUserSetup."Approbation Garantie" THEN BEGIN
                          "Warranty Status" := 0;
                          VALIDATE(Warranty , FALSE);
                          LRecServiceLine.RESET;
                          LRecServiceHeader.SETRANGE("Document Type",LRecServiceHeader."Document Type"::Order);
                          LRecServiceHeader.SETRANGE("Reception No","Reception No");
                          IF LRecServiceHeader.FINDFIRST THEN BEGIN
                            LRecServiceLine.RESET;
                            LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                            LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                            IF LRecServiceLine.FINDSET THEN
                              LRecServiceLine.MODIFYALL("Garantie approuvée",FALSE);
                          END;
                          CurrPage.UPDATE(TRUE);
                          CurrPage.CLOSE;
                        END;
                        //END KT
                        //END SM
                        "Demande approbation garantie":=FALSE;
                    end;
                }
                action("Demande Approbation Pièce")
                {
                    Caption = 'Demande Approbation Pièce';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        LRecServiceLine : Record "5902";
                        LRecServiceHeader : Record "5900";
                    begin
                        //<<---NM091220
                        TESTFIELD("TWC Labor Hours");
                        TESTFIELD("TWC Number");
                        TESTFIELD("TWC parts Amount");
                        TESTFIELD("TWC Situation");
                        //>>END
                        //KT 080817
                        LRecServiceHeader.RESET;
                        LRecServiceHeader.SETRANGE("Reception No","Reception No");
                        LRecServiceHeader.SETRANGE("Document Type",LRecServiceHeader."Document Type"::Order);
                        IF LRecServiceHeader.FINDFIRST THEN BEGIN
                          LRecServiceLine.RESET;
                          LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                          LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                          IF NOT LRecServiceLine.FINDFIRST THEN
                            ERROR('Il n''existe pas de pièces à demander ');
                        END ELSE
                          ERROR('Une commande doit être créée sur l''ordre de réparation %1',"Reception No");
                        //END KT

                        VALIDATE("Approval Warranty Pick Request","Approval Warranty Pick Request"::Encours);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Approuver Demande Pièce")
                {
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //<<---NM091220
                        TESTFIELD("TWC Labor Hours");
                        TESTFIELD("TWC Number");
                        TESTFIELD("TWC parts Amount");
                        TESTFIELD("TWC Situation");
                        //>>END
                        VALIDATE("Approval Warranty Pick Request","Approval Warranty Pick Request"::Approuver);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Refuser Demande Pièce")
                {
                    Image = CancelLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        VALIDATE("Approval Warranty Pick Request","Approval Warranty Pick Request"::Refuser);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Demande Approbation BL/Facturation")
                {
                    Caption = 'Demande Approbation BL/Facturation';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //<<---NM091220
                        TESTFIELD("TWC Labor Hours");
                        TESTFIELD("TWC Number");
                        TESTFIELD("TWC parts Amount");
                        TESTFIELD("TWC Situation");
                        //>>END
                        VALIDATE("Approval Warranty Service Post","Approval Warranty Service Post"::Encours);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Approuver BL/Facturation")
                {
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //<<---NM091220
                        TESTFIELD("TWC Labor Hours");
                        TESTFIELD("TWC Number");
                        TESTFIELD("TWC parts Amount");
                        TESTFIELD("TWC Situation");
                        //>>END
                        VALIDATE("Approval Warranty Service Post","Approval Warranty Service Post"::Approuver);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Refuser BL/Facturation")
                {
                    Image = CancelLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        VALIDATE("Approval Warranty Service Post","Approval Warranty Service Post"::Refuser);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Refus dossier par directeur technique")
                {
                    Caption = 'Refus dossier par directeur technique';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //KT 0980817
                        IF ("Status SR"<>"Status SR"::Facturée) AND ("Status SR" <>"Status SR"::Livré) THEN BEGIN
                          GRecUserSetup.GET(USERID);
                          IF GRecUserSetup."Refus garantie Dir. Technique" THEN BEGIN
                            "Warranty Status":="Warranty Status"::"Fiche créée";
                            "Approval Warranty Pick Request":="Approval Intern Pick Request"::Refuser;
                            "Approval Warranty Service Post":="Approval Warranty Service Post"::Refuser;
                          END;
                        END;
                        //END KT
                    end;
                }
                action("Refus dossier par responsable garantie")
                {
                    Caption = 'Refus dossier par responsable garantie';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin

                        //KT 0980817
                        IF ("Status SR"<>"Status SR"::Facturée) AND ("Status SR" <>"Status SR"::Livré) THEN BEGIN
                          GRecUserSetup.GET(USERID);
                          IF GRecUserSetup."Refus garantie Resp. Garantie" THEN BEGIN
                            "Warranty Status":="Warranty Status"::"Garantie approuvée";
                            "Approval Warranty Pick Request":="Approval Intern Pick Request"::Refuser;
                            "Approval Warranty Service Post":="Approval Warranty Service Post"::Refuser;
                          END;
                        END;
                        //END KT
                    end;
                }
            }
            group("&Inspection")
            {
                CaptionML = ENU='Control',
                            FRA='Contrôle';
                action("Contrôle Visuel")
                {
                    CaptionML = ENU='Visual Control',
                                FRA='Contrôle Visuel';
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PageControlVisule : Page "60012";
                        RecControl : Record "60009";
                    begin
                        //--> Appel au contrôle Visuel

                            RecControl.RESET;
                            IF RecControl.GET("Reception No") THEN
                               BEGIN
                                    PAGE.RUNMODAL(60012,RecControl);
                               END
                            ELSE
                               BEGIN
                                    RecControl.INIT;
                                    RecControl.Id:="Reception No";
                                    //--> Donnée Date         RecControl."Date de Creation":=
                                    RecControl.INSERT;
                                    PAGE.RUN(60012,RecControl);
                               END;
                    end;
                }
            }
            group("&Document")
            {
                action("Fiche Réception")
                {
                    Caption = 'Fiche OR';

                    trigger OnAction();
                    begin
                         PAGE.RUN(PAGE::"Fiche Reception Grande Réparat",Rec);
                    end;
                }
                action("Imprimer Fiche")
                {
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecRecpetionSav : Record "60008";
                    begin
                        RecRecpetionSav.SETRANGE("Reception No","Reception No");
                        IF RecRecpetionSav.FINDFIRST THEN
                          REPORT.RUN(REPORT::"Cmd Service Grand Rep",TRUE,TRUE,RecRecpetionSav);
                    end;
                }
                action("Fiche Véhicule")
                {
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page 5980;
                    RunPageLink = Serial No.=FIELD(VIN);
                    RunPageView = SORTING(Item No.,Serial No.)
                                  ORDER(Ascending);
                }
                action("Consulter commande")
                {
                    Caption = 'Consulter Commande';
                    Image = ServiceLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecLServiceHeader : Record "5900";
                    begin
                        RecLServiceHeader.RESET;
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Order);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Order",RecLServiceHeader);
                    end;
                }
                action("Consulter Devis")
                {
                    Caption = 'Consulter Devis';
                    Image = ServiceLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecLServiceHeader : Record "5900";
                    begin
                        RecLServiceHeader.RESET;
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Quote);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Quote",RecLServiceHeader);
                    end;
                }
                action("Imprimer demande de garantie")
                {
                    Image = print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        ReceptionSAV.SETRANGE("Reception No","Reception No");
                        IF ReceptionSAV.FINDFIRST THEN
                          REPORT.RUN(50027,TRUE,TRUE,ReceptionSAV);
                    end;
                }
            }
            group("&Historique")
            {
                action("Historiques Expéditions SAV Enregistrées")
                {
                    Caption = 'Historiques Expéditions SAV Enregistrées';
                    Image = PostedShipment;

                    trigger OnAction();
                    begin

                        RecServiceShipmentHeader.RESET;
                        RecServiceShipmentHeader.SETRANGE("Reception No","Reception No");
                        IF RecServiceShipmentHeader.FINDSET THEN
                          PAGE.RUN(PAGE::"Posted Service Shipments",RecServiceShipmentHeader);
                    end;
                }
                action("Historiques Factures SAV Enregistrées")
                {
                    Caption = 'Historiques Factures SAV Enregistrées';
                    Image = PostedServiceOrder;

                    trigger OnAction();
                    begin

                        RecServiceInvoiceHeader.RESET;
                        RecServiceInvoiceHeader.SETRANGE("Reception No","Reception No");
                        IF RecServiceInvoiceHeader.FINDSET THEN
                          PAGE.RUN(PAGE::"Posted Service Invoices",RecServiceInvoiceHeader);
                    end;
                }
                action("Historique Dossier SAV")
                {
                    Image = Line;
                    RunObject = Page 60118;
                    RunPageLink = No_Chassis=FIELD(VIN);
                    RunPageMode = View;
                }
                action("Approuver dossier garantie")
                {
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        LRecServiceLine : Record "5902";
                        LRecServiceHeader : Record "5900";
                    begin
                        //KT 080817
                        TESTFIELD("TWC Labor Hours");
                        TESTFIELD("TWC Number");
                        TESTFIELD("TWC parts Amount");
                        TESTFIELD("TWC Situation");
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approbation Garantie" THEN BEGIN
                          CASE "Warranty Status" OF
                            "Warranty Status"::"Fiche créée": BEGIN
                              LRecServiceHeader.RESET;
                              LRecServiceHeader.SETRANGE("Reception No","Reception No");
                              LRecServiceHeader.SETRANGE("Document Type",LRecServiceHeader."Document Type"::Order);
                              IF LRecServiceHeader.FINDFIRST THEN BEGIN
                                LRecServiceLine.RESET;
                                LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                IF NOT LRecServiceLine.FINDSET THEN
                                  ERROR('Rien à approuver')
                                ELSE
                                  LRecServiceLine.MODIFYALL("Garantie approuvée",TRUE);
                              END ELSE
                                ERROR('Rien à approuver, merci de créer une commande',"Reception No");
                              VALIDATE("Warranty Status","Warranty Status"::"Garantie approuvée");
                              "Demande approbation garantie":=FALSE;
                              END;
                          END;
                          CurrPage.UPDATE(TRUE);
                        END;
                    end;
                }
                action("Approuver complément garantie")
                {
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        LRecServiceLine : Record "5902";
                        LRecServiceHeader : Record "5900";
                    begin
                        //KT 080817
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approbation Garantie" THEN BEGIN
                          CASE "Warranty Status" OF
                            "Warranty Status"::"Garantie approuvée": BEGIN
                              LRecServiceHeader.RESET;
                              LRecServiceHeader.SETRANGE("Reception No","Reception No");
                              LRecServiceHeader.SETRANGE("Document Type",LRecServiceHeader."Document Type"::Order);
                              IF LRecServiceHeader.FINDFIRST THEN BEGIN
                                LRecServiceLine.RESET;
                                LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                //LRecServiceLine.SETRANGE(Complément,TRUE);
                                LRecServiceLine.SETRANGE("Garantie approuvée",FALSE);
                                IF NOT LRecServiceLine.FINDSET THEN
                                  ERROR('Rien à approuver')
                                ELSE
                                  LRecServiceLine.MODIFYALL("Garantie approuvée",TRUE);
                              END ELSE
                                ERROR('Rien à approuver, merci de créer une commande',"Reception No");
                              VALIDATE("Warranty Status","Warranty Status"::"Garantie approuvée");
                              "Demande approbation garantie":=FALSE;
                              END;
                          END;
                          CurrPage.UPDATE(TRUE);
                        END;
                    end;
                }
                action("Bon pour facturation")
                {
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        LRecServiceLine : Record "5902";
                        LRecServiceHeader : Record "5900";
                    begin
                        //KT 230817
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Permettre facturation garantie" THEN BEGIN
                          IF "Warranty Status"=  "Warranty Status"::"Garantie approuvée" THEN BEGIN
                              LRecServiceHeader.RESET;
                              LRecServiceHeader.SETRANGE("Reception No","Reception No");
                              LRecServiceHeader.SETRANGE("Document Type",LRecServiceHeader."Document Type"::Order);
                              IF LRecServiceHeader.FINDFIRST THEN BEGIN
                                LRecServiceLine.RESET;
                                LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                LRecServiceLine.SETRANGE("Garantie approuvée",FALSE);
                                IF  LRecServiceLine.FINDFIRST THEN
                                  ERROR('Merci d approuver les lignes complémentaires de la commande');
                              END ELSE
                                ERROR('Une commande doit être créée sur l''ordre de réparation %1',"Reception No");
                              VALIDATE("Warranty Status","Warranty Status"::"Bon pour facturation");
                              "Demande approbation garantie":=FALSE;
                          END;
                        END;
                    end;
                }
                action("Demander approbation dossier")
                {
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //KT 070917
                        FctEligibleDemandeApprobation;
                    end;
                }
                action("Annuler dernière approbation")
                {
                    Image = Cancel;

                    trigger OnAction();
                    begin
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approbation Garantie" THEN
                          IF "Warranty Status"="Warranty Status"::"Bon pour facturation" THEN
                          VALIDATE("Warranty Status","Warranty Status"-1);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //KT 280417
        GBoolSubTypeEditable:=TRUE;
        IF "Type de garantie"="Type de garantie"::"Garantie  Prolongé" THEN BEGIN
        GBoolSubTypeEditable:=FALSE;
        END;
        //END KT
        UpdateSubForm;
    end;

    trigger OnAfterGetRecord();
    begin
        InitTechnicalInfo;

        IF "Model Code" = '' THEN
          BEGIN
            "Model Code" := RecFicheTechnique."Model Code" ;

          END;
        //KT 280417
        GBoolSubTypeEditable:=TRUE;
        IF "Type de garantie"="Type de garantie"::"Garantie  Prolongé" THEN BEGIN
        GBoolSubTypeEditable:=FALSE;
        END;
        //END KT
        UpdateSubForm;
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        //TESTFIELD("Type de garantie");
        "Warranty Card Modified By" := USERID;
        "Warranty Modified Date"    := CURRENTDATETIME;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        //"Service Type":="Service Type"::"Big Service";
    end;

    trigger OnOpenPage();
    begin
        GBoolDocEditable:=FALSE;

        GRecUserSetup.GET(USERID);
        IF  GRecUserSetup."Créer fiche garantie" THEN
          GBoolDocEditable:=TRUE;
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
        //SM MAZDA19
        ShowSousTypeGarantie := ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur");
        //END SM
        //KT 280417
        GBoolSubTypeEditable:=TRUE;
        IF "Type de garantie"="Type de garantie"::"Garantie  Prolongé" THEN BEGIN
        GBoolSubTypeEditable:=FALSE;
        END;
        //END KT
        InitTechnicalInfo;
        UpdateSubForm;

        CurrPage.Pannes.PAGE.SetFromWarrantyCard;
    end;

    var
        RecGVehicule : Record "27";
        CuSAVManagement : Codeunit "50010";
        UserMgt : Codeunit "5700";
        RecControl : Record "60009";
        RecServiceHeader : Record "5900";
        RecServiceInvoiceHeader : Record "5992";
        RecServiceShipmentHeader : Record "5990";
        ShowSousTypeGarantie : Boolean;
        TXT50008 : TextConst ENU='You cannot rename a %1.',FRA='Vous n''avez pas l''autorisation approbation Garantie.';
        RecFicheTechnique : Record "50032";
        ReceptionSAV : Record "60008";
        GBoolSubTypeEditable : Boolean;
        GRecUserSetup : Record "91";
        GRecServiceLine : Record "5902";
        GBoolDocEditable : Boolean;

    procedure InitTechnicalInfo();
    begin
        IF RecGVehicule.GET("Vehicle No.") THEN
            IF RecFicheTechnique.GET(RecGVehicule."No.") THEN;
        IF RecControl.GET("Reception No")  THEN ;
    end;

    procedure UpdateSubForm();
    begin
        RecServiceHeader.RESET;
        RecServiceHeader.SETRANGE("Reception No","Reception No");
        IF RecServiceHeader.FINDFIRST THEN BEGIN
          CurrPage.WarrantyServiceLines.PAGE.SetServiceOrderNo(RecServiceHeader."No.");
          CurrPage.WarrantyServiceLines.PAGE.EDITABLE := TRUE;
        END ELSE BEGIN
          CurrPage.WarrantyServiceLines.PAGE.SetServiceOrderNo('');
          //CurrPage.WarrantyServiceLines.PAGE.EDITABLE := FALSE;
          CurrPage.WarrantyServiceLines.PAGE.EDITABLE := TRUE;
        END;
    end;

    local procedure FctEligibleDemandeApprobation();
    begin
        //KT 070917
        IF "Warranty Status"="Warranty Status"::"Fiche créée" THEN BEGIN
          RecServiceHeader.RESET;
          RecServiceHeader.SETRANGE("Reception No","Reception No");
          IF NOT RecServiceHeader.FINDFIRST THEN
            ERROR('Rien à approuver')
          ELSE BEGIN
            GRecServiceLine.RESET;
            GRecServiceLine.SETRANGE("Document No.",RecServiceHeader."No.");
            GRecServiceLine.SETRANGE("Document Type",RecServiceHeader."Document Type");
            IF NOT GRecServiceLine.FINDFIRST THEN
              ERROR('Rien à approuver')
            ELSE BEGIN
              "Demande approbation garantie":=TRUE;
              MODIFY;
            END;
          END;
        END ELSE IF "Warranty Status"="Warranty Status"::"Garantie approuvée" THEN BEGIN
          RecServiceHeader.RESET;
          RecServiceHeader.SETRANGE("Reception No","Reception No");
          IF RecServiceHeader.FINDFIRST THEN BEGIN
            GRecServiceLine.RESET;
            GRecServiceLine.SETRANGE("Document No.",RecServiceHeader."No.");
            GRecServiceLine.SETRANGE("Document Type",RecServiceHeader."Document Type");
            GRecServiceLine.SETRANGE("Garantie approuvée",FALSE);
            IF GRecServiceLine.FINDFIRST THEN BEGIN
              "Demande approbation garantie":=TRUE;
              MODIFY;
            END
            ELSE BEGIN
            GRecServiceLine.RESET;
            GRecServiceLine.SETRANGE("Document No.",RecServiceHeader."No.");
            GRecServiceLine.SETRANGE("Document Type",RecServiceHeader."Document Type");
            GRecServiceLine.SETFILTER("Qty To Order",'>%1',0);
            IF GRecServiceLine.FINDFIRST THEN
              ERROR('Merci de demander les pièces')
            ELSE BEGIN
                    "Demande approbation garantie":=TRUE;
              MODIFY;
            END
            END;
          END;
        END;
    end;
}

