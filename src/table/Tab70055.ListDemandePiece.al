table 70055 "List Demande Piece"
{
    Caption = 'Liste des ordres de transfert';

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

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
            end;
        }
        field(3;"Transfer-to Code";Code[10])
        {
            CaptionML = ENU='Transfer-to Code',
                        FRA='Code dest. transfert';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
            end;
        }
        field(4;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
            Editable = false;
        }
        field(5;"Shipment Date";Date)
        {
            CaptionML = ENU='Shipment Date',
                        FRA='Date d''expédition';
        }
        field(6;"Receipt Date";Date)
        {
            CaptionML = ENU='Receipt Date',
                        FRA='Date de réception';
        }
        field(7;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            Editable = false;
            OptionCaptionML = ENU='Open,Released,Notifié,Encours De Traitement,Traité',
                              FRA='Ouvert,Lancé,Notifié,Encours De Traitement,Traité';
            OptionMembers = Open,Released,"Notifié","Encours De Traitement","Traité";
        }
        field(8;"Company Name";Text[80])
        {
        }
        field(9;"Source Type";Option)
        {
            OptionCaption = ',Vente PR,Vente VN,Assemblage VN,Service Rapide,Grande réparation,VN';
            OptionMembers = ,"Vente PR","Vente VN","Assemblage VN","Service Rapide","Grande réparation",VN;
        }
        field(10;"Source No.";Code[20])
        {
        }
        field(11;Retour;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"No.","Company Name")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Date : Record "2000000007";

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
}

