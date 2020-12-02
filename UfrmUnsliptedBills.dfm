object frmUnsplitedBills: TfrmUnsplitedBills
  Left = 0
  Top = 0
  Caption = 'Unsplited Bills'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblWarnig: TLabel
    Left = 8
    Top = 24
    Width = 277
    Height = 13
    Caption = 'You should split these bills before send it to the residents:'
  end
  object dbgrdUnsplitedBills: TDBGrid
    Left = 8
    Top = 56
    Width = 619
    Height = 235
    DataSource = dsUnsplitedBills
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Bill'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Visible = True
      end>
  end
  object qryUnsplitedBills: TFDQuery
    Connection = frmDM.con
    SQL.Strings = (
      'SELECT b.name as '#39'Bill'#39', b.amount as '#39'Amount'#39
      'from bills b'
      ''
      '')
    Left = 544
    Top = 224
  end
  object dsUnsplitedBills: TDataSource
    DataSet = qryUnsplitedBills
    Left = 456
    Top = 224
  end
end
