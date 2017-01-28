{----------------------------------------------------------------------

   DEVIUM Content Management System
   Copyright (C) 2004 by DEIV Development Team.
   http://www.deiv.com/

   $Header: /devium/Devium\040CMS\0402/Source/Common/LibGfl.pas,v 1.5 2004/05/06 07:12:22 paladin Exp $

------------------------------------------------------------------------}
unit LibGfl;

interface

uses windows;

{$ALIGN ON} // Aligned record fields

const GFL_VERSION = '2.00';
const GFL_FALSE = 0;
const GFL_TRUE = 1;

type GFL_INT8 = ShortInt;
type GFL_UINT8 = Byte;
  PGFL_UINT8 = ^GFL_UINT8; // IN!
type GFL_INT16 = SmallInt;
type GFL_UINT16 = Word;
  PGFL_UINT16 = ^GFL_UINT16; //IS
type GFL_INT32 = LongInt;
type GFL_UINT32 = LongWord;
type GFL_BOOL = Byte;

// ERROR
type GFL_ERROR = GFL_INT16;
const GFL_NO_ERROR = 0;
const GFL_ERROR_FILE_OPEN = 1;
const GFL_ERROR_FILE_READ = 2;
const GFL_ERROR_FILE_CREATE = 3;
const GFL_ERROR_FILE_WRITE = 4;
const GFL_ERROR_NO_MEMORY = 5;
const GFL_ERROR_UNKNOWN_FORMAT = 6;
const GFL_ERROR_BAD_BITMAP = 7;
const GFL_ERROR_BAD_FORMAT_INDEX = 10;
const GFL_ERROR_BAD_PARAMETERS = 50;
const GFL_UNKNOWN_ERROR = 255;

// ORIGIN type
type GFL_ORIGIN = GFL_UINT16;
const GFL_LEFT = $00;
const GFL_RIGHT = $01;
const GFL_TOP = $00;
const GFL_BOTTOM = $10;
const GFL_TOP_LEFT = GFL_TOP or GFL_LEFT;
const GFL_BOTTOM_LEFT = GFL_BOTTOM or GFL_LEFT;
const GFL_TOP_RIGHT = GFL_TOP or GFL_RIGHT;
const GFL_BOTTOM_RIGHT = GFL_BOTTOM or GFL_RIGHT;

// COMPRESSION type
type GFL_COMPRESSION = GFL_UINT16;
const GFL_NO_COMPRESSION = 0;
const GFL_RLE = 1;
const GFL_LZW = 2;
const GFL_JPEG = 3;
const GFL_ZIP = 4;
const GFL_SGI_RLE = 5;
const GFL_CCITT_RLE = 6;
const GFL_CCITT_FAX3 = 7;
const GFL_CCITT_FAX3_2D = 8;
const GFL_CCITT_FAX4 = 9;
const GFL_WAVELET = 10;
const GFL_LZW_PREDICTOR = 11;
const GFL_UNKNOWN_COMPRESSION = 255;

// BITMAP type
type GFL_BITMAP_TYPE = GFL_UINT16;
const GFL_BINARY = $0001;
const GFL_GREY = $0002;
const GFL_COLORS = $0004;
const GFL_RGB = $0010;
const GFL_RGBA = $0020;
const GFL_BGR = $0040;
const GFL_ABGR = $0080;
const GFL_BGRA = $0100;
const GFL_ARGB = $0200;
const GFL_CMYK = $0400;
const GFL_TRUECOLORS = GFL_RGB or GFL_RGBA or GFL_BGR or GFL_ABGR or GFL_BGRA or GFL_ARGB or GFL_CMYK;

// Color Palette
type PGFL_COLORMAP = ^TGFL_COLORMAP;
  TGFL_COLORMAP = record
    Red: array[0..255] of GFL_UINT8;
    Green: array[0..255] of GFL_UINT8;
    Blue: array[0..255] of GFL_UINT8;
  end;

// Color
type PGFL_COLOR = ^TGFL_COLOR;
  TGFL_COLOR = record
    Red: GFL_UINT16;
    Green: GFL_UINT16;
    Blue: GFL_UINT16;
    Alpha: GFL_UINT16;
  end;

// BITMAP
type PGFL_BITMAP = ^TGFL_BITMAP;
  PPGFL_BITMAP = PGFL_BITMAP;
  TGFL_BITMAP = record
    BType: GFL_BITMAP_TYPE;
    Origin: GFL_ORIGIN;
    Width: GFL_INT32;
    Height: GFL_INT32;
    BytesPerLine: GFL_UINT32;
    LinePadding: GFL_INT16;
    BitsPerComponent: GFL_UINT16;
    ComponentsPerPixel: GFL_UINT16;
    BytesPerPixel: GFL_UINT16;
    Xdpi: GFL_UINT16;
    Ydpi: GFL_UINT16;
    TransparentIndex: GFL_INT16; // -1 if not used
    ColorUsed: GFL_INT32;
    ColorMap: PGFL_COLORMAP;
    Data: PGFL_UINT8;
    Comment: PChar;
    MetaData: Pointer;
  end;

// Channels Order
type GFL_CORDER = GFL_UINT16;
const GFL_CORDER_INTERLEAVED = 0;
const GFL_CORDER_SEQUENTIAL = 1;
const GFL_CORDER_SEPARATE = 2;

// Channels Type
type GFL_CTYPE = GFL_UINT16;
const GFL_CTYPE_GREYSCALE = 0;
const GFL_CTYPE_RGB = 1;
const GFL_CTYPE_BGR = 2;
const GFL_CTYPE_RGBA = 3;
const GFL_CTYPE_ABGR = 4;
const GFL_CTYPE_CMY = 5;
const GFL_CTYPE_CMYK = 6;

// Lut Type (For DPX/Cineon)
type GFL_LUT_TYPE = GFL_UINT16;
const GFL_LUT_TO8BITS = 1;
const GFL_LUT_TO10BITS = 2;
const GFL_LUT_TO12BITS = 3;
const GFL_LUT_TO16BITS = 4;

// Callbacks
type GFL_HANDLE = Pointer;

  GFL_ALLOC_CALLBACK = procedure(size: GFL_UINT32; param: Pointer); stdcall;
  GFL_REALLOC_CALLBACK = procedure(ptr: Pointer; newsize: GFL_UINT32; param: Pointer); stdcall;
  GFL_FREE_CALLBACK = procedure(buffer: Pointer; param: Pointer); stdcall;

  GFL_READ_CALLBACK = function(handle: GFL_HANDLE; buffer: Pointer; size: GFL_UINT32): GFL_UINT32; stdcall;
  GFL_TELL_CALLBACK = function(handle: GFL_HANDLE): GFL_UINT32; stdcall;
  GFL_SEEK_CALLBACK = function(handle: GFL_HANDLE; offset: GFL_INT32; origin: GFL_INT32): GFL_UINT32; stdcall;
  GFL_WRITE_CALLBACK = function(handle: GFL_HANDLE; buffer: Pointer; size: GFL_UINT32): GFL_UINT32; stdcall;

type TGFL_LoadCallbacks = record
    Read: GFL_READ_CALLBACK;
    Tell: GFL_TELL_CALLBACK;
    Seek: GFL_SEEK_CALLBACK;
  end;

type TGFL_SaveCallbacks = record
    Write: GFL_WRITE_CALLBACK;
    Tell: GFL_TELL_CALLBACK;
    Seek: GFL_SEEK_CALLBACK;
  end;

// LOAD_PARAMS Flags
const GFL_LOAD_SKIP_ALPHA = $0001;
const GFL_LOAD_IGNORE_READ_ERROR = $0002;
const GFL_LOAD_BY_EXTENSION_ONLY = $0004;
const GFL_LOAD_READ_ALL_COMMENT = $0008;
const GFL_LOAD_FORCE_COLOR_MODEL = $0010;
const GFL_LOAD_PREVIEW_NO_CANVAS_RESIZE = $0020;
const GFL_LOAD_BINARY_AS_GREY = $0040;
const GFL_LOAD_ORIGINAL_COLORMODEL = $0080;
const GFL_LOAD_ONLY_FIRST_FRAME = $0100;
const GFL_LOAD_ORIGINAL_DEPTH = $0200;
const GFL_LOAD_METADATA = $0400;
const GFL_LOAD_COMMENT = $0800;
const GFL_LOAD_HIGH_QUALITY_THUMBNAIL = $1000;

// LOAD_PARAMS
type PGFL_LOAD_PARAMS = ^TGFL_LOAD_PARAMS;
  TGFL_LOAD_PARAMS = record
    Flags: GFL_UINT32;
    FormatIndex: GFL_INT32; // -1 for automatic recognition
    ImageWanted: GFL_INT32; // for multi-page or animated file
    Origin: GFL_ORIGIN; // default: GFL_TOP_LEFT
    ColorModel: GFL_BITMAP_TYPE; // 24/32 bits picture, GFL_RGB/GFL_RGBA (default), GFL_BGR/GFL_ABGR
    LinePadding: GFL_UINT32; // 1, 2, 4, ...
    DefaultAlpha: GFL_UINT8;
    Reserved1: GFL_UINT8;
    Reserved2: GFL_UINT16;
         // for RAW/YUV
    Width: GFL_INT32;
    Height: GFL_INT32;
    Offset: GFL_UINT32;
         // for RAW
    ChannelOrder: GFL_CORDER;
    ChannelType: GFL_CTYPE;
          // for PCD
    PcdBase: GFL_UINT16; // PCD -> 2:768x576, 1:384x288, 0:192x144

   // For Eps
    EpsDpi: GFL_UINT16;
    EpsWidth: GFL_INT32;
    EpsHeight: GFL_INT32;

         // For Dpx, Cineon
    LutType: GFL_LUT_TYPE; // GFL_LUT_TO8BITS, GFL_LUT_TO8BITS, GFL_LUT_TO8BITS
	Reserved3 : GFL_UINT16; 
    LutData: PGFL_UINT16; // RRRR.../GGGG..../BBBB.....
    LutFilename: PChar;

         // Own callback
    Callbacks: TGFL_LoadCallbacks;
  end;


// SAVE_PARAMS
// support of GFL_BITMAP ChannelTypes: GFL_RGB + GFL_RGBA + GFL_BGR
// support of GFL_BITMAP OriginTypes: GFL_TOP_LEFT + GFL_BOTTOM_LEFT

const GFL_SAVE_REPLACE_EXTENSION = $0001;
const GFL_SAVE_WANT_FILENAME = $0002;
const GFL_SAVE_ANYWAY = $0004;

type PGFL_SAVE_PARAMS = ^TGFL_SAVE_PARAMS;
  TGFL_SAVE_PARAMS = record
    Flags: GFL_UINT32;
    FormatIndex: GFL_INT32;

    Compression: GFL_COMPRESSION;
    Quality: GFL_INT16; // Jpeg + Wic + Fpx
    CompressionLevel: GFL_INT16; // Png
    Interlaced: GFL_BOOL; // Gif
    Progressive: GFL_BOOL; // Jpeg
    OptimizeHuffmanTable: GFL_BOOL; // Jpeg
    InAscii: GFL_BOOL; // PPM

         // For Dpx, Cineon
    LutType: GFL_LUT_TYPE; // GFL_LUT_TO8BITS, GFL_LUT_TO8BITS, GFL_LUT_TO8BITS
	Reserved3 : GFL_UINT16;
    LutData: PGFL_UINT16; // RRRR.../GGGG..../BBBB.....
    LutFilename: PChar;

         // For RAW/YUV
    Offset: GFL_UINT32;
    ChannelOrder: GFL_CORDER;
    ChannelType: GFL_CTYPE;
         // Own callback
    Callbacks: TGFL_SaveCallbacks;
  end;

// Color model
type GFL_COLORMODEL = GFL_UINT16;
const GFL_CM_RGB = 0;
const GFL_CM_GREY = 1;
const GFL_CM_CMY = 2;
const GFL_CM_CMYK = 3;
const GFL_CM_YCBCR = 4;
const GFL_CM_YUV16 = 5;
const GFL_CM_LAB = 6;
const GFL_CM_LOGLUV = 7;
const GFL_CM_LOGL = 8;

// FILE_INFORMATION
type PGFL_FILE_INFORMATION = ^TGFL_FILE_INFORMATION;
  TGFL_FILE_INFORMATION = record
    BType: GFL_BITMAP_TYPE;
    Origin: GFL_ORIGIN;
    Width: GFL_INT32;
    Height: GFL_INT32;
    FormatIndex: GFL_INT32;
    FormatName: array[0..7] of char;
    Description: array[0..63] of char;
    Xdpi: GFL_UINT16;
    Ydpi: GFL_UINT16;
    BitsPerPlane: GFL_UINT16;
    NumberOfPlanes: GFL_UINT16;
    BytesPerPlane: GFL_UINT32;
    NumberOfImages: GFL_INT32;
    FileSize: GFL_UINT32;
    ColorModel: GFL_COLORMODEL;
    Compression: GFL_COMPRESSION;
    CompressionDescription: array[0..63] of char;
	XOffset: GFL_INT32;
	YOffset: GFL_INT32;
  end;

const GFL_READ = $01;
const GFL_WRITE = $02;

// FORMAT_INFORMATION
type PGFL_FORMAT_INFORMATION = ^TGFL_FORMAT_INFORMATION;
  TGFL_FORMAT_INFORMATION = record
    Index: GFL_INT32;
    Name: array[0..7] of char;
    Description: array[0..63] of char;
    Status: GFL_UINT32;
    NumberOfExtension: GFL_UINT32;
    Extension: array[0..15, 0..7] of char;
  end;


// EXIF
const
  EXIF_MAIN_IFD             = 0;
  EXIF_IFD_0                = 2;
  EXIF_INTEROPERABILITY_IFD = 1;
  EXIF_IFD_THUMBNAIL        = 3;
  EXIF_GPS_IFD              = 3;
  EXIF_MAKERNOTE_IFD        = 3;

type
  PGFL_EXIF_ENTRY = ^TGFL_EXIF_ENTRY;
  TGFL_EXIF_ENTRY = record
    Flag: GFL_UINT32;
    Tag: GFL_UINT32;
    Name: PChar;
    Value: PChar;
  end;

  PGFL_EXIF_DATA = ^TGFL_EXIF_DATA;
  TGFL_EXIF_DATA = record
    ItemsList: PGFL_EXIF_ENTRY;
    NumberOfItems: GFL_UINT32;
  end;

//---------------------------------------------------------------------------------------------------
// functions in LibGflxxx.dll
//---------------------------------------------------------------------------------------------------
// Common Memory Handling
function gflMemoryAlloc(size: GFL_UINT32): Pointer; stdcall;
function gflMemoryRealloc(var Ptr: Pointer; size: GFL_UINT32): Pointer; stdcall;
procedure gflMemoryFree(var Ptr: Pointer); stdcall;

// Version Info
function gflGetVersion: PChar; stdcall;
function gflGetVersionOfLibformat: PChar; stdcall;
function gflGetErrorString(error: GFL_ERROR): PChar; stdcall;

// Initialization
function gflLibraryInit: GFL_ERROR; stdcall;
function gflLibraryInitEx(alloc_callback: GFL_ALLOC_CALLBACK;
  realloc_callback: GFL_REALLOC_CALLBACK;
  free_callback: GFL_FREE_CALLBACK;
  user_parms: Pointer): GFL_ERROR; stdcall;
procedure gflLibraryExit; stdcall;
procedure gflEnableLZW(value: GFL_BOOL); stdcall;
procedure gflSetPluginsPathname(const pathname: PChar); stdcall;

// Infos of supported Formats
function gflGetNumberOfFormat: GFL_INT32; stdcall;
function gflGetFormatIndexByName(const name: PChar): GFL_INT32; stdcall;
function gflGetFormatNameByIndex(index: GFL_INT32): PChar; stdcall;
function gflFormatIsSupported(const name: PChar): GFL_BOOL; stdcall;
function gflFormatIsWritableByIndex(index: GFL_INT32): GFL_BOOL; stdcall;
function gflFormatIsWritableByName(const name: PChar): GFL_BOOL; stdcall;
function gflFormatIsReadableByIndex(index: GFL_INT32): GFL_BOOL; stdcall;
function gflFormatIsReadableByName(const name: PChar): GFL_BOOL; stdcall;
function gflGetDefaultFormatSuffixByIndex(index: GFL_INT32): PChar; stdcall;
function gflGetDefaultFormatSuffixByName(const name: PChar): PChar; stdcall;
function gflGetFormatDescriptionByIndex(index: GFL_INT32): PChar; stdcall;
function gflGetFormatDescriptionByName(const name: PChar): PChar; stdcall;
function gflGetFormatInformationByName(const name: PChar;
  var info: TGFL_FORMAT_INFORMATION): GFL_ERROR; stdcall;
function gflGetFormatInformationByIndex(index: GFL_INT32;
  var info: TGFL_FORMAT_INFORMATION): GFL_ERROR; stdcall;

function gflGetLabelForColorModel(color_model: GFL_COLORMODEL): PChar; stdcall;
function gflGetFileInformation(const filename: PChar;
  index: GFL_INT32;
  var info: TGFL_FILE_INFORMATION): GFL_ERROR; stdcall;
procedure gflFreeFileInformation(var info: TGFL_FILE_INFORMATION); stdcall;


// Loading and Saving
procedure gflGetDefaultLoadParams(var params: TGFL_LOAD_PARAMS); stdcall;
function gflLoadBitmap(const filename: PChar;
  var bitmap: PGFL_BITMAP;
  var params: TGFL_LOAD_PARAMS;
  var info: TGFL_FILE_INFORMATION): GFL_ERROR; stdcall;
function gflLoadBitmapFromHandle(handle: GFL_HANDLE;
  var bitmap: PGFL_BITMAP;
  var params: TGFL_LOAD_PARAMS;
  var info: TGFL_FILE_INFORMATION): GFL_ERROR; stdcall;

procedure gflGetDefaultPreviewParams(var params: TGFL_LOAD_PARAMS); stdcall;
function gflLoadThumbnail(const filename: PChar;
  width, height: GFL_INT32;
  var bitmap: PGFL_BITMAP;
  var params: TGFL_LOAD_PARAMS;
  var info: TGFL_FILE_INFORMATION): GFL_ERROR; stdcall;
function gflLoadThumbnailFromHandle(handle: GFL_HANDLE;
  width, height: GFL_INT32;
  var bitmap: PGFL_BITMAP;
  var params: TGFL_LOAD_PARAMS;
  var info: TGFL_FILE_INFORMATION): GFL_ERROR; stdcall;

procedure gflGetDefaultSaveParams(var params: TGFL_SAVE_PARAMS); stdcall;
function gflSaveBitmap(filename: PChar;
  var bitmap: TGFL_BITMAP;
  var params: TGFL_SAVE_PARAMS): GFL_ERROR; stdcall;
function gflSaveBitmapIntoHandle(handle: GFL_HANDLE;
  var bitmap: TGFL_BITMAP;
  var params: TGFL_SAVE_PARAMS): GFL_ERROR; stdcall;

// Bitmap Memory Handling
function gflAllockBitmap(BType: GFL_BITMAP_TYPE;
  width, height, line_padding: GFL_INT32;
  var color: PGFL_COLOR): PGFL_BITMAP; stdcall;

procedure gflFreeBitmap(bitmap: PGFL_BITMAP); stdcall;
procedure gflFreeBitmapData(bitmap: PGFL_BITMAP); stdcall;

function gflCloneBitmap(bitmap: PGFL_BITMAP): PGFL_BITMAP; stdcall;


// Multi-page file
type GFL_FILE_HANDLE = Pointer;

function gflFileCreate(var handle: GFL_FILE_HANDLE;
  filename: PChar;
  image_count: GFL_UINT32;
  var params: TGFL_SAVE_PARAMS): GFL_ERROR; stdcall;
function gflFileAddPicture(handle: GFL_FILE_HANDLE;
  bitmap: PGFL_BITMAP): GFL_ERROR; stdcall;
procedure gflFileClose(handle: GFL_FILE_HANDLE); stdcall;

// Bitmap modifiers
const GFL_RESIZE_QUICK = 0;
const GFL_RESIZE_BILINEAR = 1;
function gflResize(src: PGFL_BITMAP;
  dst: PPGFL_BITMAP;
  width, height: GFL_INT32;
  method, flags: GFL_UINT32): GFL_ERROR; stdcall;


const GFL_MODE_TO_BINARY = 1;
const GFL_MODE_TO_4GREY = 2;
const GFL_MODE_TO_8GREY = 3;
const GFL_MODE_TO_16GREY = 4;
const GFL_MODE_TO_32GREY = 5;
const GFL_MODE_TO_64GREY = 6;
const GFL_MODE_TO_128GREY = 7;
const GFL_MODE_TO_216GREY = 8;
const GFL_MODE_TO_256GREY = 9;
const GFL_MODE_TO_8COLORS = 12;
const GFL_MODE_TO_16COLORS = 13;
const GFL_MODE_TO_32COLORS = 14;
const GFL_MODE_TO_64COLORS = 15;
const GFL_MODE_TO_128COLORS = 16;
const GFL_MODE_TO_216COLORS = 17;
const GFL_MODE_TO_256COLORS = 18;
const GFL_MODE_TO_RGB = 19;
const GFL_MODE_TO_RGBA = 20;
const GFL_MODE_TO_BGR = 21;
const GFL_MODE_TO_ABGR = 22;
const GFL_MODE_TO_BGRA = 23;
const GFL_MODE_TO_ARGB = 24;

const GFL_MODE_TO_TRUECOLORS = GFL_MODE_TO_RGB; // For compatibility

type GFL_MODE = GFL_UINT16;
const GFL_MODE_NO_DITHER = 0;
const GFL_MODE_PATTERN_DITHER = 1;
const GFL_MODE_HALTONE45_DITHER = 2; // Only with GFL_MODE_TO_BINARY
const GFL_MODE_HALTONE90_DITHER = 3; // Only with GFL_MODE_TO_BINARY
const GFL_MODE_ADAPTIVE = 4;
const GFL_MODE_FLOYD_STEINBERG = 5; // Only with GFL_MODE_TO_BINARY

type GFL_MODE_PARAMS = GFL_UINT16;
function gflChangeColorDepth(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  mode: GFL_MODE; params: GFL_MODE_PARAMS): GFL_ERROR; stdcall;

type PGFL_RECT = ^TGFL_RECT;
  TGFL_RECT = record
    x, y,
    w, h: GFL_INT32;
  end;

function gflFlipVertical(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflFlipHorizontal(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflCrop(src: PGFL_BITMAP; dst: PPGFL_BITMAP; var rect: TGFL_RECT): GFL_ERROR; stdcall;
function gflAutoCrop(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  var color: PGFL_COLOR; tolerance: GFL_INT32): GFL_ERROR; stdcall;

const GFL_CANVASRESIZE_TOPLEFT     = 0;
const GFL_CANVASRESIZE_TOP         = 1;
const GFL_CANVASRESIZE_TOPRIGHT    = 2;
const GFL_CANVASRESIZE_LEFT        = 3;
const GFL_CANVASRESIZE_CENTER      = 4;
const GFL_CANVASRESIZE_RIGHT       = 5;
const GFL_CANVASRESIZE_BOTTOMLEFT  = 6;
const GFL_CANVASRESIZE_BOTTOM      = 7;
const GFL_CANVASRESIZE_BOTTOMRIGHT = 8;

type GFL_CANVASRESIZE = GFL_UINT32;

function gflResizeCanvas(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  width, height: GFL_INT32; mode: GFL_CANVASRESIZE;
  var color: TGFL_COLOR): GFL_ERROR; stdcall;

function gflRotate(src: PGFL_BITMAP; dst: PPGFL_BITMAP; angle: GFL_INT32;
  var color: TGFL_COLOR): GFL_ERROR; stdcall;
function gflRotateFine(src: PGFL_BITMAP; dst: PPGFL_BITMAP; angle: double): GFL_ERROR; stdcall;

function gflBitblt(src: PGFL_BITMAP; rect: PGFL_RECT;
  dst: PGFL_BITMAP; x_dest, y_dest: GFL_INT32): GFL_ERROR; stdcall;

function gflGetColorAt(src: PGFL_BITMAP; x, y: GFL_INT32; var color: PGFL_COLOR): GFL_ERROR; stdcall;
function gflSetColorAt(src: PGFL_BITMAP; x, y: GFL_INT32; var color: PGFL_COLOR): GFL_ERROR; stdcall;
function gflReplaceColor(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  color, new_color: PGFL_COLOR; tolerance: GFL_INT32): GFL_ERROR; stdcall;

//------------------------------------------------------------------------------------------------------------------
// functions in LibGflExxx.dll
//------------------------------------------------------------------------------------------------------------------
function gflGetNumberOfColorsUsed(src: PGFL_BITMAP): GFL_UINT32; stdcall;

function gflNegative(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflBrightness(src: PGFL_BITMAP; dst: PPGFL_BITMAP; brightness: GFL_INT32): GFL_ERROR; stdcall;
function gflContrast(src: PGFL_BITMAP; dst: PPGFL_BITMAP; contrast: GFL_INT32): GFL_ERROR; stdcall;
function gflGamma(src: PGFL_BITMAP; dst: PPGFL_BITMAP; gamma: double): GFL_ERROR; stdcall;
function gflLogCorrection(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflNormalize(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEqualize(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEqualizeOnLuminance(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflBalance(src: PGFL_BITMAP; dst: PPGFL_BITMAP; var color: TGFL_COLOR): GFL_ERROR; stdcall;
function gflAdjust(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  brightness: GFL_INT32; contrast: GFL_INT32; gamma: double): GFL_ERROR; stdcall;
function gflAdjustHLS(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  hue: GFL_INT32; lightness: GFL_INT32; saturation: GFL_INT32): GFL_ERROR; stdcall;

function gflAverage(src: PGFL_BITMAP; dst: PPGFL_BITMAP; filter_size: GFL_INT32): GFL_ERROR; stdcall;
function gflSoften(src: PGFL_BITMAP; dst: PPGFL_BITMAP; percentage: GFL_INT32): GFL_ERROR; stdcall;
function gflBlur(src: PGFL_BITMAP; dst: PPGFL_BITMAP; percentage: GFL_INT32): GFL_ERROR; stdcall;
function gflGaussianBlur(src: PGFL_BITMAP; dst: PPGFL_BITMAP; filter_size: GFL_INT32): GFL_ERROR; stdcall;
function gflMaximum(src: PGFL_BITMAP; dst: PPGFL_BITMAP; filter_size: GFL_INT32): GFL_ERROR; stdcall;
function gflMinimum(src: PGFL_BITMAP; dst: PPGFL_BITMAP; filter_size: GFL_INT32): GFL_ERROR; stdcall;
function gflMedianBox(src: PGFL_BITMAP; dst: PPGFL_BITMAP; filter_size: GFL_INT32): GFL_ERROR; stdcall;
function gflMedianCross(src: PGFL_BITMAP; dst: PPGFL_BITMAP; filter_size: GFL_INT32): GFL_ERROR; stdcall;
function gflSharpen(src: PGFL_BITMAP; dst: PPGFL_BITMAP; percentage: GFL_INT32): GFL_ERROR; stdcall;

function gflEnhanceDetail(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEnhanceFocus(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflFocusRestoration(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEdgeDetectLight(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEdgeDetectMedium(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEdgeDetectHeavy(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEmboss(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflEmbossMore(src: PGFL_BITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

function gflSepia(src: PGFL_BITMAP; dst: PPGFL_BITMAP; percent: GFL_INT32): GFL_ERROR; stdcall;
function gflSepiaExt(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  percent: GFL_INT32; var color: PGFL_COLOR): GFL_ERROR; stdcall;

// CONVOLVE
type PGFL_FILTER = ^TGFL_FILTER;
  TGFL_FILTER = record
    Size: GFL_INT16;
    Matrix: array[0..15, 0..7] of GFL_INT16;
    Divisor: GFL_INT16;
    Bias: GFL_INT16;
  end;

function gflConvolve(src: PGFL_BITMAP; dst: PPGFL_BITMAP;
  var color: PGFL_FILTER): GFL_ERROR; stdcall;

// SWAP COLORS
type GFL_SWAPCOLORS_MODE = GFL_UINT16;
const GFL_SWAPCOLORS_RBG = 0;
const GFL_SWAPCOLORS_BGR = 1;
const GFL_SWAPCOLORS_BRG = 2;
const GFL_SWAPCOLORS_GRB = 3;
const GFL_SWAPCOLORS_GBR = 4;

function gflSwapColors(src: PGFL_BITMAP; dst: PPGFL_BITMAP; mode: GFL_SWAPCOLORS_MODE): GFL_ERROR; stdcall;

// JPEG LOSSLESS
type GFL_LOSSLESS_TRANSFORM = GFL_UINT16;
const GFL_LOSSLESS_TRANSFORM_NONE = 0;
const GFL_LOSSLESS_TRANSFORM_ROTATE90 = 1;
const GFL_LOSSLESS_TRANSFORM_ROTATE180 = 2;
const GFL_LOSSLESS_TRANSFORM_ROTATE270 = 3;
const GFL_LOSSLESS_TRANSFORM_VERTICAL_FLIP = 4;
const GFL_LOSSLESS_TRANSFORM_HORIZONTAL_FLIP = 5;

function gflJpegLosslessTransform(filename: PChar; transform: GFL_LOSSLESS_TRANSFORM): GFL_ERROR; stdcall;

{$IFDEF MSWINDOWS}

function gflConvertBitmapIntoDIB(src: PGFL_BITMAP; var hDIB: THANDLE): GFL_ERROR; stdcall;
function gflConvertBitmapIntoDDB(src: PGFL_BITMAP; var hBitmap: HBITMAP): GFL_ERROR; stdcall;
function gflConvertDIBIntoBitmap(hDIB: THANDLE; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflConvertDDBIntoBitmap(hBitmap: HBITMAP; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

function gflLoadBitmapIntoDIB(filename: PChar;
  var hDIB: THANDLE;
  var params: TGFL_LOAD_PARAMS;
  var info: TGFL_FILE_INFORMATION): GFL_ERROR; stdcall;
function gflLoadBitmapIntoDDB(filename: PChar;
  var hBitmap: HBITMAP;
  var params: TGFL_LOAD_PARAMS;
  var info: TGFL_FILE_INFORMATION): GFL_ERROR; stdcall;

function gflAddText(src: PGFL_BITMAP;
  text: PChar;
  font_name: PChar;
  x: GFL_INT32;
  y: GFL_INT32;
  font_size: GFL_INT32;
  orientation: GFL_INT32;
  italic: GFL_BOOL;
  bold: GFL_BOOL;
  strike_out: GFL_BOOL;
  underline: GFL_BOOL;
  antialias: GFL_BOOL;
  var color: PGFL_COLOR): GFL_ERROR; stdcall;

function gflImportFromClipboard(dst: PPGFL_BITMAP): GFL_ERROR; stdcall;
function gflExportIntoClipboard(dst: PGFL_BITMAP): GFL_ERROR; stdcall;
function gflImportFromHWND(hBitmap: HWND; rect: PGFL_RECT;
  dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

type PGFL_POINT = ^TGFL_POINT;
  TGFL_POINT = record
    x, y: GFL_INT32;
  end;

// LINE STYLE
type GFL_LINE_STYLE = GFL_UINT32;
const GFL_LINE_STYLE_SOLID = 0;
const GFL_LINE_STYLE_DASH = 1;
const GFL_LINE_STYLE_DOT = 2;
const GFL_LINE_STYLE_DASHDOT = 3;
const GFL_LINE_STYLE_DASHDOTDOT = 4;

function gflDrawLineColor(src: PGFL_BITMAP; x0, y0, x1, y1: GFL_INT32;
  line_width: GFL_UINT32; var line_color: PGFL_COLOR;
  dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

function gflDrawPolylineColor(src: PGFL_BITMAP; var points: PGFL_POINT; num_points: GFL_INT32;
  line_width: GFL_UINT32; var line_color: PGFL_COLOR; line_style: GFL_LINE_STYLE; 
  dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

function gflDrawPolygonColor(src: PGFL_BITMAP; var points: PGFL_POINT; num_points: GFL_INT32;
  var fill_color: PGFL_COLOR;
  line_width: GFL_UINT32; var line_color: PGFL_COLOR; line_style: GFL_LINE_STYLE; 
  dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

function gflDrawRectangleColor(src: PGFL_BITMAP; x, y, width, height: GFL_INT32;
  fill_color: PGFL_COLOR; line_width: GFL_UINT32; line_color: PGFL_COLOR;
  line_style: GFL_LINE_STYLE; dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

function gflDrawPointColor(src: PGFL_BITMAP; x0, y0, width, height: GFL_INT32;
  line_width: GFL_UINT32; var line_color: PGFL_COLOR; line_style: GFL_LINE_STYLE; 
  dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

function gflDrawCircleColor(src: PGFL_BITMAP; x, y, radius: GFL_INT32;
  var fill_color: PGFL_COLOR;
  line_width: GFL_UINT32; var line_color: PGFL_COLOR; line_style: GFL_LINE_STYLE; 
  dst: PPGFL_BITMAP): GFL_ERROR; stdcall;

{$ENDIF}

// EXIF
function gflBitmapHasEXIF(bitmap: PGFL_BITMAP): GFL_BOOL; stdcall;
procedure gflSetComment(bitmap: PGFL_BITMAP; comment: PChar); stdcall;
//gflSetComment
//gflBitmapRemoveMetadata
//gflBitmapRemoveEXIFThumbnail
function gflBitmapGetEXIF(bitmap: PGFL_BITMAP): PGFL_EXIF_DATA; stdcall;
procedure gflFreeEXIF(exif_data: PGFL_EXIF_DATA); stdcall;
//gflBitmapHasIPTC
//gflBitmapGetIPTC
//gflFreeIPTC


//******************************************************************************
implementation
//******************************************************************************
{$IFDEF MSWINDOWS}
const GflDLL = 'libgfl201.dll'; // DLL filename
const GfleDLL = 'libgfle201.dll'; // DLL filename
{$ENDIF}

{$IFDEF LINUX}
const GflDLL = 'libgfl.so.2.01'; // DLL filename
const GfleDLL = 'libgfle.so.2.01'; // DLL filename
{$ENDIF}

//------------------------------------------------------------------------------
// functions in LibGflxxx.dll
//------------------------------------------------------------------------------
function gflMemoryAlloc; external GflDLL;
function gflMemoryRealloc; external GflDLL;
procedure gflMemoryFree; external GflDLL;

function gflGetVersion; external GflDLL;
function gflGetVersionOfLibformat; external GflDLL;

function gflLibraryInit; external GflDLL;
function gflLibraryInitEx; external GflDLL;
procedure gflLibraryExit; external GflDLL;
procedure gflEnableLZW; external GflDLL;
procedure gflSetPluginsPathname; external GflDLL;

function gflGetNumberOfFormat; external GflDLL;
function gflGetFormatIndexByName; external GflDLL;
function gflGetFormatNameByIndex; external GflDLL;
function gflFormatIsSupported; external GflDLL;
function gflFormatIsWritableByIndex; external GflDLL;
function gflFormatIsWritableByName; external GflDLL;
function gflFormatIsReadableByIndex; external GflDLL;
function gflFormatIsReadableByName; external GflDLL;

function gflGetDefaultFormatSuffixByIndex; external GflDLL;
function gflGetDefaultFormatSuffixByName; external GflDLL;
function gflGetFormatDescriptionByIndex; external GflDLL;
function gflGetFormatDescriptionByName; external GflDLL;
function gflGetFormatInformationByName; external GflDLL;
function gflGetFormatInformationByIndex; external GflDLL;

function gflGetErrorString; external GflDLL;
function gflGetLabelForColorModel; external GflDLL;
function gflGetFileInformation; external GflDLL;
procedure gflFreeFileInformation; external GflDLL;

procedure gflGetDefaultLoadParams; external GflDLL;
function gflLoadBitmap; external GflDLL;
function gflLoadBitmapFromHandle; external GflDLL;
procedure gflGetDefaultPreviewParams; external GflDLL;
function gflLoadThumbnail; external GflDLL;
function gflLoadThumbnailFromHandle; external GflDLL;
procedure gflGetDefaultSaveParams; external GflDLL;
function gflSaveBitmap; external GflDLL;
function gflSaveBitmapIntoHandle; external GflDLL;

function gflAllockBitmap; external GflDLL;
procedure gflFreeBitmap; external GflDLL;
procedure gflFreeBitmapData; external GflDLL;
function gflCloneBitmap; external GflDLL;

function gflFileCreate; external GflDLL;
function gflFileAddPicture; external GflDLL;
procedure gflFileClose; external GflDLL;

function gflResize; external GflDLL;
function gflChangeColorDepth; external GflDLL;

function gflFlipVertical; external GflDLL;
function gflFlipHorizontal; external GflDLL;
function gflCrop; external GflDLL;
function gflAutoCrop; external GflDLL;
function gflResizeCanvas; external GflDLL;
function gflRotate; external GflDLL;
function gflRotateFine; external GflDLL;
function gflBitblt; external GflDLL;
procedure gflMerge; external GflDLL;

function gflGetColorAt; external GflDLL;
function gflSetColorAt; external GflDLL;
function gflReplaceColor; external GflDLL;

//------------------------------------------------------------------------------
// functions in LibGflExxx.dll
//------------------------------------------------------------------------------
function gflGetNumberOfColorsUsed; external GfleDLL;
function gflNegative; external GfleDLL;
function gflBrightness; external GfleDLL;
function gflContrast; external GfleDLL;
function gflGamma; external GfleDLL;
function gflLogCorrection; external GfleDLL;
function gflNormalize; external GfleDLL;
function gflEqualize; external GfleDLL;
function gflEqualizeOnLuminance; external GfleDLL;
function gflBalance; external GfleDLL;
function gflAdjust; external GfleDLL;
function gflAdjustHLS; external GfleDLL;

function gflAverage; external GfleDLL;
function gflSoften; external GfleDLL;
function gflBlur; external GfleDLL;
function gflGaussianBlur; external GfleDLL;
function gflMaximum; external GfleDLL;
function gflMinimum; external GfleDLL;
function gflMedianBox; external GfleDLL;
function gflMedianCross; external GfleDLL;
function gflSharpen; external GfleDLL;

function gflEnhanceDetail; external GfleDLL;
function gflEnhanceFocus; external GfleDLL;
function gflFocusRestoration; external GfleDLL;
function gflEdgeDetectLight; external GfleDLL;
function gflEdgeDetectMedium; external GfleDLL;
function gflEdgeDetectHeavy; external GfleDLL;
function gflEmboss; external GfleDLL;
function gflEmbossMore; external GfleDLL;

function gflSepia; external GfleDLL;
function gflSepiaExt; external GfleDLL;

function gflConvolve; external GfleDLL;

function gflSwapColors; external GfleDLL;

function gflJpegLosslessTransform; external GfleDLL;

{$IFDEF MSWINDOWS}

function gflConvertBitmapIntoDIB; external GfleDLL;
function gflConvertBitmapIntoDDB; external GfleDLL;
function gflConvertDIBIntoBitmap; external GfleDLL;
function gflConvertDDBIntoBitmap; external GfleDLL;

function gflLoadBitmapIntoDIB; external GfleDLL;
function gflLoadBitmapIntoDDB; external GfleDLL;
function gflAddText; external GfleDLL;

function gflImportFromClipboard; external GfleDLL;
function gflExportIntoClipboard; external GfleDLL;
function gflImportFromHWND; external GfleDLL;

function gflDrawLineColor; external GfleDLL;
function gflDrawPolylineColor; external GfleDLL;
function gflDrawPolygonColor; external GfleDLL;
function gflDrawRectangleColor; external GfleDLL;
function gflDrawPointColor; external GfleDLL;
function gflDrawCircleColor; external GfleDLL;

{$ENDIF}

// EXIF
function gflBitmapHasEXIF; external GflDLL;
procedure gflSetComment; external GflDLL;
function gflBitmapGetEXIF; external GflDLL;
procedure gflFreeEXIF; external GflDLL;


//******************************************************************************
initialization
  gflLibraryInit;
finalization
  gflLibraryExit;
end.






