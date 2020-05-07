object FormPriceAdd: TFormPriceAdd
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Price Add'
  ClientHeight = 212
  ClientWidth = 644
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
  object LabelProduct: TLabel
    Left = 0
    Top = 92
    Width = 644
    Height = 18
    Align = alBottom
    Alignment = taCenter
    Caption = 'Product:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 68
  end
  object LabelPrice: TLabel
    Left = 0
    Top = 136
    Width = 644
    Height = 18
    Align = alBottom
    Alignment = taCenter
    Caption = 'Price:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 46
  end
  object LabelDate: TLabel
    Left = 0
    Top = 0
    Width = 644
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
  object LabelSupplier: TLabel
    Left = 0
    Top = 48
    Width = 644
    Height = 18
    Align = alBottom
    Alignment = taCenter
    Caption = 'Supplier:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 73
  end
  object EditPrice: TEdit
    Left = 0
    Top = 154
    Width = 644
    Height = 26
    Align = alBottom
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnKeyPress = EditPriceKeyPress
  end
  object ButtonAdd: TButton
    Left = 0
    Top = 180
    Width = 644
    Height = 32
    Align = alBottom
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = ButtonAddClick
  end
  object DBLookupComboBoxType: TDBLookupComboBox
    Left = 0
    Top = 110
    Width = 644
    Height = 26
    Align = alBottom
    DropDownRows = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'sort'
    ListField = 'sort;name'
    ListFieldIndex = 2
    ListSource = DataSourceProduct
    ParentFont = False
    TabOrder = 3
  end
  object DBLookupComboBoxSupplier: TDBLookupComboBox
    Left = 0
    Top = 66
    Width = 644
    Height = 26
    Align = alBottom
    DropDownRows = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'name'
    ListField = 'name;INN'
    ListFieldIndex = 2
    ListSource = DataSourceSupplier
    ParentFont = False
    TabOrder = 2
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
  object ADOQueryProduct: TADOQuery
    Active = True
    Connection = DbMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT products.id, types.name, products.sort FROM products'
      'INNER JOIN types ON products.idType = types.id'
      'ORDER BY types.name')
    Left = 424
    Top = 144
  end
  object DataSourceProduct: TDataSource
    AutoEdit = False
    DataSet = ADOQueryProduct
    Left = 544
    Top = 152
  end
  object ADOQuerySupplier: TADOQuery
    Active = True
    Connection = DbMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT id, name, INN FROM suppliers ORDER BY name')
    Left = 432
    Top = 64
  end
  object DataSourceSupplier: TDataSource
    AutoEdit = False
    DataSet = ADOQuerySupplier
    Left = 536
    Top = 64
  end
end
