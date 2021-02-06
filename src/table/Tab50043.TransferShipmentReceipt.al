table 50043 "Transfer Shipment/Receipt"
{
    // version NAVW18.00,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    DataCaptionFields = "No.";

    fields
    {
        field(1;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
        }
        field(2;"Transfer-from Code";Code[10])
        {
            CaptionML = ENU='Transfer-from Code',
                        FRA='Code prov. transfert';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));
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
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(8;"Transfer-from City";Text[30])
        {
            CaptionML = ENU='Transfer-from City',
                        FRA='Ville prov. transfert';
            TableRelation = "Post Code".City;
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
            TableRelation = "Post Code".City;
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
        field(20;"Transfer Order Date";Date)
        {
            CaptionML = ENU='Transfer Order Date',
                        FRA='Date ordre transfert';
        }
        field(21;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
        }
        field(22;Comment;Boolean)
        {
            CalcFormula = Exist("Inventory Comment Line" WHERE (Document Type=CONST(Posted Transfer Shipment),
                                                                No.=FIELD(No.)));
            CaptionML = ENU='Comment',
                        FRA='Commentaires';
            Editable = false;
            FieldClass = FlowField;
        }
        field(23;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(24;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(25;"Transfer Order No.";Code[20])
        {
            CaptionML = ENU='Transfer Order No.',
                        FRA='N° ordre transfert';
            TableRelation = "Transfer Header";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(26;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            TableRelation = "No. Series";
        }
        field(27;"Shipment Date";Date)
        {
            CaptionML = ENU='Shipment Date',
                        FRA='Date d''expédition';
        }
        field(28;"Receipt Date";Date)
        {
            CaptionML = ENU='Receipt Date',
                        FRA='Date de réception';
        }
        field(29;"In-Transit Code";Code[10])
        {
            CaptionML = ENU='In-Transit Code',
                        FRA='Code transit';
            TableRelation = Location.Code WHERE (Use As In-Transit=CONST(Yes));
        }
        field(30;"Transfer-from Contact";Text[50])
        {
            CaptionML = ENU='Transfer-from Contact',
                        FRA='Contact prov. transfert';
        }
        field(31;"Transfer-to Contact";Text[50])
        {
            CaptionML = ENU='Transfer-to Contact',
                        FRA='Contact dest. transfert';
        }
        field(32;"External Document No.";Code[35])
        {
            CaptionML = ENU='External Document No.',
                        FRA='N° doc. externe';
        }
        field(33;"Shipping Agent Code";Code[10])
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Agent Code',
                        FRA='Code transporteur';
            TableRelation = "Shipping Agent";
        }
        field(34;"Shipping Agent Service Code";Code[10])
        {
            CaptionML = ENU='Shipping Agent Service Code',
                        FRA='Code prestation transporteur';
            TableRelation = "Shipping Agent Services".Code WHERE (Shipping Agent Code=FIELD(Shipping Agent Code));
        }
        field(35;"Shipment Method Code";Code[10])
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
                ShowDimensions;
            end;
        }
        field(60000;"Reception No";Code[20])
        {
            CaptionML = ENU='Receive No.',
                        FRA='Reception N°';
        }
        field(60001;"Type Reception";Option)
        {
            Description = 'a supprimer';
            OptionMembers = "Reception Rapide","Reception Grand Reparation",VN;
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
        field(60014;"Item Source Location";Code[20])
        {
            Caption = 'Magasin Source Pièce';
            Description = 'SM MAZDA71';
            TableRelation = Location;
        }
        field(60016;"Statut Livraison";Option)
        {
            Description = 'SM202';
            OptionCaption = 'Ouvert,Envoyé,Livraison En cours,Livraison Terminé';
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
        field(90000;"Assigned User ID";Code[50])
        {
            CaptionML = ENU='Assigned User ID',
                        FRA='Code utilisateur affecté';
            Description = 'SM MAZDA200';
            TableRelation = "User Setup";
        }
        field(90001;"User ID";Code[50])
        {
            CalcFormula = Lookup("Value Entry"."User ID" WHERE (Document No.=FIELD(No.)));
            CaptionML = ENU='User ID',
                        FRA='Code utilisateur';
            Description = 'RA';
            FieldClass = FlowField;
            TableRelation = User."User Name";

            trigger OnLookup();
            var
                UserMgt : Codeunit "418";
            begin
            end;
        }
        field(90002;"Company Name";Text[30])
        {
        }
        field(90003;"Operation type";Option)
        {
            CaptionML = ENU='Operation type',
                        FRA='Type opération';
            OptionCaptionML = ENU='Receipt,Shipment',
                              FRA='Réception,Expédition';
            OptionMembers = Reception,Transfert;
        }
    }

    keys
    {
        key(Key1;"No.","Company Name","Source No")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"No.","Transfer-from Code","Transfer-to Code","Posting Date","Transfer Order Date")
        {
        }
    }

    trigger OnDelete();
    var
        InvtCommentLine : Record "5748";
        TransShptLine : Record "5745";
        MoveEntries : Codeunit "361";
    begin

        //<<CT16V001 ZM 15/05/2016 - interdire la suppression
        //ERROR('la supression de document validé n''est pas autorisée');
        //>>CT16V001 ZM 15/05/2016

        TransShptLine.SETRANGE("Document No.","No.");
        IF TransShptLine.FIND('-') THEN
          REPEAT
            TransShptLine.DELETE;
          UNTIL TransShptLine.NEXT = 0;

        InvtCommentLine.SETRANGE("Document Type",InvtCommentLine."Document Type"::"Posted Transfer Shipment");
        InvtCommentLine.SETRANGE("No.","No.");
        InvtCommentLine.DELETEALL;

        ItemTrackingMgt.DeleteItemEntryRelation(
          DATABASE::"Transfer Shipment Line",0,"No.",'',0,0,TRUE);

        MoveEntries.MoveDocRelatedEntries(DATABASE::"Transfer Shipment Header","No.");
    end;

    trigger OnInsert();
    begin
        "Créer par" := USERID;
    end;

    trigger OnModify();
    begin
        "Modifier par" := USERID
    end;

    var
        DimMgt : Codeunit "408";
        ItemTrackingMgt : Codeunit "6500";
        TransferReceiptHeader : Record "5746";
        TransferShipmentHeader : Record "5744";
        url : Text[500];

    procedure Navigate();
    var
        NavigateForm : Page "344";
    begin
        NavigateForm.SetDoc("Posting Date","No.");
        NavigateForm.RUN;
    end;

    procedure PrintRecords(ShowRequestForm : Boolean);
    var
        ReportSelection : Record "77";
        TransShptHeader : Record "5744";
    begin
        WITH TransShptHeader DO BEGIN
          COPY(Rec);
          ReportSelection.SETRANGE(Usage,ReportSelection.Usage::Inv2);
          ReportSelection.SETFILTER("Report ID",'<>0');
          ReportSelection.FIND('-');
          REPEAT
            REPORT.RUNMODAL(ReportSelection."Report ID",ShowRequestForm,FALSE,TransShptHeader);
          UNTIL ReportSelection.NEXT = 0;
        END;
    end;

    procedure ShowDimensions();
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2',TABLECAPTION,"No."));
    end;

    procedure FctShowTrabsferOrderCard(var PREcListDemandePiece : Record "70055");
    var
        RecTransferHeader : Record "5740";
        url : Text;
    begin
        IF COMPANYNAME = "Company Name" THEN  BEGIN
          RecTransferHeader.RESET;
          RecTransferHeader.SETRANGE("No.","No.");
          IF RecTransferHeader.FINDFIRST THEN  BEGIN
            //url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::
            PAGE.RUN(5740,RecTransferHeader);
            //HYPERLINK(url);
          END;
        END ELSE BEGIN
          RecTransferHeader.CHANGECOMPANY("Company Name");
          RecTransferHeader.SETRANGE("No.","No.");
          IF RecTransferHeader.FINDFIRST THEN BEGIN
            url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5740,RecTransferHeader);
            HYPERLINK(url);
          END;
        END;
    end;

    procedure ShowCard();
    begin
        IF "Operation type"="Operation type"::Reception THEN BEGIN
          IF COMPANYNAME = "Company Name" THEN  BEGIN
              TransferReceiptHeader.RESET;
              TransferReceiptHeader.SETRANGE("No.","No.");
              IF TransferReceiptHeader.FINDFIRST THEN  BEGIN
                  //url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5745,TransferReceiptHeader);
                  //HYPERLINK(url);
                  PAGE.RUN(5745,TransferReceiptHeader);
              END;
          END ELSE  BEGIN
              TransferReceiptHeader.CHANGECOMPANY("Company Name");
              TransferReceiptHeader.SETRANGE("No.","No.");
              IF TransferReceiptHeader.FINDFIRST THEN BEGIN
                  url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5745,TransferReceiptHeader);
                  HYPERLINK(url);
              END;
          END;
        END
        ELSE IF "Operation type"="Operation type"::Transfert THEN BEGIN
          IF COMPANYNAME = "Company Name" THEN  BEGIN
              TransferShipmentHeader.RESET;
              TransferShipmentHeader.SETRANGE("No.","No.");
              IF TransferShipmentHeader.FINDFIRST THEN  BEGIN
                  //url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5743,TransferShipmentHeader);
                  //HYPERLINK(url);
                PAGE.RUN(5743,TransferShipmentHeader);
              END;
          END ELSE  BEGIN
              TransferShipmentHeader.CHANGECOMPANY("Company Name");
              TransferShipmentHeader.SETRANGE("No.","No.");
              IF TransferShipmentHeader.FINDFIRST THEN BEGIN
                  url := GETURL(CLIENTTYPE::Current, "Company Name", OBJECTTYPE::Page,5743,TransferShipmentHeader);
                 HYPERLINK(url);

              END;
          END;

        END;
    end;
}

