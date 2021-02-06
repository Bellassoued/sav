table 70040 "Ligne Simulation D.Douanes"
{

    fields
    {
        field(1;"No. Document";Code[20])
        {
        }
        field(2;"No. Expédition";Code[20])
        {
        }
        field(3;MODEL;Code[30])
        {
            Description = 'Item No.';

            trigger OnValidate();
            begin
                CLEAR(Item);
                Item.GET(MODEL);
                Désignation := Item.Description;
            end;
        }
        field(4;"Désignation";Code[50])
        {
        }
        field(5;"% DC";Decimal)
        {
        }
        field(6;"% TVA";Decimal)
        {
        }
        field(7;"% RDP";Decimal)
        {
        }
        field(8;"Quantité";Decimal)
        {
        }
        field(9;"Mnt en EURO";Decimal)
        {
        }
        field(10;"Mnt TND";Decimal)
        {
        }
        field(11;FRET;Decimal)
        {
        }
        field(12;ASSURANCE;Decimal)
        {
        }
        field(13;"Valeur en Douane";Decimal)
        {
        }
        field(14;"Droit Douane";Decimal)
        {
        }
        field(16;TVA;Decimal)
        {
        }
        field(17;RDP;Decimal)
        {
        }
        field(18;"Interêt / OB";Decimal)
        {
        }
        field(19;"Remise / OB";Decimal)
        {
        }
        field(21;"Total Obligation";Decimal)
        {
        }
        field(45;"T.P";Decimal)
        {
        }
        field(46;"Code article";Code[20])
        {
            TableRelation = Item.No.;
        }
        field(47;"No. Ligne Expédition";Integer)
        {
        }
        field(48;"Type VN";Option)
        {
            OptionCaption = '" ,VP,VU"';
            OptionMembers = " ",VP,VU;
        }
        field(49;"Code NGP";Code[20])
        {
        }
        field(50;"Port de Provenance";Code[20])
        {
        }
        field(51;"PU en Euro";Decimal)
        {
        }
        field(52;"Minoration/Unité";Decimal)
        {
        }
        field(53;"PU Remisé";Decimal)
        {
        }
        field(54;"Mnt en EURO Remisé";Decimal)
        {
        }
        field(55;"Mnt TND Remisé";Decimal)
        {
        }
        field(56;"Droit de consommation";Decimal)
        {
        }
        field(57;Fodec;Decimal)
        {
        }
        field(58;"INT /OC";Decimal)
        {
        }
        field(59;"REM/OC";Decimal)
        {
        }
        field(60;"Frais Avis";Decimal)
        {
        }
        field(61;ISPS;Decimal)
        {
        }
        field(62;"Frais débarquement";Decimal)
        {
        }
        field(63;"HAM 10% F.Débarq.";Decimal)
        {
        }
        field(64;CARB_VN;Decimal)
        {
        }
        field(65;FR_HOMOLOG;Decimal)
        {
        }
        field(66;GARD_VN;Decimal)
        {
        }
        field(67;HON_VN;Decimal)
        {
        }
        field(68;MAG_VN;Decimal)
        {
        }
        field(69;PENAL_VN;Decimal)
        {
        }
        field(70;TRANSIT_VN;Decimal)
        {
        }
        field(71;TRANSP_VN;Decimal)
        {
        }
        field(72;MANUT_VN;Decimal)
        {
        }
        field(73;"Frais L/C sans Minoration";Decimal)
        {
        }
        field(74;"Frais Achat à Terme Sans Mino";Decimal)
        {
        }
        field(75;"Frais L/C Avec Minoration";Decimal)
        {
        }
        field(76;"Frais Achat à Terme Avec Mino";Decimal)
        {
        }
        field(77;"Cout sans Minoration";Decimal)
        {
        }
        field(78;"Cout avec Minoration";Decimal)
        {
        }
        field(79;"Cout sans Mino /charge Fin";Decimal)
        {
        }
        field(80;"Cout avec Mino /charge Fin";Decimal)
        {
        }
        field(81;"Prix de Vente";Decimal)
        {
        }
        field(82;"% Marge Brut sans Minoration";Decimal)
        {
        }
        field(83;"% Marge Brut avec Minoration";Decimal)
        {
        }
        field(84;"ASSURANCE-Av-Mino";Decimal)
        {
        }
        field(85;"Valeur en Douane-Av-Mino";Decimal)
        {
        }
        field(86;"Droit Douane-Av-Mino";Decimal)
        {
        }
        field(87;"TVA-Av-Mino";Decimal)
        {
        }
        field(88;"RDP-Av-Mino";Decimal)
        {
        }
        field(89;"Droit de consommation-Av-Mino";Decimal)
        {
        }
        field(90;"Fodec-Av-Mino";Decimal)
        {
        }
        field(100;"INT /OC-Av-Mino";Decimal)
        {
        }
        field(101;"REM/OC-Av-Mino";Decimal)
        {
        }
        field(102;"ISPS-Av-Mino";Decimal)
        {
        }
        field(103;"Frais débarquement-Av-Mino";Decimal)
        {
        }
        field(104;"HAM 10% F.Débarq.-Av-Mino";Decimal)
        {
        }
        field(105;"Sales Type";Option)
        {
            Caption = 'Type vente';
            OptionCaption = 'Client,Groupe tarifs client,Tous les clients,Campagne';
            OptionMembers = Customer,"Customer Price Group","All Customers",Campaign;
        }
        field(106;"Sales Code";Code[10])
        {
            Caption = 'Code vente';
            TableRelation = IF (Sales Type=CONST(Customer Price Group)) "Customer Price Group"
                            ELSE IF (Sales Type=CONST(Customer)) Customer
                            ELSE IF (Sales Type=CONST(Campaign)) Campaign;
        }
        field(107;"No. Proforma";Code[20])
        {
        }
        field(108;"Total DD/Mino";Decimal)
        {
        }
        field(109;"Total Obligation/Mino";Decimal)
        {
        }
        field(110;"Total Obligation/Comptant";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"No. Document","No. Ligne Expédition")
        {
        }
        key(Key2;"No. Proforma")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Item : Record "27";
}

