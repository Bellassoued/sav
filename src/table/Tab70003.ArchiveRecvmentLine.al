table 70003 "Archive Recvment Line"
{
    // version CT16V002

    CaptionML = ENU='Archived Recovry Line',
                FRA='Archive Recvment Line';

    fields
    {
        field(1;"No. Bord. Recouvrement";Code[20])
        {
            CaptionML = ENU='No. Slip Cover',
                        FRA='No. Bordereau Recouvrement';
        }
        field(2;"No. Ligne";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(3;"No. Facture";Code[20])
        {
            CaptionML = ENU='No. Invoice',
                        FRA='No. Facture';
            Editable = false;
            TableRelation = "Sales Invoice Header";
        }
        field(4;"Mnt TTC Facture";Decimal)
        {
            CaptionML = ENU='Invoice Amount',
                        FRA='Montant Facturé';
            Editable = false;
        }
        field(5;"Date Echéance";Date)
        {
            CaptionML = ENU='Due Date',
                        FRA='Date Echéance';
            Editable = false;
        }
        field(6;"Code Client";Code[20])
        {
            CaptionML = ENU='Customer',
                        FRA='Client';
            Editable = false;
            TableRelation = Customer;
        }
        field(7;"Nom Client";Text[80])
        {
            CaptionML = ENU='Customer Name',
                        FRA='Nom Client';
            Editable = false;
        }
        field(8;"Date Recep. Decharge";Date)
        {
            CaptionML = ENU='Reception Discharge Date',
                        FRA='Date Reception Décharge';
        }
        field(9;"Réception Décharge";Boolean)
        {
            CaptionML = ENU='Reception Discharge',
                        FRA='Réception Décharge';
        }
        field(10;"Reglé";Boolean)
        {
            CaptionML = ENU='Paid',
                        FRA='Reglé';
        }
        field(12;Etape;Option)
        {
            CaptionML = ENU='Steep',
                        FRA='Etape';
            OptionCaptionML = ENU=' ,Remis coursier,Reception décharge',
                              FRA=' ,Remis coursier,Reception décharge';
            OptionMembers = " ","Remis coursier","Reception décharge";
        }
        field(13;"Date Facture";Date)
        {
            CaptionML = ENU='Invoice Date',
                        FRA='Date Facture';
            Editable = false;
        }
        field(14;"Date reglement";Date)
        {
            CalcFormula = Lookup("Detailed Cust. Ledg. Entry"."Posting Date" WHERE (Cust. Ledger Entry No.=FIELD(No Sequence Document No.),
                                                                                    Entry Type=FILTER(Application)));
            CaptionML = ENU='Payment Date',
                        FRA='Date réglement';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"Mnt Reglement";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Cust. Ledger Entry No.=FIELD(No Sequence Document No.),
                                                                         Entry Type=FILTER(Application)));
            CaptionML = ENU='Payment amount',
                        FRA='Montant réglement';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"Ecart date Ech. Regl.";Integer)
        {
            CaptionML = ENU='Discard Due Payment Date',
                        FRA='Ecart Date Echéance  Réglement';
            Editable = false;
        }
        field(17;"Mnt Ouvert";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Cust. Ledger Entry No.=FIELD(No Sequence Document No.)));
            CaptionML = ENU='Open Amount',
                        FRA='Montant Ouvert';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18;"Address Client";Text[80])
        {
            CaptionML = ENU='Customer address',
                        FRA='Address Client';
        }
        field(19;Commentaire;Text[250])
        {
            CaptionML = ENU='Comment',
                        FRA='Commentaire';
        }
        field(20;"Code coursier";Code[20])
        {
            CaptionML = ENU='Steed Code',
                        FRA='Code coursier';
            TableRelation = Employee;
        }
        field(21;"Nom coursier";Text[80])
        {
            CaptionML = ENU='steed Name',
                        FRA='Nom Coursier';
        }
        field(22;"Remis Coursier";Boolean)
        {
        }
        field(23;"Date Remis Coursier";Date)
        {
            Editable = false;
        }
        field(24;Selected;Boolean)
        {
        }
        field(25;"No Sequence Document No.";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"No. Bord. Recouvrement","No. Ligne")
        {
        }
    }

    fieldgroups
    {
    }
}

