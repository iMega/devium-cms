unit pgViewPictureFrom;

interface

uses
  Forms, Classes, Controls, ExtCtrls;

type
  TViewPictureFrom = class(TForm)
    Image: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetViewPictureFrom(const Title, FileName: String): Integer;

implementation

{$R *.dfm}

uses GflImage;

function GetViewPictureFrom;
var
  From: TViewPictureFrom;
begin
  From := TViewPictureFrom.Create(Application);
  try
    From.Caption := Title;
    From.Image.Picture.LoadFromFile(FileName);
    Result := From.ShowModal;
  finally
    From.Free;
  end;
end;

end.
