object FormSupplierEdit: TFormSupplierEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Supplier Edit'
  ClientHeight = 122
  ClientWidth = 364
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
    Top = 2
    Width = 364
    Height = 18
    Align = alBottom
    Alignment = taCenter
    Caption = 'Name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 54
  end
  object LabelINN: TLabel
    Left = 0
    Top = 46
    Width = 364
    Height = 18
    Align = alBottom
    Alignment = taCenter
    Caption = 'INN:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 38
  end
  object ButtonEdit: TButton
    Left = 0
    Top = 90
    Width = 364
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
    OnClick = ButtonEditClick
  end
  object DBEditEh1: TDBEditEh
    Left = 0
    Top = 20
    Width = 364
    Height = 26
    Align = alBottom
    Alignment = taCenter
    DataField = 'name'
    DataSource = FormSuppliers.DataSource1
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 0
    Top = 64
    Width = 364
    Height = 26
    Align = alBottom
    Alignment = taCenter
    DataField = 'INN'
    DataSource = FormSuppliers.DataSource1
    DynProps = <>
    EditButtons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = True
    OnKeyPress = DBEditEh2KeyPress
  end
end
