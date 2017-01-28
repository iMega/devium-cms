unit TravelTourEditFrom;

interface

uses
  Forms, cxLookAndFeelPainters, Classes, Controls, StdCtrls, cxButtons,
  ExtCtrls, ActnList, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxMaskEdit, cxCalendar, Messages, cxMemo, cxImageComboBox,
  cxCurrencyEdit, cxCheckBox, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TB2Item, TB2Dock, TB2Toolbar, cxDBLookupComboBox, cxSpinEdit, Dialogs;

type
  TTourEditFrom = class(TForm)
    btnOK: TcxButton;
    Cancel: TcxButton;
    Panel2: TPanel;
    ActionList: TActionList;
    ActionOK: TAction;
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    description: TcxDBMemo;
    Label5: TLabel;
    EditDescr: TcxButton;
    special_offer: TcxDBCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label3: TLabel;
    TBToolbar1: TTBToolbar;
    direction_id: TcxDBLookupComboBox;
    currency_id: TcxDBLookupComboBox;
    cxGrid1DBTableView1date_begin: TcxGridDBColumn;
    date_begin: TcxDBDateEdit;
    Ins: TAction;
    Post: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    Del: TAction;
    priority: TcxDBComboBox;
    low_price: TcxDBSpinEdit;
    title: TcxDBTextEdit;
    Label9: TLabel;
    name: TcxDBMaskEdit;
    tourtype_id: TcxDBLookupComboBox;
    Label10: TLabel;
    Attach: TcxButton;
    plus_avia: TcxDBCheckBox;
    length_day: TcxDBSpinEdit;
    length_night: TcxDBSpinEdit;
    Label11: TLabel;
    OpenDialog: TOpenDialog;
    Monday: TcxCheckBox;
    Tuesday: TcxCheckBox;
    Wednesday: TcxCheckBox;
    Thursday: TcxCheckBox;
    Friday: TcxCheckBox;
    Saturday: TcxCheckBox;
    Sunday: TcxCheckBox;
    Label8: TLabel;
    EveryDay: TcxCheckBox;
    plus_train: TcxDBCheckBox;
    cxButton1: TcxButton;
    procedure ActionOKExecute(Sender: TObject);
    procedure InsExecute(Sender: TObject);
    procedure PostExecute(Sender: TObject);
    procedure DelExecute(Sender: TObject);
    procedure DelUpdate(Sender: TObject);
    procedure PostUpdate(Sender: TObject);
    procedure EditDescrClick(Sender: TObject);
    procedure titlePropertiesEditValueChanged(Sender: TObject);
    procedure AttachClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EveryDayPropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    FList: TStringList;
    procedure CMDialogKey(var Msg: TWMKey); message CM_DIALOGKEY;
    procedure SavePeriod;
    procedure LoadPeriod;
  public
    property List: TStringList read FList write FList;
  end;

// AList - списко уникальных имено для проверки
function GetTourEditFrom(const AList: String): Integer;

implementation

uses TravelDM, Windows, TravelMainForm, HTMLEditorIntf, DeviumLib,
  SysUtils;

{$R *.dfm}

function GetTourEditFrom;
var
  From: TTourEditFrom;
begin
  From := TTourEditFrom.Create(Application);
  try
    From.List.Text := AList;
    Result := From.ShowModal;
  finally
    From.Free;
  end;
end;

procedure TTourEditFrom.ActionOKExecute(Sender: TObject);
begin
  btnOK.SetFocus;
  // проверка на уже сужествующие имена на "уникальность"
  if FList.IndexOf(name.Text) > -1  then
    MessageBox(Handle, PChar(Format('Данное имя "%s" уже используется!',
      [name.Text])), PChar(Caption), MB_ICONERROR + MB_OK)
  else
  begin
    // собираем переидочность
    SavePeriod;
    ModalResult := mrOK;
  end;
end;

procedure TTourEditFrom.CMDialogKey(var Msg: TWMKey);
begin
  if not (ActiveControl is TButton) then
    if Msg.Charcode = VK_RETURN then
      Msg.Charcode := VK_TAB;
  inherited;
end;

procedure TTourEditFrom.InsExecute(Sender: TObject);
begin
  DM.ToursDates.Append;
end;

procedure TTourEditFrom.PostExecute(Sender: TObject);
begin
  DM.ToursDates.Post;
end;

procedure TTourEditFrom.DelExecute(Sender: TObject);
begin
  DM.ToursDates.Delete;
end;

procedure TTourEditFrom.DelUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := (Dm.ToursDates.RecordCount > 0);
end;

procedure TTourEditFrom.PostUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled :=
    (Dm.ToursDates.State = dsEdit) or
    (Dm.ToursDates.State = dsInsert);
end;

procedure TTourEditFrom.EditDescrClick(Sender: TObject);
var
  Editor: IHTMLEditor;
  s: String;
begin
  if DM.PluginManager.GetPlugin(IHTMLEditor, Editor) then
  begin
    s := description.DataBinding.Field.AsString;
    if Editor.Execute(s) then
      description.DataBinding.Field.Value := s;
  end;
end;

procedure TTourEditFrom.titlePropertiesEditValueChanged(Sender: TObject);
begin
  if Length(name.Text) = 0 then
    name.DataBinding.Field.Value := TransLiterStr(title.Text);
end;

procedure TTourEditFrom.AttachClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
   { TODO -oPaladin : 
1. Доделать добавлеине в базу данных имени файла
2. Положить его в папку программы
3. }     
  end;
end;

procedure TTourEditFrom.FormCreate(Sender: TObject);
begin
  FList := TStringList.Create;
  LoadPeriod;
end;

procedure TTourEditFrom.FormDestroy(Sender: TObject);
begin
  FList.Free;
end;

procedure TTourEditFrom.EveryDayPropertiesChange(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TcxCheckBox) and (Components[i].Tag > 0)  then
    begin
      if TcxCheckBox(Sender).Checked then
        TcxCheckBox(Components[i]).Checked := False;
      TcxCheckBox(Components[i]).Enabled := not TcxCheckBox(Sender).Checked;
    end;
end;

procedure TTourEditFrom.LoadPeriod;
var
  i: Integer;
  s: String;
begin
  // собираем переидочность
  s := DM.Tours.FieldByName('period').AsString;
  if s = '8' then
    EveryDay.Checked := True
  else
  begin
    for i := 0  to ComponentCount - 1 do
    begin
      if (Components[i] is TcxCheckBox) and (Components[i].Tag > 0) then
        if Pos(IntToStr(Components[i].Tag), s) > 0 then
          TcxCheckBox(Components[i]).Checked := True;
    end;
  end;
end;

procedure TTourEditFrom.SavePeriod;
var
  i: Integer;
  s: String;
begin
  // собираем переидочность
  s := '';
  if EveryDay.Checked then
    s := '8'
  else
  begin
    for i := 0  to ComponentCount - 1 do
    begin
      if (Components[i] is TcxCheckBox) and (Components[i].Tag > 0) then
        if TcxCheckBox(Components[i]).Checked then
          s := s + IntToStr(Components[i].Tag) + ',';
    end;
    s := Copy(s, 1, Length(s) - 1);
  end;
  DM.Tours['period'] := s;
end;

procedure TTourEditFrom.cxButton1Click(Sender: TObject);
begin
  name.DataBinding.Field.Value := TransLiterStr(title.Text);
end;

end.
