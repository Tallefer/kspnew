unit MediaFolders;

interface

uses Classes, SysUtils, MediaItems, Dialogs, Playlists, ID3Mgmnt, app_db_utils;

type TMediaFolder = record
  Folder: string;
  Name: string;
  Description: string;
  LastScanned: TDateTime;
  ScannedEver: boolean;
  end;

  TMediaFolderItem = class(TObject)
  public
    Entry: TMediaFolder;
  end;

  TMediaFoldersList = class(TList)
  public
    constructor Create;
    destructor Destroy; override;
    function Add(Entry: TMediaFolder): boolean;
    procedure Remove(Index: Integer; var mItems: TAppDBConnection);
    function GetItem(Index: Integer): TMediaFolder;
    procedure ReplaceEntry(Index: Integer; new: TMediaFolder);
    procedure SaveToFile(FileName: string);
    procedure LoadFromFile(FileName: string);
    function FileInFolders(FileName: string): boolean;
  end;

implementation

uses IniFiles, FoldersScan;

constructor TMediaFoldersList.Create;
begin
  inherited Create;
end;

{The Items should be freed here but it isn't. Doesn't matter.
TPlayList is created only once and destroyed only while KSP is
to be closed}

destructor TMediaFoldersList.Destroy;
var
  i: integer;
begin
  for I := 0 to Count-1 do
    TMediaFolderItem(Items[I]).Free;
  inherited Destroy;
end;

function TMediaFoldersList.Add(Entry: TMediaFolder): boolean;
var
  T: TMediaFolderItem;

  function CheckIfExists: boolean;
  var
    i: integer;
  begin
    Result:=false;
    if Self.Count>0 then
      for i:=0 to Self.Count-1 do
        if TMediaFolderItem(Items[i]).Entry.Folder=Entry.Folder then Result:=true;
  end;

begin
  Result:=not CheckIfExists;

  if Result then begin
      T:=TMediaFolderItem.Create;
      T.Entry:=Entry;
      inherited Add(T);
    end;
end;

function TMediaFoldersList.FileInFolders(FileName: string): boolean;
var
  i: integer;
begin
  Result:=false;
  if Count>0 then
    for i:=0 to Count-1 do
      if Pos(UpperCase(GetItem(i).Folder), UpperCase(FileName))>0 then
        Result:=true;
end;

procedure TMediaFoldersList.ReplaceEntry(Index: Integer; new: TMediaFolder);
begin
  TMediaFolderItem(Items[Index]).Entry:=new;
end;

procedure TMediaFoldersList.Remove(Index: Integer; var mItems: TAppDBConnection);
var
  s: string;
  i: integer;
  p: TPLEntry;
  RecCo: integer;
begin
  s:=TMediaFolderItem(Items[Index]).Entry.Folder;

  mItems.OpenQuery('SELECT * FROM meta');
  RecCo:=mItems.ReturnRecordsCount;
  if RecCo>0 then for i:=RecCo-1 downto 0 do
    begin
      mItems.GoToNext;
      p:=mItems.ReadEntry;
      if Pos(s, p.FileName)>-1 then
       mItems.Remove(p.FileName);
    end;

  mItems.CloseQuery;

  TMediaFolderItem(Items[Index]).Free;

  Delete(Index);
end;

function TMediaFoldersList.GetItem(Index: Integer): TMediaFolder;
begin
  Result:=TMediaFolderItem(Items[Index]).Entry;
end;

procedure TMediaFoldersList.SaveToFile(FileName: string);
var
  XMLFile: TIniFile;
  i: integer;
  mf: TMediaFolder;
begin
  if FileExists(FileName) then DeleteFile(FileName);
  if Self.Count=0 then Exit;
  XMLFile:=TIniFile.Create(FileName);
  //XMLFile.Clear;

  for i:=0 to Self.Count-1 do begin
      mf:=TMediaFolderItem(Items[i]).Entry;
      XMLFile.WriteString(IntToStr(i),'Folder',mf.Folder);
      XMLFile.WriteString(IntToStr(i),'Desc',mf.Description);
      XMLFile.WriteString(IntToStr(i),'Name',mf.Name);
      XMLFile.WriteDateTime(IntToStr(i),'LastScanned',mf.LastScanned);
      XMLFile.WriteBool(IntToStr(i),'ScannedEver',mf.ScannedEver);
    end;

  XMLFile.UpdateFile;
  XMLFile.Free;
end;

procedure TMediaFoldersList.LoadFromFile(FileName: string);
var
  XMLFile: TIniFile;
  i: integer;
  mf: TMediaFolder;
  s: TStringList;
begin
  XMLFile:=TIniFile.Create(FileName);
  s:=TStringList.Create;
  XMLFile.ReadSections(s);
  if s.Count=0 then begin
      s.Free;
      XMLFile.Free;
      Exit;
    end;
  //XMLFile.Clear;

  for i:=0 to s.Count-1 do begin
      mf.Folder:=XMLFile.ReadString(IntToStr(i),'Folder','');
      mf.Description:=XMLFile.ReadString(IntToStr(i),'Desc','');
      mf.Name:=XMLFile.ReadString(IntToStr(i),'Name','');
      mf.LastScanned:=XMLFile.ReadDateTime(IntToStr(i),'LastScanned',Now);
      mf.ScannedEver:=XMLFile.ReadBool(IntToStr(i),'ScannedEver',false);
      Add(mf);
    end;

  XMLFile.Free;
end;

end.
