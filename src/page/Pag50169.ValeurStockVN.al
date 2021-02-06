page 50169 "Valeur Stock VN"
{
    PageType = List;
    SourceTable = Table50109;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No.";"Item No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Janvier ";"Janvier : Valeur Stock")
                {
                    BlankZero = true;
                }
                field("Fevrier ";"Fevrier : Valeur Stock")
                {
                    BlankZero = true;
                }
                field(Mars;"Mars : Valeur Stock")
                {
                    BlankZero = true;
                }
                field("Avril ";"Avril : Valeur Stock")
                {
                    BlankZero = true;
                }
                field("Mai ";"Mai : Valeur Stock")
                {
                    BlankZero = true;
                }
                field(Juin;"Juin : Valeur Stock")
                {
                    BlankZero = true;
                }
                field(Juillet;"Juillet : Valeur Stock")
                {
                    BlankZero = true;
                }
                field("Aout ";"Aout : Valeur Stock")
                {
                    BlankZero = true;
                }
                field("Septembre ";"Septembre  : Valeur Stock")
                {
                    BlankZero = true;
                }
                field(Octobre;"Octobre  : Valeur Stock")
                {
                    BlankZero = true;
                }
                field(Novembre;"Novembre  : Valeur Stock")
                {
                    BlankZero = true;
                }
                field("Décembre ";"Décembre : Valeur Stock")
                {
                    BlankZero = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calc. Valeur Stock V.N")
            {
                Image = Calculate;
                RunObject = Report 50122;
            }
        }
    }
}

