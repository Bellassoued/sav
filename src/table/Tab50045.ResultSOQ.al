table 50045 "Result SOQ"
{
    // version Reappro TYT V01

    DrillDownPageID = 60384;
    LookupPageID = 60384;

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Item No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item.No.;

            trigger OnValidate();
            begin
                ItemMaster.RESET;
                ItemMaster.SETRANGE("No.","Item No.");
                IF ItemMaster.FINDFIRST THEN
                  BEGIN
                    "EPM Non Reorder Code" := ItemMaster."EPM Non Reorder Code";
                    "Substitution codes" :=  ItemMaster."Substitution code";
                    "Unit pack code"   := ItemMaster."Unit pack code" ;
                    "Not used anymore"  := ItemMaster."Not used anymore";
                    "Source Code" := ItemMaster."Source Code";
                    "Sub Supplier Code" := ItemMaster."Sub Supplier Code";
                    "Origin Code" := ItemMaster."Origin Code" ;
                    "Non Stock Code" := ItemMaster."Non Stock Code";
                    "Max qty via VOR" := ItemMaster."Max qty via VOR";
                    "Tariff code" := ItemMaster."Tariff code";
                    "Distribution Code" := ItemMaster."Distribution Code";
                    "Qty in package" := ItemMaster."Qty in package";
                    CodeNGP.RESET;
                    CodeNGP.SETRANGE(Code,"Tariff code");
                    IF CodeNGP.FINDFIRST THEN
                        "Controle technique" := CodeNGP."Controle Technique";
                    "TMC Stock Code" := ItemMaster."TMC Stock Code";
                    "Accessory Code" := ItemMaster."Accessory Code";
                    "Product Code" := ItemMaster."Product Code";
                  END;
                LrecCountryRegion.RESET;
                LrecCountryRegion.SETRANGE(Code,"Origin Code");
                IF LrecCountryRegion.FINDFIRST THEN
                  BEGIN
                    IF  LrecCountryRegion.Devise <> '' THEN
                       Eur1 := TRUE
                  END;


                Item.GET("Item No.");
                "Sur Commande" := Item."Sur commande";
            end;
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;MAD;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Order Cycle";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Lead Time";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"S/S For L/T";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"S/S For Demand";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"On Hand";Decimal)
        {
            Caption = '" Stock actuel"';
            DataClassification = ToBeClassified;
        }
        field(10;"On Order";Decimal)
        {
            Caption = 'Stock en cours';
            DataClassification = ToBeClassified;
        }
        field(11;"B/O";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;SOQ;Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:0;
        }
        field(13;ICC;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14;FC;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Product Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Créer Commande Achat";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No Commande Achat";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Date insert";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(75;"EPM Non Reorder Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'This code contains the actual reject code from the parts master';
        }
        field(80;"Substitution codes";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'value 1 -> 1 to 1 sumbstitution, other values 1 to many substitution';
        }
        field(85;"Unit pack code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code to determine if the distributor POL should be checked';
        }
        field(86;"Not used anymore";Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(90;"Source Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'A=TMC, Z= local part,….';
        }
        field(91;"Sub Supplier Code";Code[5])
        {
            DataClassification = ToBeClassified;
        }
        field(92;"Origin Code";Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'It contains the same values as Country code';
        }
        field(93;"Non Stock Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = '1=stocked at TPCE and available, 2= stocked at TPCE but not avialble,….';
        }
        field(96;"Max qty via VOR";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Maximum quantity to order via VOR.';
        }
        field(97;"Tariff code";Code[8])
        {
            DataClassification = ToBeClassified;
            Description = 'To determine the classification of payments of custom tariff.';
        }
        field(98;"TMC Stock Code";Code[2])
        {
            DataClassification = ToBeClassified;
            Description = '0 = TMC Stock parts, 1 = TMC not Stock parts';
        }
        field(99;"Accessory Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'P = Part, A = Accessories, S = Service tool';
        }
        field(100;"Purchase Order Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",SNS,SNC,SNE,SVS,SVC,SVE,CDS,CDC,CDE,CVS,CVC,CVE,CCS,EPC,SST,DEF,CPG,CVA;
        }
        field(101;"Ancien MAD";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(102;"Standard Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(103;"Distribution Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Code indicating who is responsible to supply the goods towards distributors old style';
        }
        field(104;"Qty in package";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'The number of parts within one package. (Purchase Order Lot or Unit Pack Quantity)';
        }
        field(60078;"Dern. Date Vente";Date)
        {
            CalcFormula = Max("Item Ledger Entry"."Posting Date" WHERE (Item No.=FIELD(Item No.),
                                                                        Entry Type=FILTER(Sale)));
            Description = 'SM MAZDA500';
            FieldClass = FlowField;
        }
        field(60080;"Dern. Date Achat";Date)
        {
            CalcFormula = Max("Item Ledger Entry"."Posting Date" WHERE (Item No.=FIELD(Item No.),
                                                                        Entry Type=FILTER(Purchase)));
            Description = 'SM MAZDA500';
            FieldClass = FlowField;
        }
        field(70064;"Dern. Date Vente Histo.";Date)
        {
            CalcFormula = Max("Archive Item Ledger Entry"."Posting Date" WHERE (Item No.=FIELD(Item No.),
                                                                                Entry Type=FILTER(Sale)));
            FieldClass = FlowField;
        }
        field(70065;"Dern. Date Achat Histo.";Date)
        {
            CalcFormula = Max("Archive Item Ledger Entry"."Posting Date" WHERE (Item No.=FIELD(Item No.),
                                                                                Entry Type=FILTER(Purchase)));
            FieldClass = FlowField;
        }
        field(70066;Eur1;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70067;"Controle technique";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70068;"Sur Commande";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70069;"SCC Manual";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70070;"SCC Auto";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(70071;"Warning Output Crietria";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70072;"Qté Réserver";Decimal)
        {
            CalcFormula = Sum("Transfer Line"."Outstanding Qty. (Base)" WHERE (Derived From Line No.=CONST(0),
                                                                               Item No.=FIELD(Item No.)));
            FieldClass = FlowField;
        }
        field(70073;"Short stock warning";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70074;"Mois Saisonalite";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70075;"Mois +1 Saisonalite";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70076;modele;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ItemMaster : Record "70007";
        LrecCountryRegion : Record "9";
        CodeNGP : Record "70048";
        Item : Record "27";
}

