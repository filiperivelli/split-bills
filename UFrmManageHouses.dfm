object frmManageHouses: TfrmManageHouses
  Left = 0
  Top = 0
  Caption = 'House Manager'
  ClientHeight = 216
  ClientWidth = 540
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
  object dbgrdHouse: TDBGrid
    Left = 0
    Top = 0
    Width = 540
    Height = 177
    Align = alTop
    DataSource = dsHouse
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nick_name'
        Title.Caption = 'Nick Name'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'adress'
        Title.Caption = 'Adress'
        Width = 200
        Visible = True
      end>
  end
  object dbnvgrHouse: TDBNavigator
    Left = 0
    Top = 183
    Width = 540
    Height = 33
    DataSource = dsHouse
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alBottom
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dsHouse: TDataSource
    DataSet = qryHouse
    Left = 288
    Top = 80
  end
  object qryHouse: TFDQuery
    BeforeInsert = qryHouseBeforeInsert
    BeforeEdit = qryHouseBeforeEdit
    BeforePost = qryHouseBeforePost
    AfterPost = qryHouseAfterPost
    AfterCancel = qryHouseAfterCancel
    OnDeleteError = qryHouseDeleteError
    SQL.Strings = (
      'SELECT nick_name, adress'
      'FROM HOUSE'
      'order by nick_name')
    Left = 416
    Top = 72
  end
end
