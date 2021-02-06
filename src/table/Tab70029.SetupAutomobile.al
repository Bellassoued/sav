table 70029 "Setup Automobile"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Souche Simulation";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(3;"Compte financement";Code[20])
        {
            TableRelation = IF (Type Contre-P Fin-Dev=FILTER(Fournisseur)) Vendor.No.
                            ELSE IF (Type Contre-P Fin-Dev=FILTER(Banque)) "Bank Account".No.
                            ELSE IF (Type Contre-P Fin-Dev=FILTER(Compte Générale)) "G/L Account".No.;
        }
        field(4;"No. Financement";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5;"No. Br. Rég / Obligation";Code[20])
        {
            TableRelation = "Payment Class";
        }
        field(6;"No. DossirFact. Pr";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7;"Préfixe Facture Fournisseur";Code[10])
        {
        }
        field(8;"Cpt. Caution Prov.";Code[20])
        {
            TableRelation = "G/L Account".No.;
        }
        field(9;"Cpt. Caution Définitive.";Code[20])
        {
            TableRelation = "G/L Account".No.;
        }
        field(10;"Cpt. Caution Garantie";Code[20])
        {
            TableRelation = "G/L Account".No.;
        }
        field(11;"Contre partie Caution";Code[20])
        {
            TableRelation = "G/L Account".No.;
        }
        field(12;"No. Prêt Société";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(70033;"Statut Chèque en coffre site";Code[10])
        {
            Description = 'rh 23-01-17 : transfert inetr site';
        }
        field(70034;"Statut Effet en coffre site";Code[10])
        {
            Description = 'rh 23-01-17 : transfert inetr site';
        }
        field(70035;"Stat. Chq coffre siège En Att";Code[10])
        {
            Description = 'rh 23-01-17 : B transfert de site vers siège';
        }
        field(70036;"Stat. Eff. coffre siège En Att";Code[10])
        {
            Description = 'rh 23-01-17 : transfert inetr site';
        }
        field(70037;"Statut Chèque en transit";Integer)
        {
            Description = 'Transférer de site et nom comptabilité dans siège';
        }
        field(70038;"Statut effet en transit";Integer)
        {
            Description = 'Transférer de site et nom comptabilité dans siège';
        }
        field(70039;"Coffre Sfax";Code[20])
        {
            TableRelation = Coffre.Code;
        }
        field(70040;"Coffre Mghira";Code[20])
        {
            TableRelation = Coffre.Code;
        }
        field(70041;"Coffre Sousse";Code[20])
        {
            TableRelation = Coffre.Code;
        }
        field(70042;"Coffre Nabeul";Code[20])
        {
            TableRelation = Coffre.Code;
        }
        field(70043;"Type Contre-P Reg/Obligation";Option)
        {
            OptionCaption = '" ,Fournisseur,Banque,Compte Générale"';
            OptionMembers = " ",Fournisseur,Banque,"Compte Générale";
        }
        field(70044;"No. Contre-P Reg/Obligation";Code[20])
        {
            TableRelation = IF (Type Contre-P Reg/Obligation=FILTER(Fournisseur)) Vendor.No.
                            ELSE IF (Type Contre-P Reg/Obligation=FILTER(Banque)) "Bank Account".No.
                            ELSE IF (Type Contre-P Reg/Obligation=FILTER(Compte Générale)) "G/L Account".No.;
        }
        field(70045;"No. Br. Rég / Financement";Code[20])
        {
            TableRelation = "Payment Class".Code;
        }
        field(70046;"Type Contre-P Fin-Dev";Option)
        {
            OptionCaption = '" ,Fournisseur,Banque,Compte Générale"';
            OptionMembers = " ",Fournisseur,Banque,"Compte Générale";
        }
        field(70047;"No. Br. Fin-Const-Bqe";Code[20])
        {
            TableRelation = "Payment Class".Code;
        }
        field(70048;"Centre gestion Sfax";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(70049;"Centre gestion Mghira";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(70050;"Centre gestionSousse";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(70051;"Centre gestion Nabeul";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(70052;"Centre gestion charguia";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(70053;"Stat. Espè coffre site";Code[10])
        {
            Description = 'rh 23-01-17 : transfert inetr site';
        }
        field(70054;"Stat. Espè coffre siège en Att";Code[10])
        {
            Description = 'rh 23-01-17 : transfert inetr site';
        }
        field(70055;"Statut Espèce en transit";Integer)
        {
            Description = 'Transférer de site et nom comptabilité dans siège';
        }
        field(70056;"Type Chèque Client";Text[30])
        {
            TableRelation = "Payment Class".Code;
        }
        field(70057;"Type Effet Client";Text[30])
        {
            TableRelation = "Payment Class".Code;
        }
        field(70058;"Type espèce client";Text[30])
        {
            TableRelation = "Payment Class".Code;
        }
        field(70059;"Centre gestion LAC";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

