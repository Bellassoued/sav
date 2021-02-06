page 60179 "Fiche Technique"
{
    // version CT16V002

    PageType = Card;
    SourceTable = Table50032;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Item No.";"Item No.")
                {
                }
                field("Make Code";"Make Code")
                {
                }
                field(Description;Description)
                {
                }
                field("Vehicle Type Code";"Vehicle Type Code")
                {
                }
                field("Vehicle Category Code";"Vehicle Category Code")
                {
                }
                field("Emissions Test Category Code";"Emissions Test Category Code")
                {
                }
                field("Type mines";"Type mines")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field("Répartiton HT\TTC";"Répartiton HT\TTC")
                {
                }
                field("MVEG Consumption";"MVEG Consumption")
                {
                }
                field("Engine Type Code";"Engine Type Code")
                {
                }
                field("Transmission Type Code";"Transmission Type Code")
                {
                }
                field("Cylinder Capacity (ccm)";"Cylinder Capacity (ccm)")
                {
                }
                field("No. of Cylinders";"No. of Cylinders")
                {
                }
                field("Power (kW)";"Power (kW)")
                {
                }
                field("Power (hp)";"Power (hp)")
                {
                }
                field(Tires;Tires)
                {
                }
                field("Empty Weight (kg)";"Empty Weight (kg)")
                {
                }
                field("Total Weight (kg)";"Total Weight (kg)")
                {
                }
                field("Roof Load (kg)";"Roof Load (kg)")
                {
                }
                field("Trailer Load (kg)";"Trailer Load (kg)")
                {
                }
                field("Trailer Tongue Load (kg)";"Trailer Tongue Load (kg)")
                {
                }
                field("4WD";"4WD")
                {
                }
                field("No. of Axles";"No. of Axles")
                {
                }
                field("Wheelbase (mm)";"Wheelbase (mm)")
                {
                }
                field("Front Axle Load (kg)";"Front Axle Load (kg)")
                {
                }
                field("Rear Axle Load (kg)";"Rear Axle Load (kg)")
                {
                }
                field("No. of Doors";"No. of Doors")
                {
                }
                field("Seasonal Factor";"Seasonal Factor")
                {
                }
                field(Vitesses;Vitesses)
                {
                }
                field("Puissance Fiscal";"Puissance Fiscal")
                {
                }
                field("Type energie";"Type energie")
                {
                }
                field("Nbre Place";"Nbre Place")
                {
                }
                field("Date Début Homologation";"Date Début Homologation")
                {
                }
                field("Date Fin Homologation";"Date Fin Homologation")
                {
                }
                group("Fais Immatriculation")
                {
                    Caption = 'Fais Immatriculation';
                    field("Frais energie";"Frais energie")
                    {
                    }
                    field("Frais immatriculation";"Frais immatriculation")
                    {
                    }
                    field("Frais Red. Grosse Cylindrée";"Frais Red. Grosse Cylindrée")
                    {
                    }
                    field("Total Immatriculation";"Total Immatriculation")
                    {
                    }
                    field("Sans Fodec";"Sans Fodec")
                    {
                    }
                }
                group(Famille)
                {
                    Caption = 'Famille';
                    field("Designation 2";"Designation 2")
                    {
                        Caption = 'Famille';
                    }
                    field("Sous-famille";"Sous-famille")
                    {
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group()
            {
                action("Page List fiche Technique")
                {
                    CaptionML = ENU='List fiche Technique',
                                FRA='List fiche Technique';
                    Image = List;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    RunObject = Page 60180;
                }
            }
        }
    }
}

