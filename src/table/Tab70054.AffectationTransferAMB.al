table 70054 "Affectation Transfer AMB"
{
    DrillDownPageID = 70199;
    LookupPageID = 70199;

    fields
    {
        field(1;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(3;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
            TableRelation = Item WHERE (Type=CONST(Inventory));

            trigger OnValidate();
            var
                TempTransferLine : Record "5741" temporary;
                LRecItemJournalLine : Record "83";
            begin
                GetItem;
                GetDefaultBin("Transfer-from Code","Transfer-to Code");

                Item.TESTFIELD(Blocked,FALSE);


                VALIDATE(Quantity,xRec.Quantity);
            end;
        }
        field(4;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(5;"Code Pickeur AMB";Code[50])
        {
            TableRelation = "User Setup";
        }
        field(6;"Transfer-from Code";Code[10])
        {
            CaptionML = ENU='Transfer-from Code',
                        FRA='Code prov. transfert';
            Editable = false;
            TableRelation = Location;

            trigger OnValidate();
            begin
                IF "Transfer-from Code" <> xRec."Transfer-from Code" THEN BEGIN
                  "Transfer-from Bin Code" := '';
                  GetDefaultBin("Transfer-from Code",'');
                  GetBin("Transfer-from Code","Transfer-from Bin Code");
                  Level:= Bin."Code Level";
                END;
            end;
        }
        field(7;"Transfer-to Code";Code[10])
        {
            CaptionML = ENU='Transfer-to Code',
                        FRA='Code dest. transfert';
            Editable = false;
            TableRelation = Location;

            trigger OnValidate();
            var
                LRecItemJournalLine : Record "83";
            begin
                IF "Transfer-to Code" <> xRec."Transfer-to Code" THEN BEGIN
                  "Transfer-To Bin Code" := '';
                  GetDefaultBin('',"Transfer-to Code");

                END;
            end;
        }
        field(8;"Transfer-from Bin Code";Code[20])
        {
            CaptionML = ENU='Transfer-from Bin Code',
                        FRA='Transf. du code emplacement';
            TableRelation = "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Transfer-from Code),
                                                            Item No.=FIELD(Item No.));

            trigger OnValidate();
            begin
                IF "Transfer-from Bin Code" <> xRec."Transfer-from Bin Code" THEN BEGIN
                  TESTFIELD("Transfer-from Code");
                  IF "Transfer-from Bin Code" <> '' THEN BEGIN
                    GetLocation("Transfer-from Code");
                    Location.TESTFIELD("Bin Mandatory");
                    Location.TESTFIELD("Directed Put-away and Pick",FALSE);
                    GetBin("Transfer-from Code","Transfer-from Bin Code");
                    TESTFIELD("Transfer-from Code",Bin."Location Code");
                    HandleDedicatedBin(TRUE);
                    Level := Bin."Code Level";
                  END;
                END;
            end;
        }
        field(9;"Transfer-To Bin Code";Code[20])
        {
            CaptionML = ENU='Transfer-To Bin Code',
                        FRA='Transf. vers code emplacement';
            TableRelation = Bin.Code WHERE (Location Code=FIELD(Transfer-to Code));

            trigger OnValidate();
            begin
                IF "Transfer-To Bin Code" <> xRec."Transfer-To Bin Code" THEN BEGIN
                  TESTFIELD("Transfer-to Code");
                  IF "Transfer-To Bin Code" <> '' THEN BEGIN
                    GetLocation("Transfer-to Code");
                    Location.TESTFIELD("Bin Mandatory");
                    Location.TESTFIELD("Directed Put-away and Pick",FALSE);
                    GetBin("Transfer-to Code","Transfer-To Bin Code");
                    TESTFIELD("Transfer-to Code",Bin."Location Code");
                  END;
                END;
            end;
        }
        field(10;Level;Integer)
        {
            CaptionML = ENU='Niveau',
                        FRA='Level';
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
        }
        key(Key2;Level,"Transfer-from Bin Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        TransferRoute : Record "5742";
        Item : Record "27";
        TransHeader : Record "5740";
        Location : Record "14";
        Bin : Record "7354";
        Reservation : Page "498";
        DimMgt : Codeunit "408";
        WhseValidateSourceLine : Codeunit "5777";
        ReserveTransferLine : Codeunit "99000836";
        CheckDateConflict : Codeunit "99000815";
        WMSManagement : Codeunit "7302";
        TrackingBlocked : Boolean;
        RecTransferHeader : Record "5740";

    local procedure GetItem();
    begin
        TESTFIELD("Item No.");
        IF "Item No." <> Item."No." THEN
          Item.GET("Item No.");
    end;

    local procedure GetLocation(LocationCode : Code[10]);
    begin
        IF Location.Code <> LocationCode THEN
          Location.GET(LocationCode);
    end;

    local procedure GetBin(LocationCode : Code[10];BinCode : Code[20]);
    begin
        IF BinCode = '' THEN
          CLEAR(Bin)
        ELSE
          IF Bin.Code <> BinCode THEN
            Bin.GET(LocationCode,BinCode);
    end;

    local procedure GetDefaultBin(FromLocationCode : Code[10];ToLocationCode : Code[10]);
    begin
        IF (FromLocationCode <> '') AND ("Item No." <> '') THEN BEGIN
          GetLocation(FromLocationCode);
          IF Location."Bin Mandatory" AND NOT Location."Directed Put-away and Pick" THEN BEGIN
            WMSManagement.GetDefaultBin("Item No.",'',FromLocationCode,"Transfer-from Bin Code");
            //HandleDedicatedBin(FALSE);
          END;
        END;

        IF (ToLocationCode <> '') AND ("Item No." <> '') THEN BEGIN
          GetLocation(ToLocationCode);
          IF Location."Bin Mandatory" AND NOT Location."Directed Put-away and Pick" THEN
            WMSManagement.GetDefaultBin("Item No.",'',ToLocationCode,"Transfer-To Bin Code");
        END;
    end;

    local procedure HandleDedicatedBin(IssueWarning : Boolean);
    var
        WhseIntegrationMgt : Codeunit "7317";
    begin
        //IF NOT IsInbound AND ("Quantity (Base)" <> 0) THEN
        //  WhseIntegrationMgt.CheckIfBinDedicatedOnSrcDoc("Transfer-from Code","Transfer-from Bin Code",IssueWarning);
    end;
}

