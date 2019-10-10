unit dialogEditName;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dialogEdit, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmDialogEditName = class(TfmDialogEdit)
    lbName: TLabel;
    edName: TEdit;
  private
    function getNameItem: String;
    procedure setNameItem(const Value: String);
  public
    property NameItem : String read getNameItem write setNameItem;
  end;

implementation

{$R *.dfm}

{ TfmDialogEditName }

function TfmDialogEditName.getNameItem: String;
begin
  Result := edName.Text;
end;

procedure TfmDialogEditName.setNameItem(const Value: String);
begin
  edName.Text := Value;
end;

end.
