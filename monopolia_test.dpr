program monopolia_test;

uses
  Vcl.Forms,
  main in 'main\main.pas' {fmMain},
  datamain in 'main\datamain.pas' {dmMain: TDataModule},
  dialogEdit in 'dialogs\dialogEdit.pas' {fmDialogEdit},
  dialogEditName in 'dialogs\dialogEditName.pas' {fmDialogEditName},
  dialogEditDocs in 'dialogs\dialogEditDocs.pas' {fmDialogEditDocs},
  dialogEditDocsContent in 'dialogs\dialogEditDocsContent.pas' {fmDialogEditDocsContent};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
