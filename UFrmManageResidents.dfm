object frmManageResidents: TfrmManageResidents
  Left = 0
  Top = 0
  Caption = 'Manager Residents'
  ClientHeight = 453
  ClientWidth = 710
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 24
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Name:'
    FocusControl = dbedtname
  end
  object lblEmail: TLabel
    Left = 24
    Top = 101
    Width = 32
    Height = 13
    Caption = 'E-mail:'
    FocusControl = dbedtemail
  end
  object lblMobile: TLabel
    Left = 24
    Top = 152
    Width = 34
    Height = 13
    Caption = 'Mobile:'
    FocusControl = dbedtmobile
  end
  object lbl4: TLabel
    Left = 24
    Top = 219
    Width = 41
    Height = 13
    Caption = 'Move in:'
    FocusControl = dbedtdt_in
  end
  object lbl5: TLabel
    Left = 24
    Top = 279
    Width = 49
    Height = 13
    Caption = 'Move out:'
    FocusControl = dbedtdt_out
  end
  object lblNameFilter: TLabel
    Left = 240
    Top = 16
    Width = 73
    Height = 13
    Caption = 'Filter by Name:'
  end
  object dbedtname: TDBEdit
    Left = 24
    Top = 64
    Width = 200
    Height = 21
    DataField = 'name'
    DataSource = dsResidents
    TabOrder = 0
  end
  object dbedtemail: TDBEdit
    Left = 24
    Top = 121
    Width = 200
    Height = 21
    DataField = 'email'
    DataSource = dsResidents
    TabOrder = 1
  end
  object dbedtmobile: TDBEdit
    Left = 24
    Top = 178
    Width = 200
    Height = 21
    DataField = 'mobile'
    DataSource = dsResidents
    TabOrder = 2
  end
  object dbchkCouple: TDBCheckBox
    Left = 24
    Top = 339
    Width = 97
    Height = 15
    Caption = 'Couple'
    DataField = 'couple'
    DataSource = dsResidents
    TabOrder = 5
  end
  object dbgrdResidents: TDBGrid
    Left = 240
    Top = 42
    Width = 440
    Height = 317
    DataSource = dsResidents
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Resident'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'E-mail'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mobile'
        Title.Caption = 'Mobile'
        Width = 100
        Visible = True
      end>
  end
  object dbnvgr1: TDBNavigator
    Left = 240
    Top = 376
    Width = 378
    Height = 54
    DataSource = dsResidents
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = dbnvgr1Click
  end
  object dbedtdt_in: TDBEdit
    Left = 24
    Top = 238
    Width = 200
    Height = 21
    DataField = 'dt_in'
    DataSource = dsResidents
    TabOrder = 3
  end
  object dbedtdt_out: TDBEdit
    Left = 24
    Top = 295
    Width = 200
    Height = 21
    DataField = 'dt_out'
    DataSource = dsResidents
    TabOrder = 4
  end
  object edtNameFilter: TEdit
    Left = 327
    Top = 13
    Width = 258
    Height = 21
    TabOrder = 8
    OnKeyPress = edtNameFilterKeyPress
  end
  object btnClear: TBitBtn
    Left = 605
    Top = 11
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 9
    OnClick = btnClearClick
  end
  object dsResidents: TDataSource
    DataSet = qryResidents
    Left = 392
    Top = 96
  end
  object qryResidents: TFDQuery
    BeforeInsert = qryResidentsBeforeInsert
    BeforePost = qryResidentsBeforePost
    AfterPost = qryResidentsAfterPost
    OnDeleteError = qryResidentsDeleteError
    Connection = frmDM.con
    SQL.Strings = (
      'select name, couple, email, mobile, r.cod_house'
      ', dt_in, dt_out, h.nick_name house, cod_resident'
      'from residents r'
      'inner join house h on(h.cod_house = r.cod_house)'
      'where r.cod_house = :P_COD_HOUSE'
      'order by name')
    Left = 304
    Top = 96
    ParamData = <
      item
        Name = 'P_COD_HOUSE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object strngfldResidentsname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 32767
    end
    object blnfldResidentscouple: TBooleanField
      FieldName = 'couple'
      Origin = 'couple'
    end
    object strngfldResidentsemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 32767
    end
    object strngfldResidentsmobile: TStringField
      FieldName = 'mobile'
      Origin = 'mobile'
      Size = 32767
    end
    object intgrfldResidentscod_house: TIntegerField
      FieldName = 'cod_house'
      Origin = 'cod_house'
      Required = True
    end
    object dtfldResidentsdt_in: TDateField
      FieldName = 'dt_in'
      Origin = 'dt_in'
    end
    object dtfldResidentsdt_out: TDateField
      FieldName = 'dt_out'
      Origin = 'dt_out'
    end
    object strngfldResidentshouse: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'house'
      Origin = 'nick_name'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
end
