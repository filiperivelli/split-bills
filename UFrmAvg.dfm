object frmAvg: TfrmAvg
  Left = 0
  Top = 0
  Caption = 'Average'
  ClientHeight = 472
  ClientWidth = 649
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
  object lblYear: TLabel
    Left = 32
    Top = 33
    Width = 26
    Height = 13
    Caption = 'Year:'
  end
  object lblResidents: TLabel
    Left = 32
    Top = 80
    Width = 51
    Height = 13
    Caption = 'Residents:'
  end
  object redtAvg: TRichEdit
    Left = 8
    Top = 128
    Width = 633
    Height = 336
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'redtAvg')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    Zoom = 100
  end
  object btnOk: TBitBtn
    Left = 214
    Top = 24
    Width = 75
    Height = 74
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object dtpckr: TDatePicker
    Left = 112
    Top = 24
    Width = 73
    Date = 43913.000000000000000000
    DateFormat = 'yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
  object seResidents: TSpinEdit
    Left = 112
    Top = 76
    Width = 73
    Height = 22
    MaxValue = 99
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
  object qryAvg: TFDQuery
    Connection = frmDM.con
    SQL.Strings = (
      
        'select type ,round((sum (amount)/sum (multiply)/days),2) as perD' +
        'ay, dt_from, dt_to  '
      'from ('
      
        'SELECT b.cod_bills , t.type, s.amount, cast((JULIANDAY(b.dt_to) ' +
        '- julianday(b.dt_from)) as integer) days'
      ', b.cod_bill_type, b.name, b.dt_from, b.dt_to '
      ',case r.couple '
      #9'when true THEN '#39'2'#39
      #9'when false then '#39'1'#39
      'end multiply'#9
      'from bills b'
      'join split s on (b.cod_bills = s.cod_bills)'
      'join residents r on (s.cod_resident = r.cod_resident)'
      'join bill_type t on (b.cod_bill_type = t.cod_bill_type)'
      'where b.cod_house = :P_COD_HOUSE'
      ') '
      'GROUP BY cod_bill_type ')
    Left = 592
    Top = 416
    ParamData = <
      item
        Name = 'P_COD_HOUSE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
