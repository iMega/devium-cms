unit HotelsUploadForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, cxLookAndFeelPainters,
  StdCtrls, cxButtons;

type
  TUploadForm = class(TForm)
    pbMain: TProgressBar;
    pbOne: TProgressBar;
    IdHTTP1: TIdHTTP;
    AntiFreeze: TIdAntiFreeze;
    cxButton1: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UploadForm: TUploadForm;

implementation

{$R *.dfm}

end.
