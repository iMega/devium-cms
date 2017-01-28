unit NewsEditForm;

interface

uses
  Forms, PluginManagerIntf, cxLookAndFeelPainters, cxMemo, cxDBEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckBox, cxSpinEdit, cxTimeEdit, cxMaskEdit, cxCalendar, Controls,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, Classes, ActnList,
  cxButtons, ExtCtrls;

type
  TEditForm = class(TForm)
    Panel1: TPanel;
    btnOK: TcxButton;
    Cancel: TcxButton;
    Panel2: TPanel;
    ActionList: TActionList;
    OK: TAction;
    Action2: TAction;
    title: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    creation_date: TcxDBDateEdit;
    Label3: TLabel;
    creation_time: TcxDBTimeEdit;
    _published: TcxDBCheckBox;
    category_id: TcxDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    author: TcxDBTextEdit;
    text: TcxDBMemo;
    Label6: TLabel;
    btnEditText: TcxButton;
    Label7: TLabel;
    announcement: TcxDBMemo;
    Label8: TLabel;
    name: TcxDBMaskEdit;
    procedure OKExecute(Sender: TObject);
    procedure btnEditTextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure titlePropertiesEditValueChanged(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
  end;

function GetEditForm(APluginManager: IPluginManager): Integer;

implementation

uses NewsDM, HTMLEditorIntf, SysUtils, DB, DBClient, DeviumLib;

{$R *.dfm}

function GetEditForm;
var
  Form: TEditForm;
begin
  Form := TEditForm.Create(Application);
  try
    Form.PluginManager := APluginManager;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TEditForm.OKExecute(Sender: TObject);
begin
  btnOK.SetFocus;
  ModalResult := mrOK;
end;

procedure TEditForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
end;

procedure TEditForm.btnEditTextClick(Sender: TObject);
var
  Editor: IHTMLEditor;
  s: String;
  RemotePath, LocalPath: String;
  FilesList: TStringList;
begin
  if FPluginManager.GetPlugin(IHTMLEditor, Editor) then
  begin
    s := text.Text;
    //----------------
    LocalPath := DM.GetLocalPath(DM.News);
    RemotePath := DM.GetRemotePath(LocalPath);
    //----------------
    Editor.RemotePath := RemotePath;
    Editor.LocalPath := LocalPath;
    FilesList := TStringList.Create;
    try
      Editor.FilesList := FilesList;
      if Editor.Execute(s) then
      begin
        text.DataBinding.Field.Value := s;
        if Trim(DM.News.FieldValues['images']) <> Trim(FilesList.Text) then
          DM.News.FieldValues['images'] := Trim(FilesList.Text);
      end;
    finally
      FilesList.Free;
    end;
  end;
end;

procedure TEditForm.FormCreate(Sender: TObject);
begin
  FPath := ExtractFilePath(ParamStr(0));
end;

procedure TEditForm.titlePropertiesEditValueChanged(Sender: TObject);
begin
  name.DataBinding.Field.Value := TransLiterStr(Title.Text);
end;

end.
