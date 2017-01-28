{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Products/prodMainForm.pas,v 1.7 2004/05/06 15:24:06 paladin Exp $

------------------------------------------------------------------------}
unit prodMainForm;

interface

uses
  Forms, PluginManagerIntf, TBSkinPlus, TB2Dock, TB2Toolbar, Classes,
  Controls, ImgList, ActnList, Menus, TB2Item, ComCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls;

type

  TNC = class(TTreeNode)
  private
    FID: Integer;
    FParentID: Integer;
  public
    property ID: Integer read FID write FID;
    property ParentID: Integer read FParentID write FParentID;
  end;

  TMainForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSkin: TTBSkin;
    TBPopupMenu1: TTBPopupMenu;
    ActionList1: TActionList;
    ImageList20: TImageList;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem1: TTBItem;
    CatNew: TAction;
    CanEdit: TAction;
    CatDelete: TAction;
    ItemAdd: TAction;
    ItemEdit: TAction;
    ItemDel: TAction;
    ItemCopy: TAction;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    StatusBar: TStatusBar;
    StatsuBasrUpdate: TAction;
    ReFrash: TAction;
    Syn: TAction;
    TBItem15: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    Products: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    ImageList16: TImageList;
    title: TcxGridDBColumn;
    is_folder: TcxGridDBColumn;
    Panel1: TPanel;
    TreeView: TTreeView;
    Splitter1: TSplitter;
    Panel2: TPanel;
    parent_id: TcxGridDBColumn;
    UnitNames: TAction;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem18: TTBItem;
    Types: TAction;
    TBItem19: TTBItem;
    Price: TAction;
    TBItem20: TTBItem;
    is_visible: TcxGridDBColumn;
    product_article: TcxGridDBColumn;
    name: TcxGridDBColumn;
    SortUp: TAction;
    SortDown: TAction;
    TBSeparatorItem7: TTBSeparatorItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    sort_order: TcxGridDBColumn;
    PriceTemp: TAction;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem25: TTBItem;
    procedure StatsuBasrUpdateUpdate(Sender: TObject);
    procedure SynExecute(Sender: TObject);
    procedure SynUpdate(Sender: TObject);
    procedure ReFrashExecute(Sender: TObject);
    procedure TreeViewCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure UnitNamesExecute(Sender: TObject);
    procedure ItemEditExecute(Sender: TObject);
    procedure is_folderCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TypesExecute(Sender: TObject);
    procedure ProductsDblClick(Sender: TObject);
    procedure ItemAddExecute(Sender: TObject);
    procedure CanEditExecute(Sender: TObject);
    procedure CatNewExecute(Sender: TObject);
    procedure ItemDelExecute(Sender: TObject);
    procedure CatDeleteExecute(Sender: TObject);
    procedure PriceExecute(Sender: TObject);
    procedure CanEditUpdate(Sender: TObject);
    procedure ItemEditUpdate(Sender: TObject);
    procedure TreeViewCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure SortUpExecute(Sender: TObject);
    procedure SortDownExecute(Sender: TObject);
    procedure SortUpUpdate(Sender: TObject);
    procedure PriceTempExecute(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FDataPath: String;
    procedure SetDataPath(const Value: String);
    procedure SetPluginManager(const Value: IPluginManager);
    { Private declarations }
    procedure FillTree;
    function FindNode(AID: Integer): TNC;
    procedure DeleteProduct;
    procedure DeleteProductCategory;
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property DataPath: String read FDataPath write SetDataPath;
  end;

function GetMainForm(const PluginManager: IPluginManager; const DataPath: String): Integer;

implementation

uses progDataModule, SysUtils, prodUnitnamesForm, prodProductForm,
  Graphics, Types, prodTypesForm, DBClient, prodPriceForm, DeviumLib,
  Windows;

{$R *.dfm}

function GetMainForm;
var
  Form: TMainForm;
begin
  Form := TMainForm.Create(Application);
  try
    Form.DataPath := DataPath;
    Form.PluginManager := PluginManager;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{ TMainForm }

procedure TMainForm.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TMainForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  DM := TDM.Create(Self);
  DM.PluginManager := FPluginManager;
  DM.DataPath := FDataPath;
  DM.Open;
  Products.DataController.DataSource := DM.dsProducts;
  FillTree;
end;

procedure TMainForm.StatsuBasrUpdateUpdate(Sender: TObject);
begin
  StatusBar.Panels[0].Text := DM.GetStatsuBarString;
end;

procedure TMainForm.SynExecute(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    DM.ApplyUpdates;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.SynUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DM.CanApplyUpdates;
end;

procedure TMainForm.ReFrashExecute(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    Dm.Refresh;
    FillTree;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.FillTree;
var
  Node, PNode: TNC;
  i: Integer;
  OldKey: Integer;
begin
  OldKey := 0;
  with TreeView, DM.Products do
  begin
    // Сохраняем старое выделение
    if Assigned(Selected) then
      OldKey := TNC(Selected).ID;
    // заполняем дерево  
    Items.Clear;
    Node := TNC(Items.AddChild(nil, 'Каталог продукции'));
    Node.ID := 0;
    Node.ParentID := -1;
    Node.ImageIndex := 121;
    Node.SelectedIndex := 121;

    First;
    while not EOF do
    begin
      if FieldValues['is_folder'] = 1 then
      begin
        // добавление элемента
        Node := TNC(Items.AddChild(nil, FieldByName('title').AsString));
        Node.ID := FieldValues['product_id'];
        Node.ParentID := FieldValues['parent_id'];
        Node.ImageIndex := 20;
        Node.SelectedIndex := 20;
      end;
      Next;
    end;
    // пересортировка дерева
    i := 0;
    while i < Items.Count do
    begin
      Node := TNC(Items[i]);
      // поиск в дереве родителя
      PNode := FindNode(Node.ParentID);
      if (PNode <> nil) and (Node.Parent <> PNode) then
      begin
        // сделать детёнком
        Node.MoveTo(PNode, naAddChild);
        i := -1;
      end;
      Inc(i);
    end;
    // востонавливаем старое выделение
    if OldKey > 0 then
    begin
      Node := FindNode(OldKey);
      Selected := Node;
    end else // root
      Selected := Items[0];
    Selected.MakeVisible;
    // конец пересортировки
  end;
end;

procedure TMainForm.TreeViewCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
  NodeClass := TNC;
end;

function TMainForm.FindNode(AID: Integer): TNC;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to TreeView.Items.Count - 1 do
  begin
    if TNC(TreeView.Items[i]).ID = AID then
    begin
      Result := TNC(TreeView.Items[i]);
      Exit;
    end;
  end;
end;

procedure TMainForm.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  Products.DataController.Filter.Clear;
  Products.DataController.Filter.AddItem(nil, parent_id, foEqual,
    TNC(TreeView.Selected).ID, TreeView.Selected.Text);
  Products.DataController.Filter.Active := True;
end;

procedure TMainForm.UnitNamesExecute(Sender: TObject);
begin
  GetUnitnamesForm;
end;

procedure TMainForm.ItemEditExecute(Sender: TObject);
begin
  with DM.Products do
  begin
    Edit;
    if GetProductForm(FPluginManager) = mrOK then
      Post
    else
      Cancel;
  end;
end;

procedure TMainForm.is_folderCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  ARec: TRect;
  ImageIndex: Integer;
begin
  ImageIndex := 20;
  ARec := AViewInfo.Bounds;
  ACanvas.FillRect(ARec);
  if AViewInfo.Value = 0 then ImageIndex := 40;
  ACanvas.DrawImage(ImageList16, ARec.Left + 5, ARec.Top + 1, ImageIndex);
  ADone := True;
end;

procedure TMainForm.TypesExecute(Sender: TObject);
begin
  GetTypesForm;
end;

procedure TMainForm.ProductsDblClick(Sender: TObject);
begin
  ItemEdit.Execute;
end;

procedure TMainForm.ItemAddExecute(Sender: TObject);
begin
  with DM.Products do
  begin
    Append;
    FieldValues['parent_id'] := TNC(TreeView.Selected).ID;
    FieldValues['is_folder'] := 0;
    FieldValues['is_visible'] := 1;
    FieldValues['is_printable'] := 1;
    FieldValues['title'] := 'Новый товар';
    FieldValues['name'] := TransLiterStr(FieldValues['title']);
    Post;
    Edit;
    if GetProductForm(FPluginManager) = mrOK then
      Post
    else
      DeleteProduct;
  end;
end;

procedure TMainForm.CanEditExecute(Sender: TObject);
begin
  with DM.Products do
  begin
    Locate('product_id', TNC(TreeView.Selected).ID, []);
    Edit;
    if GetProductForm(FPluginManager) = mrOK then
    begin
      Post;
      TreeView.Selected.Text := FieldValues['title'];
    end
    else
      Cancel;
  end;
end;

procedure TMainForm.CatNewExecute(Sender: TObject);
begin
  with DM.Products do
  begin
    Append;
    FieldValues['is_visible'] := 1;
    FieldValues['is_printable'] := 1;
    FieldValues['is_folder'] := 1;
    FieldValues['parent_id'] := TNC(TreeView.Selected).ID;
    FieldValues['title'] := 'Новая группа';
    FieldValues['name'] := TransLiterStr(FieldValues['title']);
    { TODO 1 -oPaladin : Придумать уникальность формирования имени!!! }
    Post;
    Edit;
    if GetProductForm(FPluginManager) = mrOK then
      Post
    else
      Delete;
  end;
  FillTree;
end;

procedure TMainForm.DeleteProduct;
  // удаление подчиннх датасетов
  procedure DeleteChRecords(DataSet: TDataSet; product_id: Integer);
  begin
    DataSet.DisableControls;
    DataSet.First;
    while DataSet.Locate('product_id', product_id, []) do
      DataSet.Delete;
    DataSet.EnableControls;
  end;
begin
  with DM.Products do
  begin
    // удаление из свойств
    DeleteChRecords(DM.Values, FieldValues['product_id']);
    // удаление из цен
    DeleteChRecords(DM.Prices, FieldValues['product_id']);
    // удаление еденицы
    DeleteChRecords(DM.Units, FieldValues['product_id']);
    Delete;
  end;
end;

procedure TMainForm.DeleteProductCategory;
begin
  { TODO 1 -oPaladin : Доделать удаление группы со всеми вхождениями }
end;

procedure TMainForm.ItemDelExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы точно уверены что хотите это сделать',
    PChar(Caption), MB_YESNO + MB_ICONQUESTION) = IDNO then Exit; 
  DeleteProduct;
  FillTree;
end;

procedure TMainForm.CatDeleteExecute(Sender: TObject);
begin
  DeleteProductCategory;
end;

procedure TMainForm.PriceExecute(Sender: TObject);
begin
  GetPriceForm;
end;

procedure TMainForm.CanEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Dm.Products.RecordCount > 0)
    and Assigned(TreeView.Selected) and Assigned(TreeView.Selected.Parent);
end;

procedure TMainForm.ItemEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Dm.Products.RecordCount > 0);
end;

procedure TMainForm.TreeViewCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  if Node.Parent = nil then AllowCollapse := False;
end;

procedure TMainForm.SortUpExecute(Sender: TObject);
begin
  DM.ReSort(DM.Products, 'sort_order', -15,
    Format('parent_id=%d', [TNC(TreeView.Selected).ID]));
  FillTree;
end;

procedure TMainForm.SortDownExecute(Sender: TObject);
begin
  DM.ReSort(DM.Products, 'sort_order', 15,
    Format('parent_id=%d', [TNC(TreeView.Selected).ID]));
  FillTree;
end;

procedure TMainForm.SortUpUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(TreeView.Selected);
end;

procedure TMainForm.PriceTempExecute(Sender: TObject);
begin
  GetPriceFormTmp;
end;

end.
