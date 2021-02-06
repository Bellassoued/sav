table 60035 "Préconisation Article"
{
    // version MAZDA1003


    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Designation';
        }
        field(3;"Quantié à commander";Decimal)
        {
        }
        field(4;"Bool Modifié";Boolean)
        {
        }
        field(5;"Modèle PR";Text[30])
        {
        }
        field(6;"Product group code";Code[20])
        {
            CaptionML = ENU='Product group code',
                        FRA='Code sous famille';
            TableRelation = "Product Group".Code WHERE (Item Category Code=FILTER(PDR|ACCESSOIRE));
        }
        field(7;"vendor No.";Code[20])
        {
            CaptionML = ENU='vendor No.',
                        FRA='Code Fournisseur';
            TableRelation = Vendor.No.;
        }
        field(8;Stock;Decimal)
        {
        }
        field(9;"Consommation moyenne";Decimal)
        {
        }
        field(10;Qmax;Decimal)
        {
        }
        field(11;"stock dispo vente";Decimal)
        {
        }
        field(12;"qty sur cde achat";Decimal)
        {
        }
        field(60050;"Sales 2008 (QTY)";Decimal)
        {
            Description = 'SM';
        }
        field(60051;"Sales 2009 (QTY)";Decimal)
        {
            Description = 'SM';
        }
        field(60052;"Sales 2010 (QTY)";Decimal)
        {
            Description = 'SM';
        }
        field(60053;"Sales 2011 (QTY)";Decimal)
        {
            Description = 'SM';
        }
        field(60054;"Sales 2012 (QTY)";Decimal)
        {
            Description = 'SM';
        }
        field(60055;"Sales 2013 (QTY)";Decimal)
        {
            Description = 'SM';
        }
        field(60056;JANVIER;Decimal)
        {
            Description = 'SM';
        }
        field(60057;FEVRIER;Decimal)
        {
            Description = 'SM';
        }
        field(60058;MARS;Decimal)
        {
            Description = 'SM';
        }
        field(60059;AVRIL;Decimal)
        {
            Description = 'SM';
        }
        field(60060;MAI;Decimal)
        {
            Description = 'SM';
        }
        field(60061;JUIN;Decimal)
        {
            Description = 'SM';
        }
        field(60062;JUILLET;Decimal)
        {
            Description = 'SM';
        }
        field(60063;AOUT;Decimal)
        {
            Description = 'SM';
        }
        field(60064;SEPTEMBRE;Decimal)
        {
            Description = 'SM';
        }
        field(60065;OCTOBRE;Decimal)
        {
            Description = 'SM';
        }
        field(60066;NOVEMBRE;Decimal)
        {
            Description = 'SM';
        }
        field(60067;DECEMBRE;Decimal)
        {
            Description = 'SM';
        }
        field(60068;"Date dernier Commande Achat";Date)
        {
            Description = 'SM';
        }
        field(60069;"Age Stock (mois)";Integer)
        {
            Description = 'SM';
        }
        field(60070;"Quantité Préconisé";Decimal)
        {
            Description = 'SM';
        }
        field(60071;"Sales 2014 (QTY)";Decimal)
        {
            Description = 'SM';
        }
        field(60072;"Quantité Min";Decimal)
        {
            Description = 'SM';
        }
        field(60073;"Sales M-1";Decimal)
        {
            Caption = 'Ventes M-1';
            Description = 'SM MAZDA315';
        }
        field(60074;"Sales M-2";Decimal)
        {
            Caption = 'Ventes M-2';
            Description = 'SM MAZDA315';
        }
        field(60075;"Sales M-3";Decimal)
        {
            Caption = 'Ventes M-3';
            Description = 'SM MAZDA315';
        }
        field(60076;"Sales M-4";Decimal)
        {
            Caption = 'Ventes M-4';
            Description = 'SM MAZDA315';
        }
        field(60077;"Sales M-5";Decimal)
        {
            Caption = 'Ventes M-5';
            Description = 'SM MAZDA315';
        }
        field(60078;"Sales M-6";Decimal)
        {
            Caption = 'Ventes M-6';
            Description = 'SM MAZDA315';
        }
        field(60079;"Sales M-7";Decimal)
        {
            Caption = 'Ventes M-7';
            Description = 'SM MAZDA315';
        }
        field(60080;"Sales M-8";Decimal)
        {
            Caption = 'Ventes M-8';
            Description = 'SM MAZDA315';
        }
        field(60081;"Sales M-9";Decimal)
        {
            Caption = 'Ventes M-9';
            Description = 'SM MAZDA315';
        }
        field(60082;"Sales M-10";Decimal)
        {
            Caption = 'Ventes M-10';
            Description = 'SM MAZDA315';
        }
        field(60083;"Sales M-11";Decimal)
        {
            Caption = 'Ventes M-11';
            Description = 'SM MAZDA315';
        }
        field(60084;"Sales M-12";Decimal)
        {
            Caption = 'Ventes M-12';
            Description = 'SM MAZDA315';
        }
        field(60085;"Qté Min";Decimal)
        {
        }
        field(60086;"Code Modèle";Text[50])
        {
            Description = 'SM';
            Editable = false;
        }
        field(60087;"Article Racine";Code[20])
        {
            Description = 'SM MAZDA1003';
        }
        field(60088;"Sales 2015 (QTY)";Decimal)
        {
            Description = 'SM MAZDA1003';
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
        key(Key2;"Article Racine")
        {
        }
    }

    fieldgroups
    {
    }
}

