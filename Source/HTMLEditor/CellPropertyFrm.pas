unit CellPropertyFrm;

interface

uses
  Forms, MSHTML, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, Controls, ExtCtrls, Classes;

type
  TCellPropertyForm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    align: TcxComboBox;
    valign: TcxComboBox;
    UseHeight: TcxCheckBox;
    Panel4: TPanel;
    Panel5: TPanel;
    UseWidth: TcxCheckBox;
    PercentHeight: TcxCheckBox;
    PercentWidth: TcxCheckBox;
    _height: TcxSpinEdit;
    _width: TcxSpinEdit;
    Panel6: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    nowrap: TcxCheckBox;
    Panel2: TPanel;
    rowSpan: TcxSpinEdit;
    colSpan: TcxSpinEdit;
    Label1: TLabel;
    Label4: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetCellPropertyForm(const TableCell: IHTMLTableCell): Integer;

implementation

uses SysUtils, StrUtils, AlignUtils;

{$R *.dfm}

function GetCellPropertyForm;
var
  Form: TCellPropertyForm;
  i: Integer;
begin
  Form := TCellPropertyForm.Create(Application);
  try
    with Form do
    begin
      // заполнение данных
      rowSpan.Value := TableCell.rowSpan;
      colSpan.Value := TableCell.colSpan;
      align.Text := Align2RusAlign(TableCell.align);
      valign.Text := Align2RusAlign(TableCell.vAlign);
      nowrap.Checked := TableCell.noWrap;

      // Высота
      UseHeight.Checked := Length(TableCell.height) > 0;
      PercentHeight.Checked := Pos('%', TableCell.height) > 0;
      if TryStrToInt(AnsiReplaceText(TableCell.height, '%', ''), i) then
        _height.Value := i;

      // Ширина
      UseWidth.Checked := Length(TableCell.width) > 0;
      PercentWidth.Checked := Pos('%', TableCell.width) > 0;
      if TryStrToInt(AnsiReplaceText(TableCell.width, '%', ''), i) then
        _width.Value := i;

      // запуск диалога
      Result := ShowModal;
      if Result = mrOK then
      begin
        // сохранение данных
        TableCell.rowSpan := rowSpan.Value;
        TableCell.colSpan := colSpan.Value; 
        TableCell.align := RusAlign2Align(align.Text);
        TableCell.vAlign := RusAlign2Align(valign.Text);
        TableCell.noWrap := nowrap.Checked;

        // Ширина 
        if UseWidth.Checked then
        begin
          TableCell.width := IntToStr(_width.Value);
          if PercentWidth.Checked then
            TableCell.width := TableCell.width + '%';
        end
        else
          TableCell.width := '';

        // Высота
        if UseHeight.Checked then
        begin
          TableCell.height := IntToStr(_height.Value);
          if PercentHeight.Checked then
            TableCell.height := TableCell.height + '%';
        end
        else
          TableCell.height := '';
          
      end;
    end;
  finally
    Form.Free;
  end;
end;

end.
