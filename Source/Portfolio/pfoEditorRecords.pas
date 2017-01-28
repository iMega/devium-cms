unit pfoEditorRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxCheckBox, cxDBEdit,
  cxDropDownEdit, cxCalendar, cxMemo, cxMaskEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, ExtCtrls, StdCtrls, cxButtons, ImgList, ExtDlgs,
  cxButtonEdit, PluginManagerIntf;

type
  TEditorRecord = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    mbOK: TcxButton;
    mbCancel: TcxButton;
    Panel1: TPanel;
    title: TcxDBTextEdit;
    link: TcxDBMaskEdit;
    description: TcxDBMemo;
    CreateDate: TcxDBDateEdit;
    is_visible: TcxDBCheckBox;
    ActionList: TActionList;
    ActionOK: TAction;
    Label5: TLabel;
    comment: TcxDBMemo;
    PathSmallImage: TAction;
    PathImage: TAction;
    OpenPictureDialog: TOpenPictureDialog;
    translit: TcxDBTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ReSetName: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    ImageList1: TImageList;
    ViewSmallImage: TAction;
    ViewImage: TAction;
    EditDescription: TAction;
    EditComment: TAction;
    cxButton4: TcxButton;
    SmallImage: TcxDBButtonEdit;
    OrigImage: TcxDBButtonEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure PathSmallImageExecute(Sender: TObject);
    procedure PathImageExecute(Sender: TObject);
    procedure EditDescriptionExecute(Sender: TObject);
    procedure EditCommentExecute(Sender: TObject);
    procedure ViewSmallImageExecute(Sender: TObject);
    procedure ViewImageExecute(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    procedure SetPluginManager(const Value: IPluginManager);
  public
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
  end;

function GetEditorRecordForm(APluginManager: IPluginManager): Integer;

implementation

uses pfoDataModule, HTMLEditorIntf;

{$R *.dfm}

function GetEditorRecordForm;
var
  Form: TEditorRecord;
begin
  Form := TEditorRecord.Create(Application);
  try
    Form.PluginManager := APluginManager;
    Result := form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TEditorRecord.ActionOKExecute(Sender: TObject);
begin
  mbOk.SetFocus;
  ModalResult := mrOK;
end;

procedure TEditorRecord.PathSmallImageExecute(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    //Image.Picture.LoadFromFile(OpenPictureDialog.FileName);
    //DM.table_portfolio.FieldByName('path_small_image').AsString := OpenPictureDialog.FileName;
  end;
end;

procedure TEditorRecord.PathImageExecute(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    //DM.table_portfolio.FieldByName('path_image').AsString := OpenPictureDialog.FileName;
  end;
end;

// Редактирование описания
procedure TEditorRecord.EditDescriptionExecute(Sender: TObject);
var
  Editor: IHTMLEditor;
  s: String;
  RemotePath, LocalPath: String;
  FilesList: TStringList;
begin
  if FPluginManager.GetPlugin(IHTMLEditor, Editor) then
  begin
    s := description.Text;
    //----------------
    LocalPath := DM.GetLocalPath(DM.Portfolio);
    RemotePath := DM.GetRemotePath(LocalPath);
    //----------------
    Editor.RemotePath := RemotePath;
    Editor.LocalPath := LocalPath;
    FilesList := TStringList.Create;
    try
      Editor.FilesList := FilesList;
      if Editor.Execute(s) then
      begin
        description.DataBinding.Field.Value := s;
        if Trim(DM.Portfolio.FieldValues['path_small_image']) <> Trim(FilesList.Text) then
          DM.Portfolio.FieldValues['path_small_image'] := Trim(FilesList.Text);
      end;
    finally
      FilesList.Free;
    end;
  end;
end;

// Редактирование комментария
procedure TEditorRecord.EditCommentExecute(Sender: TObject);
begin
//
end;

// Предпросмотр большой картинки
procedure TEditorRecord.ViewSmallImageExecute(Sender: TObject);
begin
//
end;

// Предпросмотр маленькой картинки
procedure TEditorRecord.ViewImageExecute(Sender: TObject);
begin
//
end;

procedure TEditorRecord.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
end;

end.
