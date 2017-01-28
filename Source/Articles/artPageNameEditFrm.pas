unit artPageNameEditFrm;

interface

uses
  Forms, cxLookAndFeelPainters, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, StdCtrls, cxButtons, Controls, ExtCtrls, Classes,
  cxCheckBox, ActnList;

type
  TPageNameEditForm = class(TForm)
    Panel2: TPanel;
    Cancel: TcxButton;
    OK: TcxButton;
    Label1: TLabel;
    Label7: TLabel;
    name: TcxDBMaskEdit;
    ReSetName: TcxButton;
    title: TcxDBTextEdit;
    is_visible: TcxDBCheckBox;
    ActionList: TActionList;
    ActionOK: TAction;
    procedure ReSetNameClick(Sender: TObject);
    procedure titlePropertiesEditValueChanged(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
  end;

function GetPageNameEditForm: Integer;

implementation

uses SysUtils, artDataModule, DeviumLib;

{$R *.dfm}

function GetPageNameEditForm: Integer;
var
  Form: TPageNameEditForm;
begin
  Form := TPageNameEditForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TPageNameEditForm.ReSetNameClick(Sender: TObject);
begin
  name.DataBinding.Field.Value := TransLiterStr(Trim(title.Text));
end;

procedure TPageNameEditForm.titlePropertiesEditValueChanged(
  Sender: TObject);
begin
  if Length(name.Text) = 0 then
    ReSetNameClick(nil);
end;

procedure TPageNameEditForm.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

end.
