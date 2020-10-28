object frmUpdate: TfrmUpdate
  Left = 0
  Top = 0
  Caption = 'Update'
  ClientHeight = 204
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblProgress: TLabel
    Left = 240
    Top = 183
    Width = 17
    Height = 13
    Caption = '0%'
  end
  object pbProgressBar: TProgressBar
    Left = 40
    Top = 144
    Width = 425
    Height = 33
    TabOrder = 0
  end
  object btnSearchUpdate: TBitBtn
    Left = 350
    Top = 59
    Width = 115
    Height = 25
    Caption = 'Search for updates'
    TabOrder = 1
    OnClick = btnSearchUpdateClick
  end
  object mmoStatus: TMemo
    Left = 47
    Top = 25
    Width = 297
    Height = 96
    Lines.Strings = (
      'mmoStatus')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object idFtp2: TIdFTP
    OnDisconnected = idFtp2Disconnected
    OnWork = idFtp2Work
    OnWorkBegin = idFtp2WorkBegin
    OnConnected = idFtp2Connected
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    TransferType = ftBinary
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    OnBannerBeforeLogin = idFtp2BannerBeforeLogin
    OnBeforeGet = idFtp2BeforeGet
    OnAfterClientLogin = idFtp2AfterClientLogin
    Left = 264
    Top = 40
  end
end
