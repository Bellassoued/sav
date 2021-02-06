table 60073 "Transfer Header Return"
{
    // version RT001

    CaptionML = ENU='Transfer Header',
                FRA='En-tête transfert';

    fields
    {
        field(1;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';

            trigger OnValidate();
            begin
                IF "No." <> xRec."No." THEN BEGIN
                  GetInventorySetup;
                  NoSeriesMgt.TestManual(GetNoSeriesCode);
                  "No. Series" := '';
                END;
            end;
        }
        field(2;"Transfer-from Code";Code[10])
        {
            CaptionML = ENU='Transfer-from Code',
                        FRA='Code prov. transfert';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
                TestStatusOpen;
                IF ("Transfer-from Code" = "Transfer-to Code") AND
                   ("Transfer-from Code" <> '')
                THEN
                  ERROR(
                    Text001,
                    FIELDCAPTION("Transfer-from Code"),FIELDCAPTION("Transfer-to Code"),
                    TABLECAPTION,"No.");
                IF xRec."Transfer-from Code" <> "Transfer-from Code" THEN BEGIN
                  IF HideValidationDialog OR
                     (xRec."Transfer-from Code" = '')
                  THEN
                    Confirmed := TRUE
                  ELSE
                    Confirmed := CONFIRM(Text002,FALSE,FIELDCAPTION("Transfer-from Code"));
                  IF Confirmed THEN BEGIN
                    IF Location.GET("Transfer-from Code") THEN BEGIN
                      "Transfer-from Name" := Location.Name;
                      "Transfer-from Name 2" := Location."Name 2";
                      "Transfer-from Address" := Location.Address;
                      "Transfer-from Address 2" := Location."Address 2";
                      "Transfer-from Post Code" := Location."Post Code";
                      "Transfer-from City" := Location.City;
                      "Transfer-from County" := Location.County;
                      "Trsf.-from Country/Region Code" := Location."Country/Region Code";
                      "Transfer-from Contact" := Location.Contact;
                      "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
                     /* TransferRoute.GetTransferRoute(
                        "Transfer-from Code","Transfer-to Code","In-Transit Code",
                        "Shipping Agent Code","Shipping Agent Service Code");
                      TransferRoute.GetShippingTime(
                        "Transfer-from Code","Transfer-to Code",
                        "Shipping Agent Code","Shipping Agent Service Code",
                        "Shipping Time");
                      TransferRoute.CalcReceiptDate(
                        "Shipment Date",
                        "Receipt Date",
                        "Shipping Time",
                        "Outbound Whse. Handling Time",
                        "Inbound Whse. Handling Time",
                        "Transfer-from Code",
                        "Transfer-to Code",
                        "Shipping Agent Code",
                        "Shipping Agent Service Code");*/
                      //TransLine.LOCKTABLE;
                      //TransLine.SETRANGE("Document No.","No.");
                      IF TransLine.FINDSET THEN;
                      MODIFY;
                    END;
                    //UpdateTransLines(FIELDNO("Transfer-from Code"));
                  END ELSE BEGIN
                    "Transfer-from Code" := xRec."Transfer-from Code";
                    EXIT;
                  END;
                END;

            end;
        }
        field(3;"Transfer-from Name";Text[50])
        {
            CaptionML = ENU='Transfer-from Name',
                        FRA='Nom prov. transfert';
        }
        field(4;"Transfer-from Name 2";Text[50])
        {
            CaptionML = ENU='Transfer-from Name 2',
                        FRA='Nom prov. transfert 2';
        }
        field(5;"Transfer-from Address";Text[50])
        {
            CaptionML = ENU='Transfer-from Address',
                        FRA='Adresse prov. transfert';
        }
        field(6;"Transfer-from Address 2";Text[50])
        {
            CaptionML = ENU='Transfer-from Address 2',
                        FRA='Adresse prov. transfert 2';
        }
        field(7;"Transfer-from Post Code";Code[20])
        {
            CaptionML = ENU='Transfer-from Post Code',
                        FRA='Code postal prov. transfert';
            TableRelation = IF (Trsf.-from Country/Region Code=CONST()) "Post Code"
                            ELSE IF (Trsf.-from Country/Region Code=FILTER(<>'')) "Post Code" WHERE (Country/Region Code=FIELD(Trsf.-from Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8;"Transfer-from City";Text[30])
        {
            CaptionML = ENU='Transfer-from City',
                        FRA='Ville prov. transfert';
            TableRelation = IF (Trsf.-from Country/Region Code=CONST()) "Post Code".City
                            ELSE IF (Trsf.-from Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Trsf.-from Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(9;"Transfer-from County";Text[30])
        {
            CaptionML = ENU='Transfer-from County',
                        FRA='Pays prov. transfert';
        }
        field(10;"Trsf.-from Country/Region Code";Code[10])
        {
            CaptionML = ENU='Trsf.-from Country/Region Code',
                        FRA='Code pays/région prov. transfert';
            TableRelation = Country/Region;
        }
        field(11;"Transfer-to Code";Code[10])
        {
            CaptionML = ENU='Transfer-to Code',
                        FRA='Code dest. transfert';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
                TestStatusOpen;
                IF ("Transfer-from Code" = "Transfer-to Code") AND
                   ("Transfer-to Code" <> '')
                THEN
                  ERROR(
                    Text001,
                    FIELDCAPTION("Transfer-from Code"),FIELDCAPTION("Transfer-to Code"),
                    TABLECAPTION,"No.");
                IF xRec."Transfer-to Code" <> "Transfer-to Code" THEN BEGIN
                  IF HideValidationDialog OR
                     (xRec."Transfer-to Code" = '')
                  THEN
                    Confirmed := TRUE
                  ELSE
                    Confirmed := CONFIRM(Text002,FALSE,FIELDCAPTION("Transfer-to Code"));
                  IF Confirmed THEN BEGIN
                    IF Location.GET("Transfer-to Code") THEN BEGIN
                      "Transfer-to Name" := Location.Name;
                      "Transfer-to Name 2" := Location."Name 2";
                      "Transfer-to Address" := Location.Address;
                      "Transfer-to Address 2" := Location."Address 2";
                      "Transfer-to Post Code" := Location."Post Code";
                      "Transfer-to City" := Location.City;
                      "Transfer-to County" := Location.County;
                      "Trsf.-to Country/Region Code" := Location."Country/Region Code";
                      "Transfer-to Contact" := Location.Contact;
                      "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
                      /*TransferRoute.GetTransferRoute(
                        "Transfer-from Code","Transfer-to Code","In-Transit Code",
                        "Shipping Agent Code","Shipping Agent Service Code");
                      TransferRoute.GetShippingTime(
                        "Transfer-from Code","Transfer-to Code",
                        "Shipping Agent Code","Shipping Agent Service Code",
                        "Shipping Time");
                      TransferRoute.CalcReceiptDate(
                        "Shipment Date",
                        "Receipt Date",
                        "Shipping Time",
                        "Outbound Whse. Handling Time",
                        "Inbound Whse. Handling Time",
                        "Transfer-from Code",
                        "Transfer-to Code",
                        "Shipping Agent Code",
                        "Shipping Agent Service Code");
                      TransLine.LOCKTABLE;
                      TransLine.SETRANGE("Document No.","No.");
                      IF TransLine.FINDSET THEN;*/
                      MODIFY;
                    END;
                    //UpdateTransLines(FIELDNO("Transfer-to Code"));
                  END ELSE BEGIN
                    "Transfer-to Code" := xRec."Transfer-to Code";
                    EXIT;
                  END;
                END;

            end;
        }
        field(12;"Transfer-to Name";Text[50])
        {
            CaptionML = ENU='Transfer-to Name',
                        FRA='Nom dest. transfert';
        }
        field(13;"Transfer-to Name 2";Text[50])
        {
            CaptionML = ENU='Transfer-to Name 2',
                        FRA='Nom dest. transfert 2';
        }
        field(14;"Transfer-to Address";Text[50])
        {
            CaptionML = ENU='Transfer-to Address',
                        FRA='Adresse dest. transfert';
        }
        field(15;"Transfer-to Address 2";Text[50])
        {
            CaptionML = ENU='Transfer-to Address 2',
                        FRA='Adresse dest. transfert 2';
        }
        field(16;"Transfer-to Post Code";Code[20])
        {
            CaptionML = ENU='Transfer-to Post Code',
                        FRA='Code postal dest. transfert';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(17;"Transfer-to City";Text[30])
        {
            CaptionML = ENU='Transfer-to City',
                        FRA='Ville dest. transfert';
            TableRelation = IF (Trsf.-to Country/Region Code=CONST()) "Post Code".City
                            ELSE IF (Trsf.-to Country/Region Code=FILTER(<>'')) "Post Code".City WHERE (Country/Region Code=FIELD(Trsf.-to Country/Region Code));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(18;"Transfer-to County";Text[30])
        {
            CaptionML = ENU='Transfer-to County',
                        FRA='Pays dest. transfert';
        }
        field(19;"Trsf.-to Country/Region Code";Code[10])
        {
            CaptionML = ENU='Trsf.-to Country/Region Code',
                        FRA='Code pays/région dest. transfert';
            TableRelation = Country/Region;
        }
        field(20;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
            Editable = true;
        }
        field(21;"Shipment Date";Date)
        {
            CaptionML = ENU='Shipment Date',
                        FRA='Date d''expédition';
        }
        field(22;"Receipt Date";Date)
        {
            CaptionML = ENU='Receipt Date',
                        FRA='Date de réception';
        }
        field(23;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            Editable = false;
            OptionCaptionML = ENU='Open,Released,Notifié,Encours De Traitement,Traité',
                              FRA='Ouvert,Lancé,Notifié,Encours De Traitement,Traité';
            OptionMembers = Open,Released,"Notifié","Encours De Traitement","Traité";

            trigger OnValidate();
            begin
                //UpdateTransLines(FIELDNO(Status));
            end;
        }
        field(24;Comment;Boolean)
        {
            CalcFormula = Exist("Inventory Comment Line" WHERE (Document Type=CONST(Transfer Order),
                                                                No.=FIELD(No.)));
            CaptionML = ENU='Comment',
                        FRA='Commentaires';
            Editable = false;
            FieldClass = FlowField;
        }
        field(25;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(26;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(27;"In-Transit Code";Code[10])
        {
            CaptionML = ENU='In-Transit Code',
                        FRA='Code transit';
            TableRelation = Location WHERE (Use As In-Transit=CONST(Yes));

            trigger OnValidate();
            begin
                TestStatusOpen;
                //UpdateTransLines(FIELDNO("In-Transit Code"));
            end;
        }
        field(28;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            TableRelation = "No. Series";
        }
        field(29;"Last Shipment No.";Code[20])
        {
            CaptionML = ENU='Last Shipment No.',
                        FRA='Date dern. expédition';
            Editable = false;
            TableRelation = "Transfer Shipment Header";
        }
        field(30;"Last Receipt No.";Code[20])
        {
            CaptionML = ENU='Last Receipt No.',
                        FRA='Date dern. réception';
            Editable = false;
            TableRelation = "Transfer Receipt Header";
        }
        field(31;"Transfer-from Contact";Text[50])
        {
            CaptionML = ENU='Transfer-from Contact',
                        FRA='Contact prov. transfert';
        }
        field(32;"Transfer-to Contact";Text[50])
        {
            CaptionML = ENU='Transfer-to Contact',
                        FRA='Contact dest. transfert';
        }
        field(33;"External Document No.";Code[35])
        {
            CaptionML = ENU='External Document No.',
                        FRA='N° doc. externe';
        }
        field(34;"Shipping Agent Code";Code[10])
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Agent Code',
                        FRA='Code transporteur';
            TableRelation = "Shipping Agent";

            trigger OnValidate();
            begin
                TestStatusOpen;
                /*IF "Shipping Agent Code" <> xRec."Shipping Agent Code" THEN
                  VALIDATE("Shipping Agent Service Code",'');
                UpdateTransLines(FIELDNO("Shipping Agent Code"));*/

            end;
        }
        field(35;"Shipping Agent Service Code";Code[10])
        {
            CaptionML = ENU='Shipping Agent Service Code',
                        FRA='Code prestation transporteur';
            TableRelation = "Shipping Agent Services".Code WHERE (Shipping Agent Code=FIELD(Shipping Agent Code));

            trigger OnValidate();
            begin
                TestStatusOpen;
                /*TransferRoute.GetShippingTime(
                  "Transfer-from Code","Transfer-to Code",
                  "Shipping Agent Code","Shipping Agent Service Code",
                  "Shipping Time");
                TransferRoute.CalcReceiptDate(
                  "Shipment Date",
                  "Receipt Date",
                  "Shipping Time",
                  "Outbound Whse. Handling Time",
                  "Inbound Whse. Handling Time",
                  "Transfer-from Code",
                  "Transfer-to Code",
                  "Shipping Agent Code",
                  "Shipping Agent Service Code");
                
                UpdateTransLines(FIELDNO("Shipping Agent Service Code"));
                */

            end;
        }
        field(36;"Shipping Time";DateFormula)
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Time',
                        FRA='Délai d''expédition';

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(37;"Shipment Method Code";Code[10])
        {
            CaptionML = ENU='Shipment Method Code',
                        FRA='Code condition livraison';
            TableRelation = "Shipment Method";
        }
        field(47;"Transaction Type";Code[10])
        {
            CaptionML = ENU='Transaction Type',
                        FRA='Type de transaction';
            TableRelation = "Transaction Type";
        }
        field(48;"Transport Method";Code[10])
        {
            CaptionML = ENU='Transport Method',
                        FRA='Mode de transport';
            TableRelation = "Transport Method";
        }
        field(59;"Entry/Exit Point";Code[10])
        {
            CaptionML = ENU='Entry/Exit Point',
                        FRA='Pays destination/provenance';
            TableRelation = "Entry/Exit Point";
        }
        field(63;"Area";Code[10])
        {
            CaptionML = ENU='Area',
                        FRA='Dépt destination/provenance';
            TableRelation = Area;
        }
        field(64;"Transaction Specification";Code[10])
        {
            CaptionML = ENU='Transaction Specification',
                        FRA='Régime';
            TableRelation = "Transaction Specification";
        }
        field(480;"Dimension Set ID";Integer)
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup();
            begin
                ShowDocDim;
            end;
        }
        field(5750;"Shipping Advice";Option)
        {
            CaptionML = ENU='Shipping Advice',
                        FRA='Option d''expédition';
            OptionCaptionML = ENU='Partial,Complete',
                              FRA='Partielle,Totale';
            OptionMembers = Partial,Complete;
        }
        field(5751;"Posting from Whse. Ref.";Integer)
        {
            CaptionML = ENU='Posting from Whse. Ref.',
                        FRA='Validation à partir réf. entrepôt';
        }
        field(5752;"Completely Shipped";Boolean)
        {
            CalcFormula = Min("Transfer Line"."Completely Shipped" WHERE (Document No.=FIELD(No.),
                                                                          Shipment Date=FIELD(Date Filter),
                                                                          Transfer-from Code=FIELD(Location Filter),
                                                                          Derived From Line No.=CONST(0)));
            CaptionML = ENU='Completely Shipped CAB',
                        FRA='Entièrement expédiée';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5753;"Completely Received";Boolean)
        {
            CalcFormula = Min("Transfer Line"."Completely Received" WHERE (Document No.=FIELD(No.),
                                                                           Receipt Date=FIELD(Date Filter),
                                                                           Transfer-to Code=FIELD(Location Filter),
                                                                           Derived From Line No.=CONST(0)));
            CaptionML = ENU='Completely Received',
                        FRA='Entièrement réceptionné';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5754;"Location Filter";Code[10])
        {
            CaptionML = ENU='Location Filter',
                        FRA='Filtre magasin';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(5793;"Outbound Whse. Handling Time";DateFormula)
        {
            CaptionML = ENU='Outbound Whse. Handling Time',
                        FRA='Délai désenlogement';

            trigger OnValidate();
            begin
                TestStatusOpen;


                UpdateTransLines(FIELDNO("Outbound Whse. Handling Time"));
            end;
        }
        field(5794;"Inbound Whse. Handling Time";DateFormula)
        {
            CaptionML = ENU='Inbound Whse. Handling Time',
                        FRA='Délai enlogement';

            trigger OnValidate();
            begin
                TestStatusOpen;
            end;
        }
        field(5796;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            FieldClass = FlowFilter;
        }
        field(9000;"Assigned User ID";Code[50])
        {
            CaptionML = ENU='Assigned User ID',
                        FRA='Code utilisateur affecté';
            TableRelation = "User Setup";
        }
        field(60000;"Reception No";Code[20])
        {
            CaptionML = ENU='Receive No.',
                        FRA='Reception N°';
        }
        field(60001;"Type Reception";Option)
        {
            Description = 'a supprimer';
            OptionMembers = "Reception Rapide","Reception Grand Reparation";
        }
        field(60002;"No Service Order";Code[20])
        {
            Description = 'a supprimer';
        }
        field(60003;"Source Type";Option)
        {
            OptionCaption = ',Vente PR,Vente VN,Assemblage VN,Service Rapide,Grande réparation,VN';
            OptionMembers = ,"Vente PR","Vente VN","Assemblage VN","Service Rapide","Grande réparation",VN;
        }
        field(60004;"Source No";Code[20])
        {
        }
        field(60005;Retour;Boolean)
        {
        }
        field(60006;InterCompany;Boolean)
        {
            Caption = 'InterSociété';
            Description = 'SM MAZDA06';
        }
        field(60014;"Item Source Location";Code[20])
        {
            Caption = 'Magasin Source Pièce';
            Description = 'SM MAZDA71';
            TableRelation = Location;

            trigger OnValidate();
            var
                RecLSalesHeader : Record "36";
            begin
                //SM MAZDA71
                RecLSalesHeader.RESET;
                RecLSalesHeader.SETRANGE("No.","Source No");
                RecLSalesHeader.SETRANGE("Document Type",RecLSalesHeader."Document Type"::Order);
                IF RecLSalesHeader.FINDFIRST THEN BEGIN
                  IF (RecLSalesHeader."Item Source Location" <> '') AND (RecLSalesHeader."Item Source Location" <> "Item Source Location") THEN BEGIN
                    IF CONFIRM(STRSUBSTNO(Text50001,"No.","Item Source Location",RecLSalesHeader."Item Source Location")) THEN BEGIN
                      RecLSalesHeader."Item Source Location" := "Item Source Location";
                      RecLSalesHeader.MODIFY;
                    END ELSE BEGIN
                      ERROR(Text50002);
                    END;
                  END ELSE BEGIN
                    RecLSalesHeader."Item Source Location" := "Item Source Location";
                    RecLSalesHeader.MODIFY;
                  END;
                END;
                //END SM
            end;
        }
        field(60015;"Autoriser Transporteur";Boolean)
        {
            Description = 'SM MAZDA200';

            trigger OnValidate();
            begin
                //SM MAZDA200 27/01/2015
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Activer Promotion" THEN
                  ERROR(Text50003);
                //END SM
            end;
        }
        field(60016;"Statut Livraison";Option)
        {
            OptionMembers = Ouvert,"Envoyé","Livraison En cours","Livraison Terminé";
        }
        field(60017;"Date Notification";DateTime)
        {
            Description = 'KK MAZDA201';
        }
        field(60018;"Date Fin Traitement";DateTime)
        {
            Description = 'KK MAZDA201';
        }
        field(60019;"Notifié par";Text[100])
        {
            Description = 'KK MAZDA201';
        }
        field(60020;"Traité par";Text[100])
        {
            Description = 'KK MAZDA201';
        }
        field(60021;"Date Lancement";DateTime)
        {
            Description = 'KK MAZDA201';
        }
        field(63000;VIN;Code[20])
        {
            CalcFormula = Lookup("Preparation VN".VIN WHERE (Preparation No=FIELD(Reception No)));
            Description = 'SM';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70000;"No. Colis";Code[20])
        {
            Description = 'ZMN';
        }
        field(70001;"No Facture Fournisseur";Code[20])
        {
            Description = 'ZMN';
        }
        field(70002;"No. Arrivage PR";Code[20])
        {
            Description = 'ZMN';
        }
        field(70003;"No. Arrivage PR auto";Code[20])
        {
        }
        field(70004;"Created from Arrivage PR";Boolean)
        {
        }
        field(70005;Periority;Boolean)
        {

            trigger OnValidate();
            begin
                VALIDATE("Date Periority",CREATEDATETIME(WORKDATE,TIME));
            end;
        }
        field(70006;"Date Creation";DateTime)
        {
            Description = 'ZM';
        }
        field(70007;"Date Expedition";DateTime)
        {
            Description = 'ZM';
        }
        field(70008;"Date Reception";DateTime)
        {
            Description = 'ZM';
        }
        field(70009;"Date Periority";DateTime)
        {
            Description = 'zm';
        }
        field(70010;"Test code a barre";Boolean)
        {
        }
        field(70011;"RCP depuis Mobile";Boolean)
        {
        }
        field(70012;"EXP Depuis Mobile";Boolean)
        {
        }
        field(70013;Urgent;Boolean)
        {
        }
        field(70014;"No. Dossier Import";Code[20])
        {
        }
        field(70015;"Créer par";Code[50])
        {
        }
        field(70016;"Modifier par";Code[50])
        {
        }
        field(70017;"Transfer inter succursale";Boolean)
        {
        }
        field(70018;"Ressource affectée";Code[20])
        {

            trigger OnLookup();
            var
                LPageServiceOrderAllocations : Page "6001";
                LRecServiceOrderAllocation : Record "5950";
                LRecSalesReceivablesSetup : Record "312";
                Company : Record "2000000006";
                LTempServiceOrderAllocation : Record "5950";
                LTxtFiltreRessoures : Text[250];
                LRecResource : Record "156";
                LPageResourceList : Page "77";
            begin
                //LRecSalesReceivablesSetup.GET;
                //IF COMPANYNAME=LRecSalesReceivablesSetup.
                CLEAR(LPageServiceOrderAllocations);
                IF COMPANYNAME='AURES GROS' THEN
                  LRecServiceOrderAllocation.CHANGECOMPANY('AURES AUTO');
                LRecServiceOrderAllocation.RESET;
                LRecServiceOrderAllocation.SETRANGE("Réception No.","Reception No");
                LRecServiceOrderAllocation.FINDSET;
                REPEAT
                  IF LRecServiceOrderAllocation."Resource No."<>'' THEN
                    LTxtFiltreRessoures+=LRecServiceOrderAllocation."Resource No."+'|';
                UNTIL LRecServiceOrderAllocation.NEXT=0;
                IF LTxtFiltreRessoures<>'' THEN
                  LTxtFiltreRessoures:=COPYSTR(LTxtFiltreRessoures,1,STRLEN(LTxtFiltreRessoures)-1);
                LRecResource.RESET;
                LRecResource.CHANGECOMPANY('AURES AUTO');
                LRecResource.SETFILTER("No.",LTxtFiltreRessoures);
                LRecResource.FINDSET;
                CLEAR(LPageResourceList);
                LPageResourceList.SETRECORD(LRecResource);
                LPageResourceList.SETTABLEVIEW(LRecResource);
                LPageResourceList.LOOKUPMODE(TRUE);

                //LTempServiceOrderAllocation.TRANSFERFIELDS(LRecServiceOrderAllocation);
                //LPageServiceOrderAllocations.SETRECORD(LRecServiceOrderAllocation);
                //LPageServiceOrderAllocations.SETTABLEVIEW(LRecServiceOrderAllocation);
                //LPageServiceOrderAllocations.LOOKUPMODE(TRUE);
                IF LTxtFiltreRessoures<>'' THEN BEGIN
                  IF LPageResourceList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                    LPageResourceList.GETRECORD(LRecResource);

                    "Ressource affectée"      :=LRecResource."No.";
                    "Nom ressource affectée"  :=LRecResource.Name;
                  END;
                END ELSE MESSAGE('Pas de ressources affectées');
                //Company
            end;
        }
        field(70019;"Nom ressource affectée";Text[50])
        {
        }
        field(70020;"Completely Shipped CAB";Boolean)
        {
            CalcFormula = Min("Transfer Line"."Completely Shipped" WHERE (Document No.=FIELD(No.),
                                                                          Shipment Date=FIELD(Date Filter),
                                                                          Transfer-from Code=FIELD(Location Filter),
                                                                          Derived From Line No.=CONST(0),
                                                                          Quantity=FILTER(<>0)));
            CaptionML = ENU='Completely Shipped CAB',
                        FRA='Entièrement expédiée CAB';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70021;"Expédié";Boolean)
        {

            trigger OnValidate();
            begin
                "Date Expedition" := CURRENTDATETIME;
            end;
        }
        field(70022;"Réceptionné";Boolean)
        {

            trigger OnValidate();
            begin
                "Date Reception" := CURRENTDATETIME
            end;
        }
        field(70023;"Commande Source";Text[100])
        {
            Description = 'SM 271017';
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"No.","Transfer-from Code","Transfer-to Code","Shipment Date",Status)
        {
        }
    }

    trigger OnDelete();
    var
        TransLine : Record "60074";
        InvtCommentLine : Record "5748";
    begin
        TESTFIELD(Status,Status::Open);
        IF Expédié THEN ERROR('Expédié');
        IF Réceptionné THEN ERROR('Réceptionné');

        RecUserSetup.GET(USERID);
        IF NOT RecUserSetup."Supprimer Retour pièces serv." THEN
          ERROR('Vous n''avez pas le droit');
        TransLine.SETRANGE("Document No.","No.");
        TransLine.DELETEALL(TRUE);
    end;

    trigger OnInsert();
    begin
        GetInventorySetup;
        IF "No." = '' THEN BEGIN
          TestNoSeries;
          NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series","Posting Date","No.","No. Series");
        END;
        InitRecord;
        VALIDATE("Shipment Date",WORKDATE);

        "Date Creation" := CREATEDATETIME(WORKDATE,TIME);
        "Créer par" := USERID;
    end;

    trigger OnModify();
    begin
        "Modifier par" := USERID;
    end;

    trigger OnRename();
    begin
        ERROR(Text000,TABLECAPTION);
    end;

    var
        Text000 : TextConst ENU='You cannot rename a %1.',FRA='Vous ne pouvez pas renommer l''enregistrement %1.';
        Text001 : TextConst ENU='%1 and %2 cannot be the same in %3 %4.',FRA='%1 et %2 ne peuvent pas être identiques dans l''%3 %4.';
        Text002 : TextConst ENU='Do you want to change %1?',FRA='Souhaitez-vous modifier la valeur du champ %1?';
        Text003 : TextConst ENU='The transfer order %1 has been deleted.',FRA='L''ordre de transfert %1 a été supprimé.';
        TransferRoute : Record "5742";
        TransHeader : Record "60073";
        TransLine : Record "60074";
        PostCode : Record "225";
        InvtSetup : Record "313";
        WhseRequest : Record "5765";
        DimMgt : Codeunit "408";
        NoSeriesMgt : Codeunit "396";
        WhseSourceHeader : Codeunit "5781";
        HideValidationDialog : Boolean;
        HasInventorySetup : Boolean;
        CalledFromWhse : Boolean;
        Text004 : TextConst ENU='The transfer order %1 has item tracking. Do you want to delete it anyway?',FRA='L''ordre de transfert %1 a une traçabilité. Souhaitez-vous quand même le supprimer ?';
        Text005 : TextConst ENU='Reservations exist for this order. These reservations will be canceled if a date conflict is caused by this change.\\',FRA='Il existe des réservations pour cette commande. Ces réservations seront annulées si cette modification entraîne un conflit de dates.\\';
        Text006 : TextConst ENU='Do you want to continue?',FRA='Souhaitez-vous continuer ?';
        Text007 : TextConst ENU='You may have changed a dimension.\\Do you want to update the lines?',FRA='Vous avez probablement modifié un axe analytique.\\Souhaitez-vous mettre à jour les lignes ?';
        Text50001 : Label 'Magasin source pièce dans ordre de transfert n° %1 est %2 différent de celui de la commande vente %3.';
        Text50002 : Label 'Modification annulée.';
        RecUserSetup : Record "91";
        Text50003 : Label 'Vous n''êtes pas autoriser à valider le transfert.';

    procedure InitRecord();
    begin
        IF "Posting Date" = 0D THEN
          VALIDATE("Posting Date",WORKDATE);
    end;

    procedure AssistEdit(OldTransHeader : Record "60073") : Boolean;
    begin
        WITH TransHeader DO BEGIN
          TransHeader := Rec;
          GetInventorySetup;
          TestNoSeries;
          IF NoSeriesMgt.SelectSeries(GetNoSeriesCode,OldTransHeader."No. Series","No. Series") THEN BEGIN
            NoSeriesMgt.SetSeries("No.");
            Rec := TransHeader;
            EXIT(TRUE);
          END;
        END;
    end;

    local procedure TestNoSeries() : Boolean;
    begin
        InvtSetup.TESTFIELD("Transfer Order Nos.");
    end;

    local procedure GetNoSeriesCode() : Code[10];
    begin
        EXIT(InvtSetup."Transfer Order Nos.");
    end;

    procedure SetHideValidationDialog(NewHideValidationDialog : Boolean);
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber : Integer;var ShortcutDimCode : Code[20]);
    var
        OldDimSetID : Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        /*
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF TransferLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;
        */

    end;

    local procedure GetInventorySetup();
    begin
        IF NOT HasInventorySetup THEN BEGIN
          InvtSetup.GET;
          HasInventorySetup := TRUE;
        END;
    end;

    local procedure UpdateTransLines(FieldRef : Integer);
    var
        TransLine : Record "5741";
    begin
        /*IF GUIALLOWED THEN
          CASE FieldRef OF
            FIELDNO("Shipping Agent Code"),
            FIELDNO("Shipping Agent Service Code"),
            FIELDNO("Shipment Date"),
            FIELDNO("Receipt Date"),
            FIELDNO("Shipping Time"),
            FIELDNO("Outbound Whse. Handling Time"),
            FIELDNO("Inbound Whse. Handling Time"):
              ConfirmResvDateConflict;
          END;
        
        TransLine.SETRANGE("Document No.","No.");
        TransLine.SETFILTER("Item No.",'<>%1','');
        IF TransLine.FINDSET THEN BEGIN
          TransLine.LOCKTABLE;
          REPEAT
            CASE FieldRef OF
              FIELDNO("In-Transit Code"):
                TransLine.VALIDATE("In-Transit Code","In-Transit Code");
              FIELDNO("Transfer-from Code"):
                BEGIN
                  TransLine.VALIDATE("Transfer-from Code","Transfer-from Code");
                  TransLine.VALIDATE("Shipping Agent Code","Shipping Agent Code");
                  TransLine.VALIDATE("Shipping Agent Service Code","Shipping Agent Service Code");
                  TransLine.VALIDATE("Shipment Date","Shipment Date");
                  TransLine.VALIDATE("Receipt Date","Receipt Date");
                  TransLine.VALIDATE("Shipping Time","Shipping Time");
                END;
              FIELDNO("Transfer-to Code"):
                BEGIN
                  TransLine.VALIDATE("Transfer-to Code","Transfer-to Code");
                  TransLine.VALIDATE("Shipping Agent Code","Shipping Agent Code");
                  TransLine.VALIDATE("Shipping Agent Service Code","Shipping Agent Service Code");
                  TransLine.VALIDATE("Shipment Date","Shipment Date");
                  TransLine.VALIDATE("Receipt Date","Receipt Date");
                  TransLine.VALIDATE("Shipping Time","Shipping Time");
                END;
              FIELDNO("Shipping Agent Code"):
                BEGIN
                  TransLine.VALIDATE("Shipping Agent Code","Shipping Agent Code");
                  TransLine.VALIDATE("Shipping Agent Service Code","Shipping Agent Service Code");
                  TransLine.VALIDATE("Shipment Date","Shipment Date");
                  TransLine.VALIDATE("Receipt Date","Receipt Date");
                  TransLine.VALIDATE("Shipping Time","Shipping Time");
                END;
              FIELDNO("Shipping Agent Service Code"):
                BEGIN
                  TransLine.VALIDATE("Shipping Agent Service Code","Shipping Agent Service Code");
                  TransLine.VALIDATE("Shipment Date","Shipment Date");
                  TransLine.VALIDATE("Receipt Date","Receipt Date");
                  TransLine.VALIDATE("Shipping Time","Shipping Time");
                END;
              FIELDNO("Shipment Date"):
                BEGIN
                  TransLine.VALIDATE("Shipment Date","Shipment Date");
                  TransLine.VALIDATE("Receipt Date","Receipt Date");
                  TransLine.VALIDATE("Shipping Time","Shipping Time");
                END;
              FIELDNO("Receipt Date"),FIELDNO("Shipping Time"):
                BEGIN
                  TransLine.VALIDATE("Shipping Time","Shipping Time");
                  TransLine.VALIDATE("Receipt Date","Receipt Date");
                END;
              FIELDNO("Outbound Whse. Handling Time"):
                TransLine.VALIDATE("Outbound Whse. Handling Time","Outbound Whse. Handling Time");
              FIELDNO("Inbound Whse. Handling Time"):
                TransLine.VALIDATE("Inbound Whse. Handling Time","Inbound Whse. Handling Time");
              FIELDNO(Status):
                TransLine.VALIDATE(Status,Status);
            END;
            TransLine.MODIFY(TRUE);
          UNTIL TransLine.NEXT = 0;
        END;
        */

    end;

    local procedure ConfirmResvDateConflict();
    var
        ResvEngMgt : Codeunit "99000831";
    begin
        /*IF ResvEngMgt.ResvExistsForTransHeader(Rec) THEN
          IF NOT CONFIRM(Text005 + Text006,FALSE) THEN
            ERROR('');*/

    end;

    local procedure HandleItemTrackingDeletion();
    var
        ReservEntry : Record "337";
        ReservEntry2 : Record "337";
        Confirmed : Boolean;
    begin
        /*WITH ReservEntry DO BEGIN
          RESET;
          SETCURRENTKEY(
            "Source ID","Source Ref. No.","Source Type","Source Subtype",
            "Source Batch Name","Source Prod. Order Line","Reservation Status");
          SETRANGE("Source Type",DATABASE::"Transfer Line");
          SETRANGE("Source ID","No.");
          SETRANGE("Source Batch Name",'');
          SETFILTER("Item Tracking",'> %1',"Item Tracking"::None);
          IF ISEMPTY THEN
            EXIT;
        
          IF HideValidationDialog OR NOT GUIALLOWED THEN
            Confirmed := TRUE
          ELSE
            Confirmed := CONFIRM(Text004,FALSE,"No.");
        
          IF NOT Confirmed THEN
            ERROR('');
        
          IF FINDSET THEN
            REPEAT
              ReservEntry2 := ReservEntry;
              ReservEntry2.ClearItemTrackingFields;
              ReservEntry2.MODIFY;
            UNTIL NEXT = 0;
        END;
        */

    end;

    procedure DeleteOneTransferOrder(var TransHeader2 : Record "5740";var TransLine2 : Record "5741") : Boolean;
    var
        ItemChargeAssgntPurch : Record "5805";
        WhseRequest : Record "5765";
        InvtCommentLine : Record "5748";
        No : Code[20];
        DoNotDelete : Boolean;
    begin
        /*No := TransHeader2."No.";
        IF TransLine2.FIND('-') THEN
          REPEAT
            IF (TransLine2.Quantity <> TransLine2."Quantity Shipped") OR
               (TransLine2.Quantity <> TransLine2."Quantity Received") OR
               (TransLine2."Quantity (Base)" <> TransLine2."Qty. Shipped (Base)") OR
               (TransLine2."Quantity (Base)" <> TransLine2."Qty. Received (Base)") OR
               (TransLine2."Quantity Shipped" <> TransLine2."Quantity Received") OR
               (TransLine2."Qty. Shipped (Base)" <> TransLine2."Qty. Received (Base)")
            THEN
              DoNotDelete := TRUE;
          UNTIL TransLine2.NEXT = 0;
        
        IF NOT DoNotDelete THEN BEGIN
          WhseRequest.SETRANGE("Source Type",DATABASE::"Transfer Line");
          WhseRequest.SETRANGE("Source No.",No);
          WhseRequest.DELETEALL(TRUE);
        
          InvtCommentLine.SETRANGE("Document Type",InvtCommentLine."Document Type"::"Transfer Order");
          InvtCommentLine.SETRANGE("No.",No);
          InvtCommentLine.DELETEALL;
        
          ItemChargeAssgntPurch.SETCURRENTKEY(
            "Applies-to Doc. Type","Applies-to Doc. No.","Applies-to Doc. Line No.");
          ItemChargeAssgntPurch.SETRANGE("Applies-to Doc. Type",ItemChargeAssgntPurch."Applies-to Doc. Type"::"Transfer Receipt");
          ItemChargeAssgntPurch.SETRANGE("Applies-to Doc. No.",TransLine2."Document No.");
          ItemChargeAssgntPurch.DELETEALL;
        
          IF TransLine2.FIND('-') THEN
            TransLine2.DELETEALL;
        
          TransHeader2.DELETE;
          //<< ZMN 17/04/2017
          //IF NOT HideValidationDialog THEN
          //  MESSAGE(Text003,No);
          //>> ZMN 17/04/2017
          EXIT(TRUE);
        END;
        EXIT(FALSE);
        */

    end;

    local procedure TestStatusOpen();
    begin
        TESTFIELD(Status,Status::Open);
    end;

    procedure CalledFromWarehouse(CalledFromWhse2 : Boolean);
    begin
        //CalledFromWhse := CalledFromWhse2;
    end;

    procedure CreateInvtPutAwayPick();
    var
        WhseRequest : Record "5765";
    begin
        TESTFIELD(Status,Status::Released);
        /*
        WhseRequest.RESET;
        WhseRequest.SETCURRENTKEY("Source Document","Source No.");
        WhseRequest.SETFILTER(
          "Source Document",'%1|%2',
          WhseRequest."Source Document"::"Inbound Transfer",
          WhseRequest."Source Document"::"Outbound Transfer");
        WhseRequest.SETRANGE("Source No.","No.");
        REPORT.RUNMODAL(REPORT::"Create Invt Put-away/Pick/Mvmt",TRUE,FALSE,WhseRequest);
        */

    end;

    procedure ShowDocDim();
    var
        OldDimSetID : Integer;
    begin
        /*OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet2(
            "Dimension Set ID",STRSUBSTNO('%1 %2',TABLECAPTION,"No."),
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        
        IF OldDimSetID <> "Dimension Set ID" THEN BEGIN
          MODIFY;
          IF TransferLinesExist THEN
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        END;*/

    end;

    local procedure TransferLinesExist() : Boolean;
    begin
        /*TransLine.RESET;
        TransLine.SETRANGE("Document No.","No.");
        EXIT(TransLine.FINDFIRST);
        */

    end;

    local procedure UpdateAllLineDim(NewParentDimSetID : Integer;OldParentDimSetID : Integer);
    var
        NewDimSetID : Integer;
        ShippedLineDimChangeConfirmed : Boolean;
    begin
        // Update all lines with changed dimensions.
        /*
        IF NewParentDimSetID = OldParentDimSetID THEN
          EXIT;
        IF NOT CONFIRM(Text007) THEN
          EXIT;
        
        TransLine.RESET;
        TransLine.SETRANGE("Document No.","No.");
        TransLine.LOCKTABLE;
        IF TransLine.FIND('-') THEN
          REPEAT
            NewDimSetID := DimMgt.GetDeltaDimSetID(TransLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF TransLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              TransLine."Dimension Set ID" := NewDimSetID;
        
              VerifyShippedLineDimChange(ShippedLineDimChangeConfirmed);
        
              DimMgt.UpdateGlobalDimFromDimSetID(
                TransLine."Dimension Set ID",TransLine."Shortcut Dimension 1 Code",TransLine."Shortcut Dimension 2 Code");
              TransLine.MODIFY;
            END;
          UNTIL TransLine.NEXT = 0;
          */

    end;

    local procedure VerifyShippedLineDimChange(var ShippedLineDimChangeConfirmed : Boolean);
    begin
        /*IF TransLine.IsShippedDimChanged THEN
          IF NOT ShippedLineDimChangeConfirmed THEN
            ShippedLineDimChangeConfirmed := TransLine.ConfirmShippedDimChange;*/

    end;

    procedure FctRunPostReceptTransfer(var PRecTransferHeader : Record "5740";PComanyName : Text);
    var
        LCduTransferOrderPostReceipt : Codeunit "5705";
    begin
        /*CHANGECOMPANY(PComanyName);
        LCduTransferOrderPostReceipt.RUN(Rec);*/

    end;
}

