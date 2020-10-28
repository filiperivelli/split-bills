object frmOnePersonPays: TfrmOnePersonPays
  Left = 0
  Top = 0
  Caption = 'One Person Pays'
  ClientHeight = 106
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TBitBtn
    Left = 294
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object cbbResidents: TComboBox
    Left = 24
    Top = 24
    Width = 345
    Height = 21
    TabOrder = 1
    Text = 'cbbResidents'
    OnChange = cbbResidentsChange
  end
  object qryResidents: TFDQuery
    Connection = frmDM.con
    SQL.Strings = (
      'select name, couple, email, mobile, r.cod_house'
      ', dt_in, dt_out, h.nick_name house, cod_resident'
      'from residents r'
      'inner join house h on(h.cod_house = r.cod_house)'
      'where r.cod_house = :P_COD_HOUSE'
      'order by name')
    Left = 48
    Top = 48
    ParamData = <
      item
        Name = 'P_COD_HOUSE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
