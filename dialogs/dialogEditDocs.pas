unit dialogEditDocs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dialogEdit, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.ComCtrls, datamain;

type
  TfmDialogEditDocs = class(TfmDialogEdit)
    dtpDate: TDateTimePicker;
    lbDate: TLabel;
    lbClients: TLabel;
    dbcbClients: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
  private
    function getDocsDate: TDate;
    procedure setDocsDate(const Value: TDate);
    function getDocsClientId: Integer;
    procedure setDocsClientId(const Value: Integer);
  public
    property DocsDate : TDate read getDocsDate write setDocsDate;
    property DocsClientId : Integer read getDocsClientId write setDocsClientId;
  end;

implementation

{$R *.dfm}

{ TfmDialogEditDocs }

procedure TfmDialogEditDocs.FormCreate(Sender: TObject);
begin
  inherited;
  dtpDate.Date := Now;
end;

function TfmDialogEditDocs.getDocsClientId: Integer;
begin
  Result := dbcbClients.KeyValue;
end;

function TfmDialogEditDocs.getDocsDate: TDate;
begin
  Result := dtpDate.Date;
end;

procedure TfmDialogEditDocs.setDocsClientId(const Value: Integer);
begin
  dbcbClients.KeyValue := Value;
end;

procedure TfmDialogEditDocs.setDocsDate(const Value: TDate);
begin
  dtpDate.Date := Value;
end;

end.
