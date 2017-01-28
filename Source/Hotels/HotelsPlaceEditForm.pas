unit HotelsPlaceEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxSpinEdit, cxMemo, cxDBExtLookupComboBox;

type
  TPlaceEditForm = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    ActionList: TActionList;
    ActionOK: TAction;
    name: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    country_id: TcxDBLookupComboBox;
    Label3: TLabel;
    english_name: TcxDBTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    map_x: TcxDBSpinEdit;
    map_y: TcxDBSpinEdit;
    Label6: TLabel;
    description: TcxDBMemo;
    Label7: TLabel;
    place_type_id: TcxDBLookupComboBox;
    procedure ActionOKExecute(Sender: TObject);
  private
    procedure CMDialogKey(var Msg: TWMKey); message CM_DIALOGKEY;
  public
  end;

function GetPlaceEditForm: Integer;

implementation

uses HotelsDataModule;

{$R *.dfm}

function GetPlaceEditForm;
var
  Form: TPlaceEditForm;
begin
  Form := TPlaceEditForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TPlaceEditForm.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TPlaceEditForm.CMDialogKey(var Msg: TWMKey);
begin
  if not (ActiveControl is TButton) then
    if Msg.Charcode = VK_RETURN then
      Msg.Charcode := VK_TAB;
  inherited;
end;

end.
