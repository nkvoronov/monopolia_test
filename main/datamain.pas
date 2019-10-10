unit datamain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Forms, IniFiles;

type
  TdmMain = class(TDataModule)
    MonopoliaTest: TADOConnection;
    dsDocs: TDataSource;
    dsDocsContent: TDataSource;
    dsGoods: TDataSource;
    dsClients: TDataSource;
    aqrGoods: TADOQuery;
    aqrClients: TADOQuery;
    aqrDocsContent: TADOQuery;
    aqrDocs: TADOQuery;
    comMain: TADOCommand;
    dsClientsSelect: TDataSource;
    aqrClientsSelect: TADOQuery;
    dsGoodsSelect: TDataSource;
    aqrGoodsSelect: TADOQuery;
    aqrDocsID: TAutoIncField;
    aqrDocsDATE_DOCS: TDateTimeField;
    aqrDocsCLIENT: TIntegerField;
    aqrDocsNAME: TStringField;
    aqrDocsSUMM: TBCDField;
    aqrDocsPOST: TStringField;
    aqrDocsContentID: TAutoIncField;
    aqrDocsContentGOOD: TIntegerField;
    aqrDocsContentNAME: TStringField;
    aqrDocsContentCNT: TIntegerField;
    aqrDocsContentPRICE: TBCDField;
    aqrDocsContentSUMM: TBCDField;
    aqrGoodsID: TAutoIncField;
    aqrGoodsNAME: TStringField;
    aqrClientsID: TAutoIncField;
    aqrClientsNAME: TStringField;
    aqrGoodsSelectID: TAutoIncField;
    aqrGoodsSelectNAME: TStringField;
    aqrClientsSelectID: TAutoIncField;
    aqrClientsSelectNAME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure CloseOpenTable(Table : TADOQuery);
  public
    procedure Init;
    procedure LoadSettings;
    procedure EditDocs(EdtType, IdDocs, IdClient : Integer; DocsDate : TDate);
    procedure EditDocsContent(EdtType, IdContent, IdDocs, IdGoods, Count : Integer; Price : Currency);
    procedure EditClients(EdtType, IdClients : Integer; NameClients : String = '');
    procedure EditGoods(EdtType, IdGoods : Integer; NameGoods: String = '');
    procedure RefreshTable(EdtType : Integer; Table : TADOQuery);
    procedure RefreshMasterDetails(EdtType : Integer; Master, Details : TADOQuery);
    procedure SetDocPost(IdDocs : Integer);
  end;

var
  dmMain: TdmMain;

const
  def_conn =
  'Provider=SQLOLEDB.1;' +
  'Data Source=NIKOLAY-VORONOV;' +
  'Initial Catalog=MonopoliaTest;' +
  'Persist Security Info=True;' +
  'User ID=sa;' +
  'Password=Express2019';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.CloseOpenTable(Table: TADOQuery);
var
  bm: TBookmark;
begin
  with Table do
  begin
    if Active then
    begin
      if State in dsEditModes then
        Post;
      bm := GetBookmark;
      try
        Close;
        Open;
        if BookmarkValid(bm) then
          GotoBookmark(bm);
      finally
        if Assigned(bm) then
          FreeBookmark(bm);
      end;
    end;
  end
end;

procedure TdmMain.RefreshMasterDetails(EdtType: Integer; Master, Details: TADOQuery);
var
  bmMaster, bmDetails: TBookmark;
begin
  if Master.Active and Details.Active then
  begin
    if Master.State in dsEditModes then
      Master.Post;
    bmMaster := Master.GetBookmark;
    if Details.State in dsEditModes then
      Details.Post;
    if (EdtType=1) OR (EdtType=2) then
    begin
      if (NOT Details.Eof) AND (EdtType=2) then Details.Prior;
      bmDetails := Details.GetBookmark;
    end;
    try
      Master.Close;
      Details.Close;
      Master.Open;
      Details.Open;
      if Master.BookmarkValid(bmMaster) then
        Master.GotoBookmark(bmMaster);
      if (EdtType=1) OR (EdtType=2) then
      begin
        if Details.BookmarkValid(bmDetails) then
          Details.GotoBookmark(bmDetails);
      end
      else Details.Last;
    finally
      if Assigned(bmMaster) then
        Master.FreeBookmark(bmMaster);
      if Assigned(bmDetails) then
        Details.FreeBookmark(bmDetails);
    end;
  end;
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  Init;
end;

procedure TdmMain.DataModuleDestroy(Sender: TObject);
begin
  try
    MonopoliaTest.Connected := false;
  except
    Application.Terminate;
  end;
end;

procedure TdmMain.EditClients(EdtType, IdClients : Integer; NameClients: String);
begin
  case EdtType of
  0:begin
      comMain.CommandText := 'insert into dbo.CLIENTS (NAME) values(:name);';
      comMain.Parameters.ParamByName('name').Value := NameClients;
    end;
  1:begin
      comMain.CommandText := 'update dbo.CLIENTS set NAME=:name where ID=:id';
      comMain.Parameters.ParamByName('name').Value := NameClients;
      comMain.Parameters.ParamByName('id').Value := IdClients;
    end;
  2:begin
      comMain.CommandText := 'delete from dbo.CLIENTS where ID=:id';
      comMain.Parameters.ParamByName('id').Value := IdClients;
    end;
  end;
  try
    comMain.Execute;
    RefreshTable(EdtType, aqrClients);
  finally
    //
  end;
end;

procedure TdmMain.EditDocs(EdtType, IdDocs, IdClient: Integer; DocsDate: TDate);
begin
  case EdtType of
  0:begin
      comMain.CommandText := 'insert into dbo.DOCS (DATE_DOCS, CLIENT) values(:date_docs, :client);';
      comMain.Parameters.ParamByName('date_docs').Value := DocsDate;
      comMain.Parameters.ParamByName('client').Value := IdClient;
    end;
  1:begin
      comMain.CommandText := 'update dbo.DOCS set DATE_DOCS=:date_docs, CLIENT=:client where ID=:id';
      comMain.Parameters.ParamByName('date_docs').Value := DocsDate;
      comMain.Parameters.ParamByName('client').Value := IdClient;
      comMain.Parameters.ParamByName('id').Value := IdDocs;
    end;
  2:begin
      comMain.CommandText := 'delete from dbo.DOCS where ID=:id';
      comMain.Parameters.ParamByName('id').Value := IdDocs;
    end;
  end;
  try
    comMain.Execute;
    RefreshTable(EdtType, aqrDocs);
    aqrDocsContent.Close;
    aqrDocsContent.Open;
  finally
    //
  end;
end;

procedure TdmMain.EditDocsContent(EdtType, IdContent, IdDocs, IdGoods,
  Count: Integer; Price: Currency);
begin
  case EdtType of
  0:begin
      comMain.CommandText := 'insert into dbo.DOCS_CONTENT (DOC, GOOD, CNT, PRICE) values(:doc, :good, :cnt, :price);';
      comMain.Parameters.ParamByName('doc').Value := IdDocs;
      comMain.Parameters.ParamByName('good').Value := IdGoods;
      comMain.Parameters.ParamByName('cnt').Value := Count;
      comMain.Parameters.ParamByName('price').Value := Price;
    end;
  1:begin
      comMain.CommandText := 'update dbo.DOCS_CONTENT set GOOD=:good, CNT=:count, PRICE=:price where ID=:id';
      comMain.Parameters.ParamByName('good').Value := IdGoods;
      comMain.Parameters.ParamByName('count').Value := Count;
      comMain.Parameters.ParamByName('price').Value := Price;
      comMain.Parameters.ParamByName('id').Value := IdContent;
    end;
  2:begin
      comMain.CommandText := 'delete from dbo.DOCS_CONTENT where ID=:id';
      comMain.Parameters.ParamByName('id').Value := IdContent;
    end;
  end;
  try
    comMain.Execute;
    RefreshMasterDetails(EdtType, aqrDocs, aqrDocsContent);
  finally
    //
  end;
end;

procedure TdmMain.EditGoods(EdtType, IdGoods : Integer; NameGoods: String);
begin
  case EdtType of
  0:begin
      comMain.CommandText := 'insert into dbo.GOODS (NAME) values(:name);';
      comMain.Parameters.ParamByName('name').Value := NameGoods;
    end;
  1:begin
      comMain.CommandText := 'update dbo.GOODS set NAME=:name where ID=:id';
      comMain.Parameters.ParamByName('name').Value := NameGoods;
      comMain.Parameters.ParamByName('id').Value := IdGoods;
    end;
  2:begin
      comMain.CommandText := 'delete from dbo.GOODS where ID=:id';
      comMain.Parameters.ParamByName('id').Value := IdGoods;
    end;
  end;
  try
    comMain.Execute;
    RefreshTable(EdtType, aqrGoods);
  finally
    //
  end;
end;

procedure TdmMain.Init;
begin
  LoadSettings;
  try
    MonopoliaTest.Connected := true;
    aqrClients.Open;
    aqrGoods.Open;
    aqrClientsSelect.Open;
    aqrGoodsSelect.Open;
    aqrDocs.Open;
    aqrDocsContent.Open;
  except
    Application.Terminate;
  end;
end;

procedure TdmMain.LoadSettings;
var
  fileINI: TIniFile;
begin
  fileINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'monopolia_test.ini');
  with fileINI, MonopoliaTest do
  begin
    DefaultDatabase := ReadString('db', 'name', 'MonopoliaTest');
    Provider := 'SQLOLEDB.1';
    ConnectionString := ReadString('db', 'connection', def_conn);
  end;
end;

procedure TdmMain.RefreshTable(EdtType : Integer; Table: TADOQuery);
begin
  case EdtType of
  0:begin
      Table.Close;
      Table.Open;
      Table.Last;
    end;
  1:CloseOpenTable(Table);
  2:begin
      if NOT Table.Eof then Table.Prior;
      CloseOpenTable(Table);
    end;
  end;
end;

procedure TdmMain.SetDocPost(IdDocs: Integer);
begin
  comMain.CommandText := 'update dbo.DOCS set POST=''1'' where ID=:id';
  comMain.Parameters.ParamByName('id').Value := IdDocs;
  try
    comMain.Execute;
    RefreshTable(1, aqrDocs);
  finally
    //
  end;
end;

end.
