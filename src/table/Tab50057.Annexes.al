table 50057 "Annexes"
{
    // version DECEMP2018

    DrillDownPageID = 60379;
    LookupPageID = 60379;

    fields
    {
        field(10;"Code Retenue";Code[10])
        {

            trigger OnValidate();
            begin
                /*RecG_GroupeRetenue.RESET;
                RecG_GroupeRetenue.SETRANGE(Code, "Code Retenue");
                IF RecG_GroupeRetenue.FINDFIRST THEN BEGIN
                  "% Retenue" := RecG_GroupeRetenue."% Retenue";
                  Annexe      := RecG_GroupeRetenue.Annexe;
                  "Pos. mnt Brut dans Annexe"     := RecG_GroupeRetenue."Pos. mnt Brut Dans Annexe";
                  "Sous Pos. mnt Brut ds  Annexe" := RecG_GroupeRetenue."Sous Pos Mnt Brut ds Annexe";
                END;
                */

            end;
        }
        field(20;"Source Type";Option)
        {
            CaptionML = ENU='Source Type',
                        FRA='Type origine',
                        ITA='Tipo origine';
            OptionCaptionML = ENU=' ,Customer,Vendor,Bank Account,Fixed Asset,Employee',
                              FRA=' ,Client,Fournisseur,Banque,Immobilisation,Salarié',
                              ITA=' ,Cliente,Fornitore,Banca,Cespite';
            OptionMembers = " ",Customer,Vendor,"Bank Account","Fixed Asset","Salarié";
        }
        field(30;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.',
                        FRA='N° origine',
                        ITA='Nr. origine';
            TableRelation = IF (Source Type=CONST(Customer)) Customer
                            ELSE IF (Source Type=CONST(Vendor)) Vendor
                            ELSE IF (Source Type=CONST(Salarié)) Employee;

            trigger OnValidate();
            begin
                //remplir "Source Name", "Source Type ID", "Source ID", "Source Activité", "Source Adresse"
                //+ pr les salaries remplir :
                /*
                CASE "Source Type" OF
                  "Source Type"::Vendor :
                  BEGIN
                    RecG_Vendor.GET("Source No.");
                    "Source Name"      := RecG_Vendor.Name;
                    "Source Activité"  := RecG_Vendor.Activité;
                    "Source Adresse"   := RecG_Vendor.Address;
                    "Source Sous Type" := RecG_Vendor."Type Fournisseur";
                    IF RecG_Vendor."Matricule Fiscal" <> '' THEN BEGIN
                      "Source Type ID" := '1';
                      "Source ID"      := RecG_Vendor."Matricule Fiscal";
                    END ELSE
                      IF RecG_Vendor."N° C.I.N."<> '' THEN BEGIN
                        "Source Type ID" := '2';
                        "Source ID"      := RecG_Vendor."N° C.I.N.";
                      END ELSE
                        "Source Type ID" := '4';   // Non résident
                  END;
                
                  "Source Type"::Customer :
                  BEGIN
                    RecG_Customer.GET("Source No.");
                    "Source Name"      := RecG_Customer.Name;
                    "Source Activité"  := RecG_Customer.Activité;
                    "Source Adresse"   := RecG_Customer.Address;
                    "Source Sous Type" := RecG_Customer."Type Client";
                    IF RecG_Customer."Matricule fiscal"<> '' THEN BEGIN
                      "Source Type ID" := '1';
                      "Source ID"      := RecG_Customer."Matricule fiscal";
                    END ELSE IF RecG_Customer."N° CIN" <> '' THEN BEGIN
                      "Source Type ID" := '2';
                      "Source ID"      := RecG_Customer."N° CIN";
                    END;
                  END;
                
                  "Source Type"::Salarié : //copie travail de MBY
                  BEGIN
                    RecG_Employee.GET("Source No.");
                    //>>Deltasoft AFK 19-02-2014
                    //RecG_Employee.CALCFIELDS("Job Title");
                    //<<Deltasoft AFK 19-02-2014
                    "Source Name"      := RecG_Employee."Last Name" + ' ' + RecG_Employee."First Name";
                    "Source Activité"  := RecG_Employee."Job Title";
                    "Source Adresse"   := RecG_Employee.Address + ' ' + RecG_Employee."Post Code" + ' ' + RecG_Employee.City;
                    IF RecG_Employee."Carte Séjour" THEN
                      "Source Type ID" := '3'
                    ELSE
                      "Source Type ID" := '2';
                    "Source ID" := RecG_Employee."National Identity Card No.";
                
                    //Situation familiale
                    CASE RecG_Employee."Marital Status" OF
                      RecG_Employee."Marital Status"::Single  : "Source Situation familiale" := '1';
                      RecG_Employee."Marital Status"::Married : "Source Situation familiale" := '2';
                      RecG_Employee."Marital Status"::Divorced: "Source Situation familiale" := '3';
                      RecG_Employee."Marital Status"::Widowed : "Source Situation familiale" := '4';
                    END;
                
                    //Nb enfants à charge
                    RecG_Employee.CALCFIELDS("Loaded childs");
                    "Source Nb enfants à charge" := RecG_Employee."Loaded childs";
                
                    //Date Début Travail
                    IF RecG_Employee."Employment Date" < (DMY2DATE(1,1,Année+1)) THEN
                      "Source Date Début Travail" := DMY2DATE(1,1,Année)
                    ELSE
                      "Source Date Début Travail" := RecG_Employee."Employment Date";
                
                    //Date fin travail
                    IF (RecG_Employee."Termination Date" IN [(DMY2DATE(1,1,Année))..(DMY2DATE(31,12,Année))]) AND
                       (RecG_Employee."Termination Date"<>(0D)) THEN
                      "Source Date Fin Travail" := RecG_Employee."Termination Date"
                    ELSE
                      "Source Date Fin Travail" := DMY2DATE(31,12,Année);
                
                    //Durée période travail en Jrs
                    IF ("Source Date Fin Travail" - "Source Date Début Travail") <> 0 THEN
                      "Source Durée période travail J" := "Source Date Fin Travail" - "Source Date Début Travail" + 1;
                  END;
                END;
                */

            end;
        }
        field(31;"Source Name";Text[100])
        {
        }
        field(32;"Source Type ID";Code[10])
        {
        }
        field(33;"Source ID";Code[20])
        {
        }
        field(34;"Source Activité";Text[100])
        {
        }
        field(35;"Source Adresse";Text[100])
        {
        }
        field(36;"Source Sous Type";Option)
        {
            OptionMembers = " ","Non Résident physique","Non Résident Morale","Résident Morale","Résident Physique","Régime réel";
        }
        field(40;"Montant Base Retenue";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(50;"Montant Retenue";Decimal)
        {
            DecimalPlaces = 0:3;

            trigger OnValidate();
            begin
                IF "% Retenue" <> 0 THEN
                  "Montant Base Retenue" := ("Montant Retenue" / "% Retenue") * 100;

                "Montant Net Servis" := "Montant Base Retenue" - "Montant Retenue";
            end;
        }
        field(51;"Montant Net Servis";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(52;"Montant Ristournes";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(60;"Revenu imposable";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(70;"Avantages en nature";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(80;"Revenu réinvesti";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(90;"Année";Integer)
        {
        }
        field(1000;"% Retenue";Decimal)
        {
        }
        field(1010;Annexe;Option)
        {
            OptionMembers = " ",I,II,III,IV,V,VI,VII;
        }
        field(1020;"Pos. mnt Brut dans Annexe";Code[10])
        {
        }
        field(1030;"Sous Pos. mnt Brut ds  Annexe";Code[10])
        {
        }
        field(2000;"Source Situation familiale";Code[10])
        {
        }
        field(2010;"Source Nb enfants à charge";Integer)
        {
        }
        field(2020;"Source Date Début Travail";Date)
        {
        }
        field(2030;"Source Date Fin Travail";Date)
        {
        }
        field(2040;"Source Durée période travail J";Integer)
        {
        }
        field(2050;"Fournisseur Non Payé";Boolean)
        {
            Description = 'DeltaSoft - Med T DecEmp 13-02-13';
        }
        field(2060;"Montant RCGC";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'DeltaSoft - Med T DecEmp 07-02-14';
        }
        field(2061;"Montant Contribution conj.";Decimal)
        {
            Description = 'DeltaSoft - ZIM    DecEmp 27-02-15';
        }
        field(2062;"Mont. Enc. Client Sup";Decimal)
        {
            Description = 'DeltaSoft - ZIM    DecEmp 27-02-15';
        }
        field(2064;"Montant Base Retenue Autre";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'DeltaSoft Achour 08/02/2016';
        }
        field(2065;"Montant Retenue Autre";Decimal)
        {
            DecimalPlaces = 3:3;
            Description = 'DeltaSoft Achour 08/02/2016';
        }
    }

    keys
    {
        key(Key1;"Code Retenue","Source Type","Source No.")
        {
        }
        key(Key2;"Année",Annexe,"Pos. mnt Brut dans Annexe","Sous Pos. mnt Brut ds  Annexe","Source Type","Source No.")
        {
            SumIndexFields = "Montant Base Retenue","Montant Retenue","Montant Net Servis","Revenu imposable","Avantages en nature","Revenu réinvesti","Montant Ristournes";
        }
    }

    fieldgroups
    {
    }

    var
        RecG_GroupeRetenue : Record "50020";
        RecG_Vendor : Record "23";
        RecG_Customer : Record "18";
        RecG_Employee : Record "5200";

    procedure FctGetMontBaseReAutre(FrNo : Code[20]) Return : Decimal;
    var
        RecLParamCompta : Record "98";
        RecLPayLine : Record "10866";
        RecLGlEntry : Record "17";
        OldNo : Code[20];
        MontantCalc : Decimal;
    begin
        
        //>>DeltaSoft Achour 02/02/2016
        
        RecLParamCompta.GET();
        
        RecLPayLine.RESET;    //DC15/00585
        //RecLPayLine.SETCURRENTKEY("Account Type","Type paiement","Status No.",Posted,"Posting Date","Account No.",
        //"Code Retenue à la Source");
        
        /*RecLPayLine.SETCURRENTKEY(
        "Account Type","Type paiement","Status No.",Posted,"Posting Date","Account No.",Amount,"Code Retenu à la Source");
        RecLPayLine.ASCENDING(TRUE);*/
        RecLPayLine.SETFILTER("Account Type",'%1',RecLPayLine."Account Type"::Vendor);
        //CHKRecLPayLine.SETFILTER("Type paiement",'%1',RecLPayLine."Type paiement"::Paiement);
        //RecLPayLine.SETFILTER("Status No.",'<>%1',50000);
        RecLPayLine.SETFILTER("Status No.",'%1',20000);
        RecLPayLine.SETFILTER(Posted,'%1',TRUE);
        //RecLPayLine.SETRANGE("Posting Date",RecLParamCompta."Date Debut Annexe5",RecLParamCompta."Date Fin Annexe5");
        RecLPayLine.SETFILTER(Amount,'>=%1',1000);
        RecLPayLine.SETRANGE("Account No.",FrNo);
        RecLPayLine.SETFILTER("Code Retenue à la Source",'<>%1','');
        IF RecLPayLine.FINDSET THEN BEGIN
           RecLPayLine.CALCSUMS(Amount,"Montant Initial");
           Return:=RecLPayLine."Montant Initial";
        
        END;
        
        
        /*RecLGlEntry.RESET;
        RecLGlEntry.SETCURRENTKEY("G/L Account No.","Posting Date","Entry Type");
        RecLGlEntry.SETFILTER("Document Type",'%1',RecLGlEntry."Document Type"::Payment);
        RecLGlEntry.SETFILTER("Source Type",'%1',RecLGlEntry."Source Type"::Vendor);
        RecLGlEntry.SETRANGE("Posting Date",01012015D,31122015D);
        RecLGlEntry.SETRANGE("Source No.",FrNo);
        RecLGlEntry.SETFILTER(Amount,'>%1',999);
        IF RecLGlEntry.FINDSET THEN BEGIN
           RecLGlEntry.CALCSUMS(Amount);
           Return:=RecLGlEntry.Amount;
        END;*/
        //<<DeltaSoft Achour 02/02/2016

    end;
}

