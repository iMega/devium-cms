unit OListPropertyFrm;

interface

uses
  Forms, cxLookAndFeelPainters, Classes, Controls, StdCtrls, cxButtons,
  ExtCtrls, cxRadioGroup, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit;

type
  TOListPropertyForm = class(TForm)
    Cancel: TcxButton;
    OK: TcxButton;
    cxRadioButton1: TcxRadioButton;
    Panel1: TPanel;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    Panel3: TPanel;
    Start: TcxSpinEdit;
    Label1: TLabel;
    Panel4: TPanel;
  private
    procedure SetStyleOfList(const Value: String);
    function GetStyleOfList: String;
    { Private declarations }
  public
    { Public declarations }
    property StyleOfList: String read GetStyleOfList write SetStyleOfList;
  end;

function GetOListPropertyForm(var _start: Integer; var _type: String;
  Element: Boolean): Integer;

implementation

{$R *.dfm}

function GetOListPropertyForm;
var
  Form: TOListPropertyForm;
begin
  Form := TOListPropertyForm.Create(Application);
  try
    with Form do
    begin
      // назначение данных
      if Element then
        Caption := 'Свойства элемента';
      Start.Value := _start;
      StyleOfList := _type;
      Result := ShowModal;
      if Result = mrOK then
      begin
        // сохранение данных
        _start := Start.value;
        _type := StyleOfList;
      end;
    end;
  finally
    Form.Free;
  end;
end;

{ TLOListPropertyForm }

function TOListPropertyForm.GetStyleOfList: String;
begin
  if cxRadioButton1.Checked then
    Result := '';
  if cxRadioButton2.Checked then
    Result := 'a';
  if cxRadioButton3.Checked then
    Result := 'A';
  if cxRadioButton4.Checked then
    Result := 'i';
  if cxRadioButton5.Checked then
    Result := 'I';
end;

procedure TOListPropertyForm.SetStyleOfList(const Value: String);
begin
  if (Value = '1') or (Value = '') then
    cxRadioButton1.Checked := True;
  if Value = 'a' then
    cxRadioButton2.Checked := True;
  if Value = 'A' then
    cxRadioButton3.Checked := True;
  if Value = 'i' then
    cxRadioButton4.Checked := True;
  if Value = 'I' then
    cxRadioButton5.Checked := True;
end;

end.
