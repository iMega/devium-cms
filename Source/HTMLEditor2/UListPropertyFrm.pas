unit UListPropertyFrm;

interface

uses
  Forms, cxLookAndFeelPainters, Controls, ExtCtrls, StdCtrls, cxRadioGroup,
  Classes, cxButtons;

type
  TUListPropertyForm = class(TForm)
    OK: TcxButton;
    Cancel: TcxButton;
    Panel2: TPanel;
    cxRadioButton6: TcxRadioButton;
    cxRadioButton7: TcxRadioButton;
    cxRadioButton8: TcxRadioButton;
    Panel4: TPanel;
  private
    function GetStyleOfList: String;
    procedure SetStyleOfList(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property StyleOfList: String read GetStyleOfList write SetStyleOfList;    
  end;

function GetUListPropertyForm(var _type: String; Element: Boolean): Integer;

implementation

{$R *.dfm}

function GetUListPropertyForm;
var
  Form: TUListPropertyForm;
begin
  Form := TUListPropertyForm.Create(Application);
  try
    with Form do
    begin
      // назначение данных
      if Element then
        Caption := 'Свойства элемента';
      StyleOfList := _type;
      Result := ShowModal;
      if Result = mrOK then
      begin
        // сохранение данных
        _type := StyleOfList;
      end;
    end;
  finally
    Form.Free;
  end;
end;

{ TUListPropertyForm }

function TUListPropertyForm.GetStyleOfList: String;
begin
  if cxRadioButton6.Checked then
    Result := '';{'disc'};
  if cxRadioButton7.Checked then
    Result := 'circle';
  if cxRadioButton8.Checked then
    Result := 'square';
end;

procedure TUListPropertyForm.SetStyleOfList(const Value: String);
begin
  if (Value = 'disc') or (Value = '') then
    cxRadioButton6.Checked := True;
  if Value = 'circle' then
    cxRadioButton7.Checked := True;
  if Value = 'square' then
    cxRadioButton8.Checked := True;
end;

end.
