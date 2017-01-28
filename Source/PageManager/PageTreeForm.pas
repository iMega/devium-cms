unit PageTreeForm;

interface

uses
  Forms, PluginManagerIntf,
  Controls, ExtCtrls, Classes, ComCtrls, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, ImgList;

type
  TTreeForm = class(TForm)
    PagesTree: TTreeView;
    Panel1: TPanel;
    Panel4: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    ActionList: TActionList;
    ActionOK: TAction;
    Lang: TcxComboBox;
    ImageList16: TImageList;
    StaticText1: TStaticText;
    cxButton1: TcxButton;
    procedure ActionOKExecute(Sender: TObject);
    procedure PagesTreeCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure FormDestroy(Sender: TObject);
    procedure PagesTreeCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure PagesTreeCompare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);
    procedure PagesTreeDblClick(Sender: TObject);
    procedure LangPropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FDataPath: String;
    FOpenDM: Boolean;
    procedure SetPluginManager(const Value: IPluginManager);
    function FindNode(AID: Integer): TTreeNode;
    function IntToStr2(Value, Len: Integer): String;
    procedure FillTree;
    procedure FillLanguages;
    function GetLink: string;
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property DataPath: String read FDataPath write FDataPath;
    property Link: string read GetLink;
  end;

function GetTreeForm(const PluginManager: IPluginManager; const DataPath: String;
  var S: String): Integer;

implementation

uses PageMangerLib, PageMangerDM, SysUtils, Dialogs, StrUtils;

{$R *.dfm}

function GetTreeForm;
var
  Form: TTreeForm;
begin
  Form := TTreeForm.Create(Application);
  try
    Form.DataPath := DataPath;
    Form.PluginManager := PluginManager;
    Result := Form.ShowModal;
    if Result = mrOK then
      S := Form.Link;
  finally
    Form.Free;
  end;
end;

procedure TTreeForm.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TTreeForm.FillTree;
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
      // добавление элемента
      Node := TNC(Items.AddChild(nil, FieldValues['title']));
      Node.ID := FieldValues['id'];
      Node.ParentID := FieldValues['parent_id'];
      Node.SortOrder := FieldValues['sort_order'];
      Node.IsDefault := FieldValues['is_default'];
      Node.DontClick := FieldValues['dont_click'];
      Node.IsDynamic := FieldValues['is_dynamic'];
      Node.DontVisible := FieldValues['dont_visible'];
      Node.Folder := (FieldValues['folder'] = 1);
      if Node.Folder then
      begin
        if Node.ParentID = 0 then
          Node.ImageIndex := 121
        else
          Node.ImageIndex := 20;
      end
      else
        Node.ImageIndex := 40;
      Node.SelectedIndex := Node.ImageIndex;
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

procedure TTreeForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  FOpenDM := not Assigned(DM);
  if FOpenDM then
  begin
    DM := TDM.Create(Self);
    DM.PluginManager := FPluginManager;
    DM.DataPath := FDataPath;
    DM.Open;
  end;
  FillLanguages;
  FillTree;
end;

procedure TTreeForm.PagesTreeCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
  NodeClass := TNC;
end;

function TTreeForm.FindNode(AID: Integer): TTreeNode;
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

procedure TTreeForm.FormDestroy(Sender: TObject);
begin
  if FOpenDM then DM.Free;
end;

procedure TTreeForm.PagesTreeCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  AllowCollapse := Assigned(Node.Parent);
end;

procedure TTreeForm.PagesTreeCompare(Sender: TObject; Node1,
  Node2: TTreeNode; Data: Integer; var Compare: Integer);
var
  s1, s2: String;

  function SortStr(ANode: TTreeNode): String;
  var
    Node: TNC;
  begin
    Node := TNC(ANode);
    repeat
      Result := IntToStr(Integer(not Node.Folder)) +  IntToStr2(Node.SortOrder, 4) + Result;
      Node := TNC(Node.Parent);
    until Node = nil;
  end;

begin
  s1 := SortStr(Node1);
  s2 := SortStr(Node2);
  Compare := AnsiCompareText(S1, S2);
end;

function TTreeForm.IntToStr2(Value, Len: Integer): String;
var
  s: String;
begin
  s := IntToStr(Value);
  Result := StringOfChar('0', Len - Length(s)) + s;
end;

procedure TTreeForm.PagesTreeDblClick(Sender: TObject);
begin
  ActionOK.Execute;
end;

procedure TTreeForm.FillLanguages;
begin
  with DM.Languages do
  begin
    Lang.Properties.Items.BeginUpdate;
    Lang.Properties.Items.Clear;
    First;
    while not EOF do
    begin
      Lang.Properties.Items.Add(FieldValues['title']);
      Next;
    end;
    Lang.Properties.Items.EndUpdate;
  end;
end;

procedure TTreeForm.LangPropertiesChange(Sender: TObject);
begin
  DM.SetLanguage(Lang.Text);
  FillTree;
end;

procedure TTreeForm.cxButton1Click(Sender: TObject);
var
  s: String;
  sl: TStringList;
  i: Integer;
begin
  DM.Pages.Locate('id', TNC(PagesTree.Selected).ID, []);
  s := DM.GetLocalPath(DM.Pages);
  s := DM.GetRemotePath(s);
  sl := TStringList.Create;
  try
    sl.Delimiter := '/';
    sl.DelimitedText := s;
    // складываем путь заново
    for i := 1 to 4 do sl.Delete(0);
    // первые три элемента
    sl.Insert(0, 'ru');
    if not TNC(PagesTree.Selected).Folder then
      sl[sl.Count-1] := sl[sl.Count-1] + '.html'; 

    s := '/' + sl.DelimitedText;

{    if TNC(PagesTree.Selected).Folder then
      s := s + '/'
    else
      s := s + '.html';
}      
  finally
    sl.Free;
  end;
  ShowMessage(s);
end;

function TTreeForm.GetLink: string;
var
  sl: TStringList;
  i: Integer;
begin
  DM.Pages.Locate('id', TNC(PagesTree.Selected).ID, []);
  Result := DM.GetLocalPath(DM.Pages);
  Result := DM.GetRemotePath(Result);
  sl := TStringList.Create;
  try
    sl.Delimiter := '/';
    sl.DelimitedText := Result;
    // складываем путь заново
    for i := 1 to 4 do sl.Delete(0);
    // первые три элемента
//    sl.Insert(0, 'ru');
    Result := '/' + sl.DelimitedText;
    if not TNC(PagesTree.Selected).Folder then
    begin
      Result := Copy(Result, 1, Length(Result) - 1);
      Result := Result + '.html';
    end;
  finally
    sl.Free;
  end;
end;

end.
