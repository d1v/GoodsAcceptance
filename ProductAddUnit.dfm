object FormProductAdd: TFormProductAdd
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Product Add'
  ClientHeight = 132
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 12
    Width = 464
    Height = 18
    Align = alBottom
    Alignment = taCenter
    Caption = 'Type:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 46
  end
  object LabelSort: TLabel
    Left = 0
    Top = 56
    Width = 464
    Height = 18
    Align = alBottom
    Alignment = taCenter
    Caption = 'Sort:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 40
  end
  object EditName: TEdit
    Left = 0
    Top = 74
    Width = 464
    Height = 26
    Align = alBottom
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = EditNameKeyPress
  end
  object ButtonAdd: TButton
    Left = 0
    Top = 100
    Width = 464
    Height = 32
    Align = alBottom
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = ButtonAddClick
  end
  object DBLookupComboBoxType: TDBLookupComboBox
    Left = 0
    Top = 30
    Width = 464
    Height = 26
    Align = alBottom
    DataField = 'name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    KeyField = 'name'
    ListField = 'name'
    ListFieldIndex = 1
    ListSource = DataSource1
    ParentFont = False
    TabOrder = 0
  end
  object GoToTypes: TBitBtn
    Left = 377
    Top = 1
    Width = 84
    Height = 28
    Caption = 'Go to Types'
    TabOrder = 3
    TabStop = False
    OnClick = GoToTypesClick
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = DbMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT name, id'
      'FROM types'
      'ORDER BY name')
    Left = 280
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = ADOQuery1
    Left = 344
  end
end
