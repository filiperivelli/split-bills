object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Split Bills'
  ClientHeight = 761
  ClientWidth = 1051
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object statBar: TStatusBar
    Left = 0
    Top = 742
    Width = 1051
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1051
    Height = 137
    Align = alTop
    TabOrder = 1
    object lblHouse: TLabel
      Left = 8
      Top = 13
      Width = 34
      Height = 13
      Caption = 'House:'
    end
    object lblBillCategory: TLabel
      Left = 8
      Top = 67
      Width = 106
      Height = 13
      Caption = 'Filter by Bill Category:'
    end
    object btnNewHouse: TBitBtn
      Left = 311
      Top = 14
      Width = 169
      Height = 41
      Caption = 'Manage Houses'
      TabOrder = 0
      OnClick = btnNewHouseClick
    end
    object btnNewResident: TBitBtn
      Left = 499
      Top = 14
      Width = 169
      Height = 41
      Caption = 'Manage Residents'
      TabOrder = 1
      OnClick = btnNewResidentClick
    end
    object btnNewBillCategory: TBitBtn
      Left = 683
      Top = 14
      Width = 169
      Height = 41
      Caption = 'Manage Bill Category'
      TabOrder = 2
      OnClick = btnNewBillCategoryClick
    end
    object cbbHouse: TComboBox
      Left = 8
      Top = 32
      Width = 281
      Height = 21
      TabOrder = 3
      OnChange = cbbHouseChange
      OnEnter = cbbHouseEnter
    end
    object btnSend: TBitBtn
      Left = 683
      Top = 76
      Width = 169
      Height = 41
      Caption = 'Send Report to Residents'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnSendClick
    end
    object chkSendFilter: TCheckBox
      Left = 177
      Top = 88
      Width = 112
      Height = 17
      Caption = 'Show only "Send"'
      TabOrder = 5
      OnClick = chkSendFilterClick
    end
    object cbbBillType: TComboBox
      Left = 8
      Top = 86
      Width = 145
      Height = 21
      TabOrder = 6
      OnChange = cbbBillTypeChange
    end
    object chkShowOnlyNotSplitted: TCheckBox
      Left = 304
      Top = 88
      Width = 137
      Height = 17
      Caption = 'Show Only Not Splitted'
      TabOrder = 7
      OnClick = chkShowOnlyNotSplittedClick
    end
    object chkShowOnlyOverdue: TCheckBox
      Left = 456
      Top = 88
      Width = 121
      Height = 17
      Caption = 'Show only overdue'
      TabOrder = 8
      OnClick = chkShowOnlyOverdueClick
    end
  end
  object pnlBillFields: TPanel
    Left = 0
    Top = 137
    Width = 329
    Height = 605
    Align = alLeft
    TabOrder = 2
    object lblAmount: TLabel
      Left = 60
      Top = 148
      Width = 41
      Height = 13
      Caption = 'Amount:'
      FocusControl = dbedtAmount
    end
    object lblBillName: TLabel
      Left = 60
      Top = 96
      Width = 16
      Height = 13
      Caption = 'Bill:'
      FocusControl = dbedtname
    end
    object lblDtFrom: TLabel
      Left = 60
      Top = 199
      Width = 28
      Height = 13
      Caption = 'From:'
    end
    object lblDtTo: TLabel
      Left = 60
      Top = 251
      Width = 16
      Height = 13
      Caption = 'To:'
    end
    object lblBillType: TLabel
      Left = 60
      Top = 44
      Width = 28
      Height = 13
      Caption = 'Type:'
    end
    object lbl1: TLabel
      Left = 60
      Top = 304
      Width = 48
      Height = 13
      Caption = 'Due date:'
    end
    object lbl2: TLabel
      Left = 59
      Top = 352
      Width = 56
      Height = 13
      Caption = 'Bill Paid On:'
    end
    object dbedtAmount: TDBEdit
      Left = 60
      Top = 166
      Width = 209
      Height = 21
      DataField = 'amount'
      DataSource = dsBills
      TabOrder = 3
    end
    object dbedtname: TDBEdit
      Left = 60
      Top = 114
      Width = 209
      Height = 21
      DataField = 'name'
      DataSource = dsBills
      TabOrder = 2
    end
    object dblkcbbBillType: TDBLookupComboBox
      Left = 60
      Top = 63
      Width = 209
      Height = 21
      DataField = 'cod_bill_type'
      DataSource = dsBills
      KeyField = 'cod_bill_type'
      ListField = 'type'
      ListSource = dsBillType
      TabOrder = 1
      OnDragOver = dblkcbbBillTypeDragOver
    end
    object dtpBillFrom: TDateTimePicker
      Left = 59
      Top = 218
      Width = 209
      Height = 21
      Date = 43900.000000000000000000
      Time = 0.656462245373404600
      TabOrder = 4
      OnChange = dtpBillFromChange
    end
    object dtpBillTo: TDateTimePicker
      Left = 60
      Top = 268
      Width = 209
      Height = 21
      Date = 43900.000000000000000000
      Time = 0.656699502316769200
      TabOrder = 5
      OnChange = dtpBillToChange
    end
    object dbnvgrBills: TDBNavigator
      Left = 1
      Top = 566
      Width = 327
      Height = 38
      DataSource = dsBills
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Align = alBottom
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = dbnvgrBillsClick
    end
    object dtpDeadLine: TDateTimePicker
      Left = 60
      Top = 320
      Width = 209
      Height = 21
      Date = 43900.000000000000000000
      Time = 0.656699502316769200
      TabOrder = 6
      OnChange = dtpDeadLineChange
    end
    object dbedtPaidDay: TDBEdit
      Left = 59
      Top = 371
      Width = 213
      Height = 21
      DataField = 'paid_day'
      DataSource = dsBills
      TabOrder = 7
    end
    object dbchkSend: TDBCheckBox
      Left = 60
      Top = 408
      Width = 97
      Height = 17
      Caption = 'Send'
      DataField = 'send'
      DataSource = dsBills
      TabOrder = 8
    end
    object btnAddFile: TBitBtn
      Left = 26
      Top = 456
      Width = 75
      Height = 25
      Caption = 'Add File'
      TabOrder = 9
      OnClick = btnAddFileClick
    end
    object btnOpenFile: TBitBtn
      Left = 237
      Top = 456
      Width = 75
      Height = 25
      Caption = 'Open File'
      TabOrder = 11
      OnClick = btnOpenFileClick
    end
    object btnDeleteFile: TBitBtn
      Left = 128
      Top = 456
      Width = 75
      Height = 25
      Caption = 'Delete File'
      TabOrder = 10
      OnClick = btnDeleteFileClick
    end
    object btnOnePersonPays: TBitBtn
      Left = 191
      Top = 503
      Width = 121
      Height = 38
      Caption = 'Split Bill'
      TabOrder = 12
      OnClick = btnOnePersonPaysClick
    end
    object btnSplit: TBitBtn
      Left = 26
      Top = 502
      Width = 121
      Height = 38
      Caption = 'Split Bill'
      TabOrder = 13
      Visible = False
      OnClick = btnSplitClick
    end
  end
  object pnlBills: TPanel
    Left = 329
    Top = 137
    Width = 722
    Height = 605
    Align = alClient
    Caption = 'pnlBills'
    TabOrder = 3
    object dbgrdBills: TDBGrid
      Left = 1
      Top = 1
      Width = 720
      Height = 447
      Align = alClient
      DataSource = dsBills
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgrdBillsCellClick
      OnDrawColumnCell = dbgrdBillsDrawColumnCell
      OnKeyDown = dbgrdBillsKeyDown
      OnKeyUp = dbgrdBillsKeyUp
      Columns = <
        item
          Expanded = False
          FieldName = 'type'
          Title.Caption = 'Type'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = 'Bill'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'amount'
          Title.Caption = 'Amount (AU$)'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dead_line'
          Title.Caption = 'Deadline'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'paid_day'
          Title.Caption = 'Paid On'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_from'
          Title.Caption = 'From'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_to'
          Title.Caption = 'To'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'send'
          Title.Caption = 'Send'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'splitted'
          Title.Caption = 'Splitted'
          Width = 100
          Visible = True
        end>
    end
    object dbgrdSplit: TDBGrid
      Left = 1
      Top = 448
      Width = 720
      Height = 156
      Align = alBottom
      DataSource = dsSplit
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
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
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'amount'
          Title.Caption = 'Amount (AU$)'
          Width = 100
          Visible = True
        end>
    end
  end
  object mmMenu: TMainMenu
    Left = 872
    Top = 24
    object FindDatabase1: TMenuItem
      Caption = 'Config'
      object FindaDatabaseFile1: TMenuItem
        Caption = 'Finda Database File...'
        OnClick = FindaDatabaseFile1Click
      end
      object Searchforupdates1: TMenuItem
        Caption = 'Search for updates ...'
        OnClick = Searchforupdates1Click
      end
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
    object Reports1: TMenuItem
      Caption = 'Reports'
      object AmountperMonth1: TMenuItem
        Caption = 'Average per Month'
        OnClick = AmountperMonth1Click
      end
    end
  end
  object qryBillType: TFDQuery
    Connection = frmDM.con
    Left = 216
    Top = 136
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
    Left = 264
    Top = 136
  end
  object qryBills: TFDQuery
    BeforeInsert = qryBillsBeforeInsert
    BeforePost = qryBillsBeforePost
    AfterPost = qryBillsAfterPost
    AfterDelete = qryBillsAfterDelete
    Connection = frmDM.con
    SQL.Strings = (
      ' ')
    Left = 360
    Top = 168
    object strngfldBillstype: TStringField
      FieldName = 'type'
      Origin = 'type'
      Size = 32767
    end
    object fdtncfldBillscod_bills: TFDAutoIncField
      FieldName = 'cod_bills'
      Origin = 'cod_bills'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldBillsname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 32767
    end
    object fltfldBillsamount: TFloatField
      FieldName = 'amount'
      Origin = 'amount'
    end
    object dtfldBillsdead_line: TDateField
      FieldName = 'dead_line'
      Origin = 'dead_line'
    end
    object blbfldBillsattachment: TBlobField
      FieldName = 'attachment'
      Origin = 'attachment'
    end
    object dtfldBillspaid_day: TDateField
      FieldName = 'paid_day'
      Origin = 'paid_day'
    end
    object intgrfldBillscod_house: TIntegerField
      FieldName = 'cod_house'
      Origin = 'cod_house'
      Required = True
    end
    object dtfldBillsdt_from: TDateField
      FieldName = 'dt_from'
      Origin = 'dt_from'
    end
    object dtfldBillsdt_to: TDateField
      FieldName = 'dt_to'
      Origin = 'dt_to'
    end
    object intgrfldBillscod_bill_type: TIntegerField
      FieldName = 'cod_bill_type'
      Origin = 'cod_bill_type'
      Required = True
    end
    object blnfldBillssend: TBooleanField
      FieldName = 'send'
      Origin = 'send'
    end
    object strngfldBillsmime_type: TStringField
      FieldName = 'mime_type'
      Origin = 'mime_type'
      Size = 32767
    end
    object qryBillssplitted: TWideStringField
      FieldName = 'splitted'
      Origin = 'splitted'
      Size = 32767
    end
  end
  object qrySplit: TFDQuery
    Connection = frmDM.con
    SQL.Strings = (
      '')
    Left = 888
    Top = 176
    object strngfldSplitname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 32767
    end
    object wdstrngfldSplitamount: TWideStringField
      FieldName = 'amount'
      Origin = 'amount'
      Size = 32767
    end
  end
  object dsSplit: TDataSource
    DataSet = qrySplit
    Left = 848
    Top = 176
  end
  object dsBills: TDataSource
    DataSet = qryBills
    Left = 400
    Top = 168
  end
  object dlgOpen: TOpenDialog
    Left = 64
    Top = 617
  end
end
