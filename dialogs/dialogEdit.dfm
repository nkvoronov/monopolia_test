object fmDialogEdit: TfmDialogEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 285
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnButtons: TPanel
    Left = 0
    Top = 255
    Width = 404
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 250
    object btOK: TButton
      Left = 254
      Top = 0
      Width = 75
      Height = 30
      Align = alRight
      Caption = 'Ok'
      ModalResult = 1
      TabOrder = 0
      OnClick = btOKClick
      ExplicitLeft = 246
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btCancel: TButton
      Left = 329
      Top = 0
      Width = 75
      Height = 30
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = btCancelClick
      ExplicitLeft = 327
      ExplicitTop = 8
      ExplicitHeight = 25
    end
  end
end
