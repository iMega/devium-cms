unit gbEditQuestion;

interface

uses
  Forms, Classes, Controls, ExtCtrls, cxLookAndFeelPainters, cxMemo,
  cxDBEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, cxButtons, ActnList;

type
  TEditQuestion = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OK: TcxButton;
    Cancel: TcxButton;
    date: TcxDBDateEdit;
    author: TcxDBTextEdit;
    email: TcxDBTextEdit;
    question: TcxDBMemo;
    answer: TcxDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    ActionList: TActionList;
    ActionOK: TAction;
    Label6: TLabel;
    city: TcxDBTextEdit;
    Label7: TLabel;
    ip: TcxDBTextEdit;
    Label8: TLabel;
    homepage: TcxDBTextEdit;
    ActionCancel: TAction;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetEditQuestion: Integer;

implementation

uses gbDataModule;

{$R *.dfm}

function GetEditQuestion: Integer;
var
  Form: TEditQuestion;
begin
  Form := TEditQuestion.Create(Application);
  try
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TEditQuestion.ActionOKExecute(Sender: TObject);
begin
  OK.SetFocus;
  ModalResult := mrOK;
end;

procedure TEditQuestion.ActionCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
