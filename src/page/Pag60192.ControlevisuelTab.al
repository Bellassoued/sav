page 60192 "Controle visuel Tab"
{
    // version SAV Automobile

    SourceTable = Table60009;

    layout
    {
        area(content)
        {
            group("Tour du Véhicule")
            {
                Caption = 'Tour du Véhicule';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field(;'')
                            {
                            }
                            field(Bon;'')
                            {
                                Caption = 'Bon';
                            }
                            field("Défectueux";'')
                            {
                                Caption = 'Défectueux';
                            }
                            field("Accord client";'')
                            {
                                Caption = 'Accord client';
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field("Etat des plaques de police";'')
                            {
                                Caption = 'Etat des plaques de police';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EPPB;"Etat des plaques de policeB")
                            {
                                Caption = 'B';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*
                                    Etat0_2:=FALSE;
                                    A0_2:=FALSE;
                                    "Etat des plaques de police":=1;
                                    IF Etat0_1=FALSE THEN
                                    BEGIN
                                      A0_2:=TRUE;
                                     "Etat des plaques de police":=5;
                                    END
                                    *//*
                                    IF Etat0_1 THEN BEGIN
                                      "Etat des plaques de police" := 5;
                                      Etat0_2 := FALSE;
                                    END;
                                    */

                                end;
                            }
                            field(EPPD;"Etat des plaques de policeD")
                            {
                                Caption = 'D';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*
                                    //Etat : Défectueux
                                    Etat0_1:=FALSE;
                                    A0_1:=FALSE;
                                    "Etat des plaques de police":=1;
                                    IF Etat0_2=FALSE THEN
                                    BEGIN
                                      A0_1:=TRUE;
                                      "Etat des plaques de police":=5;
                                    END
                                    */

                                end;
                            }
                            field(EPPA;"Etat des plaques de policeA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat des vitres et pare-brise";'')
                            {
                                Caption = 'Etat des vitres et pare-brise';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EVPB;"Etat du vitre et parrebriseB")
                            {
                                Caption = 'B';
                                Enabled = true;
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    // Etat : Bon
                                    /*Etat1_2:=FALSE;
                                    A1_2:=FALSE;
                                    "Etat du vitre et parrebrise":=1;
                                    IF Etat1_1=FALSE THEN
                                    BEGIN
                                      A1_2:=TRUE;
                                     "Etat du vitre et parrebrise":=5;
                                    END
                                    */

                                end;
                            }
                            field(EVPD;"Etat du vitre et parrebriseD")
                            {
                                Caption = 'D';
                                Editable = true;
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    //Etat : Défectueux
                                    /*Etat1_1:=FALSE;
                                    A1_1:=FALSE;
                                    "Etat du vitre et parrebrise":=0;
                                    IF Etat1_2=FALSE THEN
                                    BEGIN
                                      A1_1:=TRUE;
                                      "Etat du vitre et parrebrise":=5;
                                    END
                                    */

                                end;
                            }
                            field(EVPA;"Etat du vitre et parrebriseA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat des feux avant/arrière";'')
                            {
                                Caption = 'Etat des feux avant/arrière';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EFAAB;"Etat des feux avant arriereB")
                            {
                                AssistEdit = false;
                                Caption = 'B';
                                Editable = true;
                                ShowCaption = false;
                            }
                            field(EFAAD;"Etat des feux avant arriereD")
                            {
                                Caption = 'D';
                                Editable = true;
                                ShowCaption = false;
                            }
                            field(EFAAA;"Etat des feux avant arriereA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat de carrosserie et peinture";'')
                            {
                                Caption = 'Etat de carrosserie et peinture';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(ECPB;"Etat carrosserie et peinture B")
                            {
                                AssistEdit = false;
                                Caption = 'B';
                                Editable = true;
                                Numeric = false;
                                ShowCaption = false;
                            }
                            field(ECPD;"Etat carrosserie et peinture D")
                            {
                                Caption = 'D';
                                Editable = true;
                                ShowCaption = false;
                            }
                            field(ECPA;"Etat carrosserie et peinture A")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat des balais d'ensuie-glace";'')
                            {
                                Caption = 'Etat des balais d''ensuie-glace';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EBEGB;"Etat des balais essuie-glaceB")
                            {
                                Caption = 'B';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat6_1:=FALSE;
                                    A6_1:=FALSE;
                                    "Etat des balais essuie-glace":=0;
                                    IF Etat6_2=FALSE THEN
                                    BEGIN
                                      A6_1:=TRUE;
                                      "Etat des balais essuie-glace":=5;
                                    END;
                                    */

                                end;
                            }
                            field(EBEGD;"Etat des balais essuie-glaceD")
                            {
                                AssistEdit = false;
                                Caption = 'D';
                                Numeric = false;
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat6_2:=FALSE;
                                    A6_2:=FALSE;
                                    "Etat des balais essuie-glace":=1;
                                    IF Etat6_1=FALSE THEN
                                    BEGIN
                                    A6_2:=TRUE;
                                    "Etat des balais essuie-glace":=5;
                                    END;
                                    */

                                end;
                            }
                            field(EBEGA;"Etat des balais essuie-glaceA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat des penus";'')
                            {
                                Caption = 'Etat des penus';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EPB;"Etat des pneus B")
                            {
                                AssistEdit = false;
                                Caption = 'B';
                                Numeric = false;
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat14_2:=FALSE;
                                    A14_2:=FALSE;
                                    "Etat des pneus":=1;
                                    IF Etat14_1=FALSE THEN
                                    BEGIN
                                      A14_2:=TRUE;
                                      "Etat des pneus":=5;
                                    END;
                                    */

                                end;
                            }
                            field(EPD;"Etat des pneus D")
                            {
                                Caption = 'D';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat14_1:=FALSE;
                                    A14_1:=FALSE;
                                    "Etat des pneus":=0;
                                    IF Etat14_2=FALSE THEN
                                     BEGIN
                                       A14_1:=TRUE;
                                       "Etat des pneus":=5;
                                     END;
                                     */

                                end;
                            }
                            field(EPA;"Etat des pneus A")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
            group("Contrôles approfondis (sur le pont) à partir de 50 000 km")
            {
                Caption = 'Contrôles approfondis (sur le pont) à partir de 50 000 km';
                group()
                {
                    Editable = GBoolModifyAllowed;
                    field(CAB;'')
                    {
                        Visible = false;
                    }
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field(;'')
                            {
                            }
                            field(Bon;'')
                            {
                                Caption = 'Bon';
                            }
                            field("Défectueux";'')
                            {
                                Caption = 'Défectueux';
                            }
                            field("Accord client";'')
                            {
                                Caption = 'Accord client';
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat de l'étanchéité amortisseurs et circuit de suspension";'')
                            {
                                Caption = 'Etat de l''étanchéité amortisseurs et circuit de suspension';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field(;'')
                            {
                                MultiLine = true;
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                                ToolTip = 'Etat de l''étanchéité amortisseurs et circuit de suspension';
                            }
                            field(EACSB;"Circuit de suspensionsB")
                            {
                                Caption = 'B';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat19_2:=FALSE;
                                    A19_2:=FALSE;
                                    "Circuit de suspensions":=1;
                                    IF Etat19_1=FALSE THEN
                                    BEGIN
                                      A19_2:=TRUE;
                                      "Circuit de suspensions":=5;
                                    END;
                                    */

                                end;
                            }
                            field(EACSD;"Circuit de suspensionsD")
                            {
                                Caption = 'D';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat19_1:=FALSE;
                                    A19_1:=FALSE;
                                    //A16_3:=TRUE;
                                    
                                    "Circuit de suspensions":=0;
                                    IF Etat19_2=FALSE THEN
                                     BEGIN
                                      A19_1:=TRUE;
                                      "Circuit de suspensions":=5;
                                     END;
                                     */

                                end;
                            }
                            field(EACSA;"Circuit de suspensionsA")
                            {
                                Caption = 'Accord client';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat de transmission/Rotules";'')
                            {
                                Caption = 'Etat de transmission/Rotules';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(TRB;"Etat de transmissions/RotuleB")
                            {
                                Caption = 'B';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat20_2:=FALSE;
                                    A20_2:=FALSE;
                                    "Etat de transmissions / Rotule":=1;
                                    IF Etat20_1=FALSE THEN
                                    BEGIN
                                      A20_2:=TRUE;
                                      "Etat de transmissions / Rotule":=5;
                                    END;
                                    */

                                end;
                            }
                            field(TRD;"Etat de transmissions/RotuleD")
                            {
                                Caption = 'D';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat20_1:=FALSE;
                                    A20_1:=FALSE;
                                    //A16_3:=TRUE;
                                    
                                    "Etat de transmissions / Rotule":=0;
                                    IF Etat20_2=FALSE THEN
                                     BEGIN
                                      A20_1:=TRUE;
                                      "Etat de transmissions / Rotule":=5;
                                     END;
                                     */

                                end;
                            }
                            field(TRA;"Etat de transmissions/RotuleA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat de fixation échappement";'')
                            {
                                Caption = 'Etat de fixation échappement';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EFEB;"Etat de fixation échappementB")
                            {
                                Caption = 'B';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat21_2:=FALSE;
                                    A21_2:=FALSE;
                                    "Etat de fixation échappement":=1;
                                    IF Etat21_1=FALSE THEN
                                    BEGIN
                                      A21_2:=TRUE;
                                      "Etat de fixation échappement":=5;
                                    END;
                                    */

                                end;
                            }
                            field(EFED;"Etat de fixation échappementD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(EFEA;"Etat de fixation échappementA")
                            {
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat de circuit de freinage";'')
                            {
                                Caption = 'Etat de circuit de freinage';
                                ShowCaption = false;
                                Style = StrongAccent;
                                StyleExpr = TRUE;
                                Visible = true;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etanchéité / état des gaines";'')
                            {
                                Caption = 'Etanchéité / état des gaines';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EEGB;"Etanchéité / état des grainesB")
                            {
                                Caption = 'B';
                                ShowCaption = false;
                            }
                            field(EEGD;"Etanchéité / état des grainesD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(EEGA;"Etanchéité / état des grainesA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat des disques et plaques frein";'')
                            {
                                Caption = 'Etat des disques et plaques frein';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EDPFB;"Etat disques et plaquettesB")
                            {
                                Caption = 'B';
                                ShowCaption = false;
                            }
                            field(EDPFD;"Etat disques et plaquettesD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(EDPFA;"Etat disques et plaquettesA")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
            group("Contrôle sous le capot")
            {
                Caption = 'Contrôle sous le capot';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field(;'')
                            {
                            }
                            field(Bon;'')
                            {
                                Caption = 'Bon';
                            }
                            field("Défectueux";'')
                            {
                                Caption = 'Défectueux';
                            }
                            field("Accord client";'')
                            {
                                Caption = 'Accord client';
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Huile moteur";'')
                            {
                                Caption = 'Huile moteur';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("Bon.";"Huile moteurB")
                            {
                                Caption = 'B';
                                ShowCaption = false;
                                StyleExpr = TRUE;
                            }
                            field("Défectueux.";"Huile moteurD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(Accord;"Huile moteurA")
                            {
                                Caption = 'Accord client';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Liquide de refroidissement";'')
                            {
                                Caption = 'Liquide de refroidissement';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(LRB;"Liquide de refroidissementB")
                            {
                                AssistEdit = false;
                                Caption = 'B';
                                ShowCaption = false;
                            }
                            field(LRD;"Liquide de refroidissementD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(LRA;"Liquide de refroidissementA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Liquide de freins ou LHM ou LDS";'')
                            {
                                Caption = 'Liquide de freins ou LHM ou LDS';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(LFLHMLDSBB;"Liquide freins ou LHM ou LDSB")
                            {
                                AssistEdit = false;
                                Caption = 'B';
                                Numeric = false;
                                ShowCaption = false;
                            }
                            field(LFLHMLDSBD;"Liquide freins ou LHM ou LDSD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(LFLHMLDSBA;"Liquide freins ou LHM ou LDSA")
                            {
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Liquide de direction";'')
                            {
                                Caption = 'Liquide de direction';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(LDB;"Liquide  de directionB")
                            {
                                AssistEdit = false;
                                Caption = 'B';
                                Numeric = false;
                                ShowCaption = false;
                            }
                            field(LDD;"Liquide  de directionD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(LDA;"Liquide  de directionA")
                            {
                                Caption = 'Accord client';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat de batterie";'')
                            {
                                Caption = 'Etat de batterie';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(EBB;"Etat de batterieB")
                            {
                                AssistEdit = false;
                                Caption = 'B';
                                Numeric = false;
                                ShowCaption = false;
                            }
                            field(EBD;"Etat de batterieD")
                            {
                                Caption = 'D';
                                ShowCaption = false;
                            }
                            field(EBA;"Etat de batterieA")
                            {
                                ShowCaption = false;
                            }
                        }
                        field(txtLTB;txtLTB)
                        {
                            ShowCaption = false;
                            Visible = false;
                        }
                    }
                }
            }
            group("Autres services")
            {
                Caption = 'Autres services';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field(;'')
                            {
                            }
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Pré-contrôle technique";'')
                            {
                                Caption = 'Pré-contrôle technique';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(PCTB;"Pré-Contôle TechniqueB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(PCTD;"Pré-Contôle TechniqueD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Bilan climatisation";'')
                            {
                                Caption = 'Bilan climatisation';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(BCB;"Bilan ClimatisationB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(BCD;"Bilan ClimatisationD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Réparation pare-brise";'')
                            {
                                Caption = 'Réparation pare-brise';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(RPBB;"Réparation pare-briseB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(RPBD;"Réparation pare-briseD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
            group("Qualité de service")
            {
                Caption = 'Qualité de service';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field(;'')
                            {
                            }
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Le client est déjà venu dans le réseau Citroên pour traiter le même incident (retour atelier)";'')
                            {
                                Caption = 'Le client est déjà venu dans le réseau Citroên pour traiter le même incident (retour atelier)';
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field(;'')
                            {
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(ClientVenuB;"Même incident(retour atelier)B")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(ClientVenuD;"Même incident(retour atelier)D")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Existence de campagne(s) de rappel";'')
                            {
                                Caption = 'Existence de campagne(s) de rappel';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(ECRB;"Existence compagne(s) rappelB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    IF "Existence compagne(s) rappelB" THEN BEGIN

                                    END
                                end;
                            }
                            field(ECRD;"Existence compagne(s) rappelD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Compagne de rappel 1";"Compagne de rappel 1")
                            {
                                Caption = 'Compagne 1';
                                Enabled = "Existence compagne(s) rappelB";
                            }
                            field("Compagne de rappel 2";"Compagne de rappel 2")
                            {
                                Caption = 'Compagne 2';
                                Editable = "Existence compagne(s) rappelB";
                            }
                            field("Compagne de rappel 3";"Compagne de rappel 3")
                            {
                                Caption = 'Compagne 3';
                                Editable = "Existence compagne(s) rappelB";
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Fiche incident client";'')
                            {
                                Caption = 'Fiche incident client';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(FICB;"Fiche incident clientB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(FICD;"Fiche incident clientD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Essai routier avec le client";'')
                            {
                                Caption = 'Essai routier avec le client';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(ERACB;"Essai routier avec le clientB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(ERACD;"Essai routier avec le clientD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Poste Radio";'')
                            {
                                Caption = 'Poste Radio';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(PRB;"Poste radioB")
                            {
                                AssistEdit = false;
                                Caption = 'Oui';
                                Numeric = false;
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat12_2:=FALSE;
                                    A12_2:=FALSE;
                                    "Poste radio":=1;
                                    IF Etat12_1=FALSE THEN
                                     BEGIN
                                      A12_2:=TRUE;
                                      "Poste radio":=5;
                                     END;
                                     */

                                end;
                            }
                            field(PRD;"Poste radioD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat12_1:=FALSE;
                                    A12_1:=FALSE;
                                    "Poste radio":=0;
                                    IF Etat12_2=FALSE THEN
                                     BEGIN
                                      A12_1:=TRUE;
                                      "Poste radio":=5;
                                     END;
                                     */

                                end;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Papier véhicule";'')
                            {
                                Caption = 'Papier véhicule';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(PVB;"Papier vehiculeB")
                            {
                                AssistEdit = false;
                                Caption = 'Oui';
                                Numeric = false;
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat13_2:=FALSE;
                                    A13_2:=FALSE;
                                    "Papier vehicule":=1;
                                    IF Etat13_1=FALSE THEN
                                     BEGIN
                                      A13_2:=TRUE;
                                      "Papier vehicule":=5;
                                    END;
                                    */

                                end;
                            }
                            field(PVD;"Papier vehiculeD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;

                                trigger OnValidate();
                                begin
                                    /*Etat13_1:=FALSE;
                                    A13_1:=FALSE;
                                    "Papier vehicule":=0;
                                    IF Etat13_2=FALSE THEN
                                     BEGIN
                                      A13_1:=TRUE;
                                      "Papier vehicule":=5;
                                     END;
                                     */

                                end;
                            }
                        }
                    }
                }
            }
            group("Carrosserie (Expert)")
            {
                Caption = 'Carrosserie (Expert)';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field(;'')
                            {
                            }
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Photo expertise";'')
                            {
                                Caption = 'Photo expertise';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(CARRB;"Photo expertiseB")
                            {
                                Caption = 'oui';
                                ShowCaption = false;
                            }
                            field(CARRD;"Photo expertiseD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                    }
                    grid()
                    {
                        field(Kilometrage;Kilometrage)
                        {
                            ShowCaption = true;

                            trigger OnValidate();
                            begin
                                IF CONFIRM('Etes-vous sûr de vouloir changer le kilométrage?') THEN BEGIN
                                  ReceptionSAV.GET(Id);
                                  IF ReceptionSAV."Nbre Impressions">0 THEN BEGIN
                                  IF "Ancien kilométrage"=0 THEN
                                    "Ancien kilométrage":=GintKilo
                                  ELSE
                                    ERROR(ERROR0001);
                                  END;
                                END
                                //MESSAGE(FORMAT("Ancien kilométrage"));
                                ELSE Kilometrage:=GintKilo;
                            end;
                        }
                    }
                    grid()
                    {
                        field("Ancien kilométrage";"Ancien kilométrage")
                        {
                        }
                    }
                    grid()
                    {
                        Editable = GBoolModifyAllowed;
                        field(Remarques;Remarques)
                        {
                            ShowCaption = true;

                            trigger OnValidate();
                            begin
                                ReceptionSAV.GET(Id);
                                IF ReceptionSAV."Nbre Impressions">0 THEN BEGIN
                                IF "Ancienne Remarque"='' THEN
                                  "Ancienne Remarque":=GTextRemarque
                                ELSE ERROR(ERROR0002);
                                  //MESSAGE(FORMAT("Ancien kilométrage"));
                                END;
                            end;
                        }
                    }
                    grid()
                    {
                        Editable = GBoolModifyAllowed;
                        Visible = false;
                        field("Ancienne Remarque";"Ancienne Remarque")
                        {
                        }
                    }
                }
            }
            group("Contrôles")
            {
                Caption = 'Contrôles';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Rows;
                            field(Gilet;'')
                            {
                                Caption = 'Gilet';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(GiletB;GiletB)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Rows;
                            field(Triangle;'')
                            {
                                Caption = 'Triangle';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field(TriangleB;TriangleB)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Rows;
                            field("Roue de secours";'')
                            {
                                Caption = 'Roue de secours';
                                ShowCaption = true;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("Roue se secoursB";"Roue se secoursB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Rows;
                            field("Kit de dépannage provisoire";'')
                            {
                                Caption = 'Kit de dépannage provisoire';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("Kit de dépannage provisoireB";"Kit de dépannage provisoireB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                        }
                    }
                    group()
                    {
                        //The GridLayout property is only supported on controls of type Grid
                        //GridLayout = Rows;
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            GridLayout = Columns;
                            field(;'')
                            {
                            }
                            field(Oui;'')
                            {
                                Caption = 'Oui';
                            }
                            field(Non;'')
                            {
                                Caption = 'Non';
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Ecrou antivol";'')
                            {
                                Caption = 'Ecrou antivol';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("Ecrou antivolB";"Ecrou antivolB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field("Ecrou antivolD";"Ecrou antivolD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("CD/SD Card Nav.";'')
                            {
                                Caption = 'CD/SD Card Nav.';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("CD/SD Card NAV.B";"CD/SD Card NAV.B")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field("CD/SD Card NAV.D";"CD/SD Card NAV.D")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        grid()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Carnet d'entretien";'')
                            {
                                Caption = 'Carnet d''entretien';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("Carnet d'entretienB";"Carnet d'entretienB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field("<Carnet d'entretienD>";"Carnet d'entretienD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
            group(Carburant)
            {
                Caption = 'Carburant';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                grid()
                {
                    Editable = GBoolModifyAllowed;
                    GridLayout = Rows;
                    field("0";'')
                    {
                        Caption = '0';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field("Carburant0"; Carburant0)
                    {
                        ShowCaption = false;
                        Style = Strong;
                        StyleExpr = TRUE;

                        trigger OnAssistEdit();
                        var
                            ValeurSel : Integer;
                        begin
                        end;

                        trigger OnValidate();
                        begin
                            Carburant0:=TRUE;
                            "Carburant0.25":=FALSE;
                            "Carburant0.5":=FALSE;
                            "Carburant0.75":=FALSE;
                            Carburant1:=FALSE;
                            "Fuel Gauge":=0;
                        end;
                    }
                }
                grid()
                {
                    Editable = GBoolModifyAllowed;
                    GridLayout = Rows;
                    field("0.25";'')
                    {
                        Caption = '0.25';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field("Carburant0.25"; "Carburant0.25")
                    {
                        ShowCaption = false;
                        Style = Strong;
                        StyleExpr = TRUE;

                        trigger OnValidate();
                        begin
                            Carburant0:=FALSE;
                            "Carburant0.25":=TRUE;
                            "Carburant0.5":=FALSE;
                            "Carburant0.75":=FALSE;
                            Carburant1:=FALSE;
                            "Fuel Gauge":=0.25;
                        end;
                    }
                }
                grid()
                {
                    Editable = GBoolModifyAllowed;
                    GridLayout = Rows;
                    field("0.5";'')
                    {
                        Caption = '0.5';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field("Carburant0.5";"Carburant0.5")
                    {
                        ShowCaption = false;
                        Style = Strong;
                        StyleExpr = TRUE;

                        trigger OnValidate();
                        begin
                            Carburant0:=FALSE;
                            "Carburant0.25":=FALSE;
                            "Carburant0.5":=TRUE;
                            "Carburant0.75":=FALSE;
                            Carburant1:=FALSE;
                            "Fuel Gauge":=0.5;
                        end;
                    }
                }
                grid()
                {
                    Editable = GBoolModifyAllowed;
                    GridLayout = Rows;
                    field("0.75";'')
                    {
                        Caption = '0.75';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field("Carburant0.75"; "Carburant0.75")
                    {
                        ShowCaption = false;
                        Style = Strong;
                        StyleExpr = TRUE;

                        trigger OnValidate();
                        begin
                            Carburant0:=FALSE;
                            "Carburant0.25":=FALSE;
                            "Carburant0.5":=FALSE;
                            "Carburant0.75":=TRUE;
                            Carburant1:=FALSE;
                            "Fuel Gauge":=0.75;
                        end;
                    }
                }
                grid()
                {
                    Editable = GBoolModifyAllowed;
                    GridLayout = Rows;
                    field("1";'')
                    {
                        Caption = '1';
                        Style = Strong;
                        StyleExpr = TRUE;
                    }
                    field("Carburant1"; Carburant1)
                    {
                        ShowCaption = false;
                        Style = Strong;
                        StyleExpr = TRUE;

                        trigger OnValidate();
                        begin
                            Carburant0:=FALSE;
                            "Carburant0.25":=FALSE;
                            "Carburant0.5":=FALSE;
                            "Carburant0.75":=FALSE;
                            Carburant1:=TRUE;
                            "Fuel Gauge":=1;
                        end;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Paint)
            {
                Caption = 'Tour de véhicule';
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    Pt : Page "60013";
                begin

                     IF ISCLEAR(environment) THEN
                      CREATE(environment,TRUE,TRUE);

                      // tempFolder := environment.ExpandEnvironmentStrings('%temp%');

                       tempFolder :='C:\Windows\Temp\';
                       tempFolder := CONVERTSTR (tempFolder,'\','/');

                       CLEAR(PageControl);
                       PageControl.InitUrl('http://ea-iis:8040/Auto.aspx?fiche='+tempFolder+FORMAT(Id));
                       PageControl.setFicheID(Id);
                       PageControl.RUNMODAL();
                end;
            }
            action(Imprimer)
            {
                Image = print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction();
                var
                    Control : Record "60009";
                begin
                    Control.RESET;
                    Control.SETRANGE(Id,Id);
                    Control.FINDFIRST;
                    REPORT.RUN(70028,TRUE,TRUE,Control);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        GintKilo:=Kilometrage;
    end;

    trigger OnAfterGetRecord();
    begin
        CALCFIELDS("Image Fuel Gauge");
        InitPage();
        IF "Fuel Gauge"=0 THEN
        Carburant0:=TRUE;

        IF "Fuel Gauge"=0.25 THEN
        "Carburant0.25":=TRUE;

        IF "Fuel Gauge"=0.5 THEN
        "Carburant0.5":=TRUE;

        IF "Fuel Gauge"=0.75 THEN
        "Carburant0.75":=TRUE;

        IF "Fuel Gauge"=1 THEN
        Carburant1:=TRUE;
        GintKilo:=Kilometrage;
        GTextRemarque:=Remarques;
    end;

    trigger OnClosePage();
    var
        RecControl : Record "60009";
    begin
    end;

    trigger OnOpenPage();
    begin
        /*
        RecGcompanyinformation.INIT;
        RecGcompanyinformation.INSERT;
        RecGcompanyinformation.Picture.IMPORT ('C:\inetpub\wwwroot\MAZDA\images\Modele.jpg');
        RecGcompanyinformation.CALCFIELDS(Picture);
        */
        CALCFIELDS("Image Fuel Gauge");
        ReceptionSAV.GET(Id);
        IF ReceptionSAV."Nbre Impressions">0 THEN
         GBoolModifyAllowed:=FALSE;

    end;

    var
        Container_Name : Text;
        Remarques : Text;
        RecGcompanyinformation : Record "79" temporary;
        txtLTB : Text[20];
        PageControl : Page "60013";
        tempFolder : Text[200];
        environment : Automation "{F935DC20-1CF0-11D0-ADB9-00C04FD58A0B} 1.0:{72C24DD5-D70A-438B-8A42-98424B88AFB8}:'Windows Script Host Object Model'.WshShell";
        Carburant0 : Boolean;
        "Carburant0.25" : Boolean;
        "Carburant0.5" : Boolean;
        "Carburant0.75" : Boolean;
        Carburant1 : Boolean;
        Control : Record "60009";
        GBoolModifyAllowed : Boolean;
        ReceptionSAV : Record "60008";
        GintKilo : Integer;
        ERROR0001 : Label 'Le kilométrage ne peut être modifié qu''une seule fois';
        GTextRemarque : Text[250];
        ERROR0002 : Label 'Les remarques ne peuvent être modifiées qu''une seule fois';

    procedure Switch(E_A : Boolean;E_B : Boolean;V : Boolean);
    begin
    end;

    procedure InitPage() Res : Boolean;
    begin
        // Load Page As Record Data
              /*
               Res:=TRUE;
               GetEtat("Etat des plaques de police",Etat0_1,Etat0_2,A0_1,A0_2);
               GetEtat("Etat du vitre et parrebrise",Etat1_1,Etat1_2,A1_1,A1_2);
               GetEtat("Etat des feux avant/arriére",Etat2_1,Etat2_2,A2_1,A2_2);
               //GetEtat("Etat des feux arriere",Etat3_1,Etat3_2,A3_1,A3_2);
               GetEtat("Etat des feux AB",Etat4_1,Etat4_2,A4_1,A4_2);
               GetEtat("Etat carrosserie et peinture",Etat5_1,Etat5_2,A5_1,A5_2);
               GetEtat("Etat des balais essuie-glace",Etat6_1,Etat6_2,A6_1,A6_2);
               GetEtat("Etat des pneus",Etat14_1,Etat14_2,A14_1,A14_2);
              // GetEtat("Etat des pneus arriere",Etat15_1,Etat15_2,A15_1,A15_2);
               GetEtat("Roue se secours",Etat7_1,Etat7_2,A7_1,A7_2);
               GetEtat("Cric et manivelle",Etat8_1,Etat8_2,A8_1,A8_2);
               GetEtat("Allume Cigare",Etat9_1,Etat9_2,A9_1,A9_2);
               GetEtat(Extincteur,Etat10_1,Etat10_2,A10_1,A10_2);
               GetEtat("Boite pharmacie",Etat11_1,Etat11_2,A11_1,A11_2);
               GetEtat("Poste radio",Etat12_1,Etat12_2,A12_1,A12_2);
               GetEtat("Papier vehicule",Etat13_1,Etat13_2,A13_1,A13_2);
               GetEtat("Lumineux Tableau de borad",Etat16_1,Etat16_2,A16_1,A16_2);
               GetEtat("Lumineux Tableau de borad",Etat17_1,Etat17_2,A17_1,A17_2);
               GetEtat("Lumineux Tableau de borad",Etat18_1,Etat18_2,A18_1,A18_2);
               GetEtat("Circuit de suspensions",Etat19_1,Etat19_2,A19_1,A19_2);
               GetEtat("Etat de transmissions / Rotule",Etat20_1,Etat20_2,A20_1,A20_2);
               GetEtat("Etanchéité / état des graines",Etat21_1,Etat21_2,A21_1,A21_2);
               GetEtat("Etat des disques et plaquettes",Etat22_1,Etat22_2,A22_1,A22_2);
               GetEtat("Lumineux Tableau de borad",Etat23_1,Etat23_2,A23_1,A23_2);
               GetEtat("Lumineux Tableau de borad",Etat24_1,Etat24_2,A24_1,A24_2);
               GetEtat("Lumineux Tableau de borad",Etat25_1,Etat25_2,A25_1,A25_2);
               GetEtat("Lumineux Tableau de borad",Etat26_1,Etat26_2,A26_1,A26_2);
               GetEtat("Lumineux Tableau de borad",Etat27_1,Etat27_2,A27_1,A27_2);
               IF Etat16_2= TRUE THEN A16_3:=TRUE
               ELSE A16_3:=FALSE;*/

    end;

    procedure GetEtat(Champ : Integer;var EtatA : Boolean;var EtatB : Boolean;var VisA : Boolean;var VisB : Boolean);
    begin
        //Fonction qui permet d'avoir l'etat des champs dans la page
             /*IF Champ= 5 THEN //Etat Null
              BEGIN
               EtatA:=FALSE;
               EtatB:=FALSE;
               VisA:=TRUE;
               VisB:=TRUE;
              END
              ELSE IF Champ= 1 THEN  //Etat Bon
              BEGIN
               EtatA:=TRUE;
               EtatB:=FALSE;
               VisA:=TRUE;
               VisB:=FALSE;
        
              END
              ELSE IF Champ= 0 THEN  //Etat Defectueux
              BEGIN
               EtatA:=FALSE;
               EtatB:=TRUE;
               VisA:=FALSE;
               VisB:=TRUE;
        
              END;
              */

    end;
}

