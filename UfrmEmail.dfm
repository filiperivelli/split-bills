object frmEmail: TfrmEmail
  Left = 0
  Top = 0
  Caption = 'Email'
  ClientHeight = 289
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnsend: TBitBtn
    Left = 256
    Top = 144
    Width = 75
    Height = 25
    Caption = 'btnsend'
    TabOrder = 0
    OnClick = btnsendClick
  end
  object idsmtp: TIdSMTP
    SASLMechanisms = <>
    Left = 288
    Top = 176
  end
end
