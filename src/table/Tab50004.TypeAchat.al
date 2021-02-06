table 50004 "Type Achat"
{
    // version DEM ACHAT

    CaptionML = ENU = 'Purchase type',
                FRA = 'Type Achat';
    DrillDownPageID = 50007;
    LookupPageID = 50007;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Designation; Text[30])
        {
        }
        field(103; "Type Cmd Achat"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",SNS,SNC,SNE,SVS,SVC,SVE,CDS,CDC,CDE,CVS,CVC,CVE,CCS,EPC,SST,DEF,CPG,CVA;

            trigger OnValidate();
            begin
                CASE "Type Cmd Achat" OF
                    //1
                    //SNS
                    "Type Cmd Achat"::SNS:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::"9";
                            "Type FD" := "Type FD"::"50";
                        END;
                    //12
                    //SNC
                    "Type Cmd Achat"::SNC:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::"9";
                            "Type FD" := "Type FD"::"01 Glass";
                        END;
                    //13
                    //SNE
                    "Type Cmd Achat"::SNE:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::"9";
                            "Type FD" := "Type FD"::"02 Eur1";
                        END;
                    //SVS

                    "Type Cmd Achat"::SVS:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::V;
                            "Type FD" := "Type FD"::"50";
                        END;
                    //15
                    //SVC
                    "Type Cmd Achat"::SVC:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::V;
                            "Type FD" := "Type FD"::"01 Glass";
                        END;
                    //2
                    //CDC
                    "Type Cmd Achat"::CDC:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::"9";
                            "Type FD" := "Type FD"::"01 Glass";
                        END;
                    //3
                    //CDE
                    "Type Cmd Achat"::CDE:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::"9";
                            "Type FD" := "Type FD"::"02 Eur1";
                        END;
                    //4
                    //CDS
                    "Type Cmd Achat"::CDS:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::"9";
                            "Type FD" := "Type FD"::"50";
                        END;
                    //5
                    //CPG
                    "Type Cmd Achat"::CPG:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::C;
                            "Type FD" := "Type FD"::"53";
                        END;
                    //6
                    //CVA
                    "Type Cmd Achat"::CVA:
                        BEGIN
                            "Type Transport" := "Type Transport"::VOR;
                            "Type Order" := "Type Order"::V;
                            "Type FD" := "Type FD"::"50";
                        END;
                    //7
                    //CVC
                    "Type Cmd Achat"::CVC:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::V;
                            "Type FD" := "Type FD"::"01 Glass";
                        END;
                    //8
                    //CVE
                    "Type Cmd Achat"::CVE:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::V;
                            "Type FD" := "Type FD"::"02 Eur1";
                        END;
                    //9
                    //CVS
                    "Type Cmd Achat"::CVS:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::V;
                            "Type FD" := "Type FD"::"50";
                        END;
                    //10
                    //DEF
                    "Type Cmd Achat"::DEF:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::C;
                            "Type FD" := "Type FD"::"51";
                        END;
                    //11
                    //EPC
                    "Type Cmd Achat"::EPC:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::C;
                            "Type FD" := "Type FD"::"50";
                        END;


                    //14
                    //SST
                    "Type Cmd Achat"::SST:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::C;
                            "Type FD" := "Type FD"::"50";
                        END;

                    //16
                    //SVE
                    "Type Cmd Achat"::SVE:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::V;
                            "Type FD" := "Type FD"::"02 Eur1";
                        END;
                    //17
                    //CCS
                    "Type Cmd Achat"::CCS:
                        BEGIN
                            "Type Transport" := "Type Transport"::SEA;
                            "Type Order" := "Type Order"::C;
                            "Type FD" := "Type FD"::"50";
                        END;
                    //0
                    "Type Cmd Achat"::" ":
                        BEGIN
                            "Type Transport" := "Type Transport"::" ";

                        END;


                END;
            end;
        }
        field(104; "Type Transport"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = ' ,VOR,SEA',
                              FRA = ' ,VOR,SEA';
            OptionMembers = " ",VOR,SEA;
        }
        field(105; "Type Order"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU = '9,V,C,N,S,ACC,M,5,3,G,P,A',
                              FRA = '9,V,C,N,S,ACC,M,5,3,G,P,A';
            OptionMembers = "9",V,C,N,S,ACC,M,"5","3",G,P,A;
        }
        field(106; "Type FD"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "50","01 Glass","02 Eur1","51 DMREHTT","53 GPGHTT";
        }
        field(107; "Délai de dédouanement"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

