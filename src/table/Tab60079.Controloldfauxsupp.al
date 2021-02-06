table 60079 "Control old faux supp"
{
    // version SAV Automobile

    // //Etat des champs :
    // //5 : vide
    // //1 : Bon
    // //0 : Défectueux


    fields
    {
        field(1;Id;Code[10])
        {
        }
        field(2;"Date de Creation";Date)
        {
        }
        field(3;"Cree par";Code[20])
        {
        }
        field(4;"Etat du vitre et parrebrise";Integer)
        {
            InitValue = 5;
        }
        field(6;"Etat carrosserie et peinture";Integer)
        {
            InitValue = 5;
        }
        field(7;"Etat des feux arriere";Integer)
        {
            InitValue = 5;
        }
        field(8;"Etat des feux avant";Integer)
        {
            InitValue = 5;
        }
        field(9;"Etat des feux AB";Integer)
        {
            InitValue = 5;
        }
        field(10;"Etat des balais essuie-glace";Integer)
        {
            InitValue = 5;
        }
        field(11;"Etat des pneus avant";Integer)
        {
            InitValue = 5;
        }
        field(12;"Etat des pneus arriere";Integer)
        {
            InitValue = 5;
        }
        field(13;"Roue se secours";Integer)
        {
            InitValue = 5;
        }
        field(14;"Cric et manivelle";Integer)
        {
            InitValue = 5;
        }
        field(15;"Allume Cigare";Integer)
        {
            InitValue = 5;
        }
        field(16;Extincteur;Integer)
        {
            InitValue = 5;
        }
        field(17;"Boite pharmacie";Integer)
        {
            InitValue = 5;
        }
        field(18;"Poste radio";Integer)
        {
            InitValue = 5;
        }
        field(19;"Papier vehicule";Integer)
        {
            InitValue = 5;
        }
        field(20;"Fuel Gauge";Decimal)
        {
            CaptionML = ENU='Fuel Gauge',
                        FRA='Jauge de carburant';
        }
        field(21;"Lumineux Tableau de borad";Integer)
        {
            InitValue = 5;
        }
        field(22;"Desc Lumineux Tableau de borad";Text[30])
        {
        }
        field(23;Kilometrage;Integer)
        {
        }
        field(24;"Voir les piece remplacer";Integer)
        {
            InitValue = 5;
        }
        field(25;"origine piece";Integer)
        {
            InitValue = 5;
        }
        field(26;Remarques;Text[200])
        {
        }
        field(27;"Picture a imprimer";BLOB)
        {
            CaptionML = ENU='Picture to print',
                        FRA='Image a imprimer';
            SubType = Bitmap;
        }
        field(28;"Image a afficher";BLOB)
        {
            CaptionML = ENU='Picture to show',
                        FRA='Image a afficher';
            SubType = Bitmap;
        }
        field(29;"Etat des plaques de police";Integer)
        {
            InitValue = 5;
        }
        field(30;"Etat des feux avant/arriére";Integer)
        {
            InitValue = 5;
        }
        field(31;"Etat des pneus";Integer)
        {
            InitValue = 5;
        }
        field(32;"Circuit de suspensions";Integer)
        {
            InitValue = 5;
        }
        field(33;"Etat de transmissions / Rotule";Integer)
        {
            InitValue = 5;
        }
        field(34;"Etat de fixation échappement";Integer)
        {
            InitValue = 5;
        }
        field(35;"Etanchéité / état des graines";Integer)
        {
            InitValue = 5;
        }
        field(36;"Etat des disques et plaquettes";Integer)
        {
            InitValue = 5;
        }
        field(37;"Huile moteur";Integer)
        {
            InitValue = 5;
        }
        field(38;"Liquide de refroidissement";Integer)
        {
            InitValue = 5;
        }
        field(39;"Liquide freins ou LHM ou LDS";Integer)
        {
            InitValue = 5;
        }
        field(40;"Liquide  de direction";Integer)
        {
            InitValue = 5;
        }
        field(41;"Etat de batterie";Integer)
        {
            InitValue = 5;
        }
        field(42;"Pré-Contôle Technique";Integer)
        {
            InitValue = 5;
        }
        field(43;"Bilan Climatisation";Integer)
        {
            InitValue = 5;
        }
        field(44;"Réparation pare-brise";Integer)
        {
            InitValue = 5;
        }
        field(45;"Même incident (retour atelier)";Integer)
        {
            InitValue = 5;
        }
        field(46;"Existence de compagne(s) rappe";Integer)
        {
            InitValue = 5;
        }
        field(47;"Fiche incident client";Integer)
        {
            InitValue = 5;
        }
        field(48;"Essai routier avec le client";Integer)
        {
            InitValue = 5;
        }
        field(49;"Photo expertise";Integer)
        {
            InitValue = 5;
        }
        field(50;Gilet;Integer)
        {
            InitValue = 5;
        }
        field(51;Triangle;Integer)
        {
            InitValue = 5;
        }
        field(52;"Kit de dépannage provisoire";Integer)
        {
            InitValue = 5;
        }
        field(53;"Ecrou antivol";Integer)
        {
            InitValue = 5;
        }
        field(54;"CD/SD Card NAV.";Integer)
        {
            InitValue = 5;
        }
        field(55;"Carnet d'entretien";Integer)
        {
            InitValue = 5;
        }
    }

    keys
    {
        key(Key1;Id)
        {
        }
    }

    fieldgroups
    {
    }
}

