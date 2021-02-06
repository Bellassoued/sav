table 50068 "Entête OR"
{

    fields
    {
        field(1;"Document Type";Text[30])
        {
        }
        field(2;"Sell-to Customer No.";Code[20])
        {
        }
        field(3;"No.";Code[20])
        {
        }
        field(4;"Bill-to Customer No.";Code[20])
        {
        }
        field(5;"Bill-to Name";Text[50])
        {
        }
        field(6;"Your Reference";Code[20])
        {
        }
        field(7;"Order Date";Date)
        {
        }
        field(8;"Posting Date";Date)
        {
        }
        field(9;"Payment Terms Code";Code[20])
        {
        }
        field(10;"Location Code";Code[20])
        {
        }
        field(11;"Department Code";Code[20])
        {
        }
        field(12;"Make Code";Code[20])
        {
        }
        field(13;"Customer Posting Group";Code[20])
        {
        }
        field(14;"Salesperson Code";Code[20])
        {
        }
        field(15;Amount;Decimal)
        {
        }
        field(16;"Amount Including VAT";Decimal)
        {
        }
        field(17;"Gen. Bus. Posting Group";Code[20])
        {
        }
        field(18;"Sell-to Customer Name";Text[50])
        {
        }
        field(19;"Document Date";Date)
        {
        }
        field(20;"External Document No.";Code[20])
        {
        }
        field(21;"Montant Limite Autorise";Decimal)
        {
        }
        field(22;VIN;Code[30])
        {
        }
        field(23;"License No.";Code[20])
        {
        }
        field(24;Mileage;Integer)
        {
        }
        field(25;"Model Code";Code[20])
        {
        }
        field(26;"Model No.";Code[20])
        {
        }
        field(27;"Prod. Year";Date)
        {
        }
        field(28;Model;Text[50])
        {
        }
        field(29;Type;Text[30])
        {
        }
        field(30;"Initial Registration";Code[20])
        {
        }
        field(31;"Service Advisor No./Pick-Up";Code[20])
        {
        }
        field(32;"N° OR Créé";Code[20])
        {
        }
        field(33;Erreur;Boolean)
        {
        }
        field(34;"A Integrer";Boolean)
        {
        }
        field(35;"Traité le";DateTime)
        {
        }
        field(36;"Traité par";Code[50])
        {
        }
        field(37;"OR Inséré";Boolean)
        {
            CalcFormula = Exist("Reception SAV" WHERE (Reception No=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(38;"Texte erreur";Text[250])
        {
        }
        field(39;"Commande existe";Boolean)
        {
            CalcFormula = Exist("Service Header" WHERE (No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(41;"Importé";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Document Type","No.")
        {
        }
        key(Key2;"Sell-to Customer No.","Document Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        IF "Document Date">=010117D THEN
          "A Integrer":=TRUE
        ELSE IF  ("No." IN ['CH-08-CVA00101','CH-16-CVA08483','CH-16-CVA14505','CH-16-CVA19957','CH-16-CVA20647','CH-16-CVA21335','NA-13-CVA00298','NA-16-CVA00146','NA-16-CVA03195','NA-17-CVA00126','SF-15-CVA06919','SF-16-CVA02002','SF-17-CVA00303'])
        THEN
          "A Integrer":=TRUE
        ELSE IF  ("No." IN ['SO-16-CVA03040','SO-16-CVA03648','SO-16-CVA06889']) THEN
            "A Integrer":=TRUE
        ELSE
          "A Integrer":=FALSE;
    end;
}

