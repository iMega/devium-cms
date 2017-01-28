unit HotelsEditForm;

interface

uses
  Forms, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, Classes, ActnList, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxMemo, cxDBEdit, cxTextEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, Controls, StdCtrls,
  CheckLst, cxContainer, cxMaskEdit, cxDropDownEdit, cxButtons, ExtCtrls,
  Messages, TB2Item, TB2Dock, TB2Toolbar, cxDBLookupComboBox, cxCheckBox,
  Dialogs, ExtDlgs;

type
  TServicesItem = class(TCollectionItem)
  private
    FGroupID: Integer;
    FServiceID: Integer;
  public
    property ServiceID: Integer read FServiceID write FServiceID;
    property GroupID: Integer read FGroupID write FGroupID;
  end;

  TServices = class(TCollection)
  private
    function GetItem(Index: Integer): TServicesItem;
    procedure SetItem(Index: Integer; const Value: TServicesItem);
  public
    constructor Create;
    function Add: TServicesItem;
    function Locate(ID, GroupID: Integer): Boolean;
    property Items[Index: Integer]: TServicesItem read GetItem write SetItem; default;
  end;
  
  THotelsForm = class(TForm)
    Panel2: TPanel;
    Cancel: TcxButton;
    Panel1: TPanel;
    btnOK: TcxButton;
    Groups: TcxComboBox;
    Panel3: TPanel;
    ServicesList: TCheckListBox;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    name: TcxDBTextEdit;
    description: TcxDBMemo;
    Label5: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ActionList: TActionList;
    ActionOK: TAction;
    TBToolbar1: TTBToolbar;
    Ins: TAction;
    Edit: TAction;
    Del: TAction;
    DescEdit: TAction;
    TBItem1: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    Types: TcxComboBox;
    Label7: TLabel;
    TBToolbar2: TTBToolbar;
    TypeEdit: TAction;
    TBItem5: TTBItem;
    ImageUp: TAction;
    ImageDown: TAction;
    TBSeparatorItem2: TTBSeparatorItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    place_id: TcxDBLookupComboBox;
    starts: TcxDBComboBox;
    super: TcxDBCheckBox;
    Label6: TLabel;
    Label3: TLabel;
    country_id: TcxDBLookupComboBox;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1hotel_id: TcxGridDBColumn;
    cxGrid1DBTableView1image: TcxGridDBColumn;
    cxGrid1DBTableView1description: TcxGridDBColumn;
    cxGrid1DBTableView1sort_order: TcxGridDBColumn;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    procedure ActionOKExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GroupsPropertiesChange(Sender: TObject);
    procedure TypesPropertiesChange(Sender: TObject);
    procedure TypeEditExecute(Sender: TObject);
    procedure InsExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
    procedure DescEditExecute(Sender: TObject);
  private
    FServices: TServices;
    FGroupID: Integer;
    procedure CMDialogKey(var Msg: TWMKey); message CM_DIALOGKEY;
    procedure FillServicesList(TypeID: Integer = 0);
    procedure FillServicesCollection;
    procedure SetCheckedServices(GroupID: Integer);
    procedure FillGroups;
    procedure FillTypes;
    procedure SaveServices;
  public
    procedure Save;
  end;

function GetHotelsForm(): Integer;

implementation

uses Windows, HotelsDataModule, HotelsMainForm,
  HotelsTypesForm, Variants, SysUtils, HotelsImageForm, DBClient,
  HTMLEditorIntf;

{$R *.dfm}

function GetHotelsForm;
var
  Form: THotelsForm;
begin
  Form := THotelsForm.Create(Application);
  try
    Result := Form.ShowModal;
    if Result = mrOK then
    begin
      Form.Save;      
    end;
  finally
    Form.Free;
  end;
end;

{ THotelsForm }

procedure THotelsForm.CMDialogKey(var Msg: TWMKey);
begin
  if not (ActiveControl is TButton) then
    if Msg.Charcode = VK_RETURN then
      Msg.Charcode := VK_TAB;
  inherited;
end;

procedure THotelsForm.ActionOKExecute(Sender: TObject);
begin
  btnOK.SetFocus;
  SaveServices();
  ModalResult := mrOK;
end;

procedure THotelsForm.FillServicesList(TypeID: Integer = 0);
begin
  with DM.Services do
  begin
    DisableControls;
    ServicesList.Clear;
    ServicesList.Items.BeginUpdate;
    First;
    while not EOF do
    begin
      if (TypeID = 0) or (TypeID = FieldValues['type_id']) then
      ServicesList.Items.AddObject(FieldValues['name'],
        TObject(FieldByName('id').AsInteger));      
      Next;
    end;
    ServicesList.Items.EndUpdate;
    EnableControls;
  end;
  // расновление галочек
end;

procedure THotelsForm.FormCreate(Sender: TObject);
var
  GroupID: Integer;
begin
  FServices := TServices.Create;
  FillServicesCollection; // заполнение коллекции данными
  FillServicesList;       // заполнение списка сервисов
  FillGroups;             // -//- для групп
  FillTypes;              // -//- для типов
  ///
  GroupID := Integer(Groups.Properties.Items.Objects[Groups.ItemIndex]);
  SetCheckedServices(GroupID); // растановка галок
end;

procedure THotelsForm.FillGroups;
begin
  with DM.ServicesGroups, Groups.Properties do
  begin
    Items.Clear;
    BeginUpdate;
    First;
    while not EOF do
    begin
      Items.AddObject(FieldValues['name'],
        TObject(FieldByName('id').AsInteger));
      Next;
    end;
    EndUpdate;
  end;
  Groups.ItemIndex := 0;
end;

procedure THotelsForm.FillTypes;
begin
  with DM.ServicesTypes, Types.Properties do
  begin
    DisableControls;
    Items.Clear;
    BeginUpdate;
    Items.Add('< Все типы >');
    First;
    while not EOF do
    begin
      Items.AddObject(FieldValues['name'],
        TObject(FieldByName('id').AsInteger));
      Next;
    end;
    EndUpdate;
    EnableControls;
  end;
  Types.ItemIndex := 0;
end;

procedure THotelsForm.SaveServices;
var
  i: Integer;
  id: Integer;
  Item: TServicesItem;
begin
  id := Integer(Groups.Properties.Items.Objects[Groups.ItemIndex]);
  if FGroupID > 0 then
  begin
    // чистим данные
    i := 0;
    while FServices.Count > i do
    begin
      if FServices[i].GroupID = FGroupID then
        FServices.Delete(i)
      else
        Inc(i);
    end;
    // добаялем
    for i := 0 to ServicesList.Count - 1 do
    begin
      if ServicesList.Checked[i] then
      begin
        Item := FServices.Add;
        Item.GroupID := FGroupID;
        Item.ServiceID := Integer(ServicesList.Items.Objects[i]);
      end;
    end;
  end;
  FGroupID := ID;
end;

procedure THotelsForm.FillServicesCollection;
var
  Item: TServicesItem;
begin
  with DM.HotelsServices do
  begin
    DisableControls;
    FServices.Clear;
    First;
    while not EOF do
    begin
      if FieldValues['hotel_id'] = DM.Hotels['id'] then
      begin
        Item := FServices.Add;
        Item.ServiceID := FieldValues['service_id'];
        Item.GroupID := FieldValues['group_id'];
      end;
      Next;
    end;
    EnableControls;
  end;
end;

procedure THotelsForm.SetCheckedServices(GroupID: Integer);
var
  i: Integer;
  LID: Integer;
begin
  for i := 0 to ServicesList.Count - 1 do
  begin
    LID := Integer(ServicesList.Items.Objects[i]);
    ServicesList.Checked[i] := FServices.Locate(LID, GroupID);
  end;
end;

procedure THotelsForm.Save;
var
  i: Integer;
  HotelID: Integer;
begin
  with DM.HotelsServices do
  begin
    DisableControls;
    HotelID := DM.Hotels['id'];
    // удаление удаленных записей
    First;
    while not EOF do
    begin
      if not FServices.Locate(FieldValues['service_id'], FieldValues['group_id']) then
        Delete
      else
        Next;
    end;
    // добавление записей
    for i := 0 to FServices.Count - 1 do
    begin
      if not Locate('hotel_id;service_id;group_id',
        VarArrayOf([HotelID, FServices[i].ServiceID, FServices[i].GroupID]),
        [loPartialKey]) then
      begin
        Append;
        FieldValues['hotel_id'] := HotelID;
        FieldValues['service_id'] := FServices[i].ServiceID;
        FieldValues['group_id'] := FServices[i].GroupID;
        Post;
      end;
    end;
    EnableControls;
  end;
end;

{ TServices }

function TServices.Add: TServicesItem;
begin
  Result := TServicesItem(inherited Add);
end;

constructor TServices.Create;
begin
  inherited Create(TServicesItem);
end;

function TServices.GetItem(Index: Integer): TServicesItem;
begin
  Result := TServicesItem(inherited GetItem(Index));
end;

function TServices.Locate(ID, GroupID: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Count - 1 do
    if (Items[i].ServiceID = ID) and (Items[i].GroupID = GroupID) then
    begin
      Result := True;
      Exit;
    end;
end;

procedure TServices.SetItem(Index: Integer; const Value: TServicesItem);
begin
  inherited SetItem(Index, Value);
end;

procedure THotelsForm.FormDestroy(Sender: TObject);
begin
  FServices.Free;
end;

procedure THotelsForm.GroupsPropertiesChange(Sender: TObject);
begin
  SaveServices();
  SetCheckedServices(FGroupID);
end;

procedure THotelsForm.TypesPropertiesChange(Sender: TObject);
var
  TypeID: Integer;
begin
  TypeID := Integer(Types.Properties.Items.Objects[Types.ItemIndex]);
  FillServicesList(TypeID);
  SetCheckedServices(FGroupID); // растановка галок
end;

procedure THotelsForm.TypeEditExecute(Sender: TObject);
begin
  GetTypesForm;
  TypesPropertiesChange(nil);
end;

procedure THotelsForm.InsExecute(Sender: TObject);
var
  SortOrder: Integer;
  ImageName: String;
begin
  with DM.HotelsImages do
  begin
    SortOrder := DM.GetNextHotelsImagesSort;
    Append;
    FieldValues['sort_order'] := SortOrder;
    FieldValues['name'] := Format('Фото № %d', [(SortOrder div 10)]);
    if GetImageForm(ImageName) = mrOK then
    begin
      if Length(ImageName) > 0 then
        FieldValues['image'] := ExtractFileName(ImageName);
      Post;
      if Length(ImageName) > 0 then
        DM.AddImage2(ImageName, Name, 'id', FieldValues['id']);
    end
    else
      Cancel;
  end;
end;

procedure THotelsForm.EditExecute(Sender: TObject);
var
  ImageNameOld, ImageNameNew: String;
begin
  with DM.HotelsImages do
  begin
    ImageNameOld := DM.GetImagesPathL + FieldByName('image').AsString;
    ImageNameNew := ImageNameOld;
    Edit;
    if GetImageForm(ImageNameNew) = mrOK then
    begin
      if AnsiCompareText(ImageNameNew, ImageNameOld) <> 0 then
      begin
        Dm.RemoveImage(ImageNameOld, Name, 'id', FieldValues['id']);
        FieldValues['image'] := ExtractFileName(ImageNameNew);
        DM.AddImage(ImageNameNew, Name, 'id', FieldValues['id']);
      end;
      Post;
    end
    else
      Cancel;
  end;
end;

procedure THotelsForm.DelExecute(Sender: TObject);
begin
  if MessageBox(Handle,
    'Вы тоействительно хотите удалить картинку ?',
    PChar(Caption),
    MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK
  then
    DM.HotelsImages.Delete;
end;

procedure THotelsForm.DescEditExecute(Sender: TObject);
var
  Editor: IHTMLEditor;
  FilesList: TStringList;
  s: String; 
begin
  if DM.PluginManager.GetPlugin(IHTMLEditor, Editor) then
  begin
    FilesList := TStringList.Create;
    try
      s := description.DataBinding.Field.AsString;
      Editor.FilesList := FilesList;
      Editor.LocalPath := DM.GetImagesPathL;
      Editor.RemotePath := DM.GetImagesPathR;        
      if Editor.Execute(s) then
      begin
        description.DataBinding.Field.Value := s;
        
      end;
    finally
      FilesList.Free;
    end;
  end;
end;

end.
