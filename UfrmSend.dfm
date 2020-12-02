object frmSend: TfrmSend
  Left = 0
  Top = 0
  Caption = 'Send'
  ClientHeight = 319
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
  object lblDueDate: TLabel
    Left = 8
    Top = 292
    Width = 55
    Height = 13
    Caption = 'Due Date:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgrdReport: TDBGrid
    Left = 8
    Top = 8
    Width = 538
    Height = 268
    DataSource = dsSend
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrdReportDrawColumnCell
  end
  object btnToPdf: TButton
    Left = 471
    Top = 286
    Width = 75
    Height = 25
    Caption = 'To PDF'
    TabOrder = 1
    OnClick = btnToPdfClick
  end
  object dtpDueDate: TDateTimePicker
    Left = 72
    Top = 288
    Width = 186
    Height = 21
    Date = 44162.000000000000000000
    Time = 0.436199027775728600
    TabOrder = 2
  end
  object qrySend: TFDQuery
    Connection = frmDM.con
    Left = 120
    Top = 112
  end
  object dsSend: TDataSource
    DataSet = qrySend
    Left = 480
    Top = 112
  end
  object frxrprt1: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 44160.670007210600000000
    ReportOptions.LastChange = 44165.712110416670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxrprt1GetValue
    Left = 488
    Top = 184
    Datasets = <
      item
        DataSet = frxdbdtst1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxdbBills
        DataSetName = 'frxdbBills'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 52.854360000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."display_name"'
        object frxDBDataset1display_name: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 7.500000000000000000
          Width = 718.110700000000000000
          Height = 37.795300000000000000
          DataField = 'display_name'
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 5.000000000000000000
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."display_name"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtst1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1amount: TfrxMemoView
          IndexTag = 1
          Align = baRight
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 1.000000000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frxDBDataset1."title"> = '#39'Total'#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."amount"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset1title: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1.440940000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxdbdtst1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frxDBDataset1."title"> = '#39'Total'#39
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."title"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 81.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.440940000000000000
          Top = 29.015770000000000000
          Width = 714.331170000000000000
          Height = 36.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Hi everyone, followings are bill share for:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        DataSet = frxdbBills
        DataSetName = 'frxdbBills'
        RowCount = 0
        object frxdbBillstype: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 1.440940000000000000
          Top = 4.952690000000000000
          Width = 156.212740000000000000
          Height = 18.897650000000000000
          DataSet = frxdbBills
          DataSetName = 'frxdbBills'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdbBills."type"]')
          ParentFont = False
        end
        object frxdbBillsdt_from: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 424.834880000000000000
          Top = 4.952690000000000000
          Width = 123.740260000000000000
          Height = 18.897650000000000000
          DataSet = frxdbBills
          DataSetName = 'frxdbBills'
          DisplayFormat.FormatStr = 'mmmm dd, yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdbBills."dt_from"]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 380.362400000000000000
          Top = 4.952690000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'From:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 160.000000000000000000
          Top = 4.952690000000000000
          Width = 63.000000000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Amount:')
          ParentFont = False
        end
        object frxdbBillsamount: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 227.000000000000000000
          Top = 4.952690000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxdbBills
          DataSetName = 'frxdbBills'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxdbBills."amount"]')
          ParentFont = False
        end
        object frxdbBillsdt_to: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 4.952690000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = frxdbBills
          DataSetName = 'frxdbBills'
          DisplayFormat.FormatStr = 'mmmm dd, yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxdbBills."dt_to"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 558.149970000000000000
          Top = 4.952690000000000000
          Width = 32.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'To:')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 36.677180000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 60.000000000000000000
          Top = 12.598330000000000000
          Width = 254.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'mmmm dd, yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[due_date]')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 13.598330000000000000
          Width = 53.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Due on:')
          ParentFont = False
        end
      end
    end
  end
  object frxdbdtst1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = qrySend
    BCDToCurrency = False
    Left = 176
    Top = 120
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 368
    Top = 184
  end
  object dlgSave: TSaveDialog
    Left = 296
    Top = 184
  end
  object qryBills: TFDQuery
    Connection = frmDM.con
    SQL.Strings = (
      '')
    Left = 112
    Top = 192
    object strngfldBillstype: TStringField
      FieldName = 'type'
      Origin = 'type'
      Size = 32767
    end
    object dtfldBillsdt_from: TDateField
      FieldName = 'dt_from'
      Origin = 'dt_from'
    end
    object dtfldBillsdt_to: TDateField
      FieldName = 'dt_to'
      Origin = 'dt_to'
    end
    object fltfldBillsamount: TFloatField
      FieldName = 'amount'
      Origin = 'amount'
    end
  end
  object frxdbBills: TfrxDBDataset
    UserName = 'frxdbBills'
    CloseDataSource = False
    DataSet = qryBills
    BCDToCurrency = False
    Left = 168
    Top = 184
  end
end
