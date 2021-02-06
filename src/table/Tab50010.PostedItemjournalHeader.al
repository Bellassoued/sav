table 50010 "Posted Item journal Header"
{
    // version DOC STOCK

    Caption = 'Transactions de stock enregistrées';
    LookupPageID = 50038;

    fields
    {
        field(1; "N°"; Code[20])
        {
            Caption = 'N°';
        }
        field(2; "Type Mvt"; Option)
        {
            CaptionML = ENU = 'Type',
                        FRA = 'Type';
            OptionCaptionML = ENU = 'Input,Output,Transfer',
                              FRA = 'Entrée,Sortie,Transfert';
            OptionMembers = "Entrée",Sortie,Transfert;
        }
        field(3; "N° Client"; Code[10])
        {
            CaptionML = ENU = 'Customer No.',
                        FRA = 'N° Client';
            TableRelation = Customer;
        }
        field(4; "Code Vendeur"; Code[10])
        {
            CaptionML = ENU = 'Salesperson code',
                        FRA = 'Code Vendeur';
            TableRelation = Salesperson/Purchaser;
        }
        field(5;"N° Fournisseur";Code[10])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° Fournisseur';
            TableRelation = Vendor;
        }
        field(6;"N° Souche";Code[20])
        {
            CaptionML = ENU='Series No.',
                        FRA='N° Souche';
            TableRelation = "No. Series";
        }
        field(8;"Type origine";Option)
        {
            OptionCaption = 'Montage,Démontage';
            OptionMembers = Montage,"Démontage";
        }
        field(9;"Sourec Doc Type";Option)
        {
            CaptionML = ENU='Sourec Doc Type',
                        FRA='Type Document source';
            OptionCaption = 'Ordre de Réparation,Ordre de Préparation,Achat spécifique';
            OptionMembers = "Ordre de Réparation","Ordre de Préparation","Achat spécifique";
        }
        field(10;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.',
                        FRA='Num. origine';
        }
        field(52;"Date comptabilisation";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
            Editable = true;
        }
        field(53;"Cree par";Code[50])
        {
            CaptionML = ENU='Created By',
                        FRA='Créé par';
            Editable = false;
            TableRelation = User;
        }
        field(56;"Valide par";Code[50])
        {
            CaptionML = ENU='Posted By',
                        FRA='Validé par';
            Editable = false;
            TableRelation = User;
        }
        field(53000;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            CaptionML = ENU='Global Dimension 1 Code',
                        FRA='Code axe principal 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(53001;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            CaptionML = ENU='Global Dimension 2 Code',
                        FRA='Code axe principal 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(53004;"Transfer-from Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code Magasin';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
            end;
        }
        field(53005;"Transfer-to Code";Code[10])
        {
            CaptionML = ENU='Transfer-to Code',
                        FRA='Code dest. transfert';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Location : Record "14";
                Confirmed : Boolean;
            begin
            end;
        }
        field(53027;Commentaire;Text[250])
        {
            CaptionML = ENU='Comments',
                        FRA='Commentaire';
        }
        field(53028;"Numero de Chassis";Code[20])
        {
        }
        field(53029;"Modèle Vehicule";Code[20])
        {
        }
        field(53030;"Code Variante";Code[20])
        {
        }
        field(53031;"Description Véhicule";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"N°")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
        RecLItemJournalBatch : Record "233";
        RecLItemJournalTemplate : Record "82";
    begin
    end;

    var
        Text001 : Label 'Création  décompte appro.';
}

