{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/PhotoGallery/pgGalleryForm.pas,v 1.1 2004/04/09 06:28:28 paladin Exp $

------------------------------------------------------------------------}
unit pgGalleryForm;

interface

uses
  Forms, cxLookAndFeelPainters, cxCheckBox, Classes, ActnList, StdCtrls,
  cxButtons, cxMemo, cxMaskEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, Controls, ExtCtrls, cxDBEdit;

type
  TGalleryForm = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    ActionList: TActionList;
    ActionOK: TAction;
    title: TcxDBTextEdit;
    name: TcxDBMaskEdit;
    text: TcxDBMemo;
    is_visible: TcxDBCheckBox;
    procedure ActionOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
  end;

function GetGalleryForm: Integer;

implementation

uses pgDataModule;

{$R *.dfm}

function GetGalleryForm: Integer;
var
  Form: TGalleryForm;
begin
  Form := TGalleryForm.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{ TGalleryForm }

procedure TGalleryForm.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

end.
