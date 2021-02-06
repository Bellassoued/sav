page 70032 "Payment Class CushMgt"
{
    // version NAVFR8.00,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Payment Class CushMgt',
                FRA='Types de règlement Tréso';
    DelayedInsert = true;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table10860;
    SourceTableView = WHERE(Enable=FILTER(Yes));

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Enable;Enable)
                {
                    Editable = false;
                }
                field(Code;Code)
                {
                    Editable = false;
                }
                field(Name;Name)
                {
                    Editable = false;
                }
                field(Suggestions;Suggestions)
                {
                    Editable = false;
                }
                field(Observation;Observation)
                {
                    Editable = false;
                }
                field("Inclu Profil";"Inclu Profil")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(DuplicateParameter)
                {
                    CaptionML = ENU='Duplicate Parameter',
                                FRA='Dupliquer le paramétrage';
                    Image = CopySerialNo;

                    trigger OnAction();
                    var
                        PaymentClass : Record "10860";
                        DuplicateParameter : Report "10872";
                    begin
                        IF Code <> '' THEN BEGIN
                          PaymentClass.SETRANGE(Code,Code);
                          DuplicateParameter.SETTABLEVIEW(PaymentClass);
                          DuplicateParameter.InitParameter(Code);
                          DuplicateParameter.RUNMODAL;
                        END;
                    end;
                }
                action("Import Parameters")
                {
                    CaptionML = ENU='Import Parameters',
                                FRA='Importer paramètres';
                    Image = Import;

                    trigger OnAction();
                    var
                        Instream : InStream;
                        ImportFile : File;
                        ToFile : Text[1024];
                    begin
                        UPLOAD('','','','',ToFile);
                        ImportFile.OPEN(ToFile);
                        ImportFile.CREATEINSTREAM(Instream);
                        XMLPORT.IMPORT(XMLPORT::"Import/Export Parameters",Instream);
                        ImportFile.CLOSE;
                    end;
                }
                action("Export Parameters")
                {
                    CaptionML = ENU='Export Parameters',
                                FRA='Exporter paramètres';
                    Image = Export;

                    trigger OnAction();
                    var
                        RBAutoMgt : Codeunit "419";
                        ServerFile : File;
                        Fileoutstream : OutStream;
                        ToFile : Text[1024];
                        ServerFileName : Text[1024];
                    begin
                        ServerFileName := RBAutoMgt.ServerTempFileName(Text002);

                        ServerFile.CREATE(ServerFileName);
                        ServerFile.CREATEOUTSTREAM(Fileoutstream);
                        XMLPORT.EXPORT(XMLPORT::"Import/Export Parameters",Fileoutstream);
                        ServerFile.CLOSE;

                        ToFile := Text003;
                        DOWNLOAD(ServerFileName,'','','',ToFile);
                        ERASE(ServerFileName);
                    end;
                }
            }
            action(Status)
            {
                CaptionML = ENU='St&atus',
                            FRA='Sta&tut';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 10865;
                RunPageLink = Payment Class=FIELD(Code);
            }
            action(Steps)
            {
                CaptionML = ENU='Ste&ps',
                            FRA='Eta&pes';
                Image = MoveToNextPeriod;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 10866;
                RunPageLink = Payment Class=FIELD(Code);
            }
            action("Valider détail profil")
            {
                Image = Post;

                trigger OnAction();
                begin

                    //MESSAGE('Profil.code %1',Profil.Code);
                    //MESSAGE('Profil.coffre %1',Profil.Coffre);
                    IF CONFIRM('Voulez vous affecter ce type pour le profil sélectionner',TRUE,FALSE) THEN
                      BEGIN
                    CLEAR(PaymentClass);
                    PaymentClass.SETFILTER(PaymentClass."Inclu Profil",'%1',TRUE);
                    PaymentClass.FIND('-');
                     REPEAT
                       //MESSAGE('Type %1',PaymentClass.Code);
                       CLEAR(PaymentStep);
                       PaymentStep.SETFILTER(PaymentStep."Payment Class",'%1',PaymentClass.Code);
                       PaymentStep.FIND('-');
                        REPEAT
                          CLEAR(Détailprofilréglement);
                         Détailprofilréglement.SETRANGE("Code profil réglement",Profil."Code Profil");
                         Détailprofilréglement.SETRANGE("Type de réglement",PaymentClass.Code);
                         Détailprofilréglement.SETRANGE("No. ligne",PaymentStep.Line);
                         Détailprofilréglement.SETRANGE(Coffre,Profil.Coffre);
                         IF NOT Détailprofilréglement.FIND('-') THEN
                          BEGIN
                            Détailprofilréglement."Code profil réglement" :=Profil."Code Profil";
                            Détailprofilréglement."Type de réglement":=PaymentClass.Code;
                            Détailprofilréglement."No. ligne"             :=PaymentStep.Line;
                            Détailprofilréglement."Etape de réglement" := PaymentStep.Name;
                            Détailprofilréglement.Coffre := Profil.Coffre;
                            Détailprofilréglement.Autoriser := FALSE;
                            Détailprofilréglement."Centre ge Gestion" := Profil."Centre de Gestion";
                            Détailprofilréglement."No. statut précédent" :=PaymentStep."Previous Status";
                            Détailprofilréglement."No. statut suivant" :=PaymentStep."Next Status";
                            Détailprofilréglement."Type action" :=PaymentStep."Action Type";

                            Détailprofilréglement.INSERT;
                          END
                          ELSE
                          BEGIN
                               Détailprofilréglement."No. statut précédent" :=PaymentStep."Previous Status";
                               Détailprofilréglement."No. statut suivant" :=PaymentStep."Next Status";
                               Détailprofilréglement."Type action" :=PaymentStep."Action Type";
                    Détailprofilréglement."Centre ge Gestion"           := Profil."Centre de Gestion";
                               Détailprofilréglement.MODIFY;
                          END;
                        UNTIL PaymentStep.NEXT = 0;
                     UNTIL PaymentClass.NEXT = 0;
                    END;
                end;
            }
        }
    }

    var
        Text002 : TextConst ENU='''txt''',FRA='''txt''';
        Text003 : TextConst ENU='Import_Export Parameters.txt',FRA='Import_Export parametres.txt';
        Profil : Record "70031";
        PaymentClass : Record "10860";
        PaymentStep : Record "10862";
        "Détailprofilréglement" : Record "70032";

    procedure SetParameters(SetProfil : Record "70031");
    begin
        Profil := SetProfil;
    end;
}

