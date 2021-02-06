table 50104 "Vente Article Par Magasin"
{
    // version Reappro TYT V01

    DrillDownPageID = 50163;
    LookupPageID = 50163;

    fields
    {
        field(1;"Code Article";Code[20])
        {
            TableRelation = Item;
        }
        field(3;"Année";Integer)
        {
        }
        field(4;Mois;Option)
        {
            OptionCaption = ',1,2,3,4,5,6,7,8,9,10,11,12';
            OptionMembers = ,"1","2","3","4","5","6","7","8","9","10","11","12";
        }
        field(5;"Qtée Vendue SAV";Decimal)
        {
        }
        field(6;"Qtée Vendue PR N";Decimal)
        {
        }
        field(7;"Qtée Vendue";Decimal)
        {
        }
        field(8;"Qtée Vendue SAV CS";Decimal)
        {
        }
        field(9;"Qtée Vendue VPR CS";Decimal)
        {
        }
        field(10;"Qtée Vendue CS";Decimal)
        {
        }
        field(11;"Qtée Vendue PR N-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Qtée Vendue PR N-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Qtée Vendue PR N-3";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Qtée Vendue PR N-4";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Qtée Vendue PR N-5";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Qtée Vendue PR N-6";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Qtée Vendue PR N-7";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Qtée Vendue PR N-8";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Qtée Vendue PR N-9";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Qtée Vendue PR N-10";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Qtée Vendue PR N-11";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Qtée Vendue PR Y";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Qtée Vendue PR Y-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Qtée Vendue PR Y-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Ref Remplacante";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Qtée Vendue PR  Remp N-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Qtée Vendue PR  Remp N-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Qtée Vendue PR  Remp N-3";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Qtée Vendue PR  Remp N-4";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Qtée Vendue PR  Remp N-5";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Qtée Vendue PR  Remp N-6";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Qtée Vendue PR  Remp N-7";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Qtée Vendue PR Remp N-8";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Qtée Vendue PR  Remp N-9";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Qtée Vendue PR  Remp N-10";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Qtée Vendue PR  Remp N-11";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Qtée Vendue PR Remp Y";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Qtée Vendue PR  Remp Y-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Qtée Vendue PR  Remp Y-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Qtée Vendue PR  Remp N";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Qtée Mqt PR N";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(42;"Qtée Mqt PR N-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Qtée Mqt PR N-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Qtée Mqt PR N-3";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Qtée Mqt PR N-4";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Qtée Mqt PR N-5";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(47;"Qtée Mqt PR N-6";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(48;"Qtée Mqt PR N-7";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(49;"Qtée Mqt PR N-8";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50;"Qtée Mqt PR N-9";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(51;"Qtée Mqt PR N-10";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(52;"Qtée Mqt PR N-11";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(53;"Qtée Mqt PR Y";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(54;"Qtée Mqt PR Y-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(55;"Qtée Mqt PR Y-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(56;"Qtée Mqt PR Remp N";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57;"Qtée Mqt PR Remp N-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(58;"Qtée Mqt PR Remp N-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59;"Qtée Mqt PR Remp N-3";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60;"Qtée Mqt PR Remp N-4";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(61;"Qtée Mqt PR Remp N-5";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(62;"Qtée Mqt PR Remp N-6";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(63;"Qtée Mqt PR Remp N-7";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(64;"Qtée Mqt PR Remp N-8";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(65;"Qtée Mqt PR Remp N-9";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(66;"Qtée Mqt PR Remp N-10";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67;"Qtée Mqt PR Remp N-11";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(68;"Qtée Mqt PR Remp Y";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69;"Qtée Mqt PR Remp Y-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70;"Qtée Mqt PR Remp Y-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(71;"Date Insert";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(72;"Qtée Vendue PR N + 1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(73;"Code Magasin";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(61000;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            DataClassification = ToBeClassified;
            Description = 'SM MAZDA671';
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(Key1;"Code Article","Responsibility Center")
        {
        }
    }

    fieldgroups
    {
    }
}

