unit dialogEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmDialogEdit = class(TForm)
    pnButtons: TPanel;
    btOK: TButton;
    btCancel: TButton;
    procedure btOKClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ExecuteOK;
    procedure ExecuteCancel;
  end;

var
  fmDialogEdit: TfmDialogEdit;

implementation

{$R *.dfm}

procedure TfmDialogEdit.btCancelClick(Sender: TObject);
begin
  ExecuteCancel;
end;

procedure TfmDialogEdit.btOKClick(Sender: TObject);
begin
  ExecuteOK;
end;

procedure TfmDialogEdit.ExecuteCancel;
begin
  //
end;

procedure TfmDialogEdit.ExecuteOK;
begin
  //
end;

end.
