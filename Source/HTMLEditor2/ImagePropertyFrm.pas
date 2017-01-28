unit ImagePropertyFrm;

interface

uses
  Forms, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxDropDownEdit, ExtCtrls, Dialogs, ExtDlgs, cxRadioGroup,
  cxCheckBox;

type
  PImgElement = ^TImgElement;
  TImgElement = record
    src, alt, href, align: String;
    border, vspace, hspace, width, height: Integer;
  end;

  TImagePropertyForm = class(TForm)
    src: TcxButtonEdit;
    cxButton1: TcxButton;
    alt: TcxTextEdit;
    Label1: TLabel;
    AWidth: TcxSpinEdit;
    AHeigth: TcxSpinEdit;
    Label2: TLabel;
    vspace: TcxSpinEdit;
    HSpace: TcxSpinEdit;
    Border: TcxSpinEdit;
    Align: TcxComboBox;
    Cancel: TcxButton;
    OK: TcxButton;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    OpenPictureDialog: TOpenPictureDialog;
    Panel3: TPanel;
    Panel4: TPanel;
    SizePropo: TcxCheckBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Panel7: TPanel;
    href: TcxButtonEdit;
    CalcImageSize: TcxButton;
    procedure SourcePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CalcImageSizeClick(Sender: TObject);
  private
  end;

function GetImagePropertyForm(const Img: PImgElement): Integer;

implementation

uses GflImage, LibGfl, SysUtils, StrUtils;

{$R *.dfm}

function GetImagePropertyForm;
var
  Form: TImagePropertyForm;
begin
  Form := TImagePropertyForm.Create(Application);
  try
    with Form do
    begin
      src.Text := Img.src;
      alt.Text := img.alt;
      vspace.Value := img.vspace;
      hspace.Value := img.hspace;
      Border.Value := img.border;
      AWidth.Value := img.width;
      AHeigth.Value := img.height;
      href.Text := img.href;
      Align.Text := img.align;

      Result := ShowModal;
      if Result = mrOK then
      begin
        Img.src := src.Text;
        img.alt := alt.Text;
        img.vspace := vspace.Value;
        img.hspace := HSpace.Value;
        img.border := Border.Value;
        img.width := AWidth.Value;
        img.height := AHeigth.Value;
        img.href := href.Text;
        img.align := Align.Text;
      end;
    end;
  finally
    Form.Free;
  end;
end;

procedure TImagePropertyForm.SourcePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if OpenPictureDialog.Execute then
  begin
    src.Text := OpenPictureDialog.FileName;
  end;
end;

procedure TImagePropertyForm.CalcImageSizeClick(Sender: TObject);
var
  info: TGFL_FILE_INFORMATION;
  s: String;
begin
  s := AnsiReplaceText(src.Text, 'file://', '');
  if gflGetFileInformation(PChar(s), -1, info) = GFL_NO_ERROR then
  begin
    AWidth.Value := info.Width;
    AHeigth.Value := info.Height;
  end;  
end;

end.
