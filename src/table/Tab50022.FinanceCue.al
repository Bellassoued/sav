table 50022 "Finance -Cue"
{
    // version NAVW19.00

    CaptionML = ENU='Finance Cue',
                FRA='Pile finance';

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            CaptionML = ENU='Primary Key',
                        FRA='Clé primaire';
        }
        field(2;"Overdue Sales Documents";Integer)
        {
            CalcFormula = Count("Cust. Ledger Entry" WHERE (Document Type=FILTER(Invoice|Credit Memo),
                                                            Due Date=FIELD(Overdue Date Filter),
                                                            Open=CONST(Yes)));
            CaptionML = ENU='Overdue Sales Documents',
                        FRA='Documents vente échus';
            FieldClass = FlowField;
        }
        field(3;"Purchase Invoices Due Today";Integer)
        {
            CalcFormula = Count("Vendor Ledger Entry" WHERE (Document Type=FILTER(Invoice|Credit Memo),
                                                             Due Date=FIELD(Due Date Filter),
                                                             Open=CONST(Yes)));
            CaptionML = ENU='Purchase Invoices Due Today',
                        FRA='Factures achat échues aujourd''hui';
            FieldClass = FlowField;
        }
        field(11;"Customers - Blocked";Integer)
        {
            CalcFormula = Count(Customer WHERE (Blocked=FILTER(<>' ')));
            CaptionML = ENU='Customers - Blocked',
                        FRA='Clients - Bloqués';
            FieldClass = FlowField;
        }
        field(20;"Due Date Filter";Date)
        {
            CaptionML = ENU='Due Date Filter',
                        FRA='Filtre échéance';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21;"Overdue Date Filter";Date)
        {
            CaptionML = ENU='Overdue Date Filter',
                        FRA='Filtre échus';
            FieldClass = FlowFilter;
        }
        field(28;"User ID Filter";Code[50])
        {
            CaptionML = ENU='User ID Filter',
                        FRA='Filtre code utilisateur';
            FieldClass = FlowFilter;
        }
        field(50014;"Date Filter Jour";Date)
        {
            Description = 'KT13022017';
            FieldClass = FlowFilter;
        }
        field(50018;"Solde chèques en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(20000|236875|226875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50019;"Nombre chèques en coffre";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(20000)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50020;"Solde effets en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(20000)));
            Description = '                                       : Effet  Client';
            FieldClass = FlowField;
        }
        field(50021;"Nombre effets en coffre";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(20000)));
            Description = '                                       : Effet  Client';
            FieldClass = FlowField;
        }
        field(50022;"Versement chèques";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Status No.=FILTER(92500),
                                                                    Copied To No.=FILTER(''),
                                                                    Payment Class=FILTER(ENC-Ch-CLT)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50023;"Versement effets";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(TRAITE),
                                                                   En Banque=FILTER(Yes),
                                                                   Posting Date=FIELD(Date Filter Jour)));
            Description = '                                       : Effet   Client';
            FieldClass = FlowField;
        }
        field(50024;"Versement espèce";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(ESPÈCE),
                                                                   En Banque=FILTER(Yes),
                                                                   Posting Date=FIELD(Date Filter Jour)));
            Description = '                                       : Espèce';
            FieldClass = FlowField;
        }
        field(50025;FiltreCoffre;Code[20])
        {
        }
        field(50026;"Mnt Chèq. Impay. Client Grp";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50027;"Nbr. Chèq. Impay. Client Grp";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(50028;"Mnt Effets Impayés Client Grp";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(50029;"Nbr Effets Impayés Client Grp";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(50030;"Solde Clients";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)");
            FieldClass = FlowField;
        }
        field(50031;"Solde Fournisseurs";Decimal)
        {
            CalcFormula = -Sum("Detailed Vendor Ledg. Entry"."Amount (LCY)");
            FieldClass = FlowField;
        }
        field(50032;"Acheteurs Bloqués";Integer)
        {
            CalcFormula = Count(Customer WHERE (Blocked=FILTER(<>' ')));
            FieldClass = FlowField;
        }
        field(50033;"Fournisseurs Bloqués";Integer)
        {
            CalcFormula = Count(Vendor WHERE (Blocked=FILTER(<>' ')));
            FieldClass = FlowField;
        }
        field(50063;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(70031;"Mnt Chèq. Impay. Client H.G";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(70032;"Nbr. Chèq. Impay. Client H.G";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-Ch-CLT),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875)));
            Description = '                                       : Chèque Client';
            FieldClass = FlowField;
        }
        field(70033;"Mnt Effets Impayés Client H.G";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-EFF),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(70034;"Nbr Effets Impayés Client H.G";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-EFF),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(126875)));
            Description = '                                       : Effet Client';
            FieldClass = FlowField;
        }
        field(70035;"Mnt Cautions Prov.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=CONST(CAUTION PROV),
                                                           Status No.=CONST(20000)));
            Caption = 'Cautions provisoires ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(70036;"Mnt Cautions Def.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=CONST(CAUTION DEFINITIVE),
                                                           Status No.=CONST(20000)));
            Caption = 'Cautions définitives ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
        field(70037;"Mnt Cautions Gar.Ouver";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=CONST(CAUTION GARANTIE),
                                                                   Status No.=CONST(20000)));
            Caption = 'Cautions de retenue garantie ouvertes';
            Description = 'KT13022017                    : Caution';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

