page 50182 "Historique SAV"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60008;

    layout
    {
        area(content)
        {
            group()
            {
                repeater(Group)
                {
                    field("Reception No";"Reception No")
                    {
                    }
                    field("Status SR";"Status SR")
                    {
                    }
                    field("Customer No.";"Customer No.")
                    {
                    }
                    field(Name;Name)
                    {
                    }
                    field("Creation date";"Creation date")
                    {
                    }
                    field("Invoice Date";"Invoice Date")
                    {
                    }
                    field(Warranty;Warranty)
                    {
                    }
                    field("Salesperson Name";"Salesperson Name")
                    {
                    }
                    field("Responsibility Center";"Responsibility Center")
                    {
                    }
                    field("Service Type";"Service Type")
                    {
                    }
                    field(Matricule;Matricule)
                    {
                    }
                    field("Type de garantie";"Type de garantie")
                    {
                    }
                    field(Retour;Retour)
                    {
                    }
                    field(Kilométrage;Kilométrage)
                    {
                    }
                    field("Commentaire SAV";"Commentaire SAV")
                    {
                    }
                }
            }
            part(Pannes;60064)
            {
                Caption = 'Effet Client';
                SubPageLink = Reception No=FIELD(Reception No);
                Visible = SAV;
            }
            part(LDT;70101)
            {
                Caption = 'Tavaux Atelier';
                SubPageLink = Reception No=FIELD(Reception No);
                SubPageView = WHERE(Garantie=FILTER(No),
                                    Type Effet CLT=FILTER(LDT));
                Visible = SAV;
            }
            part(LigneServRapide;60020)
            {
                SubPageLink = Reception No.=FIELD(Reception No),
                              Type opération=CONST(rapid service);
                SubPageView = WHERE(Type=CONST(Item));
                Visible = Chrono;
            }
            part(Panne;60020)
            {
                Caption = 'Effet Client';
                SubPageLink = Reception No.=FIELD(Reception No);
                Visible = false;
            }
            part(LDTs;70101)
            {
                Caption = 'Tavaux Atelier';
                SubPageLink = Reception No=FIELD(Reception No);
                SubPageView = WHERE(Garantie=FILTER(No),
                                    Type Effet CLT=FILTER(LDT));
                Visible = false;
            }
            part("Ligne travaux service rapide";60197)
            {
                Caption = 'Effets Client';
                SubPageLink = Reception No.=FIELD(Reception No),
                              Type opération=CONST(rapid service);
                SubPageView = WHERE(Type=CONST(Resource));
                Visible = Chrono;
            }
            part(;60021)
            {
                SubPageLink = Reception No.=FIELD(Reception No),
                              Type opération=CONST(Additional Sales);
                Visible = Chrono;
            }
            part("Lignes ";50183)
            {
                CaptionML = ENU='Lignes ',
                            FRA='Lignes ';
                SubPageLink = Reception No=FIELD(Reception No);
            }
            part(Resources;50173)
            {
                CaptionML = ENU='Resources',
                            FRA='Ressources';
                SubPageLink = Réception No.=FIELD(Reception No);
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        Chrono:=("Service Type"="Service Type"::"Rapid Service");
        SAV:="Service Type"="Service Type"::"Big Service";
    end;

    var
        SAV : Boolean;
        Chrono : Boolean;
}

