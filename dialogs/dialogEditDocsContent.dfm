inherited fmDialogEditDocsContent: TfmDialogEditDocsContent
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
  ClientHeight = 129
  ExplicitHeight = 158
  PixelsPerInch = 96
  TextHeight = 13
  object lbGoods: TLabel [0]
    Left = 38
    Top = 12
    Width = 30
    Height = 13
    Caption = #1058#1086#1074#1072#1088
    FocusControl = dbcbGoods
  end
  object lbCount: TLabel [1]
    Left = 8
    Top = 38
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    FocusControl = seCount
  end
  object lbPrice: TLabel [2]
    Left = 42
    Top = 66
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
    FocusControl = edPrice
  end
  inherited pnButtons: TPanel
    Top = 99
    TabOrder = 3
    ExplicitTop = 99
    inherited btOK: TButton
      ExplicitLeft = 254
      ExplicitTop = 0
      ExplicitHeight = 30
    end
    inherited btCancel: TButton
      ExplicitLeft = 329
      ExplicitTop = 0
      ExplicitHeight = 30
    end
  end
  object seCount: TSpinEdit
    Left = 74
    Top = 35
    Width = 311
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object dbcbGoods: TDBLookupComboBox
    Left = 74
    Top = 8
    Width = 311
    Height = 21
    KeyField = 'ID'
    ListField = 'NAME'
    ListFieldIndex = 1
    ListSource = dmMain.dsGoodsSelect
    TabOrder = 0
  end
  object edPrice: TEdit
    Left = 74
    Top = 63
    Width = 311
    Height = 21
    TabOrder = 2
  end
end
