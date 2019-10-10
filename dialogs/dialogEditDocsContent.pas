unit dialogEditDocsContent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dialogEdit, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Samples.Spin, datamain;

type
  TfmDialogEditDocsContent = class(TfmDialogEdit)
    lbGoods: TLabel;
    lbCount: TLabel;
    lbPrice: TLabel;
    seCount: TSpinEdit;
    dbcbGoods: TDBLookupComboBox;
    edPrice: TEdit;
  private
    function getContentGoodsID: Integer;
    procedure setContentGoodsID(const Value: Integer);
    function getContentCount: Integer;
    function getContentPrice: Currency;
    procedure setContentCount(const Value: Integer);
    procedure setContentPrice(const Value: Currency);
  public
    property ContentGoodsID : Integer read getContentGoodsID write setContentGoodsID;
    property ContentCount : Integer read getContentCount write setContentCount;
    property ContentPrice : Currency read getContentPrice write setContentPrice;
  end;

implementation

{$R *.dfm}

{ TfmDialogEditDocsContent }

function TfmDialogEditDocsContent.getContentCount: Integer;
begin
  Result := seCount.Value;
end;

function TfmDialogEditDocsContent.getContentGoodsID: Integer;
begin
  Result := dbcbGoods.KeyValue;
end;

function TfmDialogEditDocsContent.getContentPrice: Currency;
begin
  Result := StrToCurr(edPrice.Text);
end;

procedure TfmDialogEditDocsContent.setContentCount(const Value: Integer);
begin
  seCount.Value := Value;
end;

procedure TfmDialogEditDocsContent.setContentGoodsID(const Value: Integer);
begin
  dbcbGoods.KeyValue := Value;
end;

procedure TfmDialogEditDocsContent.setContentPrice(const Value: Currency);
begin
  edPrice.Text := CurrToStr(Value);
end;

end.
