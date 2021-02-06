page 50139 "Liste Article Consultation"
{
    // version M&MS

    //  T180001 KT 18/10/2018 : upgrade

    CaptionML = ENU='Items',
                FRA='Articles';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategoriesML = ENU='New,Process,Report,Item,History,Special Prices & Discounts,Request Approval,Periodic Activities,Inventory,Attributes',
                                 FRA='Nouveau,Traiter,État,Article,Historique,Prix et remises spéciaux,Demander une approbation,Traitements,Inventaire,Attributs';
    RefreshOnActivate = true;
    SourceTable = Table27;

    layout
    {
        area(content)
        {
            repeater(Item)
            {
                CaptionML = ENU='Item',
                            FRA='Article';
                field("No.";"No.")
                {
                    ApplicationArea = All;
                    ToolTipML = ENU='Specifies the number of the item.',
                                FRA='Spécifie le numéro de l''article.';
                }
                field(Description;Description)
                {
                    ApplicationArea = All;
                    ToolTipML = ENU='Specifies a description of the item.',
                                FRA='Spécifie une description de l''élément.';
                }
                field("Description 2";"Description 2")
                {
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies if the item card represents a physical item (Inventory) or a service (Service).',
                                FRA='Spécifie si la fiche article représente un article physique (Stock) ou un service (Service).';
                    Visible = IsFoundationEnabled;
                }
                field(Inventory;Inventory)
                {
                    ApplicationArea = Basic,Suite,Invoicing;
                    HideValue = IsService;
                    ToolTipML = ENU='Specifies how many units, such as pieces, boxes, or cans, of the item are in inventory.',
                                FRA='Spécifie le nombre d''unités (par exemple des pièces, des boîtes ou des palettes) en stock.';
                }
                field("Inventory Not Reserved";"Inventory Not Reserved")
                {
                    Visible = false;
                }
                field("Created From Nonstock Item";"Created From Nonstock Item")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies that the item was created from a nonstock item.',
                                FRA='Spécifie que l''article a été créé à partir d''un article non stocké.';
                    Visible = false;
                }
                field("Substitutes Exist";"Substitutes Exist")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies that a substitute exists for this item.',
                                FRA='Spécifie qu''un substitut existe pour cet article.';
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                    ApplicationArea = Basic,Suite,Invoicing;
                    ToolTipML = ENU='Specifies the price for one unit of the item, in LCY.',
                                FRA='Spécifie le prix unitaire, en DS, de l''article.';
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies that transactions with the item cannot be posted, for example, because the item is in quarantine.',
                                FRA='Indique que les transactions avec l''article ne peuvent pas être validées, par exemple, parce que l''article est en quarantaine.';
                    Visible = false;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies when the item card was last modified.',
                                FRA='Spécifie la date à laquelle la fiche article a été modifiée pour la dernière fois.';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Disponibilité article")
            {

                trigger OnAction();
                var
                    LCUItemavailability : Codeunit "70000";
                    LRecAvailibilityItem : Record "70006";
                    LPagItemAvailability : Page "70009";
                begin
                    //<< CT16V0002 ZMN 28/07/2016
                    CLEAR(LPagItemAvailability);
                    LCUItemavailability.FctStartSearchForItem("No.");
                    TotalStock :=LCUItemavailability.FctGetTotalStock;
                    TotalQtyCmdAchat :=LCUItemavailability.FctGetTotalQtyCmdAchat;
                    TotalQtyCmdVente :=LCUItemavailability.FctGetTotalQtyCmdVente;
                    TotalQtyCmdService:=LCUItemavailability.FctGetTotalQtyCmdService;
                    TotalQtyReservAchat:=LCUItemavailability.FctGetTotalQtyReservAchat;
                    TotalQtyReserStock:=LCUItemavailability.FctGetTotalQtyReservStoick;
                    TotalQtyStockDispo := LCUItemavailability.FctGetTotalStockDispo;
                    TotalQtyStockDispoProjeté := LCUItemavailability.FctGetTotalStockDispoProjete;
                    //TotalQtyDevis
                    TotalQtyTransfer := LCUItemavailability.FctGetTotalTransfer;
                    TotalQtyTransit := LCUItemavailability.FctGetTotalTransit;
                    LRecAvailibilityItem.SETRANGE("Item No.","No.");//
                    LPagItemAvailability.LOOKUPMODE(TRUE);
                    LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                    LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                    LPagItemAvailability.FctSetTotal(TotalStock ,TotalQtyCmdAchat ,TotalQtyCmdVente ,TotalQtyCmdService ,TotalQtyReservAchat,TotalQtyReserStock
                                                     ,TotalQtyStockDispo,TotalQtyStockDispoProjeté,TotalQtyTransit,TotalQtyTransfer,TotalQtyDevis,0,0);
                    IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN
                        LPagItemAvailability.GETRECORD(LRecAvailibilityItem);

                    //>> CT16V0002 ZMN 28/07/2016
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement : Codeunit "5331";
        WorkflowWebhookManagement : Codeunit "1543";
    begin
    end;

    trigger OnAfterGetRecord();
    begin
        EnableControls;
        SetSocialListeningFactboxVisibility;
        EnableCostingControls;
    end;

    trigger OnFindRecord(Which : Text) : Boolean;
    var
        Found : Boolean;
    begin
        IF RunOnTempRec THEN BEGIN
          TempFilteredItem.COPY(Rec);
          Found := TempFilteredItem.FIND(Which);
          IF Found THEN
            Rec := TempFilteredItem;
          EXIT(Found);
        END;
        EXIT(FIND(Which));
    end;

    trigger OnNextRecord(Steps : Integer) : Integer;
    var
        ResultSteps : Integer;
    begin
        IF RunOnTempRec THEN BEGIN
          TempFilteredItem.COPY(Rec);
          ResultSteps := TempFilteredItem.NEXT(Steps);
          IF ResultSteps <> 0 THEN
            Rec := TempFilteredItem;
          EXIT(ResultSteps);
        END;
        EXIT(NEXT(Steps));
    end;

    trigger OnOpenPage();
    var
        CRMIntegrationManagement : Codeunit "5330";
        ClientTypeManagement : Codeunit "4";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        IsFoundationEnabled := ApplicationAreaSetup.IsFoundationEnabled;
        SetWorkflowManagementEnabledState;
        IsOnPhone := ClientTypeManagement.IsClientType(CLIENTTYPE::Phone);

        //SM ADD 050717
          FILTERGROUP(2);
          IF RecGUserSetup.GET(UPPERCASE(USERID)) THEN
          //SM 270419
          //OLD IF RecGUserSetup."User Activity"  RecGUserSetup."User Activity"::PR THEN //SM OLD <> VN
           // IF RecGUserSetup."User Activity"  = RecGUserSetup."User Activity"::PR THEN
          //END SM
              Rec.SETFILTER("Inventory Posting Group",'<>VEHICULES');

         FILTERGROUP(0);
         //END SM
        TxtFilterLocation :=CduItemavailability.FctGetFiletLocation(COMPANYNAME);
        IF TxtFilterLocation <> '' THEN
          TxtFilterLocation:= '<>'+TxtFilterLocation;

        SETFILTER("Location Filter",TxtFilterLocation);
    end;

    var
        TempFilterItemAttributesBuffer : Record "7506" temporary;
        TempFilteredItem : Record "27" temporary;
        ApplicationAreaSetup : Record "9178";
        PowerBIUserConfiguration : Record "6304";
        SetPowerBIUserConfig : Codeunit "6305";
        CalculateStdCost : Codeunit "5812";
        ItemAvailFormsMgt : Codeunit "353";
        ApprovalsMgmt : Codeunit "1535";
        ClientTypeManagement : Codeunit "4";
        SkilledResourceList : Page "6023";
        IsFoundationEnabled : Boolean;
        [InDataSet]
        SocialListeningSetupVisible : Boolean;
        [InDataSet]
        SocialListeningVisible : Boolean;
        CRMIntegrationEnabled : Boolean;
        CRMIsCoupledToRecord : Boolean;
        OpenApprovalEntriesExist : Boolean;
        RecGUserSetup : Record "91";
        RecLocation : Record "14";
        TxtFilterLocation : Text;
        CduItemavailability : Codeunit "70000";
        TotalStock : Decimal;
        TotalQtyCmdAchat : Decimal;
        TotalQtyCmdVente : Decimal;
        TotalQtyCmdService : Decimal;
        TotalQtyReservAchat : Decimal;
        TotalQtyReserStock : Integer;
        TotalQtyStockDispo : Decimal;
        "TotalQtyStockDispoProjeté" : Decimal;
        TotalQtyDevis : Decimal;
        TotalQtyTransfer : Decimal;
        TotalQtyTransit : Decimal;
        StandardCostEnable : Boolean;
        UnitCostEnable : Boolean;
        UnitCostHide : Boolean;
        RecUserSetup : Record "91";
        [InDataSet]
        IsService : Boolean;
        [InDataSet]
        InventoryItemEditable : Boolean;
        EnabledApprovalWorkflowsExist : Boolean;
        CanCancelApprovalForRecord : Boolean;
        IsOnPhone : Boolean;
        RunOnTempRec : Boolean;
        EventFilter : Text;
        PowerBIVisible : Boolean;
        CanRequestApprovalForFlow : Boolean;
        CanCancelApprovalForFlow : Boolean;

    [Scope('Personalization')]
    procedure GetSelectionFilter() : Text;
    var
        Item : Record "27";
        SelectionFilterManagement : Codeunit "46";
    begin
        CurrPage.SETSELECTIONFILTER(Item);
        EXIT(SelectionFilterManagement.GetSelectionFilterForItem(Item));
    end;

    [Scope('Personalization')]
    procedure SetSelection(var Item : Record "27");
    begin
        CurrPage.SETSELECTIONFILTER(Item);
    end;

    local procedure SetSocialListeningFactboxVisibility();
    var
        SocialListeningMgt : Codeunit "871";
    begin
        SocialListeningMgt.GetItemFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;

    local procedure EnableControls();
    begin
        IsService := (Type = Type::Service);
        InventoryItemEditable := Type = Type::Inventory;
    end;

    local procedure SetWorkflowManagementEnabledState();
    var
        WorkflowManagement : Codeunit "1501";
        WorkflowEventHandling : Codeunit "1520";
    begin
        EventFilter := WorkflowEventHandling.RunWorkflowOnSendItemForApprovalCode + '|' +
          WorkflowEventHandling.RunWorkflowOnItemChangedCode;

        EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::Item,EventFilter);
    end;

    local procedure ClearAttributesFilter();
    begin
        CLEARMARKS;
        MARKEDONLY(FALSE);
        TempFilterItemAttributesBuffer.RESET;
        TempFilterItemAttributesBuffer.DELETEALL;
        FILTERGROUP(0);
        SETRANGE("No.");
    end;

    local procedure EnableCostingControls();
    begin
        StandardCostEnable := "Costing Method" = "Costing Method"::Standard;
        UnitCostEnable := "Costing Method" <> "Costing Method"::Standard;
        //<<CT16V001 ZM 15/05/2016
        RecUserSetup.GET(USERID);
        UnitCostHide := NOT RecUserSetup."Cost Responsable";
        //>>CT16V001 ZM 15/05/2016
    end;
}

