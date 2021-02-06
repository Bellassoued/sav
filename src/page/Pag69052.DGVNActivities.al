page 69052 "DG VN - Activities"
{
    // version Company Statistics

    PageType = CardPart;
    SourceTable = Table9053;

    layout
    {
        area(content)
        {
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='Devis';
                field("NB DEVIS VN /J";"NB DEVIS VN /J")
                {
                    DrillDownPageID = "Sales Quotes VN";
                    LookupPageID = "Sales Quotes VN";
                }
                field("NB COMMANDE VN /J";"NB COMMANDE VN /J")
                {
                    DrillDownPageID = "Sales Order List VN";
                    LookupPageID = "Sales Order List VN";
                }
                field("NB CHASSIS FAC /J";"NB CHASSIS FAC /J")
                {
                }
                field("NB CHASSIS FAC CUM";"NB CHASSIS FAC CUM")
                {
                }

                actions
                {
                    action("New Sales Quote")
                    {
                        CaptionML = ENU='New Sales Quote',
                                    FRA='Nouveau devis';
                        Image = Quote;
                        RunObject = Page 60081;
                        RunPageMode = Create;
                    }
                    action("New Sales Order")
                    {
                        CaptionML = ENU='New Sales Order',
                                    FRA='Nouvelle commande vente';
                        RunObject = Page 60084;
                        RunPageMode = Create;
                    }
                }
            }
            group()
            {
            }
            group()
            {
                fixed()
                {
                    group("CA QT")
                    {
                        Caption = 'CA QT';
                        field(RecCompanyStatistics."PU CA QT";RecCompanyStatistics."PU CA QT")
                        {
                            Caption = 'PICKUP';
                        }
                        field(RecCompanyStatistics."VP CA QT";RecCompanyStatistics."VP CA QT")
                        {
                            Caption = 'VP';
                        }
                        field(RecCompanyStatistics."SUV CA QT";RecCompanyStatistics."SUV CA QT")
                        {
                            Caption = 'SUV';
                        }
                        field(RecCompanyStatistics."PU CA QT"+RecCompanyStatistics."VP CA QT"+RecCompanyStatistics."SUV CA QT";RecCompanyStatistics."PU CA QT"+RecCompanyStatistics."VP CA QT"+RecCompanyStatistics."SUV CA QT")
                        {
                            Caption = 'TOTAL';
                        }
                    }
                    group("CA HT")
                    {
                        Caption = 'CA HT';
                        field(RecCompanyStatistics."PU CA HT";RecCompanyStatistics."PU CA HT")
                        {
                        }
                        field(RecCompanyStatistics."VP CA HT";RecCompanyStatistics."VP CA HT")
                        {
                        }
                        field(RecCompanyStatistics."SUV CA HT";RecCompanyStatistics."SUV CA HT")
                        {
                        }
                        field(RecCompanyStatistics."PU CA HT"+RecCompanyStatistics."VP CA HT"+RecCompanyStatistics."SUV CA HT";RecCompanyStatistics."PU CA HT"+RecCompanyStatistics."VP CA HT"+RecCompanyStatistics."SUV CA HT")
                        {
                        }
                    }
                    group("ST DED")
                    {
                        Caption = 'ST DED';
                        field(RecCompanyStatistics."PU ST DED";RecCompanyStatistics."PU ST DED")
                        {
                        }
                        field(RecCompanyStatistics."VP ST DED";RecCompanyStatistics."VP ST DED")
                        {
                        }
                        field(RecCompanyStatistics."SUV ST DED";RecCompanyStatistics."SUV ST DED")
                        {
                        }
                        field(RecCompanyStatistics."PU ST DED"+RecCompanyStatistics."VP ST DED"+RecCompanyStatistics."SUV ST DED";RecCompanyStatistics."PU ST DED"+RecCompanyStatistics."VP ST DED"+RecCompanyStatistics."SUV ST DED")
                        {
                        }
                    }
                    group("ST Non DED")
                    {
                        Caption = 'ST Non DED';
                        field(RecCompanyStatistics."PU ST Non DED";RecCompanyStatistics."PU ST Non DED")
                        {
                        }
                        field(RecCompanyStatistics."VP ST Non DED";RecCompanyStatistics."VP ST Non DED")
                        {
                        }
                        field(RecCompanyStatistics."SUV ST Non DED";RecCompanyStatistics."SUV ST Non DED")
                        {
                        }
                        field(RecCompanyStatistics."PU ST Non DED"+RecCompanyStatistics."VP ST Non DED"+RecCompanyStatistics."SUV ST Non DED";RecCompanyStatistics."PU ST Non DED"+RecCompanyStatistics."VP ST Non DED"+RecCompanyStatistics."SUV ST Non DED")
                        {
                        }
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        RecCompanyStatistics.GET;
        SETRANGE("Date Filter",WORKDATE);
        //SM
        SETFILTER("Date Filter3",'0101..t');
    end;

    var
        RecCompanyStatistics : Record "60046";
}

