unit TablePropertyFrm;

interface

uses
  Forms, MSHTML, cxLookAndFeelPainters, Classes, Controls, StdCtrls, cxButtons,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxDropDownEdit, cxCheckBox;

type
  { TTablePropertyForm }
  TTablePropertyForm = class(TForm)
    OK: TcxButton;
    Cancel: TcxButton;
    Panel2: TPanel;
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
    Panel1: TPanel;
    PercentHeight: TcxCheckBox;
    _height: TcxSpinEdit;
    UseHeight: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetTablePropertyForm(const Table: IHTMLTable): Integer;

implementation

uses AlignUtils, SysUtils, StrUtils;

{$R *.dfm}

function GetTablePropertyForm;
var
  Form: TTablePropertyForm;
  i: Integer;
begin
  Form := TTablePropertyForm.Create(Application);
  try
    with Form do
    begin
      // передача параметров
      align.Text := Align2RusAlign(Table.align);
      cellpadding.Value := Table.cellPadding;
      cellspacing.Value := Table.cellSpacing;
      border.Value := Table.border;

      // Высота
      UseHeight.Checked := Length(Table.height) > 0;
      PercentHeight.Checked := Pos('%', Table.height) > 0;
      if TryStrToInt(AnsiReplaceText(Table.height, '%', ''), i) then
        _height.Value := i;

      // Ширина
      UseWidth.Checked := Length(Table.width) > 0;
      PercentWidth.Checked := Pos('%', Table.width) > 0;
      if TryStrToInt(AnsiReplaceText(Table.width, '%', ''), i) then
        _width.Value := i;

      // запуск формы
      Result := ShowModal;
      if Result = mrOk then
      begin
        // сохранение данных
        Table.align := RusAlign2Align(align.Text);
        Table.cellPadding := cellpadding.Value;
        Table.cellSpacing := cellspacing.Value;
        Table.border := border.Value;

        // Ширина 
        if UseWidth.Checked then
        begin
          Table.width := IntToStr(_width.Value);
          if PercentWidth.Checked then
            Table.width := Table.width + '%';
        end
        else
          Table.width := '';

        // Высота
        if UseHeight.Checked then
        begin
          Table.height := IntToStr(_height.Value);
          if PercentHeight.Checked then
            Table.height := Table.height + '%';
        end
        else
          Table.height := '';

      end; 
    end;
  finally
    Form.Free;  
  end;
end;

end.
