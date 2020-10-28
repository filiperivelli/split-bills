object frmSend: TfrmSend
  Left = 0
  Top = 0
  Caption = 'Send'
  ClientHeight = 315
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cbbHouse: TComboBox
    Left = 25
    Top = 22
    Width = 281
    Height = 21
    TabOrder = 0
    OnChange = cbbHouseChange
  end
  object redtSend: TRichEdit
    Left = 25
    Top = 72
    Width = 505
    Height = 193
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'redtSend')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Zoom = 100
  end
  object btnCopy: TBitBtn
    Left = 416
    Top = 282
    Width = 114
    Height = 25
    Caption = 'Copy'
    TabOrder = 2
    OnClick = btnCopyClick
  end
  object btnShare: TButton
    Left = 272
    Top = 282
    Width = 107
    Height = 25
    Caption = 'Share'
    TabOrder = 3
    OnClick = btnShareClick
  end
  object qrySend: TFDQuery
    Left = 328
    Top = 16
  end
end
