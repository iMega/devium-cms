unit AlignUtils;

interface

type
  TAlignIdent = record
    Name, Value: String;
  end;

const
  Aligns: array[0..7] of TAlignIdent = (
    (Name: 'по умолчанию'; Value: ''),
    (Name: 'по левому краю'; Value: 'left'),
    (Name: 'по правому краю'; Value: 'right'),
    (Name: 'по центру'; Value: 'center'),
    (Name: 'по ширине'; Value: 'justify'),
    (Name: 'по вернему краю'; Value: 'top'),
    (Name: 'по середине'; Value: 'middle'),
    (Name: 'по нижниму краю'; Value: 'bottom')
  );

function RusAlign2Align(const Value: String): String;
function Align2RusAlign(const Value: String): String;

implementation

uses StrUtils;

function RusAlign2Align(const Value: String): String;
var
  i: Integer;
begin
  Result := '';
  for i := Low(Aligns) to High(Aligns) do
    if Aligns[i].Name = Value then
    begin
      Result := Aligns[i].Value;
      Break;
    end;
end;

function Align2RusAlign(const Value: String): String;
var
  i: Integer;
begin
  Result := '';
  for i := Low(Aligns) to High(Aligns) do
    if Aligns[i].Value = Value then
    begin
      Result := Aligns[i].Name;
      Break;
    end;
end;

end.

