unit SiteStatsFrm;

interface

uses
  Forms, PluginManagerIntf, Classes, Controls, StdCtrls, cxButtons,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TBSkinPlus, TB2Dock, TB2Toolbar, ActnList, ImgList, TB2Item,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxEdit, DB, cxDBData, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ComCtrls, ExtCtrls,
  TeeProcs, TeEngine, Chart, DbChart, Series, DBClient,
  cxHyperLinkEdit, RzTreeVw, QExport3, QExport3RTF,cxExportGrid4Link,
  QExport3HTML;

type Actions =record
  t:smallint;
  h:string;
  query:string;
  ds:smallint;
  viewIdx:smallint;
  gfx:boolean;
end;

type
  TSiteStatsForm = class(TForm)
    TBSkin: TTBSkin;
    ImageList20: TImageList;
    ActionList: TActionList;
    TBDock1: TTBDock;
    TBToolbar1: TTBToolbar;
    TBControlItem2: TTBControlItem;
    Label1: TLabel;
    TBControlItem3: TTBControlItem;
    cxDateEdit1: TcxDateEdit;
    Panel1: TPanel;
    StatusBar: TStatusBar;
    TBItem1: TTBItem;
    a_Action1: TAction;
    a_Action2: TAction;
    a_Action3: TAction;
    a_Action4: TAction;
    Refresh: TAction;
    cxComboBox1: TcxComboBox;
    TBControlItem1: TTBControlItem;
    bottomPanel: TPanel;
    a_Action5: TAction;
    a_Action6: TAction;
    b_Action1: TAction;
    b_Action2: TAction;
    b_Action3: TAction;
    b_Action4: TAction;
    c_Action1: TAction;
    c_Action2: TAction;
    c_Action3: TAction;
    c_Action4: TAction;
    d_Action1: TAction;
    d_Action2: TAction;
    d_Action3: TAction;
    e_Action1: TAction;
    c_Action5: TAction;
    Splitter1: TSplitter;
    leftPanel: TPanel;
    rzTreeView: TRzCheckTree;
    Splitter3: TSplitter;
    Panel3: TPanel;
    Splitter2: TSplitter;
    Panel4: TPanel;
    TBItem2: TTBItem;
    DoChart: TAction;
    Label2: TLabel;
    b_Action5: TAction;
    d_Action4: TAction;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    ImageList16: TImageList;
    CommonAction: TAction;
    TBControlItem4: TTBControlItem;
    cxComboBox2: TcxComboBox;
    TBDock2: TTBDock;
    DBChart1: TDBChart;
    Series1: TBarSeries;
    TBToolbar2: TTBToolbar;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    cxStyleRepository1: TcxStyleRepository;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxGrid1: TcxGrid;
    tvStat: TcxGridDBTableView;
    tvStatname: TcxGridDBColumn;
    tvStattod: TcxGridDBColumn;
    tvStatyes: TcxGridDBColumn;
    tvStatweek: TcxGridDBColumn;
    tvStatmonth: TcxGridDBColumn;
    tvStatyear: TcxGridDBColumn;
    tvStattotal: TcxGridDBColumn;
    tvPages: TcxGridDBTableView;
    tvPagesDBColumn2: TcxGridDBColumn;
    tvPagesDBColumn1: TcxGridDBColumn;
    tvPagesDBColumn3: TcxGridDBColumn;
    tvPagesDBColumn4: TcxGridDBColumn;
    tvVisits: TcxGridDBTableView;
    tvVisitshour: TcxGridDBColumn;
    tvVisitsvisits: TcxGridDBColumn;
    tvSpecial: TcxGridDBTableView;
    tvSpecialDBColumn1: TcxGridDBColumn;
    tvSpecialDBColumn2: TcxGridDBColumn;
    tvSpecialDBColumn3: TcxGridDBColumn;
    tvTimes: TcxGridDBTableView;
    tvTimesDBColumn1: TcxGridDBColumn;
    tvTimesDBColumn2: TcxGridDBColumn;
    tvTimesDBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ListView1: TListView;
    TBItem5: TTBItem;
    qeRTF: TQExport3RTF;
    DoRTF: TAction;
    tvSearchersDBColumn3: TcxGridDBColumn;
    tvSearchersDBColumn4: TcxGridDBColumn;
    TBItem6: TTBItem;
    cxStyle2: TcxStyle;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure a_Action1Execute(Sender: TObject);
    procedure a_Action2Execute(Sender: TObject);
    procedure RefreshExecute(Sender: TObject);
    procedure rzTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure DoChartExecute(Sender: TObject);
    procedure CommonActionExecute(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure TBItem3Click(Sender: TObject);
    procedure rzTreeViewDblClick(Sender: TObject);
    procedure DoRTFExecute(Sender: TObject);
    procedure rzTreeViewStateChanging(Sender: TObject; Node: TTreeNode;
      NewState: TRzCheckState; var AllowChange: Boolean);
    procedure TBItem6Click(Sender: TObject);
  private
    FPluginManager: IPluginManager;
    FDataPath: String;
    procedure SetPluginManager(const Value: IPluginManager);
    procedure LoadFromResource(const ResName: string; DBChart: TCustomChart);
    procedure SetDataPath(const Value: String);
  public
    y,m,d,fname,axisname,CachedFName:string;
    DateStr:string;
    property PluginManager: IPluginManager read FPluginManager write SetPluginManager;
    function  FindAction(Tag:Smallint):Actions;
    function FindCachedData(Path:string):string;
    Procedure ClearCache(Path:String);
    procedure FillCombo(Idx:integer);
    procedure PrepareYMD;
    procedure RunPhp(Param:String);
    Procedure ResetChart;
    property DataPath: String read FDataPath write SetDataPath;
  end;


function GetMainForm(const APluginManager: IPluginManager;
  const DataPath: String): Integer;

implementation

uses SiteStatsDM,SysUtils,SettingsIntf,teestore,teecomma;

  var AArray:Array[1..21] of Actions =
  ((t:10;h:'Хосты - количество посетителей с уникальным IP-адресом. '+
   'Хиты - количество просмотров страниц с установленным счетчиком, на которых побывали посетители вашего ресурса, исключая перезагрузки. '+
   'Показы - общее количество загрузок ваших страниц, включая перезагрузки.';
   query:'_summary.php?w=%s&y=%s&m=%s&d=%s';ds:0;viewIdx:0;gfx:true),

   (t:11;h:'Количество просмотров страниц с установленным счетчиком, на которых побывали посетители вашего ресурса, исключая перезагрузки. ';
   query:'_visits.php?w=%s&y=%s&m=%s&d=%s';ds:1;viewIdx:2;gfx:true),

   (t:12;h:'Количество посетителей с уникальным IP-адресом.';
   query:'_visits.php?w=%s&y=%s&m=%s&d=%s';ds:1;viewIdx:2;gfx:true),

   (t:13;h:'Количество загрузок ваших страниц, включая перезагрузки.';
   query:'_visits.php?w=%s&y=%s&m=%s&d=%s';ds:1;viewIdx:2;gfx:true),

   (t:14;h:'Количество посетителей, которые использовали один браузер для просмотра Вашего сайта впервые.';
   query:'_visits.php?w=%s&y=%s&m=%s&d=%s';ds:1;viewIdx:2;gfx:true),

   (t:15;h:'Количество посетителей, которые заходили на Ваш сайт через Proxy серверы.';
   query:'_visits.php?w=%s&y=%s&m=%s&d=%s';ds:1;viewIdx:2;gfx:true),

   (t:20;h:'Уровень популярности страниц Вашего сайта';
   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:1;gfx:false),

   (t:21;h:'Страницы вашего сайта, на которые посетители заходят с других сайтов (или по своим закладкам) чаще всего.';
   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:1;gfx:false),

   (t:22;h:'С каких страниц вашего сайта посетители чаще всего уходят.';
   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:1;gfx:false),

   (t:23;h:'Страницы, являющиеся одновременно точками входа и точками выхода, при условии, что более не было просмотренно ни одной страницы сайта.';
   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:1;gfx:false),

   (t:30;h:'Операционные системы, используемые посетителями Вашего сайта.';
   query:'_sys.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:3;gfx:false),

   (t:31;h:'Браузеры, используемые посетителями Вашего сайта.';
   query:'_sys.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:3;gfx:false),

   (t:40;h:'Количество страниц,просмотренное посетителем Вашего сайта за время сессии.';
   query:'_nav.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:3;gfx:false),

   (t:41;h:'Типичное время, проводимое пользователем на сайте';
   query:'_nav.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:3;gfx:false),

   (t:42;h:'Время, проводимое пользователем на сайте в целом.';
   query:'_nav.php?w=%s&y=%s&m=%s&d=%s';ds:3;viewIdx:4;gfx:false),

   (t:50;h:'Отчет по городам.';
   query:'_special.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:6;gfx:false),

   (t:51;h:'Отчет по городам.';
   query:'_special.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:6;gfx:false),

   (t:52;h:'Отчет по IP-адресам.';
   query:'_special.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:3;gfx:false),

   (t:60;h:'С каких ресурсов приходят посетители на ваш сайт.';
   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:7;gfx:false),

   (t:61;h:'С помощью этого отчета вы можете узнать, с каких поисковых систем приходят посетители на ваш сайт, '+
   'а также наиболее популярные слова и фразы, которыми пользуются посетители для поиска вашего ресурса.';
   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:7;gfx:false),

   (t:62;h:'Наиболее популярные слова и фразы, которыми пользуются посетители для поиска вашего ресурса в поисковых системах.';
   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:5;gfx:false)

//   (t:61;h:'Домены, с которых были заходы по ссылкам на Ваш сайт. Домены перечислены в убывающим порядке, согласно числу хитов, зашедших с них.';
//   query:'_pages.php?w=%s&y=%s&m=%s&d=%s';ds:2;viewIdx:3;gfx:false)
   );
   dummyArr:Array[0..30] of integer;
   imgIdxArr:Array[0..30] of integer = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
{$R *.dfm}

function GetMainForm;
var
  Form: TSiteStatsForm;
begin
  Form := TSiteStatsForm.Create(Application);
  try
    Form.DataPath := DataPath;
    Form.PluginManager := APluginManager;
    Result := Form.ShowModal;
    if Result = mrOK then
    begin
    end;
  finally
    Form.Free;
  end;
end;

{ TSiteStatsForm }
function TSiteStatsForm.FindAction(Tag:Smallint):Actions;
var i:integer;
begin
  for i:=0 to length(AArray) do
    if AArray[i].t=Tag then result:=AArray[i];
end;

function TSiteStatsForm.FindCachedData(Path:string):string;
var
  sr: TSearchRec;
  FileAttrs: Integer;
begin
  result:='';
  FileAttrs:=faArchive;
  if FindFirst(Path, FileAttrs, sr) = 0 then result:=sr.Name;
end;

procedure TSiteStatsForm.ClearCache(Path:String);
var
  sr: TSearchRec;
  FileAttrs: Integer;
begin
  FileAttrs:=faArchive;
  if FindFirst(Path, FileAttrs, sr) = 0 then
  begin
    repeat
      if (sr.Attr and FileAttrs) = sr.Attr then DeleteFile(DataPath + sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TSiteStatsForm.FillCombo(Idx:integer);
var i:integer;
    wy,wm,wd:word;
    s:string;
begin
  cxComboBox2.Properties.Items.Clear;
  DecodeDate(cxDateEdit1.Date,wy,wm,wd);
  case idx of
  1:for i:=1 to 12 do begin
      cxComboBox2.Properties.Items.Add(LongMonthNames[i]);
      cxComboBox2.ItemIndex:=wm-1;
    end;
  2:for i:=-1 to 0 do begin
      Str(wy+i,s);
      cxComboBox2.Properties.Items.Add(s);
      cxComboBox2.ItemIndex:=1;
    end;
  end;

end;

procedure TSiteStatsForm.PrepareYMD;
var wy,wm,wd:word;
    s,p:string;
begin
  DecodeDate(cxDateEdit1.Date,wy,wm,wd);
  Str(wy,y);
  Str(wm,m);
  Str(wd,d);
  s:=' за %s';
  case cxComboBox1.ItemIndex of
    0:p:=DateToStr(cxDateEdit1.Date);
    1:begin
        d:='00';
        Str(cxComboBox2.ItemIndex+1,m);
        p:=m + '-' + y;
      end;
    2:begin
        m:='00';d:='00';
        y:=cxComboBox2.Properties.Items[cxComboBox2.ItemIndex];
        p:=y + ' год';
      end;
  end;
  DateStr:=Format(s,[p]);
end;

procedure TSiteStatsForm.RunPhp(Param:String);
var Settings: ISettings;
    s, HttpRoot: String;
begin
  if PluginManager.GetPlugin(ISettings, Settings) then
  begin
//    Settings.GetValue('HttpRoot');
    HttpRoot:=Settings.HttpRoot;
//    s := '%sincludes/%s';
    s := '%s%s';
    s := Format(s, [HttpRoot, Param]);
    DM.HTTP.Get(s);
  end;
end;

Procedure TSiteStatsForm.ResetChart;
var tmpEmpty : TDBChart;
begin
  DBChart1.FreeAllSeries;
  DBChart1.Tools.Clear;
  { Create an empty chart }
  tmpEmpty:=TDBChart.Create(nil);
  try
    tmpEmpty.AllowZoom:=False;
    tmpEmpty.AllowPanning:=pmNone;
    DBChart1.Assign(tmpEmpty);
  finally
    tmpEmpty.Free;
  end;
end;

procedure TSiteStatsForm.SetPluginManager(const Value: IPluginManager);
begin
  FPluginManager := Value;
  DM := TDM.Create(Application);
  DM.PluginManager := FPluginManager;
  DM.Path := FDataPath;
  DM.Open;
end;

procedure TSiteStatsForm.FormDestroy(Sender: TObject);
begin
  ResetChart;
  DM.Free;
end;

procedure TSiteStatsForm.FormCreate(Sender: TObject);
begin
  cxDateEdit1.Date:=TDate(Now);
  cxComboBox1.ItemIndex:=0;
  TBItem2.Checked:=Splitter2.Visible;
  rzTreeView.FullExpand;
end;

procedure TSiteStatsForm.RefreshExecute(Sender: TObject);
var what:string;
    action:Actions;
    DataSource:TDataSource;
    cap,fName:string;
    i,j:integer;
begin
  ListView1.Items.Clear;
  ListView1.Show;
  ListView1.BringToFront;
  Panel4.Hide;
  Splitter2.Hide;
  DoRTF.Enabled:=false;
  j:=0;
  for i:=0 to rzTreeView.Items.Count-1 do
  if (rzTreeView.Items[i].Parent<>nil) then begin
    if (rzTreeView.Items[i].StateIndex = 2) then begin
      ListView1.Items.Add;
      ListView1.Items[j].Caption:=rzTreeView.Items[i].Text;
      dummyArr[j]:=(rzTreeView.Items[i].Parent.Index+1)*10 + rzTreeView.Items[i].Index;
      imgIdxArr[rzTreeView.Items[i].AbsoluteIndex]:=1;
      rzTreeView.Items[i].ImageIndex:=1;
      rzTreeView.Items[i].SelectedIndex:=1;
      rzTreeView.Items[i].StateIndex:=1;
      inc(j);
    end
    else begin
      rzTreeView.Items[i].ImageIndex:=0;
      rzTreeView.Items[i].SelectedIndex:=0;
      imgIdxArr[rzTreeView.Items[i].AbsoluteIndex]:=0;
    end
  end;
  ListView1.Refresh;

  PrepareYMD;
  Screen.Cursor:=crHourGlass;
  try
  for i:=0 to ListView1.Items.Count-1 do begin

    action:=FindAction(dummyArr[i]);

    case action.ds of
      0:DataSource:=DM.ds_stsummary;
      1:DataSource:=DM.ds_stvisits;
      2:DataSource:=DM.ds_stpages;
      3:DataSource:=DM.ds_stnav;
    end;

    Str(dummyArr[i],what);
    ClearCache(DataPath +'stat_' + what + '*.xml');
    RunPhp(Format(action.query,[what,y,m,d]));
    DM.ReOpenDataSet(TClientDataSet(DataSource.DataSet));
    TClientDataSet(DataSource.DataSet).FileName := DataPath + 'stat_' + what + DateStr + '.xml';
    TClientDataSet(DataSource.DataSet).SaveToFile();
    ListView1.Items[i].Checked:=true;
    ListView1.Refresh;
  end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TSiteStatsForm.rzTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  if rzTreeView.Selected.Parent<>nil then
    TBItem1.tag:=(rzTreeView.Selected.Parent.Index+1)*10 + rzTreeView.Selected.Index;
end;

procedure TSiteStatsForm.DoChartExecute(Sender: TObject);
begin
  Panel4.Visible:=DoChart.Checked;
  Splitter2.Visible:=DoChart.Checked;
end;

procedure TSiteStatsForm.CommonActionExecute(Sender: TObject);
var what:string;
    action:Actions;
    DataSource:TDataSource;
    cap,fName,dummy:string;
begin
  if ListView1.visible then ListView1.Hide;
  TBItem1.Tag:=TAction(Sender).Tag;
  action:=FindAction(TAction(Sender).Tag);

  case action.ds of
    0:DataSource:=DM.ds_stsummary;
    1:DataSource:=DM.ds_stvisits;
    2:DataSource:=DM.ds_stpages;
    3:DataSource:=DM.ds_stnav;
  end;

  PrepareYMD;
  Str(TAction(Sender).tag,what);

  fName:=DataPath + 'stat_' + IntToStr(TAction(Sender).tag) + '*.xml';
  fName:=FindCachedData(fName);
  CachedFName:=fName;

  if fName<>'' then begin
    DoRTF.Enabled:=true;
    fName:=DataPath + fName;
    cxGrid1.Show;
    TClientDataSet(DataSource.DataSet).FileName:=fName;
    TClientDataSet(DataSource.DataSet).LoadFromFile();
    dummy:=Copy(CachedFName,0,length(CachedFName)-4);
    dummy:=Copy(dummy,8,length(CachedFName));

    TcxGridDBTableView(cxGrid1.Views[action.viewIdx]).DataController.DataSource:=DataSource;
    cxGrid1.Levels[0].GridView:=cxGrid1.Views[action.viewIdx];

    DM.stpages.fields[0].DisplayLabel:=TAction(Sender).Caption;

    DoChart.Checked:=action.gfx;
    DoChartExecute(Sender);
    {if (TAction(Sender).tag>19) and TBItem2.Checked then
      DoChartExecute(Sender);
    if (TAction(Sender).tag<19) and not TBItem2.Checked then
      DoChartExecute(Sender);}
  end
  else begin
    TClientDataSet(DataSource.DataSet).Close;
    cxGrid1.Hide;
    Panel4.Hide;
    Splitter2.Hide;
    TBItem2.Checked:=false;
    DoRTF.Enabled:=false;
  end;

  Label2.Caption:=action.h;
  Caption:='Статистика - ' + TAction(Sender).Caption + dummy{ + DateStr};

end;

procedure TSiteStatsForm.a_Action1Execute(Sender: TObject);
var
  i,j:integer;
begin
  CommonActionExecute(TAction(Sender));
  TBToolbar2.Hide;

  if DM.stsummary.Active then begin
    ResetChart;

    LoadFromResource('SUMMARY_TEE', DBChart1);
    //LoadChartFromFile(TCustomChart(DBChart1),'summary.tee');
    with DM.stsummary do begin
      first;
      for j:=0 to 2 do begin
        DBChart1.SeriesList[j].Clear;
        for i:=1 to FieldCount-3 do begin
          DBChart1.SeriesList[j].AddXY(i,Fields[i].Value,Fields[i].DisplayLabel,clTeeColor);
          DBChart1.SeriesList[j].Title:=Fields[0].Value;
        end;
        next;
      end;
    end;
  end;  
end;

procedure TSiteStatsForm.a_Action2Execute(Sender: TObject);
var s:string;
begin
  CommonActionExecute(TAction(Sender));
  TBToolbar2.Show;

  case cxComboBox1.ItemIndex of
    0:begin
        DM.stvisits.fields[0].DisplayLabel:='Час';
        axisname:='часы';
      end;
    1:begin
        DM.stvisits.fields[0].DisplayLabel:='День';
        axisname:='дни';
      end;
    2:begin
        DM.stvisits.fields[0].DisplayLabel:='Месяц';
        axisname:='месяцы';
      end;
  end;

  ResetChart;
  TBItem3Click(Sender);

end;

procedure TSiteStatsForm.cxComboBox1PropertiesChange(Sender: TObject);
begin
  case cxComboBox1.ItemIndex of
  0:begin
      cxDateEdit1.Show;
      cxComboBox2.Hide;
    end;
  1:begin
      cxDateEdit1.Hide;
      cxComboBox2.Show;
      FillCombo(cxComboBox1.ItemIndex);
    end;
  2:begin
      cxDateEdit1.Hide;
      cxComboBox2.Show;
      FillCombo(cxComboBox1.ItemIndex);
    end;
  end;
end;

procedure TSiteStatsForm.TBItem3Click(Sender: TObject);
begin
  if TBItem3.Checked then
    LoadFromResource('VISITS_TEE', DBChart1)
  else
    LoadFromResource('VISITS2_TEE', DBChart1);

  DBChart1.BottomAxis.Title.Caption:=axisname;

  DBChart1.SeriesList[0].DataSource:=DM.stvisits;
  DBChart1.SeriesList[0].XLabelsSource:='hour';
  DBChart1.SeriesList[0].XValues.ValueSource:='hour';
  DBChart1.SeriesList[0].YValues.ValueSource:='visits';
end;

procedure TSiteStatsForm.rzTreeViewDblClick(Sender: TObject);
var i:integer;
begin
  if ListView1.Visible then ListView1.Hide; 
  i:=0;
  while TBItem1.tag <> ActionList.Actions[i].Tag do inc(i);
  try
    Screen.Cursor:=crHourGlass;
    ActionList.Actions[i].Execute;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TSiteStatsForm.DoRTFExecute(Sender: TObject);
var action:Actions;
    gView:TcxGridDBTableView;
    dSet:TDataSet;
    i:integer;
begin
  gView:=TcxGridDBTableView(cxGrid1Level1.GridView);
  dSet:=gView.DataController.DataSource.Dataset;
  qeRTF.FileName:=DataPath + Caption + '.rtf';
  with qeRTF do begin
    ColumnsWidth.Clear;
    ExportedFields.Clear;
    for i:=0 to gView.ColumnCount-1 do begin
      ExportedFields.Add(gView.Columns[i].DataBinding.FieldName);
      ColumnsWidth.Add(dSet.Fields[i].FieldName + '=' + IntToStr(gView.Columns[i].Tag));
    end;
    Header.Clear;
    Header.Add('devium CMS 1.1');
    Header.Add('content managament solution');
    Header.Add(Caption);
    DataSet:=dSet;
    action:=FindAction(TBItem1.Tag);
    Footer.Clear;
    Footer.Add(action.h);
  try
    Screen.Cursor:=crHourGlass;
    ActionList.Actions[i].Execute;
  finally
    Screen.Cursor:=crDefault;
  end;
    Execute;
  end;
end;

procedure TSiteStatsForm.LoadFromResource(const ResName: string; DBChart: TCustomChart);
var
  Stream: TResourceStream;
begin
  Stream := TResourceStream.Create(HInstance, ResName, 'RT_RCDATA');
  try
    LoadChartFromStream(DBChart, Stream);
  finally
    Stream.Free;
  end;
end;

procedure TSiteStatsForm.SetDataPath(const Value: String);
begin
  FDataPath := Value;
end;

procedure TSiteStatsForm.rzTreeViewStateChanging(Sender: TObject;
  Node: TTreeNode; NewState: TRzCheckState; var AllowChange: Boolean);
var i:integer;
begin
  if Node.Parent<>nil then begin
    if NewState=csChecked then begin
      Node.ImageIndex:=0;
      Node.SelectedIndex:=0
    end
    else begin
      Node.ImageIndex:=imgIdxArr[Node.AbsoluteIndex];
      Node.SelectedIndex:=imgIdxArr[Node.AbsoluteIndex];
    end;
  end;
end;

procedure TSiteStatsForm.TBItem6Click(Sender: TObject);
begin
  ExportGrid4ToHTML('c:\grid.html', cxGrid1, True, True);
end;

end.


