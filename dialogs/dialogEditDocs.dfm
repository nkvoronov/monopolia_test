inherited fmDialogEditDocs: TfmDialogEditDocs
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
  ClientHeight = 97
  ClientWidth = 405
  OnCreate = FormCreate
  ExplicitWidth = 411
  ExplicitHeight = 126
  PixelsPerInch = 96
  TextHeight = 13
  object lbDate: TLabel [0]
    Left = 19
    Top = 12
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
    FocusControl = dtpDate
  end
  object lbClients: TLabel [1]
    Left = 8
    Top = 39
    Width = 37
    Height = 13
    Caption = #1050#1083#1080#1077#1085#1090
    FocusControl = dbcbClients
  end
  inherited pnButtons: TPanel
    Top = 67
    Width = 405
    TabOrder = 2
    ExplicitTop = 67
    ExplicitWidth = 405
    inherited btOK: TButton
      Left = 255
      ExplicitLeft = 255
      ExplicitTop = 0
      ExplicitHeight = 30
    end
    inherited btCancel: TButton
      Left = 330
      ExplicitLeft = 330
      ExplicitTop = 0
      ExplicitHeight = 30
    end
  end
  object dtpDate: TDateTimePicker
    Left = 51
    Top = 8
    Width = 334
    Height = 21
    Date = 43746.000000000000000000
    Time = 43746.000000000000000000
    TabOrder = 0
  end
  object dbcbClients: TDBLookupComboBox
    Left = 51
    Top = 35
    Width = 334
    Height = 21
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = dmMain.dsClientsSelect
    TabOrder = 1
  end
end
