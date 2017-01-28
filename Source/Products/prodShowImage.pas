unit prodShowImage;

interface

uses
  Forms, Classes, Controls, ExtCtrls;

type
  TShowImageForm = class(TForm)
    Image: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetShowImageForm(const FileName: String): Integer;

implementation

uses SysUtils;

{$R *.dfm}

function GetShowImageForm;
var
  Form: TShowImageForm;
begin
  Form := TShowImageForm.Create(Application);
  try
    Form.Image.Picture.LoadFromFile(FileName);
    Form.Caption := ExtractFileName(FileName);
    Result := Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
