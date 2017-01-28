unit SiteStatsDM;

interface

uses
  Classes, DB, DBClient, SOAPConn, PluginManagerIntf, IdIntercept,
  IdLogBase, IdLogFile, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, xmldom, XMLIntf, msxmldom, XMLDoc,
  DataBaseIntf;

type
  TDM = class(TDataModule, IDataBase)
    stsummary: TClientDataSet;
    ds_stsummary: TDataSource;
    SoapConnection: TSoapConnection;
    HTTP: TIdHTTP;
    HTTPLogFile: TIdLogFile;
    stsummaryname: TStringField;
    stsummarytod: TIntegerField;
    stsummaryyes: TIntegerField;
    stsummaryweek: TIntegerField;
    stsummarymonth: TIntegerField;
    stsummaryyear: TIntegerField;
    stsummarytotal: TIntegerField;
    stvisits: TClientDataSet;
    ds_stvisits: TDataSource;
    stvisitshour: TIntegerField;
    stvisitsvisits: TIntegerField;
    stpages: TClientDataSet;
    ds_stpages: TDataSource;
    stpagesquant: TIntegerField;
    stnav: TClientDataSet;
    ds_stnav: TDataSource;
    stpagesname: TStringField;
    stnavname: TStringField;
    stnavquant: TStringField;
    stpagestitle: TStringField;
    stnavtitle: TStringField;
    XMLDocument: TXMLDocument;
    stpagesper: TFloatField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure SoapConnectionAfterExecute(const MethodName: String;
      SOAPResponse: TStream);
  private
    FPluginManager: IPluginManager;
    FPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure OpenDataSet(const DataSet: TClientDataSet; const Prefix: String);
  public
    procedure SetProviderName(Dataset:TClientDataSet;prefix:string);
    procedure Open;
    procedure Close;
    procedure ReOpenDataSet(const DataSet: TClientDataSet);
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    property Path: String read FPath write FPath;
  end;

var
  DM: TDM;

implementation

uses SettingsIntf, EncdDecd, ZLIBEX;

{$R *.dfm}
// local http://192.168.0.7/cfg/soap_server.php
// remote http://atlanta.novline.ru/soap_server.php
{ TDM }
procedure TDM.SetProviderName(Dataset:TClientDataSet;prefix:string);
begin
  DataSet.ProviderName := Prefix + DataSet.ProviderName;
end;

procedure TDM.Close;
begin
  stsummary.Close;
end;

procedure TDM.Open;
var
  Settings: ISettings;
begin
  if FPluginManager.GetPlugin(ISettings, Settings) then
  begin
    Settings.SetupSoapConnection(SoapConnection);
    SetProviderName(TClientDataset(ds_stsummary.DataSet),Settings.DataBasePrefix);
    SetProviderName(TClientDataset(ds_stvisits.DataSet),Settings.DataBasePrefix);
    SetProviderName(TClientDataset(ds_stpages.DataSet),Settings.DataBasePrefix);
    SetProviderName(TClientDataset(ds_stnav.DataSet),Settings.DataBasePrefix);
  end;
end;

procedure TDM.ReOpenDataSet(const DataSet: TClientDataSet);
var
  Settings: ISettings;
begin
  if FPluginManager.GetPlugin(ISettings, Settings) then begin
    DataSet.Close;
    OpenDataSet(DataSet,Settings.DataBasePrefix);
  end;
end;

procedure TDM.OpenDataSet(const DataSet: TClientDataSet; const Prefix: String);
begin
//  DataSet.ProviderName := Prefix + DataSet.ProviderName;
  DataSet.FileName := FPath + DataSet.ProviderName + '.xml';
  DataSet.Open;
//  DataSet.SaveToFile();
end;

procedure TDM.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Close;
end;

procedure TDM.SoapConnectionAfterExecute(const MethodName: String;
  SOAPResponse: TStream);
var
  s: String;
begin
  if MethodName = 'AS_ApplyUpdates' then Exit;
  SOAPResponse.Position := 0;
  XMLDocument.LoadFromStream(SOAPResponse);
  s := XMLDocument.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[0].Text;
  s := DecodeString(s);
  s := ZDecompressStr(s);
  s := EncodeString(s);
  XMLDocument.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[0].Text := s;
  SOAPResponse.Size := 0;
  XMLDocument.SaveToStream(SOAPResponse);
end;

end.
