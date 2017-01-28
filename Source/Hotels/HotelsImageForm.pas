unit HotelsImageForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxMemo, TB2Dock,
  TB2Toolbar, ExtDlgs;

type
  TImageForm = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    btnOK: TcxButton;
    Cancel: TcxButton;
    ActionList: TActionList;
    ActionOK: TAction;
    Label1: TLabel;
    name: TcxDBTextEdit;
    Label3: TLabel;
    description: TcxDBMemo;
    LoadImage: TAction;
    btnLoad: TcxButton;
    OpenPictureDialog: TOpenPictureDialog;
    Panel3: TPanel;
    Panel4: TPanel;
    Image: TImage;
    Label2: TLabel;
    procedure ActionOKExecute(Sender: TObject);
    procedure LoadImageExecute(Sender: TObject);
  private
    FImageName: String;
    procedure CMDialogKey(var Msg: TWMKey); message CM_DIALOGKEY;
    procedure DoLoadImage;
    procedure SetImageName(const Value: String);
  public
    property ImageName: String read FImageName write SetImageName;
  end;

var
  ImageForm: TImageForm;

function GetImageForm(var ImageName: String): Integer;

implementation

uses HotelsMainForm, HotelsDataModule, GflImage;

{$R *.dfm}

function GetImageForm;
var
  Form: TImageForm;
begin
  Form := TImageForm.Create(Application);
  try
    Form.ImageName := ImageName;
    Result := Form.ShowModal;
    if Result = mroK then
      ImageName := Form.ImageName;
  finally
    Form.Free;
  end;
end;

{ TImageForm }
procedure TImageForm.ActionOKExecute(Sender: TObject);
begin
  btnOK.SetFocus;
  ModalResult := mrOK;
end;

procedure TImageForm.CMDialogKey(var Msg: TWMKey);
begin
  if not (ActiveControl is TButton) then
    if Msg.Charcode = VK_RETURN then
      Msg.Charcode := VK_TAB;
  inherited;
end;

procedure TImageForm.DoLoadImage;
begin
  ImageName := OpenPictureDialog.FileName;
  Image.Picture.LoadFromFile(ImageName);
end;

procedure TImageForm.LoadImageExecute(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
    DoLoadImage;
end;

procedure TImageForm.SetImageName(const Value: String);
begin
  FImageName := Value;
  try
    Image.Picture.LoadFromFile(ImageName);
  except
  end;
end;

end.
