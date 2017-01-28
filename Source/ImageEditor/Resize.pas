unit Resize;

interface

uses
  SysUtils, Controls, Forms, StdCtrls, LibGfl, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxCurrencyEdit, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxLookAndFeelPainters, cxButtons, ActnList, cxCheckBox, cxSpinEdit,
  Classes;

type
  TfrmResize = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    cxComboBox1: TcxComboBox;
    ActionList1: TActionList;
    ActionOK: TAction;
    OK: TcxButton;
    Cancel: TcxButton;
    CheckBox1: TcxCheckBox;
    EditWidth: TcxSpinEdit;
    EditHeight: TcxSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure EditWidthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHeightKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmResize: TfrmResize;
  ValueHeight, ValueWidth: Integer;
  Method: Cardinal;

function GetResizeForm(var Width, Height: Integer; var Method: Cardinal): Integer;

implementation

uses mainFrm;

{$R *.dfm}

function GetResizeForm(var Width, Height: Integer; var Method: Cardinal): Integer;
var
  ResizeForm: TfrmResize;
  IndexMethod: Integer;
begin
  ResizeForm := TfrmResize.Create(Application);
  ValueHeight := Height;
  ValueWidth := Width;
  ResizeForm.EditHeight.Text := IntToStr (Height);
  ResizeForm.EditWidth.Text := IntToStr (Width);
  try
    Result := ResizeForm.ShowModal;
    if Result = mrOK then
    begin
      Height := StrToInt (ResizeForm.EditHeight.Text);
      Width := StrToInt (ResizeForm.EditWidth.Text);
      IndexMethod := ResizeForm.cxComboBox1.Properties.Items.IndexOf(ResizeForm.cxComboBox1.Text);
      case IndexMethod of
       0 : Method := GFL_RESIZE_QUICK;
       1 : Method := GFL_RESIZE_BILINEAR;
      end;
    end;
  finally
    ResizeForm.Free;
  end;
end;

procedure TfrmResize.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmResize.EditWidthKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var NewHeight, NewWidth :Integer;
begin
  if CheckBox1.Checked then
    begin
      if EditWidth.Text <> '' then
        begin
          NewHeight := StrToInt (EditHeight.Text);
          NewWidth := StrToInt (EditWidth.Text);
          try
            NewHeight := (ValueHeight * NewWidth) div ValueWidth;
            except
              NewHeight := ValueHeight;
          end;
          EditHeight.Text := IntToStr (NewHeight);
          EditWidth.Text := IntToStr (NewWidth);
        end;

    end;
end;

procedure TfrmResize.EditHeightKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var NewHeight, NewWidth :Integer;
begin
  if CheckBox1.Checked then
    begin
      if EditHeight.Text <> '' then
        begin
          NewHeight := StrToInt (EditHeight.Text);
          NewWidth := StrToInt (EditWidth.Text);
          try
            NewWidth := (ValueWidth * NewHeight) div ValueHeight;
          except
            NewWidth := ValueWidth;
            end;
          EditHeight.Text := IntToStr (NewHeight);
          EditWidth.Text := IntToStr (NewWidth);
        end;
    end;
end;

procedure TfrmResize.FormCreate(Sender: TObject);
begin
  cxComboBox1.ItemIndex := 1;
end;

procedure TfrmResize.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

end.
