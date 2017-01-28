{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/GflImage.pas,v 1.4 2004/05/06 07:12:22 paladin Exp $

------------------------------------------------------------------------}
unit GflImage;

interface

uses
  Classes, Graphics, LibGfl, Types;

type
  TGflImage = class(TBitmap)
  public
    constructor Create; override;
    procedure LoadFromFile(const Filename: string); override;
  end;

implementation

uses Windows;

{ TGflImage }

constructor TGflImage.Create;
begin
  inherited;
  gflEnableLZW(GFL_TRUE);
end;

procedure TGflImage.LoadFromFile(const Filename: string);
var
  lp: TGFL_LOAD_PARAMS;
  info: TGFL_FILE_INFORMATION;
  H: HBITMAP;
begin
  gflGetDefaultLoadParams(lp);
  gflLoadBitmapIntoDDB(PChar(Filename), H, lp, info);
  Handle := H;
end;

procedure InitializeLibrary;
begin
  TPicture.RegisterFileFormat('jpg', 'JPEG', TGflImage);
  TPicture.RegisterFileFormat('gif', 'GIF', TGflImage);
  TPicture.RegisterFileFormat('png', 'PNG', TGflImage);
end;

procedure FinalizeLibrary;
begin
  TPicture.UnregisterGraphicClass(TGflImage);
end;

initialization
  InitializeLibrary;

finalization
  FinalizeLibrary;

end.
