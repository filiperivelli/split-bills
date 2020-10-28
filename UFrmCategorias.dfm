object frmCategorias: TfrmCategorias
  Left = 0
  Top = 0
  Caption = 'Category'
  ClientHeight = 270
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdBillType: TDBGrid
    Left = 0
    Top = 0
    Width = 353
    Height = 185
    Align = alTop
    DataSource = dsBillType
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = 'Type'
        Visible = True
      end>
  end
  object dbnvgrBillType: TDBNavigator
    Left = 0
    Top = 245
    Width = 353
    Height = 25
    DataSource = dsBillType
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alBottom
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object qryBillType: TFDQuery
    BeforeInsert = qryBillTypeBeforeInsert
    BeforeEdit = qryBillTypeBeforeEdit
    AfterPost = qryBillTypeAfterPost
    BeforeCancel = qryBillTypeBeforeCancel
    OnDeleteError = qryBillTypeDeleteError
    Connection = frmDM.con
    SQL.Strings = (
      'select *'
      'from bill_type'
      'order by type')
    Left = 240
    Top = 24
    object fdtncfldBillTypecod_bill_type: TFDAutoIncField
      FieldName = 'cod_bill_type'
      Origin = 'cod_bill_type'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldBillTypetype: TStringField
      FieldName = 'type'
      Origin = 'type'
      Size = 32767
    end
  end
  object dsBillType: TDataSource
    DataSet = qryBillType
    Left = 240
    Top = 104
  end
end
