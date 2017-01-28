unit PageMangerFolderForm;

interface

uses
  Forms, PageMangerLib, cxLookAndFeelPainters, Classes, ActnList,
  cxMaskEdit, cxDropDownEdit, cxCheckBox, cxMemo, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, Controls, ExtCtrls;

type
  TFolderForm = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    Label1: TLabel;
    Title: TcxTextEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    Description: TcxMemo;
    KeyWords: TcxMemo;
    Label4: TLabel;
    ActionList: TActionList;
    Panel4: TPanel;
    dont_visible: TcxCheckBox;
    Label5: TLabel;
    Template: TcxComboBox;
    parent_data: TcxCheckBox;
    ActionOK: TAction;
    dont_click: TcxCheckBox;
    is_default: TcxCheckBox;
    is_dynamic: TcxCheckBox;
    UseParentTemplate: TcxCheckBox;
    name: TcxMaskEdit;
    cxButton1: TcxButton;
    procedure ActionOKExecute(Sender: TObject);
    procedure parent_dataPropertiesChange(Sender: TObject);
    procedure TitlePropertiesEditValueChanged(Sender: TObject);
    procedure UseParentTemplatePropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    FData: TFolderFormData;
    function GetDiscription: String;
    function GetKeyWords: String;
  protected
    function GetParentTemplate: String;
  public
    procedure Load(var Data: TFolderFormData);
    procedure Save(var Data: TFolderFormData);
  end;

function GetFolderForm(var Data: TFolderFormData): Integer;

implementation

uses PageMangerDM, DB, DeviumLib, DBClient, SysUtils;

{$R *.dfm}

function GetFolderForm;
var
  Form: TFolderForm;
begin
  Form := TFolderForm.Create(Application);
  try
    Form.Load(Data);
    Result := Form.ShowModal;
    if Result = mrOK then Form.Save(Data);
  finally
    Form.Free;
  end;
end;

procedure TFolderForm.ActionOKExecute(Sender: TObject);
begin
  // проверка на имя
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TFolderForm.Load;
begin
  FData := Data;
  Title.Text := Data.Title;
  Name.Text := Data.Name;
  Description.Lines.Text := Data.Description;
  KeyWords.Lines.Text := Data.KeyWords;
  parent_data.Checked := Data.parent_data;
//  Description.Lines.Text := GetDiscription;//Data.Description;
//  KeyWords.Lines.Text := GetKeyWords;//Data.KeyWords;
  dont_visible.Checked := Data.dont_visible;
  dont_click.Checked := Data.dont_click;
  is_default.Checked := Data.is_default;
  is_dynamic.Checked := Data.is_dynamic;
  // Шаблон
  Template.Properties.Items.Text := Data.Templates;
  if Data.template_id = 0  then
    UseParentTemplate.Checked := True;
  Template.ItemIndex := Template.Properties.Items.IndexOf(Data.Template);
  // misc
  if not Data.folder then
  begin
    dont_click.Enabled := False; // отключение установки флага для страницы
    Caption := 'Свойства страницы'; // замена а титула
  end;
end;

procedure TFolderForm.Save;
begin
  Data.Title := Title.Text;
  Data.Name := Name.Text;
  Data.KeyWords :=  KeyWords.Lines.Text;
  Data.parent_data := parent_data.Checked;
  if Data.parent_data then
  begin
    Data.Description := '';
    Data.KeyWords := '';
  end
  else
  begin
    Data.Description := Description.Lines.Text;
    Data.KeyWords := KeyWords.Lines.Text;
  end;
  Data.dont_visible := dont_visible.Checked;
  Data.dont_click := dont_click.Checked; 
  Data.is_default := is_default.Checked;
  Data.is_dynamic := is_dynamic.Checked;
  Data.Template := Template.Text;
end;

procedure TFolderForm.parent_dataPropertiesChange(Sender: TObject);
begin
  Description.Enabled := not parent_data.Checked;
  KeyWords.Enabled := not parent_data.Checked;
  FData.parent_data := parent_data.Checked;
  if parent_data.Checked then
  begin
    FData.description := '';
    FData.keywords := '';
    Description.Text := GetDiscription;
    KeyWords.Text := GetKeyWords;
  end;
end;

// Получить описание от родителя
function TFolderForm.GetDiscription: String;
var
  ParentID: Integer;
  SavePlace: TBookmark;
begin
  Result := Trim(FData.description);
  if not FData.parent_data then Exit;

  ParentID := FData.parent_id;
  with DM.Pages do
  begin
    DisableControls;
    SavePlace := GetBookmark;
    try
      while ((Result = '') and (ParentID <> 0)) do
      begin
        if Locate('id', ParentID, []) then
        begin
          Result := Trim(FieldByName('description').AsString);
          ParentID := FieldByName('parent_id').AsInteger;
        end;
      end;
      GotoBookmark(SavePlace);
    finally
      FreeBookmark(SavePlace);
    end;
    EnableControls;
  end;
end;

// Получить ключевые слова от родителя от родителя
function TFolderForm.GetKeyWords: String;
var
  ParentID: Integer;
  SavePlace: TBookmark;
begin
  Result := Trim(FData.keywords);
  if not FData.parent_data then Exit;

  ParentID := FData.parent_id;
  with DM.Pages do
  begin
    DisableControls;
    SavePlace := GetBookmark;
    try
      while ((Result = '') and (ParentID <> 0)) do
      begin
        if Locate('id', ParentID, []) then
        begin
          Result := Trim(FieldByName('keywords').AsString);
          ParentID := FieldByName('parent_id').AsInteger;
        end;
      end;
      GotoBookmark(SavePlace);
    finally
      FreeBookmark(SavePlace);
    end;
    EnableControls;
  end;
end;

procedure TFolderForm.TitlePropertiesEditValueChanged(Sender: TObject);
begin
  if Length(name.Text) = 0 then 
    name.Text := TransLiterStr(Title.Text);
end;

procedure TFolderForm.UseParentTemplatePropertiesChange(Sender: TObject);
begin
  Template.Enabled := not UseParentTemplate.Checked;
  Template.Text := '';
end;

function TFolderForm.GetParentTemplate: String;
var
  LTemplatId, LParentID: Integer;
begin
  with DM.Pages do
  begin
    DisableControls;
    LParentID := FData.parent_id;
    repeat
      if Locate('id', LParentID, []) then
        LParentID := FieldValues['parent_id']
      else
        LParentID :=  0;
      LTemplatId := FieldValues['template_id'];
    until (LParentID = 0) and (LTemplatId = 0);
    EnableControls;
  end;
end;

procedure TFolderForm.cxButton1Click(Sender: TObject);
begin
  name.Text := TransLiterStr(Title.Text);
end;

end.
