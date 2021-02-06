table 60066 "Declaration Employeur V"
{
    // version KK&RS DEC EMP V2015


    fields
    {
        field(1;"N° Seq";Integer)
        {
        }
        field(5;"Type Ligne Decl. Emp.";Option)
        {
            Description = 'Annexes|Recap :  ,Annexe I,Annexe II,Annexe III,Annexe IV,Annexe V,Annexe VI,Recap,Quittance';
            OptionCaption = '" ,Annexe I,Annexe II,Annexe III,Annexe IV,Annexe V,Annexe VI,Recap,Quittance"';
            OptionMembers = " ","Annexe I","Annexe II","Annexe III","Annexe IV","Annexe V","Annexe VI",Recap,Quittance;
        }
        field(10;"Code Retenue";Code[10])
        {
            Description = 'Annexes|Recap';

            trigger OnValidate();
            var
                RecG_GroupeRetenue : Record "50006";
            begin
                //données annexe

                // 25/02/2015 Importation ecritures
                RecG_GroupeRetenue.RESET;
                RecG_GroupeRetenue.SETRANGE(Code, "Code Retenue");
                IF RecG_GroupeRetenue.FINDFIRST THEN BEGIN
                  "% Retenue":=RecG_GroupeRetenue."% Retenue";
                  "Pos. mnt Brut dans Annexe" :=RecG_GroupeRetenue."Pos. mnt Brut dans Annexe";
                   "Sous Pos. mnt Brut ds  Annexe" :=RecG_GroupeRetenue."Sous Pos. mnt Brut ds  Annexe";

                END;
                // 25/02/2015 Importation ecritures
            end;
        }
        field(20;"Source Type Annxes";Option)
        {
            CaptionML = ENU='Source Type',
                        FRA='Type origine',
                        ITA='Tipo origine';
            Description = 'Annxes (  ,Customer,Vendor,Bank Account,Fixed Asset,Salarié)';
            OptionCaptionML = ENU=' ,Customer,Vendor,Bank Account,Fixed Asset,Employee',
                              FRA=' ,Client,Fournisseur,Banque,Immobilisation,Salarié',
                              ITA=' ,Cliente,Fornitore,Banca,Cespite';
            OptionMembers = " ",Customer,Vendor,"Bank Account","Fixed Asset","Salarié";
        }
        field(22;"Code Ligne Recap";Code[10])
        {
            Description = 'Recap';
        }
        field(30;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.',
                        FRA='N° origine',
                        ITA='Nr. origine';
            Description = 'Annexes';
            TableRelation = IF (Source Type Annxes=CONST(Customer)) Customer
                            ELSE IF (Source Type Annxes=CONST(Vendor)) Vendor
                            ELSE IF (Source Type Annxes=CONST(Salarié)) Employee;

            trigger OnValidate();
            begin
                
                // 25/02/2015 Importation ecritures
                //remplir "Source Name", "Source Type ID", "Source ID", "Source Activité", "Source Adresse"
                //+ pr les salaries remplir :
                
                CASE "Source Type Annxes" OF
                
                  "Source Type Annxes"::Vendor :
                    BEGIN
                      RecG_Vendor.GET("Source No.");
                      "Source Name":=RecG_Vendor.Name;
                      "Source Activité":=RecG_Vendor.Activité;
                      "Source Adresse":=RecG_Vendor.Address;
                      "Source Sous Type":=RecG_Vendor."Type Frns (Recap Dec. Emp.)";
                      IF RecG_Vendor."VAT Registration No."<>'' THEN BEGIN
                        "Source Type ID":='1';
                        "Source ID":=RecG_Vendor."VAT Registration No.";
                      END ELSE IF RecG_Vendor."No. C.I.N."<>'' THEN BEGIN
                        "Source Type ID":='2';
                        "Source ID":=RecG_Vendor."No. C.I.N.";
                      END;
                    END;
                
                
                  "Source Type Annxes"::Customer :
                    BEGIN
                      RecG_Customer.GET("Source No.");
                      "Source Name":=RecG_Customer.Name;
                      "Source Activité":=RecG_Customer.Activity;
                      "Source Adresse":=RecG_Customer.Address;
                      "Source Sous Type":=RecG_Customer."Type Client";
                      IF RecG_Customer."VAT Registration No."<>'' THEN BEGIN
                        "Source Type ID":='1';
                        "Source ID":=RecG_Customer."VAT Registration No.";
                      END ELSE IF RecG_Customer."No. CIN"<>'' THEN BEGIN
                        "Source Type ID":='2';
                        "Source ID":=RecG_Customer."No. CIN";
                      END;
                    END;
                  /*
                  "Source Type Annxes"::Salarié : //copie travail de MBY
                    BEGIN
                      RecG_Employee.GET("Source No.");
                      "Source Name" := RecG_Employee."Last Name"+' '+RecG_Employee."First Name";
                
                      "Source Activité":=RecG_Employee."Job Title";
                      "Source Adresse":=RecG_Employee.Address+' '+RecG_Employee."Post Code"+' '+RecG_Employee.City;
                
                      IF RecG_Employee."Carte Séjour" THEN
                        "Source Type ID":='3'
                      ELSE
                        "Source Type ID":='2';
                
                      "Source ID":=RecG_Employee."National Identity Card No.";
                
                      //Situation familiale
                     CASE RecG_Employee."Marital Status" OF
                       RecG_Employee."Marital Status"::Célibataire  : "Situation familiale":='1';
                       RecG_Employee."Marital Status"::Marié : "Situation familiale":='2';
                       RecG_Employee."Marital Status"::Divorcé: "Situation familiale":='3';
                       RecG_Employee."Marital Status"::Veuf : "Situation familiale":='4';
                      END;
                
                      //Nb enfants à charge
                      RecG_Employee.CALCFIELDS("Loaded childs");
                      "Nb enfants à charge":=RecG_Employee."Loaded childs";
                
                      //Date Début Travail
                      IF RecG_Employee."Employment Date" < (DMY2DATE(1,1,Année+1)) THEN
                        "Date Début Travail":=DMY2DATE(1,1,Année)
                      ELSE
                        "Date Début Travail":=RecG_Employee."Employment Date";
                
                      //Date fin travail
                      IF (RecG_Employee."Termination Date" IN [(DMY2DATE(1,1,Année))..(DMY2DATE(31,12,Année))])
                            AND(RecG_Employee."Termination Date"<>(0D)) THEN
                        "Date Fin Travail":=RecG_Employee."Termination Date"
                      ELSE
                        "Date Fin Travail":=DMY2DATE(31,12,Année);
                
                      //Durée période travail en Jrs
                      IF ("Date Fin Travail"-"Date Début Travail") <> 0 THEN
                        "Durée période travail J":="Date Fin Travail"-"Date Début Travail"+1;
                    END;
                   */
                END;
                // 25/02/2015 Importation ecritures

            end;
        }
        field(31;"Source Name";Text[100])
        {
            Description = 'Annexes';
        }
        field(32;"Source Type ID";Code[1])
        {
            Description = 'Annexes (1 : Matricule fiscal 2 : CIN ,3 : Numéro de la carte du séjour pour les étrangers)';
            ValuesAllowed = 1;2;3;4;
        }
        field(33;"Source ID";Code[20])
        {
            Description = 'Annexes';
        }
        field(34;"Source Activité";Text[100])
        {
            Description = 'Annexes';
        }
        field(35;"Source Adresse";Text[100])
        {
            Description = 'Annexes';
        }
        field(36;"Source Sous Type";Option)
        {
            Description = 'Annexes|Recap  ,Non Résident physique,Non Résident Morale,Résident Morale,Résident Physique,Régime réel';
            OptionMembers = " ","Non Resident physique","Non Resident Morale","Resident Morale","Resident Physique","Regime reel";
        }
        field(40;"Montant Base Retenue";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'Annexes|Recap';
        }
        field(50;"Montant Retenue";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'Annexes|Recap';

            trigger OnValidate();
            begin

                // 25/02/2015 Importation ecritures
                IF "% Retenue"<>0 THEN
                  "Montant Base Retenue":= ROUND(("Montant Retenue"/"% Retenue")*100, 0.001);

                "Montant Net Servis":="Montant Base Retenue"-"Montant Retenue";
                // 25/02/2015 Importation ecritures
            end;
        }
        field(51;"Montant Net Servis";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'Annexes';
        }
        field(52;"Montant Ristournes";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 6';
        }
        field(53;"Montants ventes PP reg forf";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 6';
        }
        field(54;"avances sur ventes PP reg forf";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 6';
        }
        field(60;"Revenu Imposable";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 1';
        }
        field(70;"Avantages en nature";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 1';
        }
        field(80;"Revenu Réinvesti";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 1';
        }
        field(90;"Montant Retenue Régime commun";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 1';
        }
        field(91;"Total retenue 20%";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 1';
        }
        field(92;"Total redevances caisse compen";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 1';
        }
        field(93;"Total Contribution Conjoncture";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'special annexe 1 V 2015';
        }
        field(94;"Montant Recouvers en Especes";Decimal)
        {
            Description = 'special annexe 6 V 2015';
        }
        field(100;"Date Quittance";Date)
        {
            Description = 'QUITTANCES';
        }
        field(110;"Num Quittance";Code[50])
        {
            Description = 'QUITTANCES';
        }
        field(120;"Admin Fiscale";Text[100])
        {
            Description = 'QUITTANCES';
        }
        field(1000;"% Retenue";Decimal)
        {
            Description = 'Annexes|Recap';
        }
        field(1020;"Pos. mnt Brut dans Annexe";Code[10])
        {
            Description = 'Annexes';
        }
        field(1030;"Sous Pos. mnt Brut ds  Annexe";Code[1])
        {
            CharAllowed = '012345';
            Description = 'Annexes';
        }
        field(2000;"Situation familiale";Code[1])
        {
            Description = 'Annexes (1:célibataire, 2:marié, 3:divorcé, 4:veuf)';
            ValuesAllowed = 1;2;3;4;
        }
        field(2010;"Nb enfants à charge";Integer)
        {
            Description = 'special annexe 1';
        }
        field(2020;"Date Début Travail";Date)
        {
            Description = 'special annexe 1';
        }
        field(2030;"Date Fin Travail";Date)
        {
            Description = 'special annexe 1';
        }
        field(2040;"Durée période travail J";Integer)
        {
            Description = 'special annexe 1';
        }
        field(10000;"Année";Integer)
        {
        }
        field(50000;"Archivé";Boolean)
        {
        }
        field(50001;"Type montants payés";Code[2])
        {
            Description = 'special annexe 7 [1...24]';
        }
        field(50002;"montants payés";Decimal)
        {
            Description = 'special annexe 7';
        }
        field(50003;"Retenue à la source";Decimal)
        {
            Description = 'special annexe 7';
        }
    }

    keys
    {
        key(Key1;"Année","Type Ligne Decl. Emp.","N° Seq")
        {
            SumIndexFields = "Montant Base Retenue","Montant Retenue","Montant Net Servis","Revenu Imposable","Avantages en nature","Revenu Réinvesti","Montant Retenue Régime commun","Total retenue 20%","Total redevances caisse compen","Montant Ristournes","Montants ventes PP reg forf","avances sur ventes PP reg forf","Total Contribution Conjoncture";
        }
        key(Key2;"Année","Type Ligne Decl. Emp.","Pos. mnt Brut dans Annexe","Sous Pos. mnt Brut ds  Annexe","Source Type Annxes","Source No.")
        {
            SumIndexFields = "Montant Base Retenue","Montant Retenue","Montant Net Servis","Revenu Imposable","Avantages en nature","Revenu Réinvesti","Montant Retenue Régime commun","Total retenue 20%","Total redevances caisse compen","Montant Ristournes","Montants ventes PP reg forf","avances sur ventes PP reg forf","Total Contribution Conjoncture";
        }
        key(Key3;"Archivé","Année","Code Retenue","Source Sous Type")
        {
            SumIndexFields = "Montant Base Retenue","Montant Retenue","Montant Net Servis","Revenu Imposable","Avantages en nature","Revenu Réinvesti","Montant Retenue Régime commun","Total retenue 20%","Total redevances caisse compen","Montant Ristournes","Montants ventes PP reg forf","avances sur ventes PP reg forf","Total Contribution Conjoncture";
        }
        key(Key4;"Code Ligne Recap")
        {
            SumIndexFields = "Montant Base Retenue","Montant Retenue","Montant Net Servis","Revenu Imposable","Avantages en nature","Revenu Réinvesti","Montant Retenue Régime commun","Total retenue 20%","Total redevances caisse compen","Montant Ristournes","Montants ventes PP reg forf","avances sur ventes PP reg forf","Total Contribution Conjoncture";
        }
        key(Key5;"Type Ligne Decl. Emp.","N° Seq")
        {
            SumIndexFields = "Montant Base Retenue","Montant Retenue","Montant Net Servis","Revenu Imposable","Avantages en nature","Revenu Réinvesti","Montant Retenue Régime commun","Total retenue 20%","Total redevances caisse compen","Montant Ristournes","Montants ventes PP reg forf","avances sur ventes PP reg forf","Total Contribution Conjoncture";
        }
        key(Key6;"Année","Code Retenue","Source Sous Type")
        {
            SumIndexFields = "Montant Base Retenue","Montant Retenue","Montant Net Servis","Revenu Imposable","Avantages en nature","Revenu Réinvesti","Montant Retenue Régime commun","Total retenue 20%","Total redevances caisse compen","Montant Ristournes","Montants ventes PP reg forf","avances sur ventes PP reg forf","Total Contribution Conjoncture";
        }
    }

    fieldgroups
    {
    }

    var
        RecG_Vendor : Record "23";
        RecG_Customer : Record "18";
        RecG_Employee : Record "5200";
        CUG_ASCII_ANSI_CONVERTER : Codeunit "50001";
}

