unit main; 

{$mode objfpc}{$H+}

interface

uses
  LResources, DefaultTranslator, Windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, BASSPlayer,
  StdCtrls, ComCtrls, Playlists, KSPMessages, ExtCtrls, LoadPlsThread, FileUtils, StrUtils,
  CheckLst, MRNG, KSPTypes,ID3Mgmnt, LMessages, KSPStrings, Menus, MediaFolders, BookmarksU, MainWindowStartupThreads,
  FoldersScan, process, Buttons, Qt4, qtwidgets;


  { TWebView }

type  TWebView = class(TObject)
  public

    Handle : QWebViewH;
    Settings : QWebSettingsH;
    fUrl : QUrlH;
    pURL: string;
    procedure SetDimensions(x, y: integer);
    constructor Create(Parent : TWinControl; URL: string);
    procedure LoadURL(URL: string);
    procedure GoBack;
    procedure GoForward;
  end;

  { TKSPMainWindow }

  TKSPMainWindow = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    IMAddress: TEdit;
    History: TPanel;
    Image1: TImage;
    Image2: TImage;
    ImageList2: TImageList;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    MenuItem15: TMenuItem;
    BookmarksMenu: TMenuItem;
    Bookmarks1: TMenuItem;
    AddCurrentFromPlaylist1: TMenuItem;
    AddSelectedFromPlaylist1: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    Panel6: TPanel;
    IMProgress: TProgressBar;
    Savewholeplaylistasbookmark1: TMenuItem;
    N2: TMenuItem;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    TabSheet6: TTabSheet;
    TrayMenu: TPopupMenu;
    RepeatButton: TButton;
    HeaderControl1: THeaderControl;
    AppVersion: TLabel;
    LibPages: TPageControl;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MFolders: TListBox;
    MIView: TCheckListBox;
    Notebook1: TNotebook;
    Page1: TPage;
    Page2: TPage;
    PagesWelcome: TPageControl;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    MediaBuild: TProgressBar;
    Process1: TProcess;
    SongListMenu: TPopupMenu;
    ScanFolder: TLabel;
    lTime2: TLabel;
    lLeft: TLabel;
    lbPlaylist: TCheckListBox;
    lFileName: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    MediaLibProgress: TProgressBar;
    SDD: TSelectDirectoryDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TB: TTrackBar;
    ShuffleButton: TToggleBox;
    NotificationTimer: TTimer;
    ToolButton2: TToolButton;
    TotalTimeLabel: TLabel;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    Timer_stat: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btStop: TToolButton;
    btPlay: TToolButton;
    ToolButton4: TToolButton;
    PosBar: TTrackBar;
    Balance: TTrackBar;
    TrayIcon1: TTrayIcon;
    MsortType: TTreeView;
    MGView: TTreeView;
    procedure AddSelectedFromPlaylist1Click(Sender: TObject);
    procedure btPlayClick(Sender: TObject);
    procedure btStopClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure HistoryResize(Sender: TObject);
    procedure IMAddressKeyPress(Sender: TObject; var Key: char);
    procedure Image1Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MIViewDblClick(Sender: TObject);
    procedure NotificationTimerTimer(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel7Resize(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RepeatButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AudioOut1Done(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure HeaderControl1SectionClick(HeaderControl: TCustomHeaderControl;
      Section: THeaderSection);
    procedure lbPlaylistDblClick(Sender: TObject);
    procedure lbPlaylistDrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure lbPlaylistMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbPlaylistMouseEnter(Sender: TObject);
    procedure lbPlaylistMouseLeave(Sender: TObject);
    procedure lbPlaylistMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbPlaylistMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lLeftClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MGViewClick(Sender: TObject);
    procedure MsortTypeClick(Sender: TObject);
    procedure Savewholeplaylistasbookmark1Click(Sender: TObject);
    procedure ShuffleButtonChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabSheet3Resize(Sender: TObject);
    procedure TBChange(Sender: TObject);
    procedure PosBarChange(Sender: TObject);
    procedure PosBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PosBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer_statTimer(Sender: TObject);
    procedure BalanceChange(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure BookmarkClick(Sender: TObject);
  private
    { private declarations }
    CurrentFile: string;
    CurrentIndex: integer;
    PreviousIndex: integer;
    LoadPlsThr: TLoadPlsThread;
    FormatedPlayListInfo: string;
    FormatedHintInfo: string;
    FormatedPlaylistHintInfo: string;
    FStopped: boolean;
    FPaused: boolean;
    Shuffled: boolean;
    RepeatType: TRepeatType;
    PrevText: string;
    LastMoveIndex: integer;
    PlayListMoveText: string;
    FoldersScan: TFoldersScanThread;
    SortType: TSortType;
    LastMediaLibTag: integer;
    ApplicationVisible: boolean;
    KSPSetupStates: TKSPSetup;
    LastOpenDir: string;
    EQGains : TEQGains;
    ShowSplash: boolean;
    KSPNotification: QWidgetH;
    procedure PlayFile;
    procedure ResetDisplay;
    procedure LoadPls(FileName: string);
    procedure LoadOptions;
    procedure SaveOptions;
    procedure PerformFileOpen(const AFileName: string);
    procedure MigrateDatabase;
    procedure AssignMedia;
    procedure SortByTrackPLS;
    procedure SortByArtistPLS;
    procedure SortByAlbumPLS;
    procedure SortByYearPLS;
    procedure SortByGenrePLS;
    procedure SortByFileNamePLS;
    procedure LoadToLB;
    procedure DatabaseSetupDialog;
    procedure SetupWebBrowserIC;
    procedure RefreshBookmarks;
    procedure CopyMenu(Src: TMenuItem; var Dest: TMenuItem);
  protected
    procedure WndProc(var m: TLMessage); override;
  public
    { public declarations }
    LoadingPlaylist: boolean;
    WaitForB: integer;
    MediaFoldersList: TMediaFoldersList;
    SongsInLib: integer;
    BookmarksList: TBookmarksList;
    Playlist: TPlaylist;
    PlayedPrevious: boolean;
    TimeFormat : TTimeFormat;
    PlayListMove: boolean;
    Seeking: boolean;
    MediaSongs: TPlayList;
    WebView: TWebView;
    MainWebView: TWebView;
    HistoryWebView: TWebView;
    ShowAlertOnNewSongPlayed: boolean;
    function GetCurrentFile: string;
    procedure ScanFolders(Force: boolean);
    procedure AddToPlayList(fname: string; IgnoreLoadPls: boolean = false);
    procedure RemoveFromPlayList(Index: integer);
    procedure ClearPlayList;
    procedure PlayListTotalTime;
    function GetFormatedPlayListInfo: string;
    procedure DoThingOnMediaLib(Par, Chi: Integer);
    procedure ICLinkClicked(Value: QUrlH); cdecl;
    procedure IMProgressChange(progress: Integer); cdecl;
    procedure ShowAlert(NotTitle, NotText: widestring);
  end; 

var
  KSPMainWindow: TKSPMainWindow;

implementation

uses KSPFiles, KSPConstsVars, FileSupport, ProfileFunc, MediaItems, app_db_utils, IniFiles,
  KSPCrossList, MultiLog, OptionsFrm2, splash, complib;

//QT

function Slot(Name:String):PAnsiChar;
begin
Result:=StrNew(PChar('1'+Name));
end;


function Signal(Name:String):PAnsiChar;
begin
Result:=StrNew(PChar('2'+Name));
end;

function L2Qt(C: TWinControl) : QWidgetH;
begin
  Result:=TQtWidget(C.Handle).Widget;
end;

function ShowNotification(NotTitle, NotText: widestring): QWidgetH;
var
  tLabel: QLabelH;
  HBox : QHBoxLayoutH;
  VBox : QVBoxLayoutH;
begin
  Result:=QWidget_create(nil, QtToolTip);
  QFrame_create(Result);

  //
  //QWidget_resize(Result, 100, 100);

  QWidget_setWindowTitle(Result, @NotTitle);
  tLabel:=QLabel_create();
  QLabel_setText(tLabel, @NotText);

  HBox:=QHBoxLayout_create();
  QBoxLayout_addWidget(HBox,tLabel);
  VBox:=QVBoxLayout_create(Result);
  QBoxLayout_addLayout(VBox,HBox);

  QWidget_Show(Result);

  QWidget_AdjustSize(Result);

  QWidget_move(Result, 0, 0);
end;

function NotificationVisible(Notification: QWidgetH): boolean;
begin
  try
    if Notification<>nil then
      Result:=QWidget_isVisible(Notification) else
      Result:=false;
  except
    Result:=false;
  end;
end;

procedure CloseNotification(Notification: QWidgetH);
begin
  if Notification<>nil then
    QWidget_Close(Notification);
end;

{ TWebView }

procedure TWebView.SetDimensions(x, y: integer);
begin
  QWidget_resize(Handle, x, y);
end;

constructor TWebView.Create(Parent : TWinControl; URL: string);
var
  Page: QWebPageH;
  NetworkAccessManager : QNetworkAccessManagerH;
  NetworkProxy : QNetworkProxyH;
  W : WideString;

begin
  Handle := QWebView_create(L2Qt(Parent));

  Settings:=QWebView_settings(Handle);

  QWebSettings_setAttribute(Settings,QWebSettingsJavascriptEnabled,true);
  QWebSettings_setAttribute(Settings,QWebSettingsPluginsEnabled,true);

  Page:=QWebView_page(Handle);
  NetworkAccessManager:=QWebPage_networkAccessManager(Page);

  // proxy :adapt host/port and remove comment of setProxy
  w:='150.10.10.111';
  NetworkProxy:=QNetworkProxy_create(QNetworkProxyHttpProxy,@w,3128);
  //QNetworkAccessManager_setProxy(NetworkAccessManager,NetworkProxy);
  QNetworkProxy_destroy(NetworkProxy);

  w:=URL;
  fUrl:=QUrl_create(@w);
  QWebView_load(Handle,fUrl);
  QWidget_resize(Handle, 500, 500);
  QUrl_Destroy(fUrl);

  QWidget_Show(Handle);
  pURL:=URL;
end;

procedure TWebView.LoadURL(URL: string);
var
  W : WideString;
begin
  w:=URL;
  fUrl:=QUrl_create(@w);
  QWebView_load(Handle,fUrl);
end;

procedure TWebView.GoBack;
begin
  QWebView_back(Handle);
end;

procedure TWebView.GoForward;
begin
  QWebView_forward(Handle);
end;


{ TKSPMainWindow }

procedure TKSPMainWindow.LoadPls(FileName: string);
var
  e: Cardinal;
begin

  if LoadingPlaylist then Exit;
  if LoadPlsThr<>nil then
    if GetExitCodeThread(LoadPlsThr.Handle, e) then
      TerminateThread(LoadPlsThr.Handle, e);
//  PlayList.Clear;
  LoadPlsThr:=TLoadPlsThread.Create(false, FileName);
 { with LoadPlsThr do
    begin
      aFileName:=FileName;
      Resume;
    end; }
end;

procedure TKSPMainWindow.PerformFileOpen(const AFileName: string);
var
  s: string;
begin
  s:=UpperCase(ExtractFileExt(AFileName));

  if (s='.KPL') or (s='.M3U') or (s='.PLS') or (s='.XSPF') then
    LoadPls(AFileName) else
  if FileSupportList.FindExtension(s, false)>-1 then
    AddToPlayList(AFileName);
end;

procedure TKSPMainWindow.MigrateDatabase;
var
  s: TStringList;

  procedure SaveVersion;
  var
    i: TIniFile;
  begin
    I:=TIniFile.Create(KSPDataFolder+'data\db\version');
    I.WriteInteger('Version', 'Number', DB_VERSION);
    I.Free;
  end;

  function ShouldMigrate: boolean;
  var
    i: TIniFile;
    v: integer;
  const
    ConstMsg = 'You''ve upgraded from KSP which used a very old table format'+#13+
      'New database has been created but you should re-scan your Media Library'+#13+
      '(If you have it) to fill new database with media entries';
  begin
     v:=0;
     if FileExists(KSPDataFolder+'data\db\version') then
       begin
          I:=TIniFile.Create(KSPDataFolder+'data\db\version');
          v:=i.ReadInteger('Version', 'Number', 0);
          I.Free;
        end;
     Result:=v<DB_VERSION;
     if V<5 then begin
        ShowMessage(ConstMsg);
        Result:=false;
        SaveVersion;
      end;

  end;

  procedure AddToNewDataBase(p: TPLEntry);
  var
    fm: TFormatSettings;
    Pc1, Pc2, Pc3, Pc4, Pc5, Pc6, Pc7: TPathChar;
  begin
//    GetLocaleFormatSettings(KSPLangID, fm);
    fm.DecimalSeparator:='.';

    StrPCopy(Pc1, p.Tag.Comment);
    StrPCopy(Pc2, p.Tag.Year);
    StrPCopy(Pc3, p.Tag.Album);
    StrPCopy(Pc4, p.FileName);
    StrPCopy(Pc5, p.Tag.Genre);
    StrPCopy(Pc6, p.Tag.Artist);
    StrPCopy(Pc7, p.Tag.Title);

    s.Add(Format(InsStatNew, [IntToStr(p.Tag.GID),
                                                  IntToStr(p.Tag.Track),
                                                  PrepareString(Pc1),
                                                  PrepareString(Pc2),
                                                  PrepareString(Pc3),
                                                  PrepareString(Pc6),
                                                  PrepareString(Pc7),
                                                  BoolToStr(p.PlayedEver, not AllSongs.SqliteInUse),
                                                  IntToStr(p.MetaTag),
                                                  IntToStr(p.PlayCount),
                                                  FloatToStr(p.Fav, fm),
                                                  DateToStr(p.LastPlay),
                                                  DateToStr(p.FirstPlay),
                                                  PrepareString(Pc4),
                                                  PrepareString(Pc5)]));
        //Application.ProcessMessages;
  end;

  procedure PrepareSQL;
  var
    i: integer;
    p: TPLEntry;
  begin
    s:=TStringList.Create;
    AllSongs.OpenQuery('SELECT * FROM meta_old ORDER BY I_Name');

    if AllSongs.ReturnRecordsCount>0 then begin
      AllSongs.GoToFirst;
      while not AllSongs.EndOfDB do
        begin
          p:=AllSongs.ReadEntry;
          AddToNewDataBase(p);
          AllSongs.GoToNext;
        end;
      end;

    AllSongs.CloseQuery;

    if s.Count>0 then
    {for i:=0 to s.Count-1 do} begin
        AllSongs.ExecuteSQL(s.Text);
      end;

    s.Free;
  end;

begin
  if ShouldMigrate then begin
      //CreateDatabase('meta_new');
      RenameFile(KSPDataFolder+'db\meta.kspdb', KSPDataFolder+'db\meta_old.kspdb');
      RenameFile(KSPDataFolder+'db\meta_new.kspdb', KSPDataFolder+'db\meta.kspdb');
      {CreateDatabaseVDJ('vdjentries_new');
      RenameFile(KSPDataFolder+'db\vdjentries.kspdb', KSPDataFolder+'db\vdjentries_old.kspdb');
      RenameFile(KSPDataFolder+'db\vdjentries_new.kspdb', KSPDataFolder+'db\vdjentries.kspdb');}
      PrepareSQL;
      SaveVersion;
      ShowMessage(SMigratedToNew);
    end;
end;

procedure TKSPMainWindow.FormCreate(Sender: TObject);
var
  PlsName: string;
  PODirectory, Lang, FallbackLang: String;
  Result: DWORD;
  i: integer;

  procedure SetVars;
  begin
    CurrentFile:=''; CurrentIndex:=-1;  PreviousIndex:=-1;  FStopped:=True;
    Caption:=Application.Title;
    //KSPMainWindow.GetNewestInfo;

    LoadingPlaylist:=false;
    ToolButton1.ImageIndex:=0;
    FPaused:=false;
    Shuffled:=false;
    RepeatType:=rtNone;
    LastMediaLibTag:=-1;
    ApplicationVisible:=true;
    Notebook1.ActivePage:='Page1';
    LibPages.ActivePage:=TabSheet1;
    PagesWelcome.ActivePage:=TabSheet3;
    WaitForB:=0;

    //KSPMainWindow.TB.Position:=Player.Volume;

    //KSPMainWindow.RemDevSheet.TabVisible:=false;
  end;

  procedure CreateObjectsAndVars;
  begin
    TCreateObjectsThread.Create(false);
    TSetVarsThread.Create(false);
    TLoadOptionsThread.Create(false);

    SetVars;
  end;

  function SetupDatabase: TAppDBConnection;
  var
    fDatabase: TAppDBConnection;
  begin
    ForceDirectoriesKSP(KSPDataFolder+'data\db');
    ForceDirectoriesKSP(KSPDataFolder+'db');
    AllSongs:=TAppDBConnection.Create;
    with AllSongs do begin
      while SetupDatabase(KSPDataFolder+'db/ksp.kspdb')<>0 do
        DatabaseSetupDialog;

      MigrateDatabase;

      Result:=fDatabase;
    end;
  end;

  procedure ApplyOptions;
  begin
    Self.RefreshBookmarks;

    case KSPMainWindow.TimeFormat of
      tfRemain: begin
          KSPMainWindow.lTime2.Caption:=Sremaining;
        end;
      tfElapsed: begin
          KSPMainWindow.lTime2.Caption:=SElapsed;
        end;
    end;
  end;

  procedure LoadPlugins;
  var
    s: TStringList;
    i: integer;
  begin
    s:=TStringList.Create;

    SearchForFilesFS(ExtractFilePath(Application.ExeName)+'plugins', true, s);

    for i:=0 to s.Count-1 do
      Player.BASSAddonLoad(s.Strings[i]);

    s.Free;
  end;

  procedure SetupOpenDialog;
  var
    i: integer;
  begin
    OpenDialog1.Filter:=SPlaylists+' (*.pls;*.m3u;*.kpl)|*.pls;*.m3u;*.kpl|'+
      SNativeFiles+'('+Player.NativeFileExts+')|'+Player.NativeFileExts;

    for i:=0 to FileSupportList.Count-1 do begin
          OpenDialog1.Filter:=OpenDialog1.Filter+'|'+FileSupportList.GetItem(i).Name+' ('+
            Player.GetBASSAddonExts(i)+')|'+Player.GetBASSAddonExts(i);
      end;
    OpenDialog1.Filter:=OpenDialog1.Filter+'|All Files (*.*)|*.*';
  end;

  procedure SetSplashProg(prg: integer);
  begin
    SplashForm.Prog.Position:=prg;
    Application.ProcessMessages;
  end;

begin
  SplashForm:=TSplashForm.Create(nil);

  LoadOptions;

  if Self.ShowSplash then SplashForm.Show;
  //PODirectory := '/path/to/lazarus/lcl/languages/';
  //GetLanguageIDs(Lang, FallbackLang); // in unit gettext
  //TranslateUnitResourceStrings('LCLStrConsts', PODirectory + 'lclstrconsts.%s.po', Lang, FallbackLang);

//  Player:=TBassPlayer.Create(Self);
  Player.OnPlayEnd:=@AudioOut1Done;

  CreateObjectsSem2 := 1;//CreateSemaphore(nil, 0,1,'CreateObjectsSem');
  LoadVarsSem2 := 1;//CreateSemaphore(nil, 0,1,'LoadVarsSem');
  CreateObjectsAndVars;
  //SetVars;
  repeat
    Sleep(500);//)Result := CreateObjectsSem, INFINITE);
  until CreateObjectsSem2=0;
  repeat
    Sleep(500);//Result := WaitForSingleObject(LoadVarsSem, INFINITE);
  until LoadVarsSem2=0;
  repeat
    Sleep(500);//  Result := WaitForSingleObject(StartupThreadSem, INFINITE);
  until StartupThreadSem2=0;

  SetSplashProg(10);

  LoadPlugins;      SetSplashProg(30);
  SetupOpenDialog;  SetSplashProg(40);

  AppVersion.Caption:=Application.Title+' '+KSPVersion+' ('+KSPVersion2+')';

    case RepeatType of
    rtNone: begin
        RepeatButton.Caption:=SRepeatOff;
      end;
    rtOne: begin
        RepeatButton.Caption:=SRepeatOne;
      end;
    rtAll: begin
        RepeatButton.Caption:=SRepeatAll;
      end;
    end;

  ShuffleButton.Checked:=Shuffled;

  SetupDatabase;   SetSplashProg(50);
  ScanFolders(false);

  if MediaFoldersList.Count>0 then
    for i := 0 to MediaFoldersList.Count - 1 do
      MFolders.Items.Add(MediaFoldersList.GetItem(i).Folder);

  PlsName:=KSPDataFolder+'data/pls.kpl';

  if ParamCount>0 then PerformFileOpen(ParamStr(1)) else
      if FileExists(PlsName) then
        LoadPls(PlsName);

  ApplyOptions;

  Self.SetupWebBrowserIC;

  SplashForm.Free;

  TCompactlibThread.Create(false);

//  ShowNotification;
end;

procedure TKSPMainWindow.Button1Click(Sender: TObject);
begin
  Log.SaveToFile(KSPDataFolder+'sqllog.txt');
end;

procedure TKSPMainWindow.Button2Click(Sender: TObject);
var
  i: integer;
  s: TStringList;

  procedure SaveMediaLib(Folder: string);
  var
    mf: TMediaFolder;
  begin
    //if SelectDir.Execute then begin
      mf.Folder:=Folder;
      mf.ScannedEver:=false;
      MediaFoldersList.Add(mf);
    //end;
  end;

begin
      if MFolders.Items.Count>0 then begin
          for i:=0 to MFolders.Items.Count-1 do
            SaveMediaLib(MFolders.Items.Strings[i]);

          MediaFoldersList.SaveToFile(KSPDataFolder+'data\MediaLib.xml');
        end;
end;

function getenv(const Name: PChar): PChar; cdecl; external 'c';

procedure TKSPMainWindow.Button3Click(Sender: TObject);
begin
  if SDD.Execute then
    MFolders.Items.Add(SDD.FileName);
end;

procedure TKSPMainWindow.Button4Click(Sender: TObject);
begin
  ShellExecute(KSPMainWindow.Handle,'Open', KSPHowHelp,nil,nil,SW_NORMAL);
end;

procedure TKSPMainWindow.Button5Click(Sender: TObject);
begin
  Self.ScanFolders(true);
end;

procedure TKSPMainWindow.Button6Click(Sender: TObject);
begin
  Self.DatabaseSetupDialog;
end;

procedure TKSPMainWindow.Button7Click(Sender: TObject);
var
  s: TStringList;
begin
  s:=TStringList.Create;
  DownloadURL(NetworkStreams, s);

  s.SaveToFile(KSPDataFolder+'icecast.xml');

  s.Free;
end;

procedure TKSPMainWindow.HistoryResize(Sender: TObject);
begin
  Self.HistoryWebView.SetDimensions(Self.History.Width, Self.History.Height);
end;

procedure TKSPMainWindow.IMAddressKeyPress(Sender: TObject; var Key: char);
begin
  if Key=#13 then
    WebView.LoadURL(IMAddress.Text);
end;

procedure TKSPMainWindow.Image1Click(Sender: TObject);
begin

end;

procedure TKSPMainWindow.MenuItem15Click(Sender: TObject);
var
  s: string;
  p2: TPLEntry;
  p: PPLEntry;
  Index: integer;
  Pc, pc2: TPathChar;
begin
  if (lbPlaylist.ItemIndex>lbPlaylist.Count) or (lbPlaylist.ItemIndex<0) then Exit;
  Index:=lbPlaylist.ItemIndex;
  P:=Playlist.GetItem(Index);
  s:=P^.FileName;

  StrPCopy(Pc, s);
  if not IsStream(Pc) then begin
      FileInfoBox(s);
      P2.Tag:=ReadID3(s);
      if AllSongs.FileInLib(s) then begin
          StrPCopy(Pc2, s);
          AllSongs.OpenQuery(Format(SelectGetItem,[PrepareString(Pc2)]));
          P2:=AllSongs.ReadEntry;
          //P2.Tag:=P^.Tag;
          AllSongs.CloseQuery;
          AllSongs.Add(P2, false);
        end;
      PlayList.ChangeEntry(Index, P2);

      lbPlaylist.Items.Strings[Index]:=
        ProduceFormatedString(FormatedPlaylistInfo, ReadID3(s), GetDuration(P^.Stream), Index);
    end else begin
      //ThemedMessages.MessageDlg(Format(GetResConst('SInfoShoutcast'), [))
    end;
end;

procedure TKSPMainWindow.MenuItem16Click(Sender: TObject);
var
  p: TBookmarkItem;
begin
  p.Name:=InputBox(SInputBookmarkCaption,
    SInputBookmarkPrompt, Playlist.GetItem(CurrentIndex)^.Tag.Title);

  if p.Name='' then Exit;
  p.URL:=Playlist.GetItem(CurrentIndex)^.FileName;
  BookmarksList.Add(p);
  RefreshBookmarks;
end;

procedure TKSPMainWindow.MIViewDblClick(Sender: TObject);
begin
  if (MIView.ItemIndex<0) or (MIView.ItemIndex>=MIView.Count) then Exit;
  if MediaSongs.Count=0 then Exit;
  AddToPlayList(MediaSongs.GetItem(MIView.ItemIndex)^.FileName);
end;

procedure TKSPMainWindow.NotificationTimerTimer(Sender: TObject);
begin
  CloseNotification(Self.KSPNotification);
  NotificationTimer.Enabled:=false;
end;

procedure TKSPMainWindow.Panel7Click(Sender: TObject);
begin

end;

procedure TKSPMainWindow.Panel7Resize(Sender: TObject);
begin
  WebView.SetDimensions(Panel7.Width, Panel7.Height);
end;

procedure TKSPMainWindow.PopupMenu1Popup(Sender: TObject);
var
  Index: integer;
  P: PPLEntry;
  s: string;
  pc: TPathChar;
begin
  if (lbPlaylist.ItemIndex>lbPlaylist.Count) or (lbPlaylist.ItemIndex<0) then Exit;
  Index:=lbPlaylist.ItemIndex;
  P:=Playlist.GetItem(Index);
  s:=P^.FileName;

  StrPCopy(Pc, s);
  MenuItem15.Enabled:=not IsStream(pc);
end;

procedure TKSPMainWindow.RepeatButtonClick(Sender: TObject);
begin
  case RepeatType of
    rtNone: begin
        RepeatButton.Caption:=SRepeatOne;
        RepeatType:=rtOne;
      end;
    rtOne: begin
        RepeatButton.Caption:=SRepeatAll;
        RepeatType:=rtAll;
      end;
    rtAll: begin
        RepeatButton.Caption:=SRepeatOff;
        RepeatType:=rtNone;
      end;
  end;
end;

procedure TKSPMainWindow.btPlayClick(Sender: TObject);
begin
  if (not FPaused) and (not FStopped) then
    begin
      Player.Pause(true);
      FPaused := True;
      btPlay.ImageIndex:=3;
    end
  else if FPaused then begin
      Player.Pause(false);
      btPlay.ImageIndex:=4;
      FPaused:=false;
  end else begin
    PlayFile;
  end;


  btStop.ImageIndex := 2;
  lbPlaylist.Repaint;
end;

procedure TKSPMainWindow.AddSelectedFromPlaylist1Click(Sender: TObject);
var
  p: TBookmarkItem;
  Index: integer;
begin
  if (lbPlaylist.ItemIndex>lbPlaylist.Count) or (lbPlaylist.ItemIndex<0) then Exit;
  Index:=lbPlaylist.ItemIndex;
  p.Name:=InputBox(SInputBookmarkCaption,
    SInputBookmarkPrompt, Playlist.GetItem(Index)^.Tag.Title);

  if p.Name='' then Exit;
  p.URL:=Playlist.GetItem(Index)^.FileName;
  BookmarksList.Add(p);
  RefreshBookmarks;
end;

procedure TKSPMainWindow.btStopClick(Sender: TObject);
var
  i: integer;
  s: string;
  E: Cardinal;
begin
  if CurrentIndex=-1 then Exit;
  if FStopped then Exit;
  ResetDisplay;
  FStopped := True;
  //btPlay.Enabled := True;
  btStop.ImageIndex:=1;
  Player.Stop;
  Player.Close;

  for i:=0 to PlayList.Count-1 do PlayList.UnSetPlayed(i);
  btPlay.ImageIndex:=3;
  //lbPlayList.Items.Item[CurrentIndex].ImageIndex:=-1;

  s:=lbPlaylist.Items.Strings[CurrentIndex];
//  Delete(s, 1, Length(SPlaying)+1);
  PlayedPrevious:=false;
  lbPlaylist.Items.Strings[CurrentIndex]:=s;

  lbPlayList.Refresh;
end;

function TKSPMainWindow.GetCurrentFile: string;
begin
  Result:=CurrentFile;
end;

function TKSPMainWindow.GetFormatedPlayListInfo: string;
begin
  Result:=FormatedPlayListInfo;
end;

procedure TKSPMainWindow.PlayFile;
var
  P: PPLEntry;
  s: string;
  Pc: TPathChar;

  procedure PlayAudio;
  begin
    Timer_stat.Enabled:=true;
    if Player.PlayerReady then
      Timer_Stat.Enabled := true;
    Player.Open(CurrentFile);
    PosBar.Position:=0;
    Player.Play;
    //SuggThread:=TFindSugg.Create(false);
  end;

begin
    //PlayerBase.Mode:=gmNormal;
    if CurrentIndex>=Playlist.Count then CurrentIndex:=0;
      if CurrentIndex >= 0 then ResetDisplay else
        begin
          if lbPlaylist.Items.Count = 0 then exit;

          if lbPlaylist.ItemIndex < 0 then
            lbPlaylist.ItemIndex:=0;
          CurrentIndex:=lbPlayList.ItemIndex;
        end;

      PreviousIndex:=CurrentIndex;
      CurrentFile := (PlayList.GetItem(CurrentIndex))^.FileName;

      //if not PlayerBase.Active then PlayerBase.Active := true;
      //PlayerBase.ClearGraph;
      StrPCopy(Pc, CurrentFile);
      while (not FileExists(CurrentFile)) and (not (IsStream(Pc)))
        and (not IsCD(Pc)) do begin
          Inc(CurrentIndex);
          CurrentFile := (PlayList.GetItem(CurrentIndex))^.FileName;
          StrPCopy(Pc, CurrentFile);
        end;

      PlayAudio;

      lFilename.Caption := MinimizeName(Format(SFile+' %s',[ExtractFileName(CurrentFile)]), lFilename.Canvas, lFilename.Width);
      P:=PlayList.GetItem(CurrentIndex);

      if IsStream(Pc) then TrayIcon1.Hint:=lFilename.Caption else
        TrayIcon1.Hint:=ProduceFormatedString(FormatedHintInfo, p^.Tag, GetDuration(p^.Stream), CurrentIndex+1);

      //Inc(TotalPlayCount);
      //KSPMainWindow.LoadLyrics(CurrentFile);

      //PlayerBase.RenderFile(CurrentFile);
      FStopped := False;

      if ShowAlertOnNewSongPlayed then begin
        if IsStream(Pc) then
          ShowAlert(SPlayingNewFile, lFileName.Caption)
        else
          ShowAlert(SPlayingNewFile, ProduceFormatedString(FormatedHintInfo, p^.Tag, GetDuration(p^.Stream),
            CurrentIndex));
        end;


      s:=lbPlayList.Items.Strings[CurrentIndex];
      //PlayItems.Items[CurrentIndex].Checked:=true;
      lbPlayList.Items.Strings[CurrentIndex]:=s;
      PlayedPrevious:=true;
      lbPlaylist.Repaint;
      lbPlaylist.Invalidate;

      lbPlayList.Refresh;
      btPlay.ImageIndex:=4;
end;

procedure TKSPMainWindow.AudioOut1Done(Sender: TObject);
var
  i: integer;
  Ind: Integer;
  E: Cardinal;

  function FindIfRight(i: integer): boolean;
  begin
    hLog.Send(PlayList.GetItem(i)^.FileName);
    Result:=(not PlayList.GetItem(i)^.Played) and (lbPlayList.State[i]<>cbChecked);
  end;

  function GetCurrentIndex: integer;
  var
    i: integer;
    t: boolean;
    MCC: integer;
  begin
    hLog.Send('Looking for next index');
    t:=false;
    mcc:=Playlist.Count;//*1000;

    for i:=0 to PlayList.Count-1 do
      if not (PlayList.GetItem(i)^.Played)
//{$IFDEF USECHECKED}
      and (lbPlayList.State[i]<>cbChecked)
//{$ENDIF}
      then t:=true;
    if t then begin
      i:=MRandInt(0, MCC);// div 1000;//000;

      while (PlayList.GetItem(i)^.Played)
//{$IFDEF USECHECKED}
      or (lbPlayList.State[i]=cbChecked)
//{$ENDIF}
      do i:=(MRandInt(0, MCC)); // div 1000000)-1;
      //until (FindIfRight(i));// and (CheckedCount>MCC);
      if FindIfRight(i) then begin end
      else i:=-1;
      end else i:=-1;

    Result:=i;
  end;

  function SetNextSong: boolean;
  begin
    Result:=CurrentIndex>=lbPlayList.Items.Count;
    if not Result then
      begin
        Result:=(lbPlayList.State[CurrentIndex]<>cbChecked);
      end;
  end;

begin  //btPlay.Enabled := True;
  //btStop.Enabled := False;
  hLog.Send('Audio done for '+CurrentFile);

  Player.Stop;
  Player.Close;


  hLog.Send('Reset display');
  ResetDisplay;
  Ind:=CurrentIndex;//FindSong(CurrentFile, AllSongs);

//  s:=PlsForm.lbPlaylist.Items.Strings[CurrentIndex];
//  Delete(s, 1, Length(SPlaying)+1);
//  PlsForm.lbPlaylist.Items.Strings[CurrentIndex]:=s;

  //lbPlayList.Items.Item[CurrentIndex].ImageIndex:=-1;
//  PlsForm.lbPlayList.Refresh;
  if FStopped then
    exit;

  PlayList.SetPlayed(CurrentIndex);
//  spTrayIcon1.Hint:=Application.Title;

  if lbPlaylist.Items.Count = 0 then exit;
  if CurrentIndex = -1 then
    CurrentIndex := 0;

  if Shuffled and (RepeatType<>rtOne) then CurrentIndex:=GetCurrentIndex;
  hLog.Send('Index is '+IntToStr(CurrentIndex));

  if (CurrentIndex=-1) and Shuffled then case RepeatType of
    rtAll: begin
        hLog.Send('Starting new shuffle');
        for i:=0 to PlayList.Count-1 do PlayList.UnSetPlayed(i);
        CurrentIndex:=GetCurrentIndex;
        hLog.Send('Index is '+IntToStr(CurrentIndex));
      end;
    rtNone: begin
        hLog.Send('Stopping: PLAYLIST END');
        FStopped:=true;
        for i:=0 to PlayList.Count-1 do PlayList.UnSetPlayed(i);
        Exit;
      end;
    else end;



  //and (RepeatType=rtAll) then  else if (CurrentIndex=-1) and Shuffled and (RepeatType=rtNone)


  CurrentFile := PlayList.GetItem(CurrentIndex)^.FileName;
  if (lbPlaylist.Items.Count > CurrentIndex) or (RepeatType<>rtNone) then
    begin
      if not Shuffled and (RepeatType=rtNone) and (lbPlaylist.Items.Count-1 <= CurrentIndex) then begin
          hLog.Send('Last song played');
          FStopped:=true;
          btPlay.ImageIndex:=3;
          lFilename.Caption:='';
          CurrentIndex:=-1;
          lbPlayList.Refresh;

          if ShowAlertOnNewSongPlayed then
            ShowAlert(SLastSongPlayed, SLastSongPlayed2);

          Exit;
        end;

      if not Shuffled and (RepeatType=rtAll) then begin
          hLog.Send('Repeating playlist');
          if (lbPlaylist.Items.Count-1 <= CurrentIndex) then CurrentIndex:=-1;// else
          Inc(CurrentIndex);
          while
//{$IFDEF USECHECKED}
          (lbPlayList.State[CurrentIndex]=cbChecked) and
//{$ENDIF}
          (CurrentIndex<lbPlayList.Items.Count) do
            Inc(CurrentIndex);
{If we passed whole playlist and whole items are disabled then we play previous
song. It works as if RepeatType=rtOne}
          if CurrentIndex>=lbPlayList.Items.Count then CurrentIndex:=Ind;
        end;
      if (RepeatType=rtNone) and (not Shuffled) then
        repeat Inc(CurrentIndex) until
          SetNextSong;
//          (lbPlayList.State[CurrentIndex]<>cbChecked) or
//          (CurrentIndex>=lbPlayList.Items.Count);

      if (CurrentIndex>=lbPlayList.Items.Count) and (RepeatType<>rtAll) then begin
          hLog.Send('Last song played');
          FStopped:=true;
          btPlay.ImageIndex:=3;
          lFilename.Caption:='';
          CurrentIndex:=-1;
          lbPlayList.Refresh;
          Exit;
      end;

      if (CurrentIndex>=lbPlayList.Items.Count) then CurrentIndex:=0;

      CurrentFile := PlayList.GetItem(CurrentIndex)^.FileName;
      hLog.Send('New file is '+CurrentFile);
      //lFilename.Caption := MinimizeName(Format(GetResConst('SFile')+'%s',[ExtractFileName(CurrentFile)]), lFileName.Canvas, lFileName.Width);
      PlayFile;

    end else
//Playlist.Count<=CurrentIndex (whole playlist has been changed)
    begin
          hLog.Send('Last song played');
          FStopped:=true;
          btPlay.ImageIndex:=3;
          lFilename.Caption:='';
          CurrentIndex:=-1;
          lbPlayList.Refresh;

          if ShowAlertOnNewSongPlayed then
            ShowAlert(SLastSongPlayed, SLastSongPlayed2);

          Exit;
        end;

end;

procedure TKSPMainWindow.FormDestroy(Sender: TObject);
var
  Pls:TXMLPlayList;
  PlsFile: string;

  {procedure FreeHandles;
  begin
    CloseHandle(GetCountSem);
    CloseHandle(LoadPlsSem);
    CloseHandle(StartupThreadSem);
    CloseHandle(LoadOptionsSem);
    CloseHandle(LoadVarsSem);
    CloseHandle(CreateObjectsSem);
    CloseHandle(KSPDatabaseThreads);
  end;  }

begin
  AllSongs.Free;
  MediaSongs.Free;

  BookmarksList.SaveToFile(KSPDataFolder+'data\bookmarks.xml');

  SaveOptions;


  Pls:=TXMLPlayList.create;
  PlsFile:= KSPDataFolder+'data/pls.kpl';
  FixFolderNames(PlsFile);
  Pls.SavePls(PlayList, PlsFile);
  Pls.Free;

  Player.Stop;
  Player.Close;
//  Player.Free;
  hLog.Free;
  ExitProcess(0);
end;

procedure TKSPMainWindow.FormWindowStateChange(Sender: TObject);
begin
     if WindowState = wsMinimized then begin
      //WindowState := wsNormal;
      //Hide;
      //ShowInTaskBar := stNever;
     end;
end;

procedure TKSPMainWindow.HeaderControl1SectionClick(
  HeaderControl: TCustomHeaderControl; Section: THeaderSection);
begin
  case Section.Index of
    0: Notebook1.ActivePage:='Page1';
    1: Notebook1.ActivePage:='Page2';
  end;
end;

procedure TKSPMainWindow.lbPlaylistDblClick(Sender: TObject);
var
  s: string;
begin
  if LoadingPlaylist then Exit;
  CurrentFile:='';
  if (CurrentIndex>-1) and PlayedPrevious then begin
      ResetDisplay;
      s:=lbPlaylist.Items.Strings[CurrentIndex];
//      Delete(s, 1, Length(SPlaying)+1);
      lbPlaylist.Items.Strings[CurrentIndex]:=s;
    end;
  CurrentIndex:=-1;
  //if PreviousIndex<>-1 then lbPlayList.Items.Item[PreviousIndex].ImageIndex:=-1;
  lbPlayList.Refresh;
  PlayListMove:=false;
  Player.Stop;
  Player.Close;
  btStop.ImageIndex := 2;
  PlayFile;
end;

procedure TKSPMainWindow.lbPlaylistDrawItem(Control: TWinControl;
  Index: Integer; ARect: TRect; State: TOwnerDrawState);
var
  Bitmap: TBitmap;      { temporary variable for the itemÄ‚ËĂ˘â€šÂ¬Ă˘â€žËs bitmap }
  Offset: Integer;      { text offset width }
  s: string;
  Pc: TPathChar;
begin
try
  with lbPlaylist.Canvas do  { draw on control canvas, not on the form }
  begin
//  FillRect(TxtRect);       { clear the rectangle }
  Offset := 2;          { provide default offset }
  Bitmap := TBitmap(lbPlaylist.Items.Objects[Index]); { get the bitmap }
  if Bitmap <> nil then

  begin
    Draw(ARect.Left + Offset, ARect.Top, Bitmap); {render bitmap}
    Offset := Bitmap.width + 6;    { add four pixels between bitmap and text}
  end;
  if (not Self.FStopped) and (Index=CurrentIndex)and
    (Playlist.GetItem(CurrentIndex)^.FileName=CurrentFile) then
    Font.Style:=Font.Style+[fsBold] else
    Font.Style:=Font.Style-[fsBold];

  StrPCopy(Pc, Self.Playlist.GetItem(Index)^.FileName);
  if not IsStream(Pc) then
  s:=ProduceFormatedString(KSPMainWindow.FormatedPlayListInfo,
            Self.Playlist.GetItem(Index)^.Tag,
            GetDuration(Self.Playlist.GetItem(Index)^.Stream),
            Index+1) else begin
      if (KSPMainWindow.CurrentIndex=Index) and (Player.StreamInfo.Title<>'') then
      s:=Format(SShoutcastEntry, [Player.StreamInfo.Title]) else
      s:=Format(SShoutcastEntry, [Self.Playlist.GetItem(Index)^.FileName]);
    end;
  TextOut(ARect.Left + Offset, ARect.Top, s);//lbPlaylist.Items[Index])  { display the text }
  end;
finally

end;
end;

procedure TKSPMainWindow.lbPlaylistMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;
  i, PlayListMoveIndex: integer;
begin
  if LoadingPlaylist then Exit;
  if (lbPlayList.ItemAtPos(p, true)>=lbPlayList.Items.Count)
  or (lbPlayList.ItemAtPos(p, true)<0) then Exit;
  //PlayListMove:=true;
  p.X:=X; p.Y:=Y;
  i:=lbPlayList.ItemAtPos(p, true);
  if (i<0)or(i>=lbPlaylist.Items.Count) then Exit;
  PlaylistMove:=true;
  PlayListMoveIndex:=i;
  PlayListMoveText:=lbPlayList.Items.Strings[lbPlayList.ItemAtPos(p, true)];
  LastMoveIndex:=PlayListMoveIndex;
//  LastMoveText:='';
end;

procedure TKSPMainWindow.lbPlaylistMouseEnter(Sender: TObject);
begin
  PrevText:='';
end;

procedure TKSPMainWindow.lbPlaylistMouseLeave(Sender: TObject);
begin
  PlayListMove:=false;
end;

procedure TKSPMainWindow.lbPlaylistMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
//{$IFDEF USECHECKED}
  st:TCheckBoxState;
//{$ENDIF}
begin
  if not PlayListMove then Exit;

  p.X:=X; p.Y:=Y;
  if lbPlayList.ItemAtPos(p, true)<0 then Exit;
  if (PlayListMoveText=lbPlayList.Items.Strings[lbPlayList.ItemAtPos(p, true)]) then Exit;
  if LastMoveIndex=lbPlayList.ItemAtPos(p, true) then Exit;
  //log.WriteLogFile(lbPlayList.Items);
//  s:=PlsForm.lbPlayList.Items.Strings[PlsForm.lbPlayList.ItemAtPos(p, true)];
//  PlsForm.lbPlayList.Items.Strings[PlsForm.lbPlayList.ItemAtPos(p, true)]:=PlsForm.lbPlayList.Items.Strings[LastMoveIndex];
//  PlsForm.lbPlayList.Items.Strings[LastMoveIndex]:=s;
//{$IFDEF USECHECKED}
  st:=lbPlayList.State[lbPlayList.ItemAtPos(p, true)];
  lbPlayList.State[lbPlayList.ItemAtPos(p, true)]:=lbPlayList.State[LastMoveIndex];
  lbPlayList.State[LastMoveIndex]:=st;
//{$ENDIF}
  PlayList.Exchange(LastMoveIndex, lbPlayList.ItemAtPos(p, true));
  lbPlayList.Items.Strings[lbPlayList.ItemAtPos(p, true)]:=
    ProduceFormatedString(FormatedPlaylistInfo,
      PlayList.GetItem(lbPlayList.ItemAtPos(p, true))^.Tag,
      GetDuration(PlayList.GetItem(lbPlayList.ItemAtPos(p, true))^.Stream),
      lbPlayList.ItemAtPos(p, true)+1);

  lbPlayList.Items.Strings[LastMoveIndex]:=
    ProduceFormatedString(FormatedPlaylistInfo, PlayList.GetItem(LastMoveIndex)^.Tag,
      GetDuration(PlayList.GetItem(LastMoveIndex)^.Stream), LastMoveIndex+1);

  if lbPlayList.ItemAtPos(p, true)=CurrentIndex then begin
      CurrentIndex:=LastMoveIndex;
    end else if CurrentIndex=LastMoveIndex then begin
      CurrentIndex:=lbPlayList.ItemAtPos(p, true);
    end;
  //if LastMoveText<>'' then
  //  lbPlayList.Items.Item[LastMoveIndex].Text:=LastMoveText;

  //LastMoveText:=s;
  lbPlaylist.Selected[LastMoveIndex]:=false;
  LastMoveIndex:=lbPlayList.ItemAtPos(p, true);
end;

procedure TKSPMainWindow.lbPlaylistMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PlayListMove:=false;
end;

procedure TKSPMainWindow.lLeftClick(Sender: TObject);
begin
    case TimeFormat of
      tfRemain: begin
          TimeFormat:=tfElapsed;
          lTime2.Caption:=SElapsed;
        end;
      tfElapsed: begin
          TimeFormat:=tfRemain;
          lTime2.Caption:=SRemaining;
        end;
    end;
end;

procedure TKSPMainWindow.MenuItem1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      Self.PerformFileOpen(OpenDialog1.FileName);
    end;
end;

procedure TKSPMainWindow.MenuItem2Click(Sender: TObject);
begin
  ClearPlayList;
end;

procedure TKSPMainWindow.MenuItem3Click(Sender: TObject);
var
  i: integer;
begin
  if MediaSongs.Count=0 then Exit;
  for i:=0 to MIView.Items.Count-1 do begin
      if MIView.State[i]=cbChecked then
        AddToPlayList(MediaSongs.GetItem(i)^.FileName);
    end;

end;

procedure TKSPMainWindow.MenuItem4Click(Sender: TObject);
var
  i, t: integer;
begin
  t:=TMenuItem(Sender).Tag;
  for i:=0 to MIView.Items.Count-1 do
    case t of
      1: MIView.State[i]:=cbChecked;
      2: MIView.State[i]:=cbUnchecked;
      3: if MIView.State[i]=cbUnchecked then MIView.State[i]:=cbChecked
        else MIView.State[i]:=cbUnchecked;
    end;
end;

procedure TKSPMainWindow.MenuItem7Click(Sender: TObject);
var
  i: integer;
begin
  if lbPlayList.ItemIndex < 0 then Exit;
  for i:=lbPlaylist.Items.Count-1 downto 0 do
    if lbPlaylist.Selected[i] then
      RemoveFromPlayList(i);
end;

procedure TKSPMainWindow.MenuItem9Click(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    1: SortByArtistPLS;
    2: SortByTrackPLS;
    3: SortByAlbumPLS;
    4: SortByYearPLS;
    5: SortByGenrePLS;
    6: SortByFileNamePLS;
  end;
end;

procedure TKSPMainWindow.MGViewClick(Sender: TObject);

  procedure ParentSelected;
  begin
    case SortType of
    stByArtist: FindSongsArtist(MediaSongs, AllSongs, MGView.Selected.Text);
    stByAlbum: FindSongsAlbum(MediaSongs, AllSongs, MGView.Selected.Text);
    stByYear: FindSongsByYear(MediaSongs, AllSongs, MGView.Selected.Text);
    stByGenre: FindSongsByGenre(MediaSongs, AllSongs, MGView.Selected.Text);
{    stCDArtist: begin
        FindCDArtistSongs(CDTracks, AllCDS, Frame11.TeTreeView2.Selected.Text);
        CDTracks
        //s:=CDTracks.Entry.Tracks;
      end;  }
    end;
  end;

begin
  if MGView.Selected=nil then Exit;;
  if MGView.Items.Count=0 then Exit;

  if MGView.Selected.Parent=nil then
    begin
      ParentSelected;
    end else
  //showMessage(TeTreeView2.Selected.Text);
  case SortType of
    stByArtist: begin
        AllSongs.FindSongs(MediaSongs, MGView.Selected.Parent.Text, MGView.Selected.Text);
      end;
    stByAlbum: begin
        AllSongs.FindSongs(MediaSongs, MGView.Selected.Text, MGView.Selected.Parent.Text);
      end;
    stByYear: FindSongsByYear(MediaSongs, AllSongs, MGView.Selected.Parent.Text, MGView.Selected.Text);
    stByGenre: FindSongsByGenre(MediaSongs, AllSongs, MGView.Selected.Parent.Text, MGView.Selected.Text);
  end;

  AssignMedia;
end;

procedure TKSPMainWindow.MsortTypeClick(Sender: TObject);
begin
  if MSortType.Selected=nil then Exit;
  DoThingOnMediaLib(MSortType.Selected.Parent.Index, MSortType.Selected.Index);
end;

procedure TKSPMainWindow.Savewholeplaylistasbookmark1Click(Sender: TObject);
var
  p: TBookmarkItem;
  Pls:TXMLPlayList;
  bName: string;
  i: integer;
begin
  ForceDirectories(KSPDataFolder+'bookmarks');

  for i:=0 to MaxInt do
    if not FileExists(KSPDataFolder+'bookmarks\bookmark'+IntToStr(i)+'.kpl') then
      begin
        bName:=KSPDataFolder+'bookmarks\bookmark'+IntToStr(i)+'.kpl';
        Break;
      end;

  p.Name:=InputBox(SInputBookmarkCaption, SInputBookmarkPrompt, ExtractFileName(bName));

  if p.Name='' then Exit;

  Pls:=TXMLPlayList.create;
  Pls.SavePls(PlayList, bName);
  Pls.Free;

  p.URL:=bName;
  BookmarksList.Add(p);
  RefreshBookmarks;
end;

procedure TKSPMainWindow.ShuffleButtonChange(Sender: TObject);
begin
  Shuffled:=ShuffleButton.Checked;
end;

procedure TKSPMainWindow.SpeedButton1Click(Sender: TObject);
begin
  WebView.LoadURL(IMAddress.Text);
end;

procedure TKSPMainWindow.TabSheet3Resize(Sender: TObject);
begin
  MainWebView.SetDimensions(TabSheet3.Width, TabSheet3.Height);
end;


procedure TKSPMainWindow.TBChange(Sender: TObject);
begin
  Player.Volume:=TB.Position;// else
end;

procedure TKSPMainWindow.PosBarChange(Sender: TObject);
var
   SongPos : DWORD;
begin
  if Seeking then begin
   if Player.Seekable then
   begin
      Seeking:=false;
      SongPos := Trunc((DWORD(PosBar.Position) * Player.PlayLength) / DWORD(PosBar.Max));
      //BassPlayer.Pause(true);
//      Player.Pause(true);
      Player.Position := SongPos;
//      Player.Pause(false);
      //BassPlayer.Pause(false);
      Seeking:=true;
   end;
  end;

  //spTrayIcon1.Icon:=SysIconDefault;
  //Lines:=Round((PosBar.Value/PosBar.MaxValue)*SysIconDefault.Height);
  //bmptosepia(Lines, 0);
end;

procedure TKSPMainWindow.PosBarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Seeking:=true;
end;

procedure TKSPMainWindow.PosBarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Seeking:=false;
end;

procedure TKSPMainWindow.Timer_statTimer(Sender: TObject);
var
  s: string;
begin
  if Player.PlayLength=0 then Exit;
  if Player.PlayLength>(1000 * 60 * 60) then s:='hh:nn:ss' else s:='nn:ss';

   Timer_Stat.Enabled := false;
    case TimeFormat of
      tfElapsed: lLeft.Caption := FormatDateTime (s, Player.Position / (1000 * 24 * 60 * 60));
      tfRemain: lLeft.Caption := FormatDateTime (s, (Player.PlayLength-Player.Position) / (1000 * 24 * 60 * 60));
    end;



    if not Seeking and (Player.Mode <> plmStopped) then begin
    //if (BassPlayer.PlayLength > 0)  then
    //        lTime2.Caption:='Elapsed';
            PosBar.Position := (Player.Position * PosBar.Max) div Player.PlayLength end;// else


   Timer_Stat.Enabled := true;
end;

procedure TKSPMainWindow.BalanceChange(Sender: TObject);
var
  s: string;
  i: integer;
begin
  Player.SetPan((Balance.Position / 100)-1);
  i:=Balance.Position div 100;
  if i<0 then
    s:=Format(SToLeftOutput, [IntToStr(i)]) else
  if i>0 then
    s:=Format(SToRightOutput, [IntToStr(i)]) else
  s:=SToCenterOutput;
  Balance.Hint:=s;
end;

procedure TKSPMainWindow.ToolButton1Click(Sender: TObject);
var
  s: string;
begin
  s:=lbPlaylist.Items.Strings[CurrentIndex];
//  Delete(s, 1, Length(SPlaying)+1);
  lbPlaylist.Items.Strings[CurrentIndex]:=s;

  if CurrentIndex >= 1 then
    CurrentIndex := CurrentIndex-1;
  CurrentFile := lbPlaylist.Items.Strings[CurrentIndex];
  ResetDisplay;
  PlayFile;
end;

procedure TKSPMainWindow.ToolButton4Click(Sender: TObject);
var
  s: string;
begin
  s:=lbPlaylist.Items.Strings[CurrentIndex];
//  Delete(s, 1, Length(SPlaying)+1);
  lbPlaylist.Items.Strings[CurrentIndex]:=s;

  if lbPlaylist.Items.Count-1 > CurrentIndex then
    CurrentIndex := CurrentIndex+1;
  CurrentFile := lbPlaylist.Items.Strings[CurrentIndex];
  ResetDisplay;
  PlayFile;
end;

procedure TKSPMainWindow.TrayIcon1Click(Sender: TObject);
begin
  if ApplicationVisible then begin
            //Self.Hide;:=;//.MinimizeToTray;
            Hide;
            ApplicationVisible:=false;
            Self.ShowInTaskBar:=stNever;
         end else begin
            Self.ShowInTaskBar:=stAlways;
            ApplicationVisible:=true;
            Show;
         end;
end;

procedure TKSPMainWindow.ResetDisplay;
begin
  lFilename.Caption := MinimizeName(Format(SFile+'%s',[ExtractFileName(CurrentFile)]), lFilename.Canvas, lFilename.Width);

  {if (CurrentIndex<PlayItems.Count)
  and (CurrentIndex>=0) then}

  TrayIcon1.Hint:='KSP';//TeLabel2.Caption;
end;

procedure TKSPMainWindow.AddToPlayList(fname: string; IgnoreLoadPls: boolean = false);
var
  p: TPLEntry;
  lack: integer;
  s: string;
  Pc: TPathChar;
  GetIsTag: boolean;
begin
  if not IgnoreLoadPls then
    if LoadingPlaylist then Exit;

  hLog.Send('Adding item: '+fname);
          StrPCopy(Pc, fname);
          lack:=0;
          if (not FileExists(fname))and (not IsStream(Pc)) and
            (not IsCD(Pc))or(IsPlaylist(fname)) then Exit;
          hLog.Send('('+fname+'): Reading info');
          p.Stream:=GetStreamInfoSimple(fname, GetIsTag);

{If local file and not cd track then get tag}

          if not IsStream(Pc) then begin
              if not IsCD(Pc) then
                p.Tag:=GetFromInfo(p.Stream, lack);
              p.Tag.IsTag:=GetIsTag;
            end else p.Tag.Title:=ExtractFileName(fname);

          p.FileName:=fname;
          hLog.Send('('+fname+'): Info read');
          PlayList.Add(p);
          hLog.Send('('+fname+'): Adding to playlist');

          s:=ProduceFormatedString(FormatedPlayListInfo, p.Tag, p.Stream.Duration,
            lbPlayList.Items.Count+1);
          hLog.Send('('+fname+'): String produced');

          lbPlayList.Items.Add(s);
//{$IFDEF USECHECKED}
//          lbPlayList.State[lbPlayList.Items.Count-1]:=cbUnchecked;
//{$ENDIF}

          PlayListTotalTime;
          hLog.Send('('+fname+'): Item added');
end;

procedure TKSPMainWindow.PlayListTotalTime;
var
  Total: Int64;
  i: Integer;
  Days: integer;
  s: string;
begin
  Total:=0;
  //InfoBase.Active:=true;
  if PlayList.Count>0 then
  for i:= 0 to PlayList.Count-1 do begin
//      InfoBase1.RenderFile(PlayList.GetItem(i).FileName);
      Total:=Total+(GetDuration(PlayList.GetItem(i)^.Stream));
    end;
//ShowMessage(FloatToStr(Total / (1000 * 24 * 60 * 60)));
  //InfoBase.Active:=false;
  if Total>(1000 * 60 * 60 * 24) then begin
    Days:=Total div (1000 * 60 * 60 * 24);
    Total:=Total mod (1000 * 60 * 60 * 24);
    if Days<10 then
      s:='0'+IntToStr(Days) else s:=IntToStr(Days);
    s:=s+':';
    TotalTimeLabel.Caption:=s+FormatDateTime ('hh:nn:ss', Total / (1000 * 24 * 60 * 60));
  end
  else if Total>(1000 * 60 * 60) then
    TotalTimeLabel.Caption:=FormatDateTime ('hh:nn:ss', Total / (1000 * 24 * 60 * 60))
  else
    TotalTimeLabel.Caption:=FormatDateTime ('nn:ss', Total / (1000 * 24 * 60 * 60));

end;

procedure TKSPMainWindow.WndProc(var m: TLMessage);
begin
  try
    if Player<>nil then
      Player.ProcMessage(m);
  except
  end;
  inherited WndProc(m);
end;

procedure TKSPMainWindow.ScanFolders(Force: boolean);
begin
  if Force then
  while Self.WaitForB>1 do begin
    // wait infinitely (until B wakes A)

//    writeln('A: ThreadB.Counter='+IntToStr(Form1.ThreadB.Counter));
  end else while Self.WaitForB>0 do begin
    // wait infinitely (until B wakes A)

//    writeln('A: ThreadB.Counter='+IntToStr(Form1.ThreadB.Counter));
  end;

  SongsInLib:=0;
  GetCountSem2 := 1;//CreateSemaphore(nil, 0,1,'MediaLibGetCount');
  FoldersScan:=TFoldersScanThread.Create(true);
  FoldersScan.ForceRescan:=Force;
  FoldersScan.Resume;
//  ReleaseSemaphore(GetCountSem, 1, nil);
  repeat
    Sleep(500);//Result := WaitForSingleObject(GetCountSem, 2000);
  until GetCountSem2=0;
end;

procedure TKSPMainWindow.DoThingOnMediaLib(Par, Chi: Integer);

  procedure ShowCompressedByArtist;
  var
    s2: TStringList;
    MyTreeNode1: TTreeNode;
    i, x: integer;
    s: TCrossList;
  begin
    SortType:=stByArtist;
    MGView.Items.Clear;
    s:=TCrossList.Create;
    s2:=TStringList.Create;
    //ReturnAlbums(s2, AllSongs);
    ReturnArtists(s, AllSongs);
    MediaBuild.Max:=s.Count;
    MediaBuild.Position:=0;
    if s.Count>0 then
      for i:=0 to s.Count-1 do with MGView.Items do begin
         if TCrossEntry(s.Items[i]).Name='' then
            TCrossEntry(s.Items[i]).Name:=SUnknownArtist;
         MyTreeNode1 := Add(nil, TCrossEntry(s.Items[i]).Name); { Add a root node }
         //Log.WriteLogFile(TCrossEntry(s.Items[i]).Name+' '+IntToStr(i));
         //ReturnAlbums(s2, AllSongs, s.Strings[i]);
         s2:=TCrossEntry(s.Items[i]).SubList;

         MediaBuild.Position:=MediaBuild.Position+1;
         if s2.Count>0 then
           for x:=0 to s2.Count-1 do begin
             if s2.Strings[x]='' then s2.Strings[x]:=SUnknownAlbum;
             AddChild(MyTreeNode1,s2.Strings[x]);
           end;
        end;

    s.Free;
    s2.Free;
  end;

  procedure ShowCompressedByAlbum;
  var
    s2: TStringList;
    MyTreeNode1: TTreeNode;
    i, x: integer;
    s: TCrossList;
  begin
    SortType:=stByAlbum;
    MGView.Items.Clear;
    s:=TCrossList.Create;
    s2:=TStringList.Create;
    ReturnAlbums(s, AllSongs);
    MediaBuild.Max:=s.Count;
    MediaBuild.Position:=0;
    if s.Count>0 then
      for i:=0 to s.Count-1 do with MGView.Items do begin
          if TCrossEntry(s.Items[i]).Name='' then TCrossEntry(s.Items[i]).Name:=SUnknownAlbum;
         MyTreeNode1 := Add(nil, TCrossEntry(s.Items[i]).Name); { Add a root node }
         //ReturnArtists(s2, AllSongs, s.Strings[i]);
         s2:=TCrossEntry(s.Items[i]).SubList;
         MediaBuild.Position:=MediaBuild.Position+1;
         if s2.Count>0 then
           for x:=0 to s2.Count-1 do begin
              if s2.Strings[x]='' then s2.Strings[x]:=SUnknownArtist;
              AddChild(MyTreeNode1,s2.Strings[x]);
            end;
        end;

    s.Free;
    s2.Free;
  end;

  procedure ShowCompressedByYear;
  var
    s2: TStringList;
    MyTreeNode1: TTreeNode;
    i, x: integer;
    s: TCrossList;
  begin
    SortType:=stByYear;
    MGView.Items.Clear;
    s:=TCrossList.Create;
    s2:=TStringList.Create;
    ReturnYears(s, AllSongs);
    MediaBuild.Max:=s.Count;
    MediaBuild.Position:=0;
    if s.Count>0 then
      for i:=0 to s.Count-1 do with MGView.Items do begin
         MyTreeNode1 := Add(nil, TCrossEntry(s.Items[i]).Name); { Add a root node }
         s2:=TCrossEntry(s.Items[i]).SubList;
         MediaBuild.Position:=MediaBuild.Position+1;
         if s2.Count>0 then
           for x:=0 to s2.Count-1 do
             AddChild(MyTreeNode1,s2.Strings[x]);
        end;

    s.Free;
    s2.Free;
  end;

  procedure ShowCompressedByGenre;
  var
    s2: TStringList;
    MyTreeNode1: TTreeNode;
    i, x: integer;
    s: TCrossList;
  begin
    SortType:=stByGenre;
    MGView.Items.Clear;
    s:=TCrossList.Create;
    s2:=TStringList.Create;
    ReturnGenres(s, AllSongs);
    MediaBuild.Max:=s.Count;
    MediaBuild.Position:=0;
    if s.Count>0 then
      for i:=0 to s.Count-1 do with MGView.Items do begin
         MyTreeNode1 := Add(nil, TCrossEntry(s.Items[i]).Name); { Add a root node }
         s2:=TCrossEntry(s.Items[i]).SubList;
         MediaBuild.Position:=MediaBuild.Position+1;
         if s2.Count>0 then
           for x:=0 to s2.Count-1 do
             AddChild(MyTreeNode1,s2.Strings[x]);
        end;

    s.Free;
    s2.Free;
  end;

  procedure ShowCompressed;
  begin
    case Chi of
      0: ShowCompressedByArtist;
      1: ShowCompressedByAlbum;
      2: ShowCompressedByYear;
      3: ShowCompressedByGenre;
    end;
  end;

begin
//  if Frame11.TeTreeView1.Items.Count=0 then Exit;
//  if Frame11.TeTreeView1.Selected.Parent=nil then Exit;
  if Par=-1 then Exit;
  LastMediaLibTag:=Par;

  case Par of
    0: ShowCompressed;
  end;

end;

procedure TKSPMainWindow.AssignMedia;
var
  i: integer;
begin
  if (SortType<>stByArtist)
    and (SortType<>stByAlbum)
    and (SortType<>stByYear)
    and (SortType<>stByGenre) then Exit;

  MIView.Clear;
  if MediaSongs.Count=0 then Exit;
  for i:=0 to MediaSongs.Count-1 do begin
      if MediaSongs.GetItem(i)^.Tag.Title<>'' then
        MIView.Items.Add(MediaSongs.GetItem(i)^.Tag.Title)
      else MIView.Items.Add(MediaSongs.GetItem(i)^.FileName);
    end;
end;

procedure TKSPMainWindow.RemoveFromPlayList(Index: integer);
begin

  if Index<CurrentIndex then Dec(CurrentIndex);
  if Index<PreviousIndex then Dec(PreviousIndex);

  PlayList.Remove(Index);
  lbPlayList.Items.Delete(Index);

  PlayListTotalTime;
end;

procedure TKSPMainWindow.ClearPlayList;
begin
  PlayList.Clear;
  lbPlayList.Items.Clear;
end;

procedure TKSPMainWindow.LoadOptions;
var
  XMLFile: TIniFile;
//  aTimer : TQTimer;


  procedure LoadAudioSettings;
  begin
    KSPMainWindow.Balance.Position:=XMLFile.ReadInteger('Audio', 'Pan', 0);
  end;

  procedure LoadVars;
  begin
    KSPMainWindow.Shuffled:=XMLFile.ReadBool('Vars', 'Shuffled', KSPMainWindow.Shuffled);
    case XMLFile.ReadInteger('Vars', 'Repeat', 0) of
      0:  KSPMainWindow.RepeatType:=rtNone;
      1:  KSPMainWindow.RepeatType:=rtOne;
      2:  KSPMainWindow.RepeatType:=rtAll;
    end;
    self.ShowSplash:=XMLFile.ReadBool('Vars', 'Splash', true);

    LastOpenDir:=XMLFile.ReadString('General', 'LastFolder', ExtractFilePath(Application.ExeName));
    KSPMainWindow.SDD.InitialDir:=LastOpenDir;//XMLFile.ReadString('Vars', 'CurrentFolder', ExtractFilePath(Application.ExeName));
    KSPMainWindow.OpenDialog1.InitialDir:=LastOpenDir;//SaveDialog.InitialDir;

    case XMLFile.ReadInteger('General', 'TimeFormat', 1) of
      0: KSPMainWindow.TimeFormat:=tfRemain;
      1: KSPMainWindow.TimeFormat:=tfElapsed;
    end;

    ShowAlertOnNewSongPlayed:=XMLFile.ReadBool('Alerts', 'OnNewSongPlayed', true);

    Application.ProcessMessages;
{     }
  end;

{  procedure LoadDocked;
  begin
    KSPSetupStates.DockedItems.Playlist:=XMLFile.ReadBool('Docked', 'Playlist', false);
    KSPSetupStates.DockedItems.Info:=XMLFile.ReadBool('Docked', 'Info', false);
    KSPSetupStates.DockedItems.StreamInfo:=XMLFile.ReadBool('Docked', 'StreamInfo', false);
    KSPSetupStates.DockedItems.SuggOptions:=XMLFile.ReadBool('Docked', 'SuggOptions', false);
  end; }

  procedure LoadState;
  begin
    KSPMainWindow.Top:=XMLFile.ReadInteger('Main window', 'top', KSPMainWindow.Top);
    KSPMainWindow.Left:=XMLFile.ReadInteger('Main window', 'left', KSPMainWindow.Left);
    KSPMainWindow.Height:=XMLFile.ReadInteger('Main window', 'height', KSPMainWindow.Height);
    KSPMainWindow.Width:=XMLFile.ReadInteger('Main window', 'width', KSPMainWindow.Width);
    KSPMainWindow.Update;

    lbPlaylist.Width:=XMLFile.ReadInteger('Main Window', 'PlsInfoBox', 300);
    KSPMainWindow.MSortType.Width:=XMLFile.ReadInteger('Main Window', 'MediaLibPanelSize', KSPMainWindow.MSortType.Width);
    KSPMainWindow.MIView.Height:=XMLFile.ReadInteger('Main Window', 'MediaLibLibHeaderPanelHeight', KSPMainWindow.MIView.Height);

    //TePageControl1.ActivePageIndex:=XMLFile.ReadInteger('Main window', 'Main page control', TePageControl1.ActivePageIndex);
    KSPMainWindow.TB.Position:=XMLFile.ReadInteger('Main window', 'Volume', Player.Volume);

    KSPMainWindow.TBChange(Self);
  end;

  procedure FormatANSICTags(var Text: string);
  var
    i: integer;
  begin
    i:=Pos('\n', Text);
    if i>0 then
      repeat
        Delete(Text, i, 2);
        Insert(#13, Text, i);
        i:=PosEx('\n', Text, i);
      until i=0;
  end;

  procedure LoadFormat;
  var
    s: string;
  begin
    s:=XMLFile.ReadString('Format', 'PlayList', CDefPlaylistFormat);
    if s<>'' then KSPMainWindow.FormatedPlayListInfo:=s else
      KSPMainWindow.FormatedPlayListInfo:=CDefPlaylistFormat;
    s:=XMLFile.ReadString('Format', 'Hint', CFormatedHintInfo);
    if s<>'' then KSPMainWindow.FormatedHintInfo:=s else
      KSPMainWindow.FormatedHintInfo:=CFormatedHintInfo;
    s:=XMLFile.ReadString('Format', 'PlaylistHint', CFormatedHintInfoPls);
    if s<>'' then KSPMainWindow.FormatedPlaylistHintInfo:=s else
      KSPMainWindow.FormatedPlaylistHintInfo:=CFormatedHintInfoPls;
    FormatANSICTags(KSPMainWindow.FormatedPlaylistHintInfo);
  end;

  procedure LoadEqualizer;
  begin
    KSPSetupStates.KSPOptions.Equalizer.Enabled:=XMLFile.ReadBool('Equalizer', 'Enabled', false);
    KSPSetupStates.KSPOptions.Equalizer.e0:=XMLFile.ReadInteger('Equalizer', 'eq0', 0);
    KSPSetupStates.KSPOptions.Equalizer.e1:=XMLFile.ReadInteger('Equalizer', 'eq1', 0);
    KSPSetupStates.KSPOptions.Equalizer.e2:=XMLFile.ReadInteger('Equalizer', 'eq2', 0);
    KSPSetupStates.KSPOptions.Equalizer.e3:=XMLFile.ReadInteger('Equalizer', 'eq3', 0);
    KSPSetupStates.KSPOptions.Equalizer.e4:=XMLFile.ReadInteger('Equalizer', 'eq4', 0);
    KSPSetupStates.KSPOptions.Equalizer.e5:=XMLFile.ReadInteger('Equalizer', 'eq5', 0);
    KSPSetupStates.KSPOptions.Equalizer.e6:=XMLFile.ReadInteger('Equalizer', 'eq6', 0);
    KSPSetupStates.KSPOptions.Equalizer.e7:=XMLFile.ReadInteger('Equalizer', 'eq7', 0);
    KSPSetupStates.KSPOptions.Equalizer.e8:=XMLFile.ReadInteger('Equalizer', 'eq8', 0);
    KSPSetupStates.KSPOptions.Equalizer.e9:=XMLFile.ReadInteger('Equalizer', 'eq9', 0);
    KSPSetupStates.KSPOptions.Equalizer.Visible:=XMLFile.ReadBool('Equalizer', 'Visible', false);

    KSPMainWindow.EQGains[0] := KSPSetupStates.KSPOptions.Equalizer.e0 / 2;
    KSPMainWindow.EQGains[1] := KSPSetupStates.KSPOptions.Equalizer.e1 / 2;
    KSPMainWindow.EQGains[2] := KSPSetupStates.KSPOptions.Equalizer.e2 / 2;
    KSPMainWindow.EQGains[3] := KSPSetupStates.KSPOptions.Equalizer.e3 / 2;
    KSPMainWindow.EQGains[4] := KSPSetupStates.KSPOptions.Equalizer.e4 / 2;
    KSPMainWindow.EQGains[5] := KSPSetupStates.KSPOptions.Equalizer.e5 / 2;
    KSPMainWindow.EQGains[6] := KSPSetupStates.KSPOptions.Equalizer.e6 / 2;
    KSPMainWindow.EQGains[7] := KSPSetupStates.KSPOptions.Equalizer.e7 / 2;
    KSPMainWindow.EQGains[8] := KSPSetupStates.KSPOptions.Equalizer.e8 / 2;
    KSPMainWindow.EQGains[9] := KSPSetupStates.KSPOptions.Equalizer.e9 / 2;

    Player.SetAEQGain(0, KSPMainWindow.EQGains[0]);
    Player.SetAEQGain(1, KSPMainWindow.EQGains[1]);
    Player.SetAEQGain(2, KSPMainWindow.EQGains[2]);
    Player.SetAEQGain(3, KSPMainWindow.EQGains[3]);
    Player.SetAEQGain(4, KSPMainWindow.EQGains[4]);
    Player.SetAEQGain(5, KSPMainWindow.EQGains[5]);
    Player.SetAEQGain(6, KSPMainWindow.EQGains[6]);
    Player.SetAEQGain(7, KSPMainWindow.EQGains[7]);
    Player.SetAEQGain(8, KSPMainWindow.EQGains[8]);
    Player.SetAEQGain(9, KSPMainWindow.EQGains[9]);

    if KSPSetupStates.KSPOptions.Equalizer.Enabled then
      Player.SoundEffects := Player.SoundEffects + [Equalizer]
    else
      Player.SoundEffects := Player.SoundEffects - [Equalizer];
  end;

begin
  if SetupFileName='' then
    SetupFileName:=KSPDataFolder+DefSetupFileName;
  XMLFile:=TIniFile.Create(SetupFileName);
  LoadVars;
  LoadState;
  LoadFormat;
  LoadEqualizer;
  LoadAudioSettings;
  XMLFile.Free;
end;

procedure TKSPMainWindow.SaveOptions;
var
  XMLFile: TIniFile;

  procedure SaveAudioSettings;
  begin
    XMLFile.EraseSection('Audio');

    XMLFile.WriteInteger('Audio', 'Pan', Balance.Position);
  end;

  procedure SaveVars;
  begin
    XMLFile.EraseSection('Vars');
    XMLFile.WriteBool('Vars', 'Shuffled', Shuffled);
    XMLFile.WriteBool('Vars', 'Splash', Self.ShowSplash);
    case RepeatType of
      rtNone: XMLFile.WriteInteger('Vars', 'Repeat', 0);
      rtOne:  XMLFile.WriteInteger('Vars', 'Repeat', 1);
      rtAll:  XMLFile.WriteInteger('Vars', 'Repeat', 2);
    end;

    XMLFile.EraseSection('General');
    XMLFile.WriteString('General', 'LastFolder', LastOpenDir);

    case TimeFormat of
      tfRemain: XMLFile.WriteInteger('General', 'TimeFormat', 0);
      tfElapsed:  XMLFile.WriteInteger('General', 'TimeFormat', 1);
    end;

    XMLFile.EraseSection('KSP');
    XMLFile.WriteString('KSP', 'Version', KSPVersion2);

    XMLFile.EraseSection('Alerts');
    XMLFile.WriteBool('Alerts', 'OnNewSongPlayed', Self.ShowAlertOnNewSongPlayed);
  end;

{  procedure SaveDocked;
  begin
    XMLFile.EraseSection('Docked');
    XMLFile.WriteBool('Docked', 'Playlist', KSPSetupStates.DockedItems.Playlist);
    XMLFile.WriteBool('Docked', 'Info', KSPSetupStates.DockedItems.Info);
    XMLFile.WriteBool('Docked', 'StreamInfo', KSPSetupStates.DockedItems.StreamInfo);
    XMLFile.WriteBool('Docked', 'SuggOptions', KSPSetupStates.DockedItems.SuggOptions);
  end;  }

  procedure SaveState;
  begin
    XMLFile.EraseSection('Main window');
    XMLFile.WriteInteger('Main window', 'top', Top);
    XMLFile.WriteInteger('Main window', 'left', Left);
    XMLFile.WriteInteger('Main window', 'height', Height);
    XMLFile.WriteInteger('Main window', 'width', Width);

    XMLFile.WriteInteger('Main window', 'Volume', TB.Position);
    XMLFile.WriteInteger('Main Window', 'PlsInfoBox', lbPlaylist.Width);
    XMLFile.WriteInteger('Main Window', 'MediaLibPanelSize', MSortType.Width);

    XMLFile.WriteInteger('Main Window', 'MediaLibLibHeaderPanelHeight', Self.MIView.Height);

  end;

  procedure SaveFormat;
  begin
    XMLFile.EraseSection('Format');
    XMLFile.WriteString('Format', 'PlayList', FormatedPlayListInfo);//XMLFile.ReadString('Format', 'PlayList', CDefPlaylistFormat);
    XMLFile.WriteString('Format', 'Hint', FormatedHintInfo);
    XMLFile.WriteString('Format', 'PlaylistHint', FormatedPlaylistHintInfo);
  end;

  procedure SaveEqualizer;
  begin
    XMLFile.EraseSection('Equalizer');
    XMLFile.WriteBool('Equalizer', 'Enabled', Self.KSPSetupStates.KSPOptions.Equalizer.Enabled);
    XMLFile.WriteInteger('Equalizer', 'eq0', Self.KSPSetupStates.KSPOptions.Equalizer.e0);
    XMLFile.WriteInteger('Equalizer', 'eq1', Self.KSPSetupStates.KSPOptions.Equalizer.e1);
    XMLFile.WriteInteger('Equalizer', 'eq2', Self.KSPSetupStates.KSPOptions.Equalizer.e2);
    XMLFile.WriteInteger('Equalizer', 'eq3', Self.KSPSetupStates.KSPOptions.Equalizer.e3);
    XMLFile.WriteInteger('Equalizer', 'eq4', Self.KSPSetupStates.KSPOptions.Equalizer.e4);
    XMLFile.WriteInteger('Equalizer', 'eq5', Self.KSPSetupStates.KSPOptions.Equalizer.e5);
    XMLFile.WriteInteger('Equalizer', 'eq6', Self.KSPSetupStates.KSPOptions.Equalizer.e6);
    XMLFile.WriteInteger('Equalizer', 'eq7', Self.KSPSetupStates.KSPOptions.Equalizer.e7);
    XMLFile.WriteInteger('Equalizer', 'eq8', Self.KSPSetupStates.KSPOptions.Equalizer.e8);
    XMLFile.WriteInteger('Equalizer', 'eq9', Self.KSPSetupStates.KSPOptions.Equalizer.e9);
    XMLFile.WriteBool('Equalizer', 'Visible', KSPSetupStates.KSPOptions.Equalizer.Visible);
  end;

begin
  XMLFile:=TIniFile.Create(SetupFileName);
  SaveVars;
  //SaveDocked;
  SaveState;
  SaveFormat;
  SaveEqualizer;
  SaveAudioSettings;
  XMLFile.UpdateFile;
  XMLFile.Free;
end;

procedure TKSPMainWindow.SortByTrackPLS;
begin
  Playlist.SortPlaylist(pstTrack);
  LoadToLB;
end;

procedure TKSPMainWindow.SortByArtistPLS;
begin
  Playlist.SortPlaylist(pstArtist);
  LoadToLB;
end;

procedure TKSPMainWindow.SortByAlbumPLS;
begin
  Playlist.SortPlaylist(pstAlbum);
  LoadToLB;
end;

procedure TKSPMainWindow.SortByYearPLS;
begin
  Playlist.SortPlaylist(pstYear);
  LoadToLB;
end;

procedure TKSPMainWindow.SortByFileNamePLS;
begin
  Playlist.SortPlaylist(pstFileName);
  LoadToLB;
end;

procedure TKSPMainWindow.SortByGenrePLS;
begin
  Playlist.SortPlaylist(pstGenre);
  LoadToLB;
end;

procedure TKSPMainWindow.LoadToLB;
var
  i: integer;
  s: string;
  p: PPLEntry;
begin
  lbPlaylist.Clear;

  for i:=0 to PlayList.Count-1 do
    begin
      p:=PlayList.GetItem(i);
      s:=ProduceFormatedString(FormatedPlayListInfo, p^.Tag, GetDuration(p^.FileName),
        i+1);

      lbPlayList.Items.Add(s);

//{$IFDEF USECHECKED}
      lbPlayList.State[lbPlayList.Items.Count-1]:=cbUnchecked;
//{$ENDIF}
    end;

  if not FStopped and (CurrentIndex>-1) then
    lbPlayList.Items.Strings[CurrentIndex]:=lbPlayList.Items.Strings[CurrentIndex];

end;

procedure TKSPMainWindow.DatabaseSetupDialog;
var
  OptForm: TKSPOptions;
begin
//  hLog.Add('Showing application options');
  OptForm:=TKSPOptions.Create(nil);
  OptForm.ShowModal;
  OptForm.Free;
//  hLog.Add('Aplication options window closed');
end;

procedure TKSPMainWindow.SetupWebBrowserIC;
var
  WebViewHook     : QWebView_hookH;
  Method          : TMethod;

begin
//  HandleIC:=QWidget_Create(nil, 0);

  // VBox
//  VBox:=QVBoxLayout_create(HandleIC);

  // WebView
  WebView:=TWebView.Create(KSPMainWindow.Panel7, 'http://dir.xiph.org/index.php');
  WebView.SetDimensions(Panel7.Width, Panel7.Height);
  MainWebView:=TWebView.Create(Self.TabSheet3, KSPHost);
  MainWebView.SetDimensions(TabSheet3.Width, TabSheet3.Height);

  HistoryWebView:=TWebView.Create(Self.History, ExtractFilePath(Application.ExeName)+'history.html');
  HistoryWebView.SetDimensions(History.Width, History.Height);

  QWebView_linkClicked_Event(Method):=@ICLinkClicked;
  WebViewHook:=QWebView_hook_create(Webview.Handle);
  QWebView_hook_hook_linkClicked(WebViewHook,Method);

  QWebView_loadProgress_Event(Method):=@IMProgressChange;
  WebViewHook:=QWebView_hook_create(Webview.Handle);
  QWebView_hook_hook_loadProgress(WebViewHook,Method);

  QWebPage_setLinkDelegationPolicy(QWebView_Page(WebView.Handle),QWebPageDelegateExternalLinks);

end;

procedure TKSPMainWindow.ICLinkClicked(Value: QUrlH); cdecl;
var
  URL,URL2: widestring;
  sl: TStringList;
  s: string;
begin
  QUrl_toString(Value, @URL2);

  URL:=URl2;
  if IsPlaylist(URL) then begin
    s:=ExtractFileName(URL);
    sl:=TStringList.Create;
    kspfiles.DownloadURLi(URL, sl);
    ForceDirectories(KSPDataFolder+'temp');
    sl.SaveToFile(KSPDataFolder+'temp\'+s);
    Self.ClearPlayList;
    LoadPls(KSPDataFolder+'temp\'+s);
    sl.Free;
  end else WebView.LoadURL(URL);

//  ShowMessage(URL);
//  Self.PerformFileOpen();

end;

procedure TKSPMainWindow.IMProgressChange(progress: Integer); cdecl;
begin
  IMProgress.Position:=Progress;
end;

procedure TKSPMainWindow.RefreshBookmarks;
var
  i: integer;
  t:TMenuItem;
begin
  for i := BookmarksMenu.Count - 1 downto 0 do
    begin
      if (BookmarksMenu.Items[i]=Savewholeplaylistasbookmark1)or
        (BookmarksMenu.Items[i]=AddCurrentFromPlaylist1)or
        (BookmarksMenu.Items[i]=AddSelectedFromPlaylist1)or
        (BookmarksMenu.Items[i]=N2) then
          Continue;
      BookmarksMenu.Items[i].Free;
    end;

  for i := Bookmarks1.Count - 1 downto 0 do
    begin
      Bookmarks1.Items[i].Free;
    end;

//    Frame11.BookmarksList.Clear;

    for i := 0 to BookMarksList.Count - 1 do
      begin
        t:=TMenuItem.Create(Self);
        t.Caption:=BookmarksList.GetItem(i).Name;
        t.Tag:=i;
        t.OnClick:=@BookmarkClick;
        //AllSongs.QueryFindNext;
        BookmarksMenu.Add(t);
        //Frame11.BookmarksList.Items.Add(t.Caption);
      end;

  //AllSongs.CloseQuery;
  CopyMenu(BookmarksMenu, Bookmarks1);
  CopyMenu(BookmarksMenu, MenuItem17);
end;

procedure TKSPMainWindow.CopyMenu(Src: TMenuItem; var Dest: TMenuItem);
  var
    i: integer;
    m: TMenuItem;
  begin
    if Src.Count=0 then Exit;
    for i:=0 to Src.Count-1 do begin
        if (not Assigned(Src.Items[i].OnClick)) and
          (Src.Items[i].Action=nil)and
          (Src.Items[i].Count=0) then Continue;
        m:=TMenuItem.Create(Self);
        m.Caption:=Src.Items[i].Caption;
        m.OnClick:=Src.Items[i].OnClick;
        m.Action:=Src.Items[i].Action;
        if m.Action<>nil then
          m.Action.Update;
        CopyMenu(Src.Items[i], m);
        Dest.Add(m);
      end;
  end;

procedure TKSPMainWindow.BookmarkClick(Sender: TObject);
begin
  Self.PerformFileOpen(BookmarksList.GetItem(TMenuItem(Sender).Tag).URL);
end;


procedure TKSPMainWindow.ShowAlert(NotTitle, NotText: widestring);
begin
  if not NotificationVisible(Self.KSPNotification) then begin
    Self.KSPNotification:=ShowNotification(NotTitle, NotText);
    NotificationTimer.Enabled:=true;
  end;
end;

initialization
  {$I main.lrs}

end.

