object fLetra: TfLetra
  Left = 393
  Top = 166
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Letra da M'#250'sica'
  ClientHeight = 637
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object sSplitter1: TbsSkinSplitter
    Left = 181
    Top = 0
    Width = 10
    Height = 637
    Constraints.MinHeight = 512
    Constraints.MinWidth = 6
    Transparent = False
    DefaultSize = 10
    SkinDataName = 'vsplitter'
    SkinData = DM.bsSkinData1
  end
  object sPanel2: TbsSkinPanel
    Left = 191
    Top = 0
    Width = 469
    Height = 637
    HintImageIndex = 0
    TabOrder = 1
    SkinData = DM.bsSkinData1
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    EmptyDrawing = False
    RibbonStyle = False
    ImagePosition = bsipDefault
    TransparentMode = False
    CaptionImageIndex = -1
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 20
    BorderStyle = bvNone
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Align = alClient
    object Carregando: TbsSkinDBText
      Left = 0
      Top = 0
      Width = 469
      Height = 57
      EllipsType = bsetNone
      UseSkinFont = False
      UseSkinColor = True
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = -11
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      SkinData = DM.bsSkinData1
      SkinDataName = 'stdlabel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      Align = alTop
      Alignment = taCenter
      Caption = 'Carregando'
      ParentFont = False
      ShowAccelChar = False
      Layout = tlCenter
      WordWrap = True
      DataField = 'NOME'
      DataSource = dsBUSCA
      Transparent = True
      ExplicitTop = 8
    end
    object reLetra: TbsSkinRichEdit
      Left = 0
      Top = 149
      Width = 450
      Height = 439
      ScrollBars = ssVertical
      Align = alClient
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Transparent = False
      WallpaperStretch = False
      SkinSupport = False
      VScrollBar = bsSkinScrollBar8
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      SkinData = DM.bsSkinData1
      SkinDataName = 'richedit'
      DefaultColor = clWindow
    end
    object GridPanel1: TGridPanel
      Left = 0
      Top = 588
      Width = 469
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end>
      ControlCollection = <
        item
          Column = -1
          Row = -1
        end
        item
          Column = -1
          Row = 1
        end
        item
          Column = 2
          Control = txtLocaliz
          Row = 1
        end
        item
          Column = 1
          Control = bsSkinStdLabel1
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.003923162062800000
        end
        item
          SizeStyle = ssAbsolute
          Value = 21.000000000000000000
        end
        item
          Value = 49.996076837937200000
        end>
      ShowCaption = False
      TabOrder = 4
      object txtLocaliz: TbsSkinEdit
        Left = 75
        Top = 14
        Width = 389
        Height = 21
        Text = ''
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = DM.bsSkinData1
        SkinDataName = 'edit'
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ButtonImageIndex = -1
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        OnChange = txtLocalizChange
      end
      object bsSkinStdLabel1: TbsSkinStdLabel
        Left = 5
        Top = 14
        Width = 70
        Height = 21
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        SkinData = DM.bsSkinData1
        SkinDataName = 'stdlabel'
        Align = alClient
        Caption = 'Localizar:'
        Layout = tlCenter
        ExplicitWidth = 45
        ExplicitHeight = 13
      end
    end
    object bsSkinScrollBar8: TbsSkinScrollBar
      Left = 450
      Top = 149
      Width = 19
      Height = 439
      HintImageIndex = 0
      TabOrder = 3
      SkinDataName = 'vscrollbar'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 19
      DefaultHeight = 0
      UseSkinFont = True
      Enabled = False
      Both = False
      BothMarkerWidth = 19
      BothSkinDataName = 'bothhscrollbar'
      CanFocused = False
      Align = alRight
      Kind = sbVertical
      PageSize = 0
      Min = 0
      Max = 16
      Position = 0
      SmallChange = 1
      LargeChange = 1
    end
    object GridPanel2: TGridPanel
      Left = 0
      Top = 107
      Width = 469
      Height = 42
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 120.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 120.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 110.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 110.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end>
      ControlCollection = <
        item
          Column = -1
          Row = -1
        end
        item
          Column = -1
          Row = 1
        end
        item
          Column = 1
          Control = tbSlideM
          Row = 1
        end
        item
          Column = 3
          Control = tbSlideSM
          Row = 1
        end
        item
          Column = 7
          Control = btErro
          Row = 1
        end>
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 5.000000000000000000
        end>
      ShowCaption = False
      TabOrder = 1
      object tbSlideM: TbsSkinButton
        Left = 5
        Top = 5
        Width = 120
        Height = 32
        HintImageIndex = 0
        TabOrder = 0
        SkinData = DM.bsSkinData1
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        Transparent = False
        CheckedMode = False
        ImageList = DM.ico_24x24
        ImageIndex = 76
        AlwaysShowLayeredFrame = False
        UseSkinSize = False
        UseSkinFontColor = True
        RepeatMode = False
        RepeatInterval = 100
        AllowAllUp = False
        TabStop = True
        CanFocused = True
        Down = False
        GroupIndex = 0
        Caption = 'Slide com M'#250'sica'
        NumGlyphs = 1
        Spacing = 1
        Align = alClient
        OnClick = tbSlideMClick
      end
      object tbSlideSM: TbsSkinButton
        Tag = 1
        Left = 130
        Top = 5
        Width = 120
        Height = 32
        HintImageIndex = 0
        TabOrder = 1
        SkinData = DM.bsSkinData1
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        Transparent = False
        CheckedMode = False
        ImageList = DM.ico_24x24
        ImageIndex = 77
        AlwaysShowLayeredFrame = False
        UseSkinSize = False
        UseSkinFontColor = True
        RepeatMode = False
        RepeatInterval = 100
        AllowAllUp = False
        TabStop = True
        CanFocused = True
        Down = False
        GroupIndex = 0
        Caption = 'Slide sem M'#250'sica'
        NumGlyphs = 1
        Spacing = 1
        Align = alClient
        OnClick = tbSlideMClick
      end
      object btErro: TbsSkinButton
        Left = 354
        Top = 5
        Width = 110
        Height = 32
        HintImageIndex = 0
        TabOrder = 2
        SkinData = DM.bsSkinData1
        SkinDataName = 'button'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        Transparent = False
        CheckedMode = False
        ImageList = DM.ico_24x24
        ImageIndex = 80
        AlwaysShowLayeredFrame = False
        UseSkinSize = False
        UseSkinFontColor = True
        RepeatMode = False
        RepeatInterval = 100
        AllowAllUp = False
        TabStop = True
        CanFocused = True
        Down = False
        GroupIndex = 0
        Caption = ' Reportar Erro'
        NumGlyphs = 1
        Spacing = 1
        Align = alClient
        OnClick = btErroClick
      end
    end
    object bsSkinPanel1: TbsSkinPanel
      Left = 0
      Top = 57
      Width = 469
      Height = 50
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'panel'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      EmptyDrawing = False
      RibbonStyle = False
      ImagePosition = bsipDefault
      TransparentMode = False
      CaptionImageIndex = -1
      RealHeight = -1
      AutoEnabledControls = True
      CheckedMode = False
      Checked = False
      DefaultAlignment = taLeftJustify
      DefaultCaptionHeight = 20
      BorderStyle = bvNone
      CaptionMode = False
      RollUpMode = False
      RollUpState = False
      NumGlyphs = 1
      Spacing = 2
      Caption = 'bsSkinPanel1'
      Align = alTop
      object bsSkinStdLabel2: TbsSkinStdLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 36
        Height = 50
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = -11
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        SkinData = DM.bsSkinData1
        SkinDataName = 'stdlabel'
        Align = alLeft
        Caption = #193'lbuns:'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object bsSkinDBLookupListBox1: TbsSkinDBLookupListBox
        AlignWithMargins = True
        Left = 46
        Top = 0
        Width = 420
        Height = 50
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        HintImageIndex = 0
        TabOrder = 0
        SkinData = DM.bsSkinData1
        SkinDataName = 'listbox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        Align = alClient
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = dsALBUNS
        ParentCtl3D = False
        RowCount = 2
        DefaultItemHeight = 20
        UseSkinItemHeight = True
      end
    end
  end
  object dbLista: TbsSkinDBLookupListBox
    Left = 0
    Top = 0
    Width = 181
    Height = 637
    HintImageIndex = 0
    TabOrder = 0
    SkinData = DM.bsSkinData1
    SkinDataName = 'listbox'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    Align = alLeft
    KeyField = 'ID'
    ListField = 'NOME'
    ListSource = dsBUSCA
    ParentCtl3D = False
    RowCount = 31
    DefaultItemHeight = 20
    UseSkinItemHeight = True
    OnClick = dbListaClick
  end
  object qrBUSCA: TADOQuery
    Connection = DM.ADO
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT MUSICAS.ID, MUSICAS.NOME'
      'FROM MUSICAS'
      'ORDER BY MUSICAS.NOME')
    Left = 256
    Top = 196
  end
  object dsBUSCA: TDataSource
    DataSet = qrBUSCA
    Left = 324
    Top = 196
  end
  object bsBusinessSkinForm1: TbsBusinessSkinForm
    UseRibbon = False
    ShowMDIScrollBars = True
    WindowState = wsNormal
    QuickButtons = <
      item
        AllowAllUp = False
        Down = False
        ImageIndex = 15
        Enabled = True
        Visible = False
        Caption = 'Atualizar Colet'#226'nea'
        Position = bsqbpLeft
      end>
    QuickButtonsShowHint = False
    QuickButtonsShowDivider = True
    ClientInActiveEffect = False
    ClientInActiveEffectType = bsieSemiTransparent
    DisableSystemMenu = False
    AlwaysResize = False
    PositionInMonitor = bspScreenCenter
    UseFormCursorInNCArea = False
    MaxMenuItemsInWindow = 0
    ClientWidth = 0
    ClientHeight = 0
    HideCaptionButtons = False
    HideCloseButton = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = True
    UseSkinFontInCaption = True
    UseSkinSizeInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    ShowObjectHint = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 13
    DefCaptionFont.Name = 'Tahoma'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 13
    DefInActiveCaptionFont.Name = 'Tahoma'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 13
    DefMenuItemFont.Name = 'Tahoma'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = True
    SkinData = DM.bsSkinData1
    MinimizeApplication = False
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    MinClientHeight = 0
    MinClientWidth = 0
    MaxClientHeight = 0
    MaxClientWidth = 0
    Magnetic = False
    MagneticSize = 5
    BorderIcons = [biMaximize]
    Left = 111
    Top = 87
  end
  object qrLETRA: TADOQuery
    Connection = DM.ADO
    Filtered = True
    Parameters = <
      item
        Name = 'MUSICA'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT ID,MUSICA,LETRA,LETRA_AUX FROM MUSICAS_LETRA'
      'WHERE MUSICA = :MUSICA'
      'ORDER BY ORDEM')
    Left = 256
    Top = 244
  end
  object qrALBUNS: TADOQuery
    Connection = DM.ADO
    Filtered = True
    Parameters = <
      item
        Name = 'MUSICA'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT A.ID,A.NOME FROM ALBUM_MUSICAS AM'
      'LEFT JOIN ALBUM A ON (A.ID = AM.ID_ALBUM)'
      'WHERE AM.ID_MUSICA = :MUSICA'
      'ORDER BY A.NOME')
    Left = 256
    Top = 292
  end
  object dsALBUNS: TDataSource
    DataSet = qrALBUNS
    Left = 316
    Top = 292
  end
end
