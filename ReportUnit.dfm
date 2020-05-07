object FormReport: TFormReport
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Report'
  ClientHeight = 105
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDate: TLabel
    Left = 0
    Top = 0
    Width = 661
    Height = 18
    Align = alTop
    Alignment = taCenter
    Caption = 'Start - End'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 89
  end
  object DateTimePickerBegin: TDateTimePicker
    Left = 0
    Top = 24
    Width = 321
    Height = 26
    Date = 43957.006919224540000000
    Format = 'dd.MM.yyyy'
    Time = 43957.006919224540000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DateTimePickerEnd: TDateTimePicker
    Left = 327
    Top = 24
    Width = 321
    Height = 26
    Date = 43957.006919224540000000
    Format = 'dd.MM.yyyy'
    Time = 43957.006919224540000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 58
    Width = 661
    Height = 47
    Align = alBottom
    TabOrder = 2
    object ButtonPreview: TButton
      Left = 1
      Top = 1
      Width = 320
      Height = 45
      Align = alLeft
      Anchors = []
      Caption = 'Preview'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonPreviewClick
    end
    object ButtonExport: TButton
      Left = 327
      Top = 1
      Width = 333
      Height = 45
      Align = alRight
      Caption = 'Export PDF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonExportClick
    end
  end
  object ADOQueryReport: TADOQuery
    Active = True
    Connection = DbMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Q1.types.name, Q1.sort, Q1.suppliers.name, Q1.INN, Sum(Q1' +
        '.[Sum-weight]) AS [Sum-Sum-weight], Sum(Q1.[Total cost]) AS [Sum' +
        '-Total cost]'
      
        'FROM (SELECT types.name, products.sort, suppliers.name, supplier' +
        's.INN, Sum(items.weight) AS [Sum-weight], ([prices]![price]*item' +
        's.weight) AS [Total cost]'
      
        'FROM types INNER JOIN (suppliers INNER JOIN ((products INNER JOI' +
        'N (acceptances INNER JOIN items ON acceptances.id = items.idAcce' +
        'ptance) ON products.id = items.idProduct)'
      
        'INNER JOIN prices ON products.id = prices.idProduct) ON (supplie' +
        'rs.id = prices.idSupplier) AND (suppliers.id = acceptances.idSup' +
        'plier)) ON types.id = products.idType'
      
        'GROUP BY types.name, products.sort, suppliers.name, suppliers.IN' +
        'N, prices.price, ([prices]![price]*items.weight), acceptances.da' +
        'te, prices.dateBegin, prices.dateEnd'
      
        'HAVING (([acceptances]![date]>#5/1/2020# And [acceptances]![date' +
        ']<#9/2/2020#) AND ((prices.dateBegin)<=[acceptances]![date]) AND' +
        ' ((prices.dateEnd)>=[acceptances]![date]))) AS Q1'
      'GROUP BY Q1.types.name, Q1.sort, Q1.suppliers.name, Q1.INN'
      'ORDER BY Q1.types.name, Q1.sort, Q1.suppliers.name;'
      ''
      ''
      '')
    Left = 448
    Top = 8
  end
  object DataSourceProduct: TDataSource
    AutoEdit = False
    DataSet = ADOQueryReport
    Left = 544
    Top = 8
  end
end
