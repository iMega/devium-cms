{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PageManager/PageMangerMainForm.pas,v 1.4 2004/05/14 09:38:50 paladin Exp $

------------------------------------------------------------------------}
unit PageMangerMainForm;

interface

uses
  Forms, TBSkinPlus, TB2Dock, TB2Toolbar, Classes, Controls, ExtCtrls,
  ComCtrls, ImgList, Menus, TB2Item, ActnList, PluginManagerIntf, PageMangerLib,
  Grids, DBGrids;

type
  TMainForm = class(TForm)
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBSkin: TTBSkin;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    PagesTree: TTreeView;
    PagesList: TListView;
    ImageList20: TImageList;
    ImageList32: TImageList;
    ImageList16: TImageList;
    ActionList: TActionList;
    TreePopupMenu: TTBPopupMenu;
    PagesPopupMenu: TTBPopupMenu;
    FolderAdd: TAction;
    FolderDel: TAction;
    FolderEdit: TAction;
    Settings: TAction;
    ItemAdd: TAction;
    ItemEdit: TAction;
    ItemDelete: TAction;
    SortUp: TAction;
    SortDown: TAction;
    Move: TAction;
    Syn: TAction;
    ReFresh: TAction;
    TBItem17: TTBItem;
    Copy: TAction;
    Past: TAction;
    Cut: TAction;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem20: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem1: TTBItem;
    TBItem8: TTBItem;
    TBItem14: TTBItem;
    TBItem16: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    StatusBarUpDate: TAction;
    SetClearTemplate: TAction;
    Languages: TTBSubmenuItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem12: TTBItem;
    TBItem25: TTBItem;
    TBItem28: TTBItem;
    TBItem29: TTBItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBSeparatorItem14: TTBSeparatorItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    Rename: TAction;
    EditInDialog: TAction;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem30: TTBItem;
    Properties: TAction;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem13: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem35: TTBItem;
    ItemEdit2: TAction;
    TBItem4: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    Test: TAction;
    TBItem15: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    procedure FormDestroy(Sender: TObject);
    procedure FolderAddExecute(Sender: TObject);
    procedure PagesTreeCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure PagesTreeEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure SynExecute(Sender: TObject);
    procedure SynUpdate(Sender: TObject);
    procedure FolderEditExecute(Sender: TObject);
    procedure ReFreshExecute(Sender: TObject);
    procedure ItemAddExecute(Sender: TObject);
    procedure PagesTreeChange(Sender: TObject; Node: TTreeNode);
    procedure PagesListEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure ItemDeleteExecute(Sender: TObject);
    procedure SortUpExecute(Sender: TObject);
    procedure SortDownExecute(Sender: TObject);
    procedure PagesTreeCompare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);
    procedure FolderDelExecute(Sender: TObject);
    procedure ItemEditExecute(Sender: TObject);
    procedure StatusBarUpDateUpdate(Sender: TObject);
    procedure FolderEditUpdate(Sender: TObject);
    procedure ItemEditUpdate(Sender: TObject);
    procedure PagesTreeGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure PagesTreeGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure FolderDelUpdate(Sender: TObject);
    procedure SetClearTemplateExecute(Sender: TObject);
    procedure PagesListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PropertiesExecute(Sender: TObject);
    procedure RenameExecute(Sender: TObject);
    procedure RenameUpdate(Sender: TObject);
    procedure ItemEdit2Execute(Sender: TObject);
    procedure ItemEdit2Update(Sender: TObject);
    procedure ItemAddUpdate(Sender: TObject);
    procedure PagesTreeCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
  private
    FPluginManager: IPluginManager;
    FDataPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure SetDataPath(const Value: String);
    function UpdateFolder(AData: TFolderFormData; AParent: Integer = -1;
      Add: Boolean = False; AFolder: Integer = 1): Integer;
    procedure FillTree;
    procedure FillListView;
    function FindNode(AID: Integer): TTreeNode;
    procedure CreateEmptyPage(AParentID: Integer; ATitle: String = '');
    function CheckName(const AName, ATitle: String): String;
    procedure FillData(var AData: TFolderFormData; AID: Integer);
    procedure SortNode(ANode: TTreeNode; ADelta: Integer);
    function GetNextOrder(AParentID: Integer; AFolder: Integer = 1): Integer;
    function IntToStr2(Value, Len: Integer): String;
    procedure FillLanguages;
    procedure LanguageSelect(Sender: TObject);
    // images
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property DataPath: String read FDataPath write SetDataPath;
  end;

function GetMainForm(const PluginManager: IPluginManager; const DataPath: String): Integer;

implementation

{$R *.dfm}

uses Clipbrd, PageMangerDM, PageMangerFolderForm, Dialogs, DB, DBClient,
  Windows, SysUtils, StrUtils, Math, Variants, HTMLEditorIntf, DeviumLib,
  FilesLib, DataBase, CommCtrl, PageTreeForm;

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

procedure TMainForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  DM := TDM.Create(Self);
  DM.PluginManager := FPluginManager;
  DM.DataPath := FDataPath;
  DM.Open;
  FillLanguages;
  FillTree;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if Assigned(DM) then DM.Free
end;

procedure TMainForm.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TMainForm.FolderAddExecute(Sender: TObject);
var
  Data: TFolderFormData;
  LParent: Integer;
  LID: Integer;
begin
  if Assigned(PagesTree.Selected) then
    Data.parent_id := TNC(PagesTree.Selected).ID;
  Data.parent_data := True;
  Data.template_id := 0;
  Data.dont_visible := False;
  Data.dont_click := False;
  Data.folder := True;
  Data.is_default := False;
  Data.is_dynamic := False;
  if GetFolderForm(Data) = mrOK then
  begin
    LParent := 1;
    if Assigned(PagesTree.Selected) then
      LParent := TNC(PagesTree.Selected).ID;
    LID := UpdateFolder(Data, LParent, True);
    // спрашиваем надоли создать страницу
    if MessageBox(Handle, 'Ходите создать страницу для этого раздела ?',
      PChar(Caption), MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      CreateEmptyPage(LID, Data.Title);
    end;
  end;
end;

function TMainForm.UpdateFolder(AData: TFolderFormData; AParent: Integer = -1;
      Add: Boolean = False; AFolder: Integer = 1): Integer;
var
  SortOrder: Integer;
begin
  with Dm.Pages do
  begin
    if Add then
    begin
      SortOrder := GetNextOrder(AParent);
      Append;
      FieldValues['parent_id'] := AParent;
      FieldValues['folder'] := AFolder;
      FieldValues['language_id'] := DM.Language;
      FieldValues['sort_order'] := SortOrder;
      FieldValues['template_id'] := 0;
      FieldValues['parent_data'] := 1;
    end
    else
      Edit;
    // update data
    FieldValues['title'] := AData.Title;
    FieldValues['name'] := CheckName(AData.Name, AData.Title);
    FieldValues['is_dynamic'] := Integer(AData.is_dynamic);
    FieldValues['is_default'] := Integer(AData.is_default);
    FieldValues['dont_click'] := Integer(AData.dont_click);
    FieldValues['dont_visible'] := Integer(AData.dont_visible);
    FieldValues['parent_data'] := Integer(AData.parent_data);
    FieldValues['template_id'] := 0;
    FieldValues['description'] := AData.description;
    FieldValues['keywords'] := AData.keywords;
    // template
    if AData.Template <> '' then
    begin
      if DM.Templates.Locate('name', AData.Template, []) then
        FieldValues['template_id'] := DM.Templates.FieldValues['id'];
    end;
    //
    Post;
    Result := FieldValues['id'];
  end;
  FillTree;
end;

// построение дерева слева
procedure TMainForm.FillTree;
var
  Node: TNC;
  PNode: TTreeNode;
  SaveID, i: Integer;
begin
  SaveID := -1;
  with PagesTree, Dm.Pages do
  begin
    // Сохранение местоположения
    if Assigned(Selected) then
      SaveID := TNC(Selected).ID;

    DisableControls;
    Items.BeginUpdate;
    Items.Clear;
    First;
    while not EOF do
    begin
      if FieldValues['folder'] = 1 then
      begin
        // добавление элемента
        Node := TNC(Items.AddChild(nil, FieldValues['title']));
        Node.ID := FieldValues['id'];
        Node.ParentID := FieldValues['parent_id'];
        Node.SortOrder := FieldValues['sort_order'];
        Node.IsDefault := FieldValues['is_default'];
        Node.DontClick := FieldValues['dont_click'];
        Node.IsDynamic := FieldValues['is_dynamic'];
        Node.DontVisible := FieldValues['dont_visible'];
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
    // конец пересортировки
    Items.EndUpdate;
    EnableControls;
    // возврат на то что было
    if SaveID > -1 then
    begin
      PNode := FindNode(SaveID);
      if PNode <> nil then
      begin
        Selected := PNode;
        PNode.MakeVisible;
      end
      else
        Selected := Items[0];
    end;
    AlphaSort;
  end;
  PagesTree.Refresh;
end;

procedure TMainForm.PagesTreeCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
  NodeClass := TNC;
end;

// поиск дереве
function TMainForm.FindNode(AID: Integer): TTreeNode;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to PagesTree.Items.Count - 1 do
  begin
    if TNC(PagesTree.Items[i]).ID = AID then
    begin
      Result := PagesTree.Items[i];
      Exit;
    end;
  end;
end;

// создание пустой страницы для раздела
procedure TMainForm.CreateEmptyPage(AParentID: Integer; ATitle: String = '');
var
  SortOrder: Integer;
begin
  with Dm.Pages do
  begin
    SortOrder := GetNextOrder(AParentID, 0);
    Append;
    if ATitle = '' then
      ATitle := 'Новая страница';
    FieldValues['title'] := ATitle;
    FieldValues['name'] := CheckName('', ATitle);
    FieldValues['language_id'] := DM.Language;
    FieldValues['parent_id'] := AParentID;
    FieldValues['folder'] := 0;
    FieldValues['sort_order'] := SortOrder;
    FieldValues['template_id'] := 0;
    FieldValues['is_default'] := 0;
    FieldValues['is_dynamic'] := 0;
    FieldValues['dont_click'] := 0;
    FieldValues['parent_data'] := 1;
    FieldValues['dont_visible'] := 0;
    Post;
  end;
end;

// проверка имени на валидность
// чтобы небыло дубликатов в данном разделе
function TMainForm.CheckName(const AName, ATitle: String): String;
begin
  Result := AName;
  if Result = '' then
    Result := TransLiterStr(ATitle)
end;

procedure TMainForm.PagesTreeEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
  // обновляем данные в базе
  with DM.Pages do
  begin
    Locate('id', TNC(Node).ID, []);
    Edit;
    FieldValues['title'] := S;
    Post;
  end;
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

procedure TMainForm.FolderEditExecute(Sender: TObject);
var
  Data: TFolderFormData;
begin
  FillData(Data, TNC(PagesTree.Selected).ID);
  if GetFolderForm(Data) = mrOK then
  begin
    UpdateFolder(Data);
  end;
end;

// заполение структыру данными
procedure TMainForm.FillData(var AData: TFolderFormData; AID: Integer);
var
  sl: TStringList;
begin
  with DM.Pages, AData do
  begin
    Locate('id', AID, []);
    ID              := FieldValues['id'];
    parent_id       := FieldValues['parent_id'];
    Title           := FieldValues['Title'];
    Name            := FieldValues['Name'];
    text            := FieldValues['text'];
    description     := FieldValues['description'];
    dont_visible    := FieldValues['dont_visible'];
    folder          := FieldValues['folder'];
    language_id     := FieldValues['language_id'];
    keywords        := FieldValues['keywords'];
    sort_order      := FieldValues['sort_order'];
    template_id     := FieldValues['template_id'];
    is_default      := FieldValues['is_default'];
    is_dynamic      := FieldValues['is_dynamic'];
    dont_click      := FieldValues['dont_click'];
    //link_image      := FieldByName('link_image').AsString;
    parent_data     := FieldValues['parent_data'];
  end;
  // создание строки с шаблонами
  sl := TStringList.Create;
  try
    with DM.Templates do
    begin
      First;
      while not EOF do
      begin
        sl.Add(FieldValues['name']);
        if AData.template_id = FieldValues['id'] then
          AData.Template := FieldValues['name'];
        Next;
      end;
    end;
    AData.Templates := sl.Text;
  finally
    sl.Free;
  end;
end;

procedure TMainForm.ReFreshExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'При этой операции все изменения, которые быле произведены, будут утеряны.' + #13#10+
    'Вы точно уверены что хотите это делать ?', PChar(Caption),
    MB_ICONQUESTION + MB_YESNO) = IDNO then Exit;

  Screen.Cursor := crHourGlass;
  try
    DM.Refresh;
    FillTree;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.ItemAddExecute(Sender: TObject);
var
  ParentID: Integer;
begin
  ParentID := TNC(PagesTree.Selected).ID;
  CreateEmptyPage(ParentID);
  FillListView;
  PagesList.Items[PagesList.Items.Count-1].EditCaption;
end;

procedure TMainForm.FillListView;
var
  OldFilter: String;
  ParentID: Integer;
  li: TListItem;
begin
  with DM.Pages, PagesList do
  begin
    OldFilter := Filter;
    ParentID := 0;
    if Assigned(PagesTree.Selected) then
      ParentID := TNC(PagesTree.Selected).ID;
    // откоючение обновления
    DisableControls;
    Items.BeginUpdate;
    Items.Clear;
    // фильтр по родителю
    Filter := Format('%s and parent_id = %d', [OldFilter, ParentID]);
    Filtered := True;
    // цикл по выборке
    First;
    while not EOF do
    begin
      if FieldValues['folder'] = 0 then
      begin
        li := Items.Add;
        li.Data := Pointer(FieldByName('id').AsInteger); 
        li.Caption := FieldValues['title'];
      end;
      Next;
    end;
    // востановление фильтра
    Filter := OldFilter;
    Filtered := True;
    // включение обновления
    Items.EndUpdate;
    EnableControls;
  end;
end;

procedure TMainForm.PagesTreeChange(Sender: TObject; Node: TTreeNode);
begin
  FillListView;
end;

procedure TMainForm.PagesListEdited(Sender: TObject; Item: TListItem;
  var S: String);
begin
  // обновляем данные в базе
  with DM.Pages do
  begin
    Locate('id', Integer(Item.Data), []);
    Edit;
    FieldValues['title'] := S;
    FieldValues['name'] := CheckName('', S);
    Post;
  end;
end;

procedure TMainForm.ItemDeleteExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы уверены, что хотите удалить страницу?',
  //Вы уверены, что хотите удалить группу?
    PChar(Caption), MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;
  with DM.Pages do
  begin
    if Locate('id', Integer(PagesList.Selected.Data), []) then
      Delete;
  end;
  FillListView;
end;

procedure TMainForm.SortUpExecute(Sender: TObject);
begin
  SortNode(PagesTree.Selected, -15);
  FillTree;
end;

procedure TMainForm.SortDownExecute(Sender: TObject);
begin
  SortNode(PagesTree.Selected, 15);
  FillTree;
end;

procedure TMainForm.SortNode(ANode: TTreeNode; ADelta: Integer);
var
  OldFilter: String;
  LNode: TNC;
  i: Integer;
begin
  with DM.Pages do
  begin
    DisableControls;
    OldFilter := Filter;
    LNode := TNC(ANode);
    Filter := Format('%s and parent_id=%d', [OldFilter, LNode.ParentID]);
    Filtered := True;
    if Locate('id', LNode.ID, []) then
    begin
      Edit;
      FieldValues['sort_order'] := Integer(FieldValues['sort_order'] + ADelta);
      Post;
      i := RecordCount;
      Last;
      while not BOF do
      begin
        Edit;
        FieldValues['sort_order'] := i * 10;
        Post;
        Prior;
        Dec(i);
      end;
    end;
    Filter := OldFilter;
    Filtered := True;
    EnableControls;
  end;
end;

procedure TMainForm.PagesTreeCompare(Sender: TObject; Node1,
  Node2: TTreeNode; Data: Integer; var Compare: Integer);
var
  s1, s2: String;

  function SortStr(ANode: TTreeNode): String;
  var
    Node: TNC;
  begin
    Node := TNC(ANode);
    repeat
      Result := IntToStr2(Node.SortOrder, 4) + Result;
      Node := TNC(Node.Parent);
    until Node = nil;
  end;

begin
  s1 := SortStr(Node1);
  s2 := SortStr(Node2);
  Compare := AnsiCompareText(S1, S2);
end;

function TMainForm.GetNextOrder(AParentID: Integer; AFolder: Integer = 1): Integer;
var
  OldFilter: String;
begin
  Result := 0;
  with DM.Pages do
  begin
    DisableControls;
    OldFilter := Filter;
    Filter := Format('%s and folder=%d and parent_id=%d', [OldFilter, AFolder, AParentID]);
    Filtered := True;
    First;
    while not EOF do
    begin
      Result := Max(Result, FieldValues['sort_order']);
      Next;
    end;
    Filter := OldFilter;
    Filtered := True;
    EnableControls;
  end;
  Result := Result + 10;
end;

function TMainForm.IntToStr2(Value, Len: Integer): String;
var
  s: String;
begin
  s := IntToStr(Value);
  Result := StringOfChar('0', Len - Length(s)) + s;
end;

procedure TMainForm.FolderDelExecute(Sender: TObject);

  // Рекурсивный пробег по дереву
  procedure ScanForDelete(ANode: TTreeNode; DataSet: TDataSet);
  var
    i: Integer;
  begin
    for i := 0 to ANode.Count - 1 do
    begin
      ScanForDelete(ANode[i], DataSet);
      while DataSet.Locate('parent_id', TNC(ANode[i]).ID, []) do
        DataSet.Delete;
    end;
    if DataSet.Locate('id', TNC(ANode).ID, []) then
      DataSet.Delete;
  end;

begin
  if MessageBox(Handle, 'Вы уверены, что хотите удалить группу?',
    PChar(Caption), MB_YESNO + MB_ICONQUESTION) = IDNO then Exit;

  DM.Pages.DisableControls;
  ScanForDelete(PagesTree.Selected, DM.Pages);
  PagesTree.Selected.Delete;
  DM.Pages.EnableControls;
  FillTree;
end;

procedure TMainForm.ItemEditExecute(Sender: TObject);
var
  Data: TFolderFormData;
begin
  FillData(Data, Integer(PagesList.Selected.Data));
  if GetFolderForm(Data) = mrOK then
  begin
    UpdateFolder(Data, -1, False, 0);
  end;
end;

procedure TMainForm.StatusBarUpDateUpdate(Sender: TObject);
begin
  StatusBar.Panels[0].Text := DM.GetStatsuBarString;
end;

procedure TMainForm.FolderEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(PagesTree.Selected);
end;

procedure TMainForm.ItemEditUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(PagesList.Selected);
end;

procedure TMainForm.PagesTreeGetImageIndex(Sender: TObject;
  Node: TTreeNode);
var
  LNode: TNC;
begin
  Node.ImageIndex := 10;
  LNode := TNC(Node);
  if LNode.IsDynamic then
    LNode.ImageIndex := 12;
  if LNode.DontClick then
    LNode.ImageIndex := 15;
  if LNode.IsDefault then
    LNode.ImageIndex := 11;
  if LNode.DontVisible then
    LNode.ImageIndex := 14;
  if LNode.Parent = nil then
    LNode.ImageIndex := 7; // home
end;

procedure TMainForm.PagesTreeGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TMainForm.FolderDelUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(PagesTree.Selected) and
    (PagesTree.Selected.Parent <> nil);
end;

procedure TMainForm.SetClearTemplateExecute(Sender: TObject);

  procedure ClearTml(DataSet: TDataSet);
  begin
    DataSet.Edit;
    DataSet['template_id'] := 0;
    DataSet.Post;
  end;

  procedure Tmp1(DataSet: TDataSet; AID: Integer);
  begin
    DataSet.First;
    while not DataSet.Eof do
    begin
      if DataSet['parent_id'] = AID then
        ClearTml(DataSet);
      DataSet.Next;
    end;
  end;

  // Рекурсивный пробег по дереву
  procedure ScanTree(ANode: TTreeNode; DataSet: TDataSet);
  var
    i: Integer;
  begin
    for i := 0 to ANode.Count - 1 do
    begin
      ScanTree(ANode[i], DataSet);
      if DataSet.Locate('id', TNC(ANode[i]).ID, []) then
        ClearTml(DataSet);
      Tmp1(DataSet, TNC(ANode[i]).ID);
    end;
    Tmp1(DataSet, TNC(ANode).ID);
  end;
begin
  DM.Pages.DisableControls;
  ScanTree(PagesTree.Selected, DM.Pages);
  DM.Pages.EnableControls;
end;

procedure TMainForm.FillLanguages;
var
  tb: TTBItem;
begin
  with DM.Languages do
  begin
    First;
    while not EOF do
    begin
      tb := TTBItem.Create(Languages);
      tb.Caption := FieldValues['title'];
      tb.OnClick := LanguageSelect;
      tb.AutoCheck := True;
      tb.GroupIndex := 10;
      Languages.Add(tb);
      Next;
    end;
    First;
  end;
  Languages.Items[0].Checked := True;
end;

procedure TMainForm.LanguageSelect(Sender: TObject);
begin
  StatusBar.Panels[1].Text := 'Текущий язык: ' + TTBItem(Sender).Caption;
  DM.SetLanguage(TTBItem(Sender).Caption);
  FillTree;
end;

procedure TMainForm.PagesListDblClick(Sender: TObject);
begin
  ItemEdit2.Execute;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Res: Integer;
begin
  if not DM.CanApplyUpdates then Exit;

  Res := MessageBox(Handle, 'Отправить изменения на сервер?',
    PChar(Caption), MB_YESNOCANCEL + MB_ICONQUESTION);
  case Res of
    IDYES: DM.ApplyUpdates;
    IDNO: ;
    IDCANCEL: Action := caNone;
  end;
end;

procedure TMainForm.PropertiesExecute(Sender: TObject);
begin
  if PagesTree.Focused then
    FolderEdit.Execute;
  if PagesList.Focused then
    ItemEdit.Execute;
end;

procedure TMainForm.RenameExecute(Sender: TObject);
begin
  if PagesTree.Focused then
    PagesTree.Selected.EditText;
  if PagesList.Focused then
    PagesList.Selected.EditCaption;
end;

procedure TMainForm.RenameUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := PagesTree.Focused or PagesList.Focused;
end;

procedure TMainForm.ItemEdit2Execute(Sender: TObject);
var
  Editor: IHTMLEditor;
  s: String;
  RemotePath, LocalPath: String;
  FilesList: TStringList;
  id: Integer;
begin
  if not Assigned(PagesList.Selected) then Exit;
  if FPluginManager.GetPlugin(IHTMLEditor, Editor) then
  begin
    with DM.Pages do
    begin
      id := Integer(PagesList.Selected.Data);
      if not Locate('id', id, []) then
        Exit;
      s := FieldValues['text'];
      //----------------
      LocalPath := DM.GetLocalPath(DM.Pages);
      RemotePath := DM.GetRemotePath(LocalPath);
      //----------------
      Editor.RemotePath := RemotePath;
      Editor.LocalPath := LocalPath;
      FilesList := TStringList.Create;
      try
        Editor.FilesList := FilesList;
        if Editor.Execute(s) then
        begin
          Edit;
          FieldValues['text'] := s;
          // картинки
          FieldValues['images'] := Trim(FilesList.Text);
          Post;
        end;
      finally
        FilesList.Free;  
      end;
    end;
  end;
end;

procedure TMainForm.ItemEdit2Update(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(PagesList.Selected);
end;

procedure TMainForm.ItemAddUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Assigned(PagesTree.Selected);
end;

procedure TMainForm.PagesTreeCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  AllowCollapse := Assigned(Node.Parent);
end;

end.
