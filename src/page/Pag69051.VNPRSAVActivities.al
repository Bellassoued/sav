page 69051 "VN PR SAV - Activities"
{
    // version Company Statistics

    PageType = CardPart;
    SourceTable = Table60046;

    layout
    {
        area(content)
        {
            Caption = 'VUE RECAPE';
            field(WORKDATE;WORKDATE)
            {
                Caption = 'JOURNEE';
            }
            group(CA)
            {
                Caption = 'CA';
                fixed()
                {
                    group("CA HT-J")
                    {
                        Caption = 'CA HT-J';
                        field("CA VN J";"CA VN J")
                        {
                            Caption = 'CA VN';
                        }
                        field("CA ACC-VN J";"CA ACC-VN J")
                        {
                            Caption = 'CA ACC-VN';
                        }
                        field("CA PR J";"CA PR J")
                        {
                            Caption = 'CA PR';
                        }
                        field("CA SAV J";"CA SAV J")
                        {
                            Caption = 'CA SAV';
                        }
                        field("CA VN J"+"CA ACC-VN J"+"CA PR J"+"CA SAV J";"CA VN J"+"CA ACC-VN J"+"CA PR J"+"CA SAV J")
                        {
                            Caption = 'TOTAL';
                        }
                    }
                    group("CA HT-M")
                    {
                        Caption = 'CA HT-M';
                        field("CA VN M";"CA VN M")
                        {
                        }
                        field("CA ACC-VN M";"CA ACC-VN M")
                        {
                        }
                        field("CA PR M";"CA PR M")
                        {
                        }
                        field("CA SAV M";"CA SAV M")
                        {
                        }
                        field("CA VN M"+"CA ACC-VN M"+"CA PR M"+"CA SAV M";"CA VN M"+"CA ACC-VN M"+"CA PR M"+"CA SAV M")
                        {
                            Caption = 'TOTALM';
                        }
                    }
                    group("CA HT-AN")
                    {
                        Caption = 'CA HT-AN';
                        field("CA VN A";"CA VN A")
                        {
                        }
                        field("CA ACC-VN A";"CA ACC-VN A")
                        {
                        }
                        field("CA PR A";"CA PR A")
                        {
                        }
                        field("CA SAV A";"CA SAV A")
                        {
                        }
                        field("CA VN A"+"CA ACC-VN A"+"CA PR A"+"CA SAV A";"CA VN A"+"CA ACC-VN A"+"CA PR A"+"CA SAV A")
                        {
                            Caption = 'TOTALAN';
                        }
                    }
                    group("CA BUD")
                    {
                        Caption = 'CA BUD';
                        field("Budget CA VN";"Budget CA VN")
                        {
                            HideValue = true;
                        }
                        field("Budget CA ACC-VN";"Budget CA ACC-VN")
                        {
                            HideValue = true;
                        }
                        field("Budget CA PR";"Budget CA PR")
                        {
                            HideValue = true;
                        }
                        field("Budget CA SAV";"Budget CA SAV")
                        {
                            HideValue = true;
                        }
                    }
                    group("ECART-BUD")
                    {
                        Caption = 'ECART-BUD';
                        field("Budget CA VN"-"CA VN A";"Budget CA VN"-"CA VN A")
                        {
                            HideValue = true;
                            StyleExpr = MyStyleVarVN;
                        }
                        field("Budget CA ACC-VN"-"CA ACC-VN A";"Budget CA ACC-VN"-"CA ACC-VN A")
                        {
                            HideValue = true;
                            StyleExpr = MyStyleVarACC;
                        }
                        field("Budget CA PR"-"CA PR A";"Budget CA PR"-"CA PR A")
                        {
                            HideValue = true;
                            StyleExpr = MyStyleVarPR;
                        }
                        field("Budget CA SAV"-"CA SAV A";"Budget CA SAV"-"CA SAV A")
                        {
                            HideValue = true;
                            StyleExpr = MyStyleVarSAV;
                        }
                    }
                }
            }
            group(ENCAISSEMENT)
            {
                Caption = 'ENCAISSEMENT';
                fixed()
                {
                    group("ENCAISS-ESP")
                    {
                        Caption = 'ENCAISS-ESP';
                        field("Enc.Esp.Fact";"Enc.Esp.Fact")
                        {
                            Caption = 'FACTURE';
                        }
                    }
                    group("ENC-CQ")
                    {
                        Caption = 'ENC-CQ';
                        field("Enc.Chq.Fact";"Enc.Chq.Fact")
                        {
                        }
                    }
                    group("ENC-EFF")
                    {
                        Caption = 'ENC-EFF';
                        field("Enc.Eff.Fact";"Enc.Eff.Fact")
                        {
                        }
                    }
                    group(Autres)
                    {
                        Caption = 'Autres';
                        field("Enc.Autres.Fact";"Enc.Autres.Fact")
                        {
                        }
                    }
                    group(TOTAL)
                    {
                        Caption = 'TOTAL';
                        field("Enc.Esp.Fact"+"Enc.Chq.Fact"+"Enc.Eff.Fact"+"Enc.Autres.Fact";"Enc.Esp.Fact"+"Enc.Chq.Fact"+"Enc.Eff.Fact"+"Enc.Autres.Fact")
                        {
                        }
                    }
                    group("SDE CLIENT")
                    {
                        Caption = 'SDE CLIENT';
                        field("SDE Client Fact";"SDE Client Fact")
                        {
                        }
                    }
                }
            }
            group(IMPAYE)
            {
                Caption = 'IMPAYE';
                fixed()
                {
                    group("CUMUL ANN")
                    {
                        Caption = 'CUMUL ANN';
                        field("Enc.Esp.IMP";"Enc.Esp.IMP")
                        {
                            Caption = 'TOTAL IMPAYE';
                        }
                        field("Enc.Chq.IMP";"Enc.Chq.IMP")
                        {
                            Caption = 'Recouvrement IMPAYE';
                        }
                        field("Enc.Esp.IMP"-"Enc.Chq.IMP";"Enc.Esp.IMP"-"Enc.Chq.IMP")
                        {
                            Caption = 'SOLDE IMPAYE';
                        }
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        IF ("Budget CA VN"-"CA VN A" > 0) THEN   MyStyleVarVN := 'Attention' ELSE   MyStyleVarVN := 'Favorable';
        IF ("Budget CA ACC-VN"-"CA ACC-VN A" > 0) THEN   MyStyleVarACC := 'Attention' ELSE   MyStyleVarACC := 'Favorable';
        IF ("Budget CA PR"-"CA PR A" > 0) THEN   MyStyleVarPR := 'Attention' ELSE   MyStyleVarPR := 'Favorable';
        IF ("Budget CA SAV"-"CA SAV A" > 0) THEN   MyStyleVarSAV := 'Attention' ELSE   MyStyleVarSAV := 'Favorable';
    end;

    var
        MyStyleVarVN : Code[20];
        MyStyleVarACC : Code[20];
        MyStyleVarPR : Code[20];
        MyStyleVarSAV : Code[20];
}

