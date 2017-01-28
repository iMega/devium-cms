{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/ControlPanel/Devium.dpr,v 1.2 2004/04/06 09:29:07 paladin Exp $

------------------------------------------------------------------------}
unit pgAddParamsForm;

interface

uses
  Forms, Classes, Controls, ExtCtrls, StdCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDropDownEdit,
  cxLookAndFeelPainters, cxButtons, cxRadioGroup, Graphics, cxCheckBox,
  ActnList;

type
  TAddParamsForm = class(TForm)
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
    procedure FormCreate(Sender: TObject);
  end;

function GetAddParamsForm(var SmallSize, BigSize: Integer;
  var CenterCrop: Boolean): Integer;

implementation

uses SysUtils;

{$R *.dfm}

function GetAddParamsForm(var SmallSize, BigSize: Integer;
  var CenterCrop: Boolean): Integer;
var
  Form: TAddParamsForm;
begin
  Form := TAddParamsForm.Create(Application);
  try
    Result := Form.ShowModal;
    if Result = mrOK then
    begin
      SmallSize := StrToInt(Form.SmallSize.Text);
      BigSize := StrToInt(Form.BigSize.Text);
      CenterCrop := Form.CenterCrop.Checked;
    end;
  finally
    Form.Free;
  end;
end;

{ TAddParamsForm }

procedure TAddParamsForm.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TAddParamsForm.FormCreate(Sender: TObject);
begin
  SmallSize.ItemIndex := 0;
  BigSize.ItemIndex := 0;
end;

end.
