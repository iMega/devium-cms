{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PhotoGallery/pgImageForm.pas,v 1.3 2004/04/10 07:12:11 paladin Exp $

------------------------------------------------------------------------}
unit pgImageForm;

interface

uses
  Forms, cxLookAndFeelPainters, Classes, ActnList, cxDropDownEdit,
  cxCalendar, cxCheckBox, cxMemo, cxMaskEdit, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, Controls, ExtCtrls,
  Graphics, cxDBEdit;

type
  TImageForm = class(TForm)
    Panel2: TPanel;
    ActionList: TActionList;
    ActionOK: TAction;
    OK: TcxButton;
    Cancel: TcxButton;
    Image: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label4: TLabel;
    title: TcxDBTextEdit;
    name: TcxDBMaskEdit;
    text: TcxDBMemo;
    last_update: TcxDBDateEdit;
    is_visible: TcxDBCheckBox;
    procedure ActionOKExecute(Sender: TObject);
  private
    FBitmap: TBitmap;
    procedure SetBitmap(const Value: TBitmap);
  public
    property Bitmap: TBitmap read FBitmap write SetBitmap;
  end;

function GetImageForm(Bitmap: TBitmap): Integer;

implementation

uses pgDataModule, DB;

{$R *.dfm}

function GetImageForm;
var
  Form: TImageForm;
begin
  Form := TImageForm.Create(Application);
  try
    Form.Bitmap := Bitmap;
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{ TImageForm }

procedure TImageForm.SetBitmap(const Value: TBitmap);
begin
  FBitmap := Value;
  Image.Picture.Bitmap.Assign(FBitmap);
end;

procedure TImageForm.ActionOKExecute(Sender: TObject);
begin
  Ok.SetFocus;
  ModalResult := mrOK;
end;

end.
