table 60047 "Campaign Lines"
{
    // version RAD,MAZDA307.1


    fields
    {
        field(1;"Campaign no";Code[20])
        {
            CaptionML = ENU='Campaign no',
                        FRA='Campgne No';
        }
        field(2;"Line No";Integer)
        {
            CaptionML = ENU='Line No',
                        FRA='Ligne No';
        }
        field(3;"Expense code";Code[20])
        {
            CaptionML = ENU='Expense code',
                        FRA='Code frais';
            TableRelation = Item.No. WHERE (Type=CONST(Service));

            trigger OnValidate();
            begin

                IF RecGItem.GET("Expense code") THEN
                  BEGIN
                   VALIDATE("Expense Description",RecGItem.Description);
                   VALIDATE(Quantity,0);
                   VALIDATE("Unit Cost",0);
                  END;
            end;
        }
        field(4;"Expense Description";Text[50])
        {
            CaptionML = ENU='Expense Description',
                        FRA='Designation frais';
        }
        field(5;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';

            trigger OnValidate();
            begin

                "Gros Estimated Cost" := Quantity * "Unit Cost" ;
                MODIFY;
            end;
        }
        field(6;"Gros Estimated Cost";Decimal)
        {
            CaptionML = ENU='Gros Estimated Cost',
                        FRA='Cout estimé Total';

            trigger OnValidate();
            begin
                IF Quantity <> 0 THEN
                  "Unit Cost" := ROUND ("Gros Estimated Cost" / Quantity * "Unit Cost" , 0.001,'=') ;

                MODIFY;
            end;
        }
        field(7;"Amount On Purchase Order";Decimal)
        {
            CalcFormula = Sum("Purchase Line".Amount WHERE (Document Type=CONST(Order),
                                                            Type=CONST(Item),
                                                            No.=FIELD(Expense code),
                                                            Campaign No=FIELD(Campaign no),
                                                            Campaign line No=FIELD(Line No)));
            CaptionML = ENU='Amount On Purchase Order',
                        FRA='Montant sur commande Achat';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"On Purchase Invoice";Decimal)
        {
            CalcFormula = Sum("Purch. Inv. Line".Amount WHERE (Type=CONST(Item),
                                                               No.=FIELD(Expense code),
                                                               Campaign No=FIELD(Campaign no),
                                                               Campaign line No=FIELD(Line No)));
            CaptionML = ENU='Amount On Purchase Invoice',
                        FRA='Montant sur facture Achat enregistré';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"Remainning Amount";Decimal)
        {
            CaptionML = ENU='Remainning Amount',
                        FRA='Montant restant';
        }
        field(10;"Unit Cost";Decimal)
        {
            CaptionML = ENU='Unit Cost',
                        FRA='Cout unitaire';

            trigger OnValidate();
            begin
                "Gros Estimated Cost" := Quantity * "Unit Cost" ;
                MODIFY;
            end;
        }
        field(11;"Buy-from Vendor No.";Code[20])
        {
            CaptionML = ENU='Buy-from Vendor No.',
                        FRA='N° fournisseur';
            TableRelation = Vendor;
        }
        field(99;"Expense code99";Code[20])
        {
            CaptionML = ENU='Expense code',
                        FRA='Code frais';
            TableRelation = IF (Type=CONST(Marketting)) Item.No. WHERE (Type=CONST(Service),
                                                                        Item type=CONST(Frais Generaux))
                                                                        ELSE IF (Type=CONST(Projet)) Item.No. WHERE (Type=CONST(Service),
                                                                                                                     Item type=CONST(Consomable));

            trigger OnValidate();
            begin

                IF RecGItem.GET("Expense code") THEN
                  BEGIN
                   VALIDATE("Expense Description",RecGItem.Description);
                   VALIDATE(Quantity,0);
                   VALIDATE("Unit Cost",0);
                  END;
            end;
        }
        field(50003;Type;Option)
        {
            CalcFormula = Lookup(Campaign.Type WHERE (No.=FIELD(Campaign no)));
            Description = 'SM MAZDA307';
            FieldClass = FlowField;
            OptionCaption = 'Marketting,Projet';
            OptionMembers = Marketting,Projet;
        }
        field(50004;"Amortissement Avance";Decimal)
        {
            CalcFormula = Sum("G/L Entry".Amount WHERE (G/L Account No.=CONST(409740),
                                                        Source Type=CONST(Vendor),
                                                        Source No.=FIELD(Buy-from Vendor No.)));
            Description = 'SM MAZDA307.1';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005;"Retenue de Garantie";Decimal)
        {
            CalcFormula = Sum("G/L Entry".Amount WHERE (G/L Account No.=CONST(401700),
                                                        Source Type=CONST(Vendor),
                                                        Source No.=FIELD(Buy-from Vendor No.)));
            Description = 'SM MAZDA307.1';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006;Avance;Decimal)
        {
            Description = 'SM MAZDA307.1';
        }
    }

    keys
    {
        key(Key1;"Campaign no","Line No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
        RecCampaign : Record "5071";
    begin

        RecGCampaignLines.SETRANGE(RecGCampaignLines."Campaign no","Campaign no");
        IF RecGCampaignLines.FINDLAST THEN
          IntLineNo += RecGCampaignLines."Line No" + 10000
          ELSE IntLineNo := 10000;

        "Line No" := IntLineNo ;
        //SM MAZDA307
        RecCampaign.GET("Campaign no");
        Type := RecCampaign.Type;
        //END SM
    end;

    var
        RecGItem : Record "27";
        RecGCampaignLines : Record "60047";
        IntLineNo : Integer;
}

