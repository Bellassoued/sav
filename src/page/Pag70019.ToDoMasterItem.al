page 70019 "To - Do Master Item"
{
    PageType = NavigatePage;
    SourceTable = Table70016;

    layout
    {
        area(content)
        {
            group(Step1)
            {
                Caption = 'Step1';
                InstructionalText = 'Vous allez commencer la procedure de mise à jour Article Master';
                Visible = Step1Visible;
                field(Description;Description)
                {
                }
                field("Date Creation";"Date Creation")
                {
                }
            }
            group(Step2)
            {
                InstructionalText = 'Import Fichier ADDIN :';
                Visible = Step2Visible;
                field("DirectoryPath ADDIN";"DirectoryPath ADDIN")
                {
                    CaptionML = ENU='DirectoryPath',
                                FRA='Import Pre Master';
                    Editable = true;

                    trigger OnAssistEdit();
                    begin
                          IF PAGE.RUNMODAL(0,RecTableFichierADDIN) = ACTION::LookupOK THEN BEGIN
                          END;
                    end;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        IF "DirectoryPath ADDIN" = '' THEN
                                FileName := STRSUBSTNO('%1.txt',"DirectoryPath ADDIN")
                              ELSE
                                FileName := "DirectoryPath ADDIN" + STRSUBSTNO('\%1.txt',"DirectoryPath ADDIN");

                              FileName2 := CUFileManagement.OpenFileDialog('',FileName,'');
                              IF FileName <> FileName2 THEN BEGIN
                                path := CUFileManagement.GetDirectoryName(FileName2);
                                path := path+'\' + CUFileManagement.GetFileName(FileName2);
                                IF path <> '' THEN
                                  "DirectoryPath ADDIN" := COPYSTR(path,1,250);
                              END;
                    end;
                }
            }
            group(Step3)
            {
                InstructionalText = 'Import Fichier CDR :';
                Visible = Step3Visible;
                field("DirectoryPath CDR";"DirectoryPath CDR")
                {
                    Editable = true;

                    trigger OnAssistEdit();
                    begin
                        IF PAGE.RUNMODAL(0,RecTableFichierCDR) = ACTION::LookupOK THEN BEGIN
                          END;
                    end;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        CLEAR(FileName);
                        CLEAR(FileName2);
                        CLEAR(path);
                        IF "DirectoryPath CDR" = '' THEN
                                FileName := STRSUBSTNO('%1.txt',"DirectoryPath CDR")
                              ELSE
                                FileName := "DirectoryPath CDR" + STRSUBSTNO('\%1.txt',"DirectoryPath CDR");

                              FileName2 := CUFileManagement.OpenFileDialog('',FileName,'');
                              IF FileName <> FileName2 THEN BEGIN
                                path := CUFileManagement.GetDirectoryName(FileName2);
                                path := path+'\' + CUFileManagement.GetFileName(FileName2);
                                IF path <> '' THEN
                                  "DirectoryPath CDR" := COPYSTR(path,1,250);
                              END;
                    end;
                }
            }
            group(Step4)
            {
                InstructionalText = 'Clquer Suivant pour importer les données pre Master';
                Visible = Step4Visible;
                field("Import Article Pre Master";"Import Article Pre Master")
                {
                    Editable = false;
                }
            }
            group(Step5)
            {
                InstructionalText = 'Clquer Suivant pour importer les données';
                Visible = Step5Visible;
                field("Consulter Pre Master";"Consulter Pre Master")
                {
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        IF PAGE.RUNMODAL(0,RecItemPreMaster) = ACTION::LookupOK THEN BEGIN
                          END;
                    end;
                }
                field("Import Article Master";"Import Article Master")
                {
                    Caption = 'Consulter Ancien Master';
                    Editable = false;

                    trigger OnAssistEdit();
                    begin
                        IF PAGE.RUNMODAL(0,RecItemMaster) = ACTION::LookupOK THEN BEGIN
                          END;
                    end;
                }
                field(IntNbreAvantinsert;IntNbreAvantinsert)
                {
                    Caption = 'Nombre des Articles existe';
                    Editable = false;
                }
                field(IntNbreApresinsert;IntNbreApresinsert)
                {
                    Caption = 'Nombre des Article a mettre à jour';
                    Editable = false;
                }
            }
            group(Step6)
            {
                Visible = Step6Visible;
                part("Item Pre Master";70103)
                {
                }
                part(;70010)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Back)
            {
                CaptionML = ENU='&Back',
                            FRA='&Précédent';
                Enabled = BackEnable;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction();
                begin
                    ShowStep(FALSE);
                    PerformPrevWizardStatus;
                    ShowStep(TRUE);
                    CurrPage.UPDATE(TRUE);
                end;
            }
            action(Next)
            {
                CaptionML = ENU='&Next',
                            FRA='&Suivant';
                Enabled = NextEnable;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction();
                begin
                    CheckStatus;
                    ShowStep(FALSE);
                    PerformNextWizardStatus;
                    ShowStep(TRUE);
                    CurrPage.UPDATE(TRUE);
                end;
            }
            action(Finish)
            {
                CaptionML = ENU='&Finish',
                            FRA='&Terminer';
                Enabled = FinishEnable;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction();
                begin
                    CheckStatus;
                    FinishWizard;
                    CurrPage.CLOSE;
                end;
            }
            action("Import ADDIN")
            {
                Image = Import;
                InFooterBar = true;
                Visible = false;

                trigger OnAction();
                var
                    CustTxtFile : File;
                    XmlStream : InStream;
                begin
                    CLEAR(CustTxtFile);
                    CustTxtFile.OPEN(path);
                    CustTxtFile.CREATEINSTREAM(XmlStream);
                    XMLPORT.IMPORT(70065, XmlStream);
                    CustTxtFile.CLOSE;
                end;
            }
            action("Import CDR")
            {
                Image = Import;
                InFooterBar = true;
                Visible = false;

                trigger OnAction();
                var
                    CustTxtFile : File;
                    XmlStream : InStream;
                begin
                    CustTxtFile.OPEN(path);
                    CustTxtFile.CREATEINSTREAM(XmlStream);
                    XMLPORT.IMPORT(70001, XmlStream);
                    CustTxtFile.CLOSE;
                end;
            }
            action("Import Article Pre Paster")
            {
                InFooterBar = true;
            }
            action("Import Master item")
            {
                CaptionML = ENU='Import Master item',
                            FRA='Import article Master';
                Image = Quote;
                InFooterBar = true;
                Visible = false;

                trigger OnAction();
                begin
                    IF PAGE.RUNMODAL(0,RecItemMaster) = ACTION::LookupOK THEN BEGIN
                        "Import Article Master" :=  'import master item terminé';
                      END;
                end;
            }
        }
    }

    trigger OnInit();
    begin
        NextEnable := TRUE;
    end;

    trigger OnOpenPage();
    begin
        UpdateEditable;
        RecItemMaster.RESET;
        IntNbreAvantinsert:=RecItemMaster.COUNT;
        ShowStep(TRUE);
    end;

    var
        [InDataSet]
        FinishEnable : Boolean;
        [InDataSet]
        BackEnable : Boolean;
        [InDataSet]
        NextEnable : Boolean;
        [InDataSet]
        Step1Visible : Boolean;
        [InDataSet]
        Step2Visible : Boolean;
        [InDataSet]
        Step3Visible : Boolean;
        [InDataSet]
        Step4Visible : Boolean;
        [InDataSet]
        Step5Visible : Boolean;
        Step6Visible : Boolean;
        RecTableFichierADDIN : Record "70009";
        RecTableFichierCDR : Record "70011";
        RecItemMaster : Record "70007";
        CUFileManagement : Codeunit "419";
        XmlImportFicheADDIN : XMLport "70000";
        XmlImportFicheCDR : XMLport "70001";
        FileName : Text;
        FileName2 : Text;
        path : Text;
        IntNbreAvantinsert : Integer;
        IntNbreApresinsert : Integer;
        RepUpdatePreMasterItem : Report "70029";
        RecItemPreMaster : Record "70068";
        RecItemPreMasterPrice : Record "70069";
        RecItemPreMasterCount : Record "70068";

    local procedure ShowStep(Visible : Boolean);
    var
        ADDINCustTxtFile : File;
        ADDINXmlStream : InStream;
        CRDCustTxtFile : File;
        CDRXmlStream : InStream;
        LRepUpdateMasterItem : Report "70003";
    begin
        CASE "Wizard Step" OF
          "Wizard Step"::"1":
            BEGIN
              Step1Visible := Visible;
              IF Visible THEN BEGIN
                FinishEnable := FALSE;
                BackEnable := FALSE;
                NextEnable := TRUE;
              END;
            END;
          "Wizard Step"::"2":
            BEGIN
              Step2Visible := Visible;
              IF Visible THEN BEGIN
                FinishEnable := TRUE;
                BackEnable := TRUE;
                NextEnable := TRUE;
            END;
            END;
          /*
          "Wizard Step"::"3":
            BEGIN
              Step3Visible := FALSE;
              IF Visible THEN BEGIN
                CLEAR(ADDINCustTxtFile);
                ADDINCustTxtFile.OPEN(path);
                ADDINCustTxtFile.CREATEINSTREAM(ADDINXmlStream);
                XMLPORT.IMPORT(70065, ADDINXmlStream);
                ADDINCustTxtFile.CLOSE;
                RecTableFichierADDIN.RESET;
                IntNbreApresinsert := RecTableFichierADDIN.COUNT;
                FinishEnable := TRUE;
                BackEnable := TRUE;
                NextEnable := TRUE;
              END;
            END;
        
        
          "Wizard Step"::"4":
            BEGIN
              Step4Visible := Visible;
              IF Visible THEN BEGIN
                CRDCustTxtFile.OPEN(path);
                CRDCustTxtFile.CREATEINSTREAM(CDRXmlStream);
                XMLPORT.IMPORT(70001, CDRXmlStream);
                CRDCustTxtFile.CLOSE;
                FinishEnable := TRUE;
                BackEnable := TRUE;
                NextEnable := TRUE;
              END;
            END;
          */
          /*
          "Wizard Step"::"5":
            BEGIN
              Step5Visible := Visible;
              IF Visible THEN BEGIN
                RepUpdatePreMasterItem.RUN;
                FinishEnable := TRUE;
                BackEnable := TRUE;
                NextEnable := TRUE;
              END;
            END;
            */
              "Wizard Step"::"5":
            BEGIN
              Step3Visible := FALSE;
              IF Visible THEN BEGIN
                CLEAR(ADDINCustTxtFile);
                ADDINCustTxtFile.OPEN(path);
                ADDINCustTxtFile.CREATEINSTREAM(ADDINXmlStream);
                XMLPORT.IMPORT(70069, ADDINXmlStream);
                ADDINCustTxtFile.CLOSE;
                RecItemPreMasterCount.RESET;
                IntNbreApresinsert := RecItemPreMasterCount.COUNT;
                FinishEnable := TRUE;
                BackEnable := TRUE;
                NextEnable := TRUE;
              END;
            END;
            "Wizard Step"::"6":
            BEGIN
              Step6Visible := Visible;
              IF Visible THEN BEGIN
                LRepUpdateMasterItem.RUN;
                FinishEnable := TRUE;
                BackEnable := TRUE;
                NextEnable := FALSE;
              END;
            END;
        
        END;

    end;

    local procedure UpdateEditable();
    begin
        /*
        "Wizard Contact NameEditable" := FALSE;
        WizardCampaignDescriptionEdita := FALSE;
        
        IF SalesPurchPerson.GET(GETFILTER("Salesperson Code")) THEN
          "Salesperson CodeEditable" := FALSE;
        
        WizardEstimatedValueLCYEnable := "Activate First Stage";
        "WizardChancesofSuccess%Enable" := "Activate First Stage";
        WizardEstimatedClosingDateEnab := "Activate First Stage";
        */

    end;
}

