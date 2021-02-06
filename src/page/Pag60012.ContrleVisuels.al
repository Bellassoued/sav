page 60012 "Contrôle Visuels"
{
    // version SAV Automobile

    SourceTable = Table60009;

    layout
    {
        area(content)
        {
            group(Accessoires)
            {
                CaptionML = ENU='Accessoires',
                            FRA='Accessoires';
                grid()
                {
                    GridLayout = Rows;
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field("Roue de Secours";'')
                        {
                            CaptionML = ENU='Roue de Secours',
                                        FRA='Roue de Secours...................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EPPB;"Etat des plaques de policeB")
                        {
                            CaptionML = ENU='Oui',
                                        FRA='Oui';
                            ShowCaption = true;

                            trigger OnValidate();
                            begin
                                IF "Etat des plaques de policeB" THEN
                                  calc1 := 1
                                ELSE
                                   calc1 := 0
                            end;
                        }
                        field(EPPD;"Etat des plaques de policeD")
                        {
                            CaptionML = ENU='Non',
                                        FRA='Non';
                            ShowCaption = true;

                            trigger OnValidate();
                            begin
                                IF "Etat des plaques de policeD" THEN
                                  calc1 := 1
                                ELSE
                                  calc1 := 0
                            end;
                        }
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field(Cric;'')
                        {
                            CaptionML = ENU='Cric',
                                        FRA='Cric....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EVPB;"Etat du vitre et parrebriseB")
                        {
                            Caption = 'Oui';
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
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field("Triangle de panne";'')
                        {
                            CaptionML = ENU='Triangle de panne',
                                        FRA='Triangle de panne....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EFAAB;"Etat des feux avant arriereB")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
                            Editable = true;
                            ShowCaption = false;
                        }
                        field(EFAAD;"Etat des feux avant arriereD")
                        {
                            Caption = 'Non';
                            Editable = true;
                            ShowCaption = false;
                        }
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field("Ecrou antivol";'')
                        {
                            CaptionML = ENU='Ecrou antivol',
                                        FRA='Ecrou antivol....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(ECPB;"Etat carrosserie et peinture B")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
                            Editable = true;
                            Numeric = false;
                            ShowCaption = false;
                        }
                        field(ECPD;"Etat carrosserie et peinture D")
                        {
                            Caption = 'Non';
                            Editable = true;
                            ShowCaption = false;
                        }
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field(Extincteur;'')
                        {
                            CaptionML = ENU='Extincteur',
                                        FRA='Extincteur....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EBEGB;"Etat des balais essuie-glaceB")
                        {
                            Caption = 'Oui';
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
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field("Boite pharmacie";'')
                        {
                            CaptionML = ENU='Boite pharmacie',
                                        FRA='Boite pharmacie....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EPB;"Etat des pneus B")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
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
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field("Trousse outillage";'')
                        {
                            CaptionML = ENU='Trousse outillage',
                                        FRA='Trousse outillage....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EPBO;"Etat des plaques de policeA")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
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
                        field(EPDN;"Etat du vitre et parrebriseA")
                        {
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field(Manivelle;'')
                        {
                            CaptionML = ENU='Manivelle',
                                        FRA='Manivelle....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EPO;"Etat carrosserie et peinture A")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
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
                        field(EPN;"Etat des feux avant arriereA")
                        {
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field("Allume Cigar";'')
                        {
                            CaptionML = ENU='Allume Cigar',
                                        FRA='Allume Cigar....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EPOO;"Etat des balais essuie-glaceA")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
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
                        field(EPNN;"Etat des pneus A")
                        {
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field(Radio;'')
                        {
                            CaptionML = ENU='Radio',
                                        FRA='Radio....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EPY;"Circuit de suspensionsA")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
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
                        field(EPYN;"Etat de transmissions/RotuleA")
                        {
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        Editable = GBoolModifyAllowed;
                        field(Enjoliveurs;'')
                        {
                            CaptionML = ENU='Enjoliveurs',
                                        FRA='Enjoliveurs....................................................................................................................................................................................................';
                            ShowCaption = false;
                        }
                        field(EFEA;"Etat de fixation échappementA")
                        {
                            AssistEdit = false;
                            Caption = 'Oui';
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
                        field(EEGA;"Etanchéité / état des grainesA")
                        {
                            Caption = 'Non';
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
                    }
                    group()
                    {
                        field("Autre Acc";"Autre Acc")
                        {
                            Caption = 'Autre';
                        }
                    }
                }
            }
            group("Tour de Véhicule : Etat")
            {
                Caption = 'Tour de Véhicule : Etat';
                group()
                {
                    field(CAB;'')
                    {
                        Visible = false;
                    }
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Plaque police";'')
                            {
                                CaptionML = ENU='Plaque police',
                                            FRA='Plaque police.......................................................................................................................................................';
                                ShowCaption = false;
                            }
                            field(EACSB;"Circuit de suspensionsB")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='Bon';
                                ShowCaption = true;

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
                                CaptionML = ENU='Défect',
                                            FRA='Défect';
                                ShowCaption = true;

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
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field(Vitres;'')
                            {
                                CaptionML = ENU='Vitres',
                                            FRA='Vitres';
                                ShowCaption = false;
                            }
                            field(TRB;"Etat de transmissions/RotuleB")
                            {
                                Caption = 'Bon';
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
                                Caption = 'Défect';
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
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Pare-brise";'')
                            {
                                CaptionML = ENU='Pare-brise',
                                            FRA='Pare-brise';
                                ShowCaption = false;
                            }
                            field(EFEB;"Etat de fixation échappementB")
                            {
                                Caption = 'Bon';
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
                                Caption = 'Défect';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Lunette-AR";'')
                            {
                                CaptionML = ENU='Lunette-AR',
                                            FRA='Lunette-AR';
                                ShowCaption = false;
                            }
                            field(EEGB;"Etanchéité / état des grainesB")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='EEGB';
                                ShowCaption = false;
                            }
                            field(EEGD;"Etanchéité / état des grainesD")
                            {
                                CaptionML = ENU='Défect',
                                            FRA='EEGD';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Feu AV";'')
                            {
                                CaptionML = ENU='Feu AV',
                                            FRA='Feu AV';
                                ShowCaption = false;
                            }
                            field(EDPFB;"Etat disques et plaquettesB")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='EDPFB';
                                ShowCaption = false;
                            }
                            field(EDPFD;"Etat disques et plaquettesD")
                            {
                                CaptionML = ENU='Défect',
                                            FRA='EDPFD';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Feu AR";'')
                            {
                                CaptionML = ENU='Feu AR',
                                            FRA='Feu AR';
                                ShowCaption = false;
                            }
                            field(EEGAY;"Etat disques et plaquettesA")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='EEGB';
                                ShowCaption = false;
                            }
                            field(EEGDN;"Huile moteurA")
                            {
                                CaptionML = ENU='Défect',
                                            FRA='EEGD';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Rétroviseur";'')
                            {
                                CaptionML = ENU='Rétroviseur',
                                            FRA='Rétroviseur';
                                ShowCaption = false;
                            }
                            field(LRA;"Liquide de refroidissementA")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='EEGB';
                                ShowCaption = false;
                            }
                            field(LFLHMLDSBA;"Liquide freins ou LHM ou LDSA")
                            {
                                CaptionML = ENU='Défect',
                                            FRA='EEGD';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Balais essuie-glace";'')
                            {
                                CaptionML = ENU='Balais essuie-glace',
                                            FRA='Balais essuie-glace';
                                ShowCaption = false;
                            }
                            field(LDA;"Liquide  de directionA")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='EEGB';
                                ShowCaption = false;
                            }
                            field(EBA;"Etat de batterieA")
                            {
                                CaptionML = ENU='Défect',
                                            FRA='EEGD';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field(Pneus;'')
                            {
                                CaptionML = ENU='Pneus',
                                            FRA='Pneus';
                                ShowCaption = false;
                            }
                            field(" Carburt0";"Papier vehiculeB")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='EEGB';
                                ShowCaption = false;
                            }
                            field(" Carburt1";"Papier vehiculeD")
                            {
                                CaptionML = ENU='Défect',
                                            FRA='EEGD';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            field("Autre Etat";"Autre Etat")
                            {
                                Caption = 'Autre';
                            }
                        }
                    }
                }
            }
            group("Propreté & Fonctionnement")
            {
                CaptionML = ENU='Propreté & Fonctionnement',
                            FRA='Propreté & Fonctionnement';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("<Propreté Int...............................................................................................................................................................................................................................>";'')
                            {
                                CaptionML = ENU='<Propreté Int...............................................................................................................................................................................................................................>',
                                            FRA='Propreté Int...............................................................................................................................................................................................................................';
                                ShowCaption = false;
                            }
                            field("Bon.";"Huile moteurB")
                            {
                                CaptionML = ENU='Oui',
                                            FRA='Oui';
                                StyleExpr = TRUE;
                            }
                            field("Défectueux.";"Huile moteurD")
                            {
                                CaptionML = ENU='Non',
                                            FRA='Non';
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Propreté Ext";'')
                            {
                                CaptionML = ENU='Propreté Ext',
                                            FRA='Propreté Ext';
                                ShowCaption = false;
                            }
                            field(LRB;"Liquide de refroidissementB")
                            {
                                AssistEdit = false;
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(LRD;"Liquide de refroidissementD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Propreté Housse";'')
                            {
                                CaptionML = ENU='Propreté Housse',
                                            FRA='Propreté Housse';
                                ShowCaption = false;
                            }
                            field(LFLHMLDSBB;"Liquide freins ou LHM ou LDSB")
                            {
                                AssistEdit = false;
                                Caption = 'Oui';
                                Numeric = false;
                                ShowCaption = false;
                            }
                            field(LFLHMLDSBD;"Liquide freins ou LHM ou LDSD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Propreté Tapis";'')
                            {
                                CaptionML = ENU='Propreté Tapis',
                                            FRA='Propreté Tapis';
                                ShowCaption = false;
                            }
                            field(LDB;"Liquide  de directionB")
                            {
                                AssistEdit = false;
                                Caption = 'Oui';
                                Numeric = false;
                                ShowCaption = false;
                            }
                            field(LDD;"Liquide  de directionD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Fonct. Leve Vitre";'')
                            {
                                CaptionML = ENU='Fonct. Leve Vitre',
                                            FRA='Fonct. Leve Vitre';
                                ShowCaption = false;
                            }
                            field("Etat de batterieB";"Etat de batterieB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field("Etat de batterieD";"Etat de batterieD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Fonct. Radio";'')
                            {
                                CaptionML = ENU='Fonct. Radio',
                                            FRA='Fonct. Radio';
                                ShowCaption = false;
                            }
                            field(Carburant25;TriangleB)
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(Carburant05;"Roue se secoursB")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Fonct. A/C";'')
                            {
                                CaptionML = ENU='Fonct. A/C',
                                            FRA='Fonct. A/C';
                                ShowCaption = false;
                            }
                            field(" Carburant75";"Kit de dépannage provisoireB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(GiletB;GiletB)
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            field("Autre Fonct";"Autre Fonct")
                            {
                                Caption = 'Autre';
                            }
                        }
                    }
                }
            }
            group("Controle sous capot moteur")
            {
                CaptionML = ENU='Controle sous capot moteur',
                            FRA='Controle sous capot moteur';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Huile Moteur..............................................................................................................................................................................................................>";'')
                            {
                                CaptionML = ENU='Huile Moteur..............................................................................................................................................................................................................>',
                                            FRA='Huile Moteur..............................................................................................................................................................................................................';
                                ShowCaption = false;
                            }
                            field(PCTB;"Pré-Contôle TechniqueB")
                            {
                                CaptionML = ENU='Bon',
                                            FRA='Bon';
                                ShowCaption = true;
                            }
                            field(PCTD;"Pré-Contôle TechniqueD")
                            {
                                CaptionML = ENU='Mauvais',
                                            FRA='Mauvais';
                                ShowCaption = true;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Liquide de refroidissement";'')
                            {
                                CaptionML = ENU='Liquide de refroidissement',
                                            FRA='Liquide de refroidissement';
                                ShowCaption = false;
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
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Liquide Frein";'')
                            {
                                CaptionML = ENU='Liquide Frein',
                                            FRA='Liquide Frein';
                                ShowCaption = false;
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
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Liquide de Direction";'')
                            {
                                CaptionML = ENU='Liquide de Direction',
                                            FRA='Liquide de Direction';
                                ShowCaption = false;
                            }
                            field(Rcarb;"Carnet d'entretienB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(Rcard;"Carnet d'entretienD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Liquide de Lave-glace";'')
                            {
                                CaptionML = ENU='Liquide de Lave-glace',
                                            FRA='Liquide de Lave-glace';
                                ShowCaption = false;
                            }
                            field(Rcarb1;"CD/SD Card NAV.B")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(Rcard1;"CD/SD Card NAV.D")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Etat Batterie";'')
                            {
                                CaptionML = ENU='Etat Batterie',
                                            FRA='Etat Batterie';
                                ShowCaption = false;
                            }
                            field(Rcarb2;"Ecrou antivolB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(Rcard2;"Ecrou antivolD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
            group("Autre : Qualité de service")
            {
                CaptionML = ENU='Autre : Qualité de service',
                            FRA='Qualité de service';
                group()
                {
                    //The GridLayout property is only supported on controls of type Grid
                    //GridLayout = Columns;
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field(Retour;'')
                            {
                                CaptionML = ENU='Retour',
                                            FRA='Retour';
                                ShowCaption = false;
                            }
                            field(ClientVenuB;"Même incident(retour atelier)B")
                            {
                                Caption = 'Oui';
                            }
                            field(ClientVenuD;"Même incident(retour atelier)D")
                            {
                                Caption = 'Non';
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Retour suite à la visite faite chez Réseaux BSB";'')
                            {
                                CaptionML = ENU='Retour suite à la visite faite chez Réseaux BSB',
                                            FRA='Retour suite à la visite faite chez Réseaux BSB';
                                ShowCaption = false;
                            }
                            field(ECRB;"Existence compagne(s) rappelB")
                            {
                                Caption = 'Oui';
                                ShowCaption = false;
                            }
                            field(ECRD;"Existence compagne(s) rappelD")
                            {
                                Caption = 'Non';
                                ShowCaption = false;
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Fiche incident client";'')
                            {
                                Caption = 'Fiche incident client';
                                ShowCaption = false;
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
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Info SSC / CSC";'')
                            {
                                CaptionML = ENU='Info SSC / CSC',
                                            FRA='Essai routier avec le client';
                                ShowCaption = false;
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
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Compagnie d'assurance";'')
                            {
                                CaptionML = ENU='Compagnie d''assurance',
                                            FRA='Info SSC / CSC';
                                ShowCaption = false;
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
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Compagnie D'assurance";'')
                            {
                                Caption = 'Compagnie D''assurance';
                                ShowCaption = false;
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
                            field("Compagnie D'assurance";"Compagnie D'assurance")
                            {
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
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field("Véhicule Remorqué....................................................................................................................................................................................................";'')
                            {
                                CaptionML = ENU='Véhicule Remorqué....................................................................................................................................................................................................',
                                            FRA='Véhicule Remorqué....................................................................................................................................................................................................';
                                ColumnSpan = 3;
                                ShowCaption = false;
                            }
                            field(CARRB;"Photo expertiseB")
                            {
                                Caption = 'oui';
                            }
                            field(CARRD;"Photo expertiseD")
                            {
                                Caption = 'Non';
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            field(Carburant;'')
                            {
                                CaptionML = ENU='Carburant',
                                            FRA='Carburant.......................................................................................................................................................................................................';
                                ColumnSpan = 3;
                                ShowCaption = false;
                            }
                            field(Carburant000;Carburant000)
                            {
                                Caption = '0';
                            }
                            field(Carburant025;Carburant025)
                            {
                                Caption = '1/4';
                            }
                            field(Carburant005;Carburant005)
                            {
                                Caption = '1/2';
                            }
                            field(Carburant075;Carburant075)
                            {
                                Caption = '3/4';
                            }
                            field(Carburant001;Carburant001)
                            {
                                Caption = '1';
                            }
                        }
                    }
                    group()
                    {
                        field(Kilometrage;Kilometrage)
                        {
                            Caption = 'Kilométrage....................................................................................................................................................................................................................................................';

                            trigger OnValidate();
                            var
                                ReceptionNo : Code[20];
                                Vin : Code[20];
                                RecDate : Date;
                            begin
                                ReceptionSAV.GET(Id);

                                //IF ReceptionSAV."Nbre Impressions">0 THEN BEGIN
                                //IF "Ancien kilométrage"=0 THEN
                                  //"Ancien kilométrage":=GintKilo
                                //ELSE
                                  //ERROR(ERROR0001);
                                //END;
                            end;
                        }
                        field("Ancien kilométrage";"Ancien kilométrage")
                        {
                            Caption = 'Ancien kilométrage............................................................................................................................................................................................................';
                        }
                        field(Remarques;Remarques)
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
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            //The GridLayout property is only supported on controls of type Grid
                            //GridLayout = Rows;
                            field("N°Visite";'')
                            {
                                CaptionML = ENU='N°Visite',
                                            FRA='N°Visite';
                                ShowCaption = false;
                                Style = Strong;
                                StyleExpr = TRUE;
                            }
                            field("Visite 1";"Visite 1")
                            {
                                Caption = '1';
                            }
                            field("Visite 2";"Visite 2")
                            {
                                Caption = '2';
                            }
                            field("Visite 3";"Visite 3")
                            {
                                Caption = '3';
                            }
                            field("Visite 4";"Visite 4")
                            {
                                Caption = '4';
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            //The GridLayout property is only supported on controls of type Grid
                            //GridLayout = Rows;
                            field("Visite SR chez réseau BSB";'')
                            {
                                CaptionML = ENU='Visite SR chez réseau BSB',
                                            FRA='Visite SR chez réseau BSB';
                                ShowCaption = false;
                            }
                            field(visitebsbY;visitebsbY)
                            {
                                Caption = 'Oui';
                            }
                            field(visitebsbN;visitebsbN)
                            {
                                Caption = 'Non';
                            }
                            field(NomAgence;NomAgence)
                            {
                                Caption = 'Nom Agence';
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            //The GridLayout property is only supported on controls of type Grid
                            //GridLayout = Rows;
                            field(Garantie;'')
                            {
                                CaptionML = ENU='Garantie',
                                            FRA='Garantie';
                                ShowCaption = false;
                            }
                            field(GarantieY;GarantieY)
                            {
                                Caption = 'Oui';
                            }
                            field(GarantieN;GarantieN)
                            {
                                Caption = 'Non';
                            }
                        }
                        group()
                        {
                            Editable = GBoolModifyAllowed;
                            //The GridLayout property is only supported on controls of type Grid
                            //GridLayout = Rows;
                            field(RDV;'')
                            {
                                CaptionML = ENU='RDV',
                                            FRA='RDV';
                                ShowCaption = false;
                            }
                            field(RDVY;RDVY)
                            {
                                Caption = 'Avec';
                            }
                            field(RDVN;RDVN)
                            {
                                Caption = 'Sans';
                            }
                        }
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
                Visible = false;

                trigger OnAction();
                var
                    Pt : Page "60013";
                begin
                    /*//   NM250219
                     IF ISCLEAR(environment) THEN
                      CREATE(environment,TRUE,TRUE);
                    
                      // tempFolder := environment.ExpandEnvironmentStrings('%temp%');
                    
                       tempFolder :='C:\Windows\Temp\';
                       tempFolder := CONVERTSTR (tempFolder,'\','/');
                    
                       CLEAR(PageControl);
                      PageControl.InitUrl('http://ea-iis:8040/Auto.aspx?fiche='+tempFolder+FORMAT(Id));
                       PageControl.setFicheID(Id);
                       PageControl.RUNMODAL();
                    */
                    //NM250219

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
                    ReceptionSAVKKKK.RESET;
                    //Control.SETRANGE(Id,Id);
                    ReceptionSAVKKKK.SETRANGE("Reception No",Id);
                    ReceptionSAVKKKK.FINDFIRST;
                    REPORT.RUN(50108,TRUE,TRUE,ReceptionSAVKKKK);
                    //Modifier := FALSE;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        IF ReceptionSAV.GET(Id) THEN BEGIN
        IF ReceptionSAV."Nbre Impressions">0 THEN
         GBoolModifyAllowed:=FALSE
        ELSE GBoolModifyAllowed:=TRUE;
        END ELSE
         BEGIN
          RecPreparationVN.GET(Id)
         END;
        GintKilo:=Kilometrage;
        GTextRemarque:=Remarques;
    end;

    trigger OnAfterGetRecord();
    begin
        IF ReceptionSAV.GET(Id) THEN
          BEGIN
            VIN := ReceptionSAV.VIN ;
        IF ReceptionSAV."Nbre Impressions">0 THEN
         GBoolModifyAllowed:=FALSE
        ELSE GBoolModifyAllowed:=TRUE;
        END
        ELSE
         BEGIN
          RecPreparationVN.GET(Id);
         END;
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
        //GintKilo:=Kilometrage;
        GTextRemarque:=Remarques;

        LastReceptionSAV.RESET;
        LastReceptionSAV.SETRANGE(VIN,VIN);
        //MESSAGE('%1',VIN);
        LastReceptionSAV.SETFILTER("Reception Date",'<=%1',ReceptionSAV."Creation date");
        LastReceptionSAV.SETFILTER("Reception No",'<>%1',ReceptionSAV."Reception No");
        LastReceptionSAV.SETCURRENTKEY("Reception No");
        LastReceptionSAV.ASCENDING(TRUE);
        LastReceptionSAV.SETRANGE("Last repair No.","Reception No");
        IF LastReceptionSAV.FINDLAST THEN BEGIN
         // MESSAGE('%1..%2',LastReceptionSAV."Creation date",LastReceptionSAV."Reception No");
          "Ancien kilométrage" := LastReceptionSAV.Kilométrage;
        MODIFY;
        END;
    end;

    trigger OnClosePage();
    var
        RecControl : Record "60009";
    begin
        /*
        ServiceHeader.RESET;
        ServiceHeader.SETRANGE("Reception No","Reception No");
        IF ServiceHeader.FINDFIRST THEN
          ServiceHeader.Kilométrage:=Kilometrage;
        ServiceHeader.MODIFY;
        */

    end;

    trigger OnOpenPage();
    var
        ReceptionNo : Code[20];
        Vin : Code[20];
        RecDate : Date;
    begin
        /*
        RecGcompanyinformation.INIT;
        RecGcompanyinformation.INSERT;
        RecGcompanyinformation.Picture.IMPORT ('C:\inetpub\wwwroot\MAZDA\images\Modele.jpg');
        RecGcompanyinformation.CALCFIELDS(Picture);
        */
        CALCFIELDS("Image Fuel Gauge");
        
        IF ReceptionSAV.GET(Id) THEN BEGIN
         IF ReceptionSAV."Nbre Impressions">0 THEN
         GBoolModifyAllowed:=FALSE
        
        ELSE GBoolModifyAllowed:=TRUE;
        END ELSE
         BEGIN
          RecPreparationVN.GET(Id)
         END;
        
         ReceptionSAV.RESET;
         ReceptionSAV.SETRANGE("Reception No","Reception No");
         IF Rec.FINDSET THEN BEGIN
         Rec.VIN := ReceptionSAV.VIN;
         MODIFY; END;

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
        ServiceHeader : Record "5900";
        GBoolModifyAllowed : Boolean;
        ReceptionSAV : Record "60008";
        GintKilo : Integer;
        ERROR0001 : Label 'Le kilométrage ne peut être modifié qu''une seule fois';
        GTextRemarque : Text[250];
        ERROR0002 : Label 'Les remarques ne peuvent être modifiées qu''une seule fois';
        RecPreparationVN : Record "60025";
        Modifier : Boolean;
        calc1 : Integer;
        ReceptionSAVKKKK : Record "60008";
        LastReceptionSAV : Record "60008";

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

