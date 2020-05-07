object FormItems: TFormItems
  Left = 0
  Top = 0
  Caption = 'Items'
  ClientHeight = 628
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelH1: TLabel
    Left = 0
    Top = 0
    Width = 1136
    Height = 29
    Align = alTop
    Alignment = taCenter
    Caption = 'Items for acceptance []'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 282
  end
  object DBGridEhItems: TDBGridEh
    Left = 0
    Top = 126
    Width = 1136
    Height = 502
    Align = alClient
    AllowedSelections = [gstRecordBookmarks]
    DataGrouping.Active = True
    DataSource = DataSourceItems
    DynProps = <>
    EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    FooterRowCount = 1
    FrozenCols = 1
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghEnterAsTab, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghRecordMoving, dghShowRecNo, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
    ParentFont = False
    ReadOnly = True
    RowSizingAllowed = True
    RowPanel.Active = True
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    EditButtonsShowOptions = [sebShowOnlyForCurCellEh, sebShowOnlyForCurRowEh, sebShowOnlyWhenGridActiveEh, sebShowOnlyWhenDataEditingEh]
    SortLocal = True
    SumList.Active = True
    SumList.VirtualRecords = True
    TabOrder = 0
    TitleParams.SortMarkerStyle = smst3DFrameEh
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'sort'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Product'
        Title.TitleButton = True
        Width = 224
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Type'
        Title.TitleButton = True
        Width = 131
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'weight'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Weight'
        Title.TitleButton = True
        Width = 131
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1136
    Height = 97
    Align = alTop
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 56
      Width = 1134
      Height = 40
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Align = alBottom
      TabOrder = 0
    end
    object BitBtnAdd: TBitBtn
      Left = 1
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        685C4D5B4F424E483C47483C474F424E5C4D5B69586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        695868695868695868695868695868695868695868685767493D48251F240907
        08000000000000000000000000000000000000090708251F24493D4868576769
        5868695868695868695868695868695868695868695868695868695868695868
        6958686958686958686958686958686958684338430E0C0E0101011B171B3A31
        3A51445060515F68576768576760515F5144503A31391B171B0101010E0C0E43
        3843695868695868695868695868695868695868695868695868695868695868
        6958686958686958686958685E4F5D1B171B0101012923295B4C5A6958686958
        686958686958686958686958686958686958686958686958685B4C5A29232901
        01011B171B5E4F5D695868695868695868695868695868695868695868695868
        6958686958686958685446530A080A110E115447536958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586854
        4753110E110A080A544653695868695868695868695868695868695868695868
        6958686958685346520605061E191E6454636958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686454631E191E060506534652695868695868695868695868695868695868
        6958685E4F5D0A080A1E191E6756666958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686756661E191E0A080A5E4F5D695868695868695868695868695868
        6958681B171B110E116454636958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868645463110E111B171B695868695868695868695868695868
        4338430101015446536958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868695868544653010101433843695868695868695868685767
        0E0C0E2923296958686958686958686958686958686958686958686958686958
        6869586869586845394445394469586869586869586869586869586869586869
        58686958686958686958686958682923290E0C0E685767695868695868493D48
        0101015B4C5A6958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958685B4C5A010101493D48695868695868251F24
        1B171A6958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958686958681B161A251F24695868695868080708
        3A313A6958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958686958683A31390907086958685C4D5B000000
        5144516958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958686958685144500000005C4D5B4E424E000000
        60515F6958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        586869586869586869586869586869586860515F0000004E424E483C47000000
        685767695868695868695868695868695868695868453944231E23231E23231E
        23231E23231E230C0A0C0C0A0C231E23231E23231E23231E23231E2345394469
        5868695868695868695868695868695868685767000000483C47483C47000000
        685767695868695868695868695868695868695868453944231E23231E23231E
        23231E23231E230C0A0C0C0A0C231E23231E23231E23231E23231E2345394469
        5868695868695868695868695868695868685767000000483C474E424E000000
        60515F6958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        586869586869586869586869586869586860515F0000004E424E5C4D5B000000
        5144516958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958686958685144500000005C4D5B695868080708
        3A313A6958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958686958683A3139090708695868695868251F24
        1B171A6958686958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958686958681B171A251F24695868695868493D48
        0101015B4C5A6958686958686958686958686958686958686958686958686958
        68695868695868231E23231E2369586869586869586869586869586869586869
        58686958686958686958686958685B4C5A010101493D48695868695868685767
        0E0C0E2923296958686958686958686958686958686958686958686958686958
        6869586869586845394445394469586869586869586869586869586869586869
        58686958686958686958686958682923290E0C0E685767695868695868695868
        4338430101015446536958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868695868544653010101433843695868695868695868695868
        6958681B171B110E116454636958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868645463110E111B171B695868695868695868695868695868
        6958685E4F5D0A080A1E191E6756666958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686756661E191E0A080A5E4F5D695868695868695868695868695868
        6958686958685346520605061E191E6454636958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686454631E191E060506534652695868695868695868695868695868695868
        6958686958686958685346530A080A110E115447536958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586854
        4753110E110A080A544653695868695868695868695868695868695868695868
        6958686958686958686958685E4F5D1B171B0101012A23295B4C5A6958686958
        686958686958686958686958686958686958686958686958685B4C5A2A232901
        01011C171B5E4F5D695868695868695868695868695868695868695868695868
        6958686958686958686958686958686958684338430E0C0E0101011B171B3A31
        3A51445060515F68576768576760515F5144503A313A1B171B0101010E0C0E43
        3843695868695868695868695868695868695868695868695868695868695868
        695868695868695868695868695868695868695868685767493D48251F250807
        08000000000000000000000000000000000000080708251F25493D4868576769
        5868695868695868695868695868695868695868695868695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        685C4D5B4F424E483C47483C474F424E5C4D5B69586869586869586869586869
        5868695868695868695868695868695868695868695868695868}
      TabOrder = 1
      OnClick = BitBtnAddClick
    end
    object BitBtnDelete: TBitBtn
      Left = 151
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        685C4D5B4F424E483C47483C474F424E5C4D5B69586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        695868695868695868695868695868695868695868685767493D48251F240907
        08000000000000000000000000000000000000090708251F24493D4868576769
        5868695868695868695868695868695868695868695868695868695868695868
        6958686958686958686958686958686958684338430E0C0E0101011B171B3A31
        3A51445060515F68576768576760515F5144503A31391B171B0101010E0C0E43
        3843695868695868695868695868695868695868695868695868695868695868
        6958686958686958686958685E4F5D1B171B0101012923295B4C5A6958686958
        686958686958686958686958686958686958686958686958685B4C5A29232901
        01011B171B5E4F5D695868695868695868695868695868695868695868695868
        6958686958686958685446530A080A110E115447536958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586854
        4753110E110A080A544653695868695868695868695868695868695868695868
        6958686958685346520605061E191E6454636958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686454631E191E060506534652695868695868695868695868695868695868
        6958685E4F5D0A080A1E191E6756666958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686756661E191E0A080A5E4F5D695868695868695868695868695868
        6958681B171B110E116454636958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868645463110E111B171B695868695868695868695868695868
        4338430101015446536958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868695868544653010101433843695868695868695868685767
        0E0C0E2923296958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958682923290E0C0E685767695868695868493D48
        0101015B4C5A6958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958685B4C5A010101493D48695868695868251F24
        1B171A6958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958681B161A251F24695868695868080708
        3A313A6958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958683A31390907086958685C4D5B000000
        5144516958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958685144500000005C4D5B4E424E000000
        60515F6958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        586869586869586869586869586869586860515F0000004E424E483C47000000
        6857676958686958686958686958686958686958686958685B4C5A241F24231E
        23231E23231E23231E23231E23231E23231E23231E23231E23231E23231E232D
        262C695868695868695868695868695868685767000000483C47483C47000000
        6857676958686958686958686958686958686958686958685B4C5A241F24231E
        23231E23231E23231E23231E23231E23231E23231E23231E23231E23231E232D
        262D695868695868695868695868695868685767000000483C474E424E000000
        60515F6958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        586869586869586869586869586869586860515F0000004E424E5C4D5B000000
        5144516958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958685144500000005C4D5B695868080708
        3A313A6958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958683A3139090708695868695868251F24
        1B171A6958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958681B171A251F24695868695868493D48
        0101015B4C5A6958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958685B4C5A010101493D48695868695868685767
        0E0C0E2923296958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958682923290E0C0E685767695868695868695868
        4338430101015446536958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868695868544653010101433843695868695868695868695868
        6958681B171B110E116454636958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868645463110E111B171B695868695868695868695868695868
        6958685E4F5D0A080A1E191E6756666958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686756661E191E0A080A5E4F5D695868695868695868695868695868
        6958686958685346520605061E191E6454636958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686454631E191E060506534652695868695868695868695868695868695868
        6958686958686958685346530A080A110E115447536958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586854
        4753110E110A080A544653695868695868695868695868695868695868695868
        6958686958686958686958685E4F5D1B171B0101012A23295B4C5A6958686958
        686958686958686958686958686958686958686958686958685B4C5A2A232901
        01011C171B5E4F5D695868695868695868695868695868695868695868695868
        6958686958686958686958686958686958684338430E0C0E0101011B171B3A31
        3A51445060515F68576768576760515F5144503A313A1B171B0101010E0C0E43
        3843695868695868695868695868695868695868695868695868695868695868
        695868695868695868695868695868695868695868685767493D48251F250807
        08000000000000000000000000000000000000080708251F25493D4868576769
        5868695868695868695868695868695868695868695868695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        685C4D5B4F424E483C47483C474F424E5C4D5B69586869586869586869586869
        5868695868695868695868695868695868695868695868695868}
      TabOrder = 2
      OnClick = BitBtnDeleteClick
    end
    object BitBtnChange: TBitBtn
      Left = 76
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000695868635362
        6958686958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868695868695868695868695868695868695868625261020102
        0A090A221D223A31395245516756666958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868080708
        1A161A211C20090809000000040304191519312930483D4860515F6958686958
        6869586869586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958686958686958686958686958681F1A1F
        231E236958686958685A4C594238412A242A1210120101010000001512155E4F
        5D69586869586869586869586869586869586869586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868372E37
        0B0A0B6958686958686958686958686857674136400E0B0E0000000000000F0D
        0F5E4F5D69586869586869586869586869586869586869586869586869586869
        58686958686958686958686958686958686958686958686958686958684F434E
        0000005C4E5C69586869586860505F1A161A0202022A242A5144505C4D5B120F
        120F0D0F5E4F5D69586869586869586869586869586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868655564
        02020245394469586860505F100D0F0908095648566958686958686958686051
        5F120F120F0D0F5E4F5D69586869586869586869586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        1612162D252C6857671916190907080101013C323B6958686958686958686958
        6860515F120F120F0D0F5E4F5D69586869586869586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        2E272D15111440363F0202025749563930380000003C323B6958686958686958
        6869586860515F120F120F0D0F5E4F5D69586869586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        463B450201020E0C0E2B242B6958686958683930380000003C323B6958686958
        6869586869586860515F120F120F0D0F5E4F5D69586869586869586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        5E4F5D0000000000005245516958686958686958683930380000003C323B6958
        6869586869586869586860515F120F120F0D0F5E4F5D69586869586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        695868120F110000005E4F5D6958686958686958686958683930380000003C32
        3B69586869586869586869586860515F120F120F0D0F5E4F5D69586869586869
        5868695868695868695868695868695868695868695868695868695868695868
        6958685C4D5B0D0B0D1411146252616958686958686958686958683930380000
        003C323B69586869586869586869586860515F120F120F0D0F5E4F5D69586869
        5868695868695868695868695868695868695868695868695868695868695868
        6958686958685C4D5B0D0B0D1411146252616958686958686958686958683930
        380000003C323B69586869586869586869586860515F120F120F0D0F5E4F5D69
        5868695868695868695868695868695868695868695868695868695868695868
        6958686958686958685C4D5B0D0B0D1411146252616958686958686958686958
        683930380000003C323B69586869586869586869586860515F120F120F0D0F5E
        4F5D695868695868695868695868695868695868695868695868695868695868
        6958686958686958686958685C4D5B0D0B0D1411146252616958686958686958
        686958683930380000003C323B69586869586869586869586860515F120F120F
        0D0F5E4F5D695868695868695868695868695868695868695868695868695868
        6958686958686958686958686958685C4D5B0D0B0D1411146252616958686958
        686958686958683930380000003C323B6958686958686958686958685F4F5E05
        04040F0D0F5E4F5D695868695868695868695868695868695868695868695868
        6958686958686958686958686958686958685C4D5B0D0B0D1411146252616958
        686958686958686958683930380000003C323B695868695868675766241E2305
        0405100D100F0D0F5E4F5D695868695868695868695868695868695868695868
        6958686958686958686958686958686958686958685C4D5B0D0B0D1411146252
        616958686958686958686958683930380000003C323B675766241E230504054F
        424E60515F120F120F0D0F5E4F5D695868695868695868695868695868695868
        6958686958686958686958686958686958686958686958685C4D5B0D0B0D1411
        146252616958686958686958686958683930380000001511140504054F424E69
        58686958685043500101010F0D0F5E4F5D695868695868695868695868695868
        6958686958686958686958686958686958686958686958686958685C4D5B0D0B
        0D1411146252616958686958686958686757661410130504054F424E69586869
        5868594B590B090B171417120F120F0D0F5E4F5D695868695868695868695868
        6958686958686958686958686958686958686958686958686958686958685C4D
        5B0D0B0D141114625261695868675766241E230504054F424E69586869586859
        4B590B090B18141763536260515F120F120F0D0F615160695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        685C4D5B0D0B0D14111460505F241E230504054F424F695868695868594B590B
        090B18141763536269586869586860505F0D0B0D272127695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        686958685C4D5B0D0B0D05050505040550424F695868695868594B590B090B18
        1417635362695868695868695868695868403640030303665565695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        686958686958685C4D5B0D0B0D120F11625261695868594B590B090B18141763
        53626958686958686958686958686958685144500000005E4E5D695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        686958686958686958685C4D5B0D0B0D1411145245510B090B18141763536269
        58686958686958686958686958686958682922280A090A685767695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        686958686958686958686958685C4D5B0D0B0D00000018141763536269586869
        58686958686958686958686958682E262D020202493D48695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        686958686958686958686958686958685C4D5B0D0B0D14111462526169586869
        58686958686958686958682E262D020202463B45695868695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        686958686958686958686958686958686958685C4D5B0D0B0D14111461526069
        58686958686958682E262D020202463B45695868695868695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        686958686958686958686958686958686958686958685C4D5B0D0B0D0F0C0F43
        3842534652292329020202463B45695868695868695868695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586860505F27202604
        03040000000B090B493D48695868695868695868695868695868695868695868
        6958686958686958686958686958686958686958686958686958686958686958
        6869586869586869586869586869586869586869586869586869586869586867
        566660505F685867695868695868695868695868695868695868}
      TabOrder = 3
      OnClick = BitBtnChangeClick
    end
  end
  object ADOQueryItems: TADOQuery
    Active = True
    Connection = DbMainModule.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT i.id, i.weight, t.name, p.sort'
      'FROM ((items as i'
      'INNER JOIN products AS p ON i.idProduct = p.id)'
      'INNER JOIN  types AS t ON p.idType = t.id)'
      'WHERE i.idAcceptance = 2'
      'ORDER BY i.id DESC;')
    Left = 264
    Top = 40
  end
  object DataSourceItems: TDataSource
    DataSet = ADOQueryItems
    Left = 352
    Top = 40
  end
end
