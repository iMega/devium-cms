unit InsertTableFrm;

interface

uses
  Forms, cxLookAndFeelPainters, cxCheckBox, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Controls,
  StdCtrls, ExtCtrls, Classes, cxButtons;

type
  TInsertTableForm = class(TForm)
    OK: TcxButton;
    Cancel: TcxButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    rows: TcxSpinEdit;
    cols: TcxSpinEdit;
    Panel3: TPanel;
    align: TcxComboBox;
    border: TcxSpinEdit;
    cellpadding: TcxSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cellspacing: TcxSpinEdit;
    Panel4: TPanel;
    UseWidth: TcxCheckBox;
    PercentWidth: TcxCheckBox;
    _width: TcxSpinEdit;
  private
    function GetTableAttrs: String;
  public
    property TableAttrs: String read GetTableAttrs;
  end;

function GetInsertTableForm(var NumRows, NumCols: Integer; var _TableAttrs: String): Integer;

implementation

{$R *.dfm}

uses SysUtils, AlignUtils;

function GetInsertTableForm;
var
  Form: TInsertTableForm;
begin
  Form := TInsertTableForm.Create(Application);
  try
    with Form do
    begin
      Result := ShowModal;
      if Result = mrOK then
      begin
        NumRows := rows.Value;
        NumCols := cols.Value;
        _TableAttrs := TableAttrs;
      end;
    end;
  finally
    Form.Free;
  end;
end;

function TInsertTableForm.GetTableAttrs: String;
var
  p, w: String;
begin
  if UseWidth.Checked then
  begin
    p := '';
    if PercentWidth.Checked then p := '%';
    w := Format(' width="%s%s"', [_width.Value, p]);
  end;

  Result := Format('border="%s" cellpadding="%s" cellspacing="%s"',
    [border.Value, cellpadding.Value, cellspacing.Value]) + w;

end;

end.
