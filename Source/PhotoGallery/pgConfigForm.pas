unit pgConfigForm;

interface

uses
  Forms, Classes, Controls, ExtCtrls, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDropDownEdit,
  cxLookAndFeelPainters, cxButtons, cxRadioGroup, Graphics, cxCheckBox,
  ActnList;

type
  TConfigForm = class(TForm)
    Panel2: TPanel;
    SmallSize: TcxComboBox;
    Label2: TLabel;
    Label3: TLabel;
    BigSize: TcxComboBox;
    Panel1: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    CenterCrop: TcxCheckBox;
    ActionList: TActionList;
    ActionOK: TAction;
    procedure ActionOKExecute(Sender: TObject);
  end;

var
  ConfigForm: TConfigForm;

function GetConfigForm
implementation

{$R *.dfm}

procedure TConfigForm.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

end.
