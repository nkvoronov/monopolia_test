unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, datamain, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TfmMain = class(TForm)
    pcMain: TPageControl;
    tsGoods: TTabSheet;
    tsClients: TTabSheet;
    tsDocs: TTabSheet;
    dbgGoods: TDBGrid;
    dbgClients: TDBGrid;
    pnGoods: TPanel;
    pnClients: TPanel;
    pnDocs: TPanel;
    dbgDocs: TDBGrid;
    spLeft: TSplitter;
    btClientsDel: TButton;
    btClientsEdt: TButton;
    btClientsAdd: TButton;
    btGoodsAdd: TButton;
    btGoodsEdt: TButton;
    btGoodsDel: TButton;
    btDocsContentAdd: TButton;
    btDocsContentEdt: TButton;
    btDocsContentDel: TButton;
    dbgDocsContent: TDBGrid;
    btDocsPost: TButton;
    btDocsEdt: TButton;
    btDocsAdd: TButton;
    btDocsDel: TButton;
    btDocsPrint: TButton;
    alMain: TActionList;
    acGoodsAdd: TAction;
    acGoodsEdt: TAction;
    acGoodsDel: TAction;
    acClientsAdd: TAction;
    acClientsEdt: TAction;
    acClientsDel: TAction;
    acDocsAdd: TAction;
    acDocsEdt: TAction;
    acDocsDel: TAction;
    acDocsPost: TAction;
    acDocsPrint: TAction;
    acDocsContentAdd: TAction;
    acDocsContentEdt: TAction;
    acDocsContentDel: TAction;
    pmClients: TPopupMenu;
    pmGoods: TPopupMenu;
    miClientsAdd: TMenuItem;
    miClientsSep: TMenuItem;
    miClientsEdt: TMenuItem;
    miClientsDel: TMenuItem;
    miGoodsAdd: TMenuItem;
    miGoodsSep: TMenuItem;
    miGoodsEdt: TMenuItem;
    miGoodsDel: TMenuItem;
    pmDocs: TPopupMenu;
    pmDocsContent: TPopupMenu;
    miDocsAdd: TMenuItem;
    miDocsSep: TMenuItem;
    miDocsEdt: TMenuItem;
    miDocsDel: TMenuItem;
    miDocsContentAdd: TMenuItem;
    miDocsContentSep: TMenuItem;
    miDocsContentEdt: TMenuItem;
    miDocsContentDel: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure acGoodsAddExecute(Sender: TObject);
    procedure acGoodsEdtExecute(Sender: TObject);
    procedure acGoodsDelExecute(Sender: TObject);
    procedure acClientsAddExecute(Sender: TObject);
    procedure acClientsEdtExecute(Sender: TObject);
    procedure acClientsDelExecute(Sender: TObject);
    procedure acDocsAddExecute(Sender: TObject);
    procedure acDocsEdtExecute(Sender: TObject);
    procedure acDocsDelExecute(Sender: TObject);
    procedure acDocsPostExecute(Sender: TObject);
    procedure acDocsPrintExecute(Sender: TObject);
    procedure acDocsContentAddExecute(Sender: TObject);
    procedure acDocsContentEdtExecute(Sender: TObject);
    procedure acDocsContentDelExecute(Sender: TObject);
    procedure alMainUpdate(Action: TBasicAction; var Handled: Boolean);
  public
    //
  end;

var
  fmMain: TfmMain;

implementation

uses
  dialogEditName,
  dialogEditDocs,
  dialogEditDocsContent;

{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
end;

procedure TfmMain.acClientsAddExecute(Sender: TObject);
var
  dlg : TfmDialogEditName;
begin
  dlg := TfmDialogEditName.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Добавить клиент';
      if ShowModal = mrOK then
        dmMain.EditClients(0, 0, NameItem);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.acClientsDelExecute(Sender: TObject);
begin
  If MessageDlg('Вы действительно хотите удалить этого клиента ?' ,mtConfirmation,[mbYes,mbNo], 0, mbOk)=mrYes then
    dmMain.EditClients(2, dmMain.aqrClients.FieldByName('ID').AsInteger);
end;

procedure TfmMain.acClientsEdtExecute(Sender: TObject);
var
  dlg : TfmDialogEditName;
begin
  dlg := TfmDialogEditName.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Редактировать клиента';
      NameItem := dmMain.aqrClients.FieldByName('NAME').AsString;
      if ShowModal = mrOK then
        dmMain.EditClients(1, dmMain.aqrClients.FieldByName('ID').AsInteger, NameItem);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.acDocsAddExecute(Sender: TObject);
var
  dlg : TfmDialogEditDocs;
begin
  dlg := TfmDialogEditDocs.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Добавить расход';
      if ShowModal = mrOK then
        dmMain.EditDocs(0, 0, DocsClientId, DocsDate);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.acDocsContentAddExecute(Sender: TObject);
var
  dlg : TfmDialogEditDocsContent;
begin
  dlg := TfmDialogEditDocsContent.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Добавить товар';
      if ShowModal = mrOK then
        dmMain.EditDocsContent(0, 0, dmMain.aqrDocs.FieldByName('ID').AsInteger, ContentGoodsID, ContentCount, ContentPrice);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.acDocsContentDelExecute(Sender: TObject);
begin
  If MessageDlg('Вы действительно хотите удалить этот товар ?' ,mtConfirmation,[mbYes,mbNo], 0, mbOk)=mrYes then
    dmMain.EditDocsContent(2, dmMain.aqrDocsContent.FieldByName('ID').AsInteger, dmMain.aqrDocs.FieldByName('id').AsInteger, 0, 0, 0);
end;

procedure TfmMain.acDocsContentEdtExecute(Sender: TObject);
var
  dlg : TfmDialogEditDocsContent;
begin
  dlg := TfmDialogEditDocsContent.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Редактировать товар';
      ContentGoodsID := dmMain.aqrDocsContent.FieldByName('GOOD').AsInteger;
      ContentCount := dmMain.aqrDocsContent.FieldByName('CNT').AsInteger;
      ContentPrice := dmMain.aqrDocsContent.FieldByName('PRICE').AsCurrency;
      if ShowModal = mrOK then
        dmMain.EditDocsContent(1, dmMain.aqrDocsContent.FieldByName('ID').AsInteger, dmMain.aqrDocs.FieldByName('ID').AsInteger, ContentGoodsID, ContentCount, ContentPrice);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.acDocsDelExecute(Sender: TObject);
begin
  If MessageDlg('Вы действительно хотите удалить этот расход ?' ,mtConfirmation,[mbYes,mbNo], 0, mbOk)=mrYes then
    dmMain.EditDocs(2, dmMain.aqrDocs.FieldByName('ID').AsInteger, 0, Now);
end;

procedure TfmMain.acDocsEdtExecute(Sender: TObject);
var
  dlg : TfmDialogEditDocs;
begin
  dlg := TfmDialogEditDocs.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Редактировать расход';
      DocsClientId := dmMain.aqrDocs.FieldByName('CLIENT').AsInteger;
      DocsDate := dmMain.aqrDocs.FieldByName('DATE_DOCS').AsDateTime;
      if ShowModal = mrOK then
        dmMain.EditDocs(1, dmMain.aqrDocs.FieldByName('ID').AsInteger, DocsClientId, DocsDate);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.acDocsPostExecute(Sender: TObject);
begin
  dmMain.SetDocPost(dmMain.aqrDocs.FieldByName('ID').AsInteger);
end;

procedure TfmMain.acDocsPrintExecute(Sender: TObject);
begin
  //PRINT
end;

procedure TfmMain.acGoodsAddExecute(Sender: TObject);
var
  dlg : TfmDialogEditName;
begin
  dlg := TfmDialogEditName.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Добавить товар';
      if ShowModal = mrOK then
        dmMain.EditGoods(0, 0, NameItem);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.acGoodsDelExecute(Sender: TObject);
begin
  If MessageDlg('Вы действительно хотите удалить этот товар ?' ,mtConfirmation,[mbYes,mbNo], 0, mbOk)=mrYes then
    dmMain.EditGoods(2, dmMain.aqrGoods.FieldByName('ID').AsInteger);
end;

procedure TfmMain.acGoodsEdtExecute(Sender: TObject);
var
  dlg : TfmDialogEditName;
begin
  dlg := TfmDialogEditName.Create(Self);
  try
    with dlg do
    begin
      Caption := 'Редактировать товар';
      NameItem := dmMain.aqrGoods.FieldByName('NAME').AsString;
      if ShowModal = mrOK then
        dmMain.EditGoods(1, dmMain.aqrGoods.FieldByName('ID').AsInteger, NameItem);
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfmMain.alMainUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  acDocsDel.Enabled := NOT dmMain.aqrDocs.IsEmpty;
  acDocsEdt.Enabled := NOT dmMain.aqrDocs.IsEmpty;
  acDocsPost.Enabled := (NOT dmMain.aqrDocs.IsEmpty) and (dmMain.aqrDocs.FieldByName('POST').AsInteger = 0);
  acDocsPrint.Enabled := NOT dmMain.aqrDocs.IsEmpty;
  acDocsContentAdd.Enabled := NOT dmMain.aqrDocs.IsEmpty and (dmMain.aqrDocs.FieldByName('POST').AsInteger = 0);
  acDocsContentEdt.Enabled := NOT dmMain.aqrDocsContent.IsEmpty and (dmMain.aqrDocs.FieldByName('POST').AsInteger = 0);
  acDocsContentDel.Enabled := NOT dmMain.aqrDocsContent.IsEmpty and (dmMain.aqrDocs.FieldByName('POST').AsInteger = 0);
  acClientsEdt.Enabled := NOT dmMain.aqrClients.IsEmpty;
  acClientsDel.Enabled := NOT dmMain.aqrClients.IsEmpty;
  acGoodsEdt.Enabled := NOT dmMain.aqrGoods.IsEmpty;
  acGoodsDel.Enabled := NOT dmMain.aqrGoods.IsEmpty;
end;

end.
