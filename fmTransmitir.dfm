object fTransmitir: TfTransmitir
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Transmiss'#227'o'
  ClientHeight = 326
  ClientWidth = 579
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object bsRibbonDivider53: TbsRibbonDivider
    Left = 0
    Top = 135
    Width = 579
    Height = 12
    Margins.Left = 30
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    HintImageIndex = 0
    SkinData = DM.bsSkinData1
    SkinDataName = 'officegroupdivider'
    DividerType = bsdtHorizontalLine
    Align = alTop
    ExplicitTop = 69
  end
  object GridPanel77: TGridPanel
    Left = 0
    Top = 0
    Width = 579
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    Caption = 'GridPanel8'
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Panel58
        Row = 0
      end
      item
        Column = 1
        Control = Panel59
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 0
    object Panel58: TPanel
      Left = 0
      Top = 0
      Width = 479
      Height = 45
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      ShowCaption = False
      TabOrder = 0
      object bsSkinStdLabel142: TbsSkinStdLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 464
        Height = 15
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 0
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        SkinData = DM.bsSkinData1
        SkinDataName = 'stdlabel'
        Align = alTop
        AutoSize = False
        Caption = 'IP:'
        Layout = tlCenter
        ExplicitLeft = 10
        ExplicitTop = 13
        ExplicitWidth = 105
      end
      object seSrvUrl: TbsSkinEdit
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 469
        Height = 20
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 5
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
        Font.Height = 13
        Font.Name = 'Tahoma'
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
        OnExit = seSrvUrlExit
      end
    end
    object Panel59: TPanel
      Left = 479
      Top = 0
      Width = 100
      Height = 45
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      ShowCaption = False
      TabOrder = 1
      object bsSkinStdLabel143: TbsSkinStdLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 85
        Height = 15
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 0
        EllipsType = bsetNone
        UseSkinFont = True
        UseSkinColor = True
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        SkinData = DM.bsSkinData1
        SkinDataName = 'stdlabel'
        Align = alTop
        AutoSize = False
        Caption = 'Porta:'
        Layout = tlCenter
        ExplicitLeft = 10
        ExplicitTop = 13
        ExplicitWidth = 106
      end
      object seSrvPorta: TbsSkinNumericEdit
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 90
        Height = 20
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 5
        Text = '0'
        Increment = 1.000000000000000000
        SupportUpDownKeys = False
        UseSkinFont = True
        ValueType = vtInteger
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = False
        SkinData = DM.bsSkinData1
        SkinDataName = 'edit'
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 13
        Font.Name = 'Tahoma'
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
      end
    end
  end
  object bsSkinPanel53: TbsSkinPanel
    Left = 0
    Top = 81
    Width = 579
    Height = 54
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
    CaptionImageIndex = 0
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
    Caption = 'bsSkinPanel10'
    Align = alTop
    object ckSrvConectar: TbsSkinCheckBox
      AlignWithMargins = True
      Left = 10
      Top = 0
      Width = 569
      Height = 21
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      WordWrap = True
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Caption = 'Conectar automaticamente ao iniciar programa'
      OnClick = ckSrvConectarClick
      Align = alClient
      ExplicitHeight = 24
    end
    object ckSrvAltIPPorta: TbsSkinCheckBox
      AlignWithMargins = True
      Left = 10
      Top = 21
      Width = 569
      Height = 33
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      HintImageIndex = 0
      TabOrder = 1
      SkinData = DM.bsSkinData1
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      WordWrap = True
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Caption = 'Alterar IP/Porta automaticamente em caso de falha na conex'#227'o'
      OnClick = ckSrvAltIPPortaClick
      Align = alBottom
      ExplicitTop = 24
    end
  end
  object bsSkinPanel1: TbsSkinPanel
    Left = 0
    Top = 147
    Width = 579
    Height = 24
    HintImageIndex = 0
    TabOrder = 2
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
    CaptionImageIndex = 0
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
    Caption = 'bsSkinPanel10'
    Align = alTop
    ExplicitTop = 117
    object bsSkinLabel1: TbsSkinLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 42
      Height = 18
      Margins.Left = 5
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = True
      UseSkinFontColor = True
      BorderStyle = bvNone
      Align = alLeft
      Caption = 'Status: '
      AutoSize = True
    end
    object lblStatus: TbsSkinLabel
      AlignWithMargins = True
      Left = 55
      Top = 3
      Width = 521
      Height = 18
      Margins.Left = 5
      HintImageIndex = 0
      TabOrder = 1
      SkinData = DM.bsSkinData1
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = True
      UseSkinFontColor = True
      BorderStyle = bvNone
      Align = alClient
      Caption = 'Desconectado'
      AutoSize = True
    end
  end
  object bsSkinPanel2: TbsSkinPanel
    Left = 0
    Top = 195
    Width = 579
    Height = 24
    HintImageIndex = 0
    TabOrder = 3
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
    CaptionImageIndex = 0
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
    Caption = 'bsSkinPanel10'
    Align = alTop
    ExplicitTop = 165
    object lblLinkMus1: TbsSkinLinkLabel
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 374
      Height = 18
      Cursor = crHandPoint
      Margins.Left = 5
      GlowEffect = False
      GlowSize = 7
      UseUnderLine = True
      UseSkinFont = True
      DefaultActiveFontColor = clBlue
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = [fsUnderline]
      SkinData = DM.bsSkinData1
      SkinDataName = 'stdlabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      Align = alClient
      AutoSize = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 78
      ExplicitWidth = 139
      ExplicitHeight = 17
    end
    object btCopLinkMus1: TbsSkinSpeedButton
      Left = 488
      Top = 0
      Width = 91
      Height = 24
      HintImageIndex = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      CheckedMode = False
      ImageList = DM.ico_16x16
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 54
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = 'Copiar Link'
      ShowCaption = True
      NumGlyphs = 1
      Align = alRight
      Margin = 5
      Spacing = 1
      OnClick = btCopLinkMus1Click
      ExplicitLeft = 491
      ExplicitTop = -3
    end
    object bsSkinLabel2: TbsSkinLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 98
      Height = 18
      Margins.Left = 5
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = True
      UseSkinFontColor = True
      BorderStyle = bvNone
      Align = alLeft
      Caption = 'Link - Transmiss'#227'o: '
      AutoSize = True
    end
  end
  object Memo1: TMemo
    Left = 394
    Top = 229
    Width = 185
    Height = 89
    Lines.Strings = (
      '[SERVER]')
    TabOrder = 4
    Visible = False
  end
  object bsSkinPanel3: TbsSkinPanel
    Left = 0
    Top = 219
    Width = 579
    Height = 24
    HintImageIndex = 0
    TabOrder = 5
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
    CaptionImageIndex = 0
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
    Caption = 'bsSkinPanel10'
    Align = alTop
    ExplicitTop = 189
    object lblLinkMus2: TbsSkinLinkLabel
      AlignWithMargins = True
      Left = 129
      Top = 3
      Width = 356
      Height = 18
      Cursor = crHandPoint
      Margins.Left = 5
      GlowEffect = False
      GlowSize = 7
      UseUnderLine = True
      UseSkinFont = True
      DefaultActiveFontColor = clBlue
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = [fsUnderline]
      SkinData = DM.bsSkinData1
      SkinDataName = 'stdlabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      Align = alClient
      AutoSize = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 78
      ExplicitWidth = 139
      ExplicitHeight = 17
    end
    object btCopLinkMus2: TbsSkinSpeedButton
      Left = 488
      Top = 0
      Width = 91
      Height = 24
      HintImageIndex = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      CheckedMode = False
      ImageList = DM.ico_16x16
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 54
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = 'Copiar Link'
      ShowCaption = True
      NumGlyphs = 1
      Align = alRight
      Margin = 5
      Spacing = 1
      OnClick = btCopLinkMus2Click
    end
    object bsSkinLabel3: TbsSkinLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 116
      Height = 18
      Margins.Left = 5
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = True
      UseSkinFontColor = True
      BorderStyle = bvNone
      Align = alLeft
      Caption = 'Link - Tela de Retorno: '
      AutoSize = True
    end
  end
  object bsSkinPanel4: TbsSkinPanel
    Left = 0
    Top = 171
    Width = 579
    Height = 24
    HintImageIndex = 0
    TabOrder = 6
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
    CaptionImageIndex = 0
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
    Caption = 'bsSkinPanel10'
    Align = alTop
    ExplicitTop = 141
    object bsSkinLabel4: TbsSkinLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 571
      Height = 18
      Margins.Left = 5
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = [fsBold]
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = True
      UseSkinFontColor = True
      BorderStyle = bvNone
      Align = alClient
      Caption = 'M'#250'sica'
      AutoSize = True
    end
  end
  object bsSkinPanel5: TbsSkinPanel
    Left = 0
    Top = 243
    Width = 579
    Height = 24
    HintImageIndex = 0
    TabOrder = 7
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
    CaptionImageIndex = 0
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
    Caption = 'bsSkinPanel10'
    Align = alTop
    ExplicitTop = 213
    object bsSkinLabel5: TbsSkinLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 571
      Height = 18
      Margins.Left = 5
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = [fsBold]
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = True
      UseSkinFontColor = True
      BorderStyle = bvNone
      Align = alClient
      Caption = 'B'#237'blia'
      AutoSize = True
    end
  end
  object bsSkinPanel6: TbsSkinPanel
    Left = 0
    Top = 267
    Width = 579
    Height = 24
    HintImageIndex = 0
    TabOrder = 8
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
    CaptionImageIndex = 0
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
    Caption = 'bsSkinPanel10'
    Align = alTop
    ExplicitTop = 237
    object lblLinkBib1: TbsSkinLinkLabel
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 374
      Height = 18
      Cursor = crHandPoint
      Margins.Left = 5
      GlowEffect = False
      GlowSize = 7
      UseUnderLine = True
      UseSkinFont = True
      DefaultActiveFontColor = clBlue
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = [fsUnderline]
      SkinData = DM.bsSkinData1
      SkinDataName = 'stdlabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      Align = alClient
      AutoSize = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 78
      ExplicitWidth = 139
      ExplicitHeight = 17
    end
    object btCopLinkBib1: TbsSkinSpeedButton
      Left = 488
      Top = 0
      Width = 91
      Height = 24
      HintImageIndex = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      CheckedMode = False
      ImageList = DM.ico_16x16
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 54
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = 'Copiar Link'
      ShowCaption = True
      NumGlyphs = 1
      Align = alRight
      Margin = 5
      Spacing = 1
      OnClick = btCopLinkBib1Click
      ExplicitLeft = 491
      ExplicitTop = -3
    end
    object bsSkinLabel6: TbsSkinLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 98
      Height = 18
      Margins.Left = 5
      HintImageIndex = 0
      TabOrder = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = True
      UseSkinFontColor = True
      BorderStyle = bvNone
      Align = alLeft
      Caption = 'Link - Transmiss'#227'o: '
      AutoSize = True
    end
  end
  object bsSkinPanel7: TbsSkinPanel
    Left = 0
    Top = 284
    Width = 579
    Height = 42
    HintImageIndex = 0
    TabOrder = 9
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
    Align = alBottom
    object bsSkinButton2: TbsSkinButton
      AlignWithMargins = True
      Left = 482
      Top = 5
      Width = 92
      Height = 32
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
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
      ImageIndex = 1
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
      Caption = 'Fechar'
      NumGlyphs = 1
      Spacing = 1
      Align = alRight
      OnClick = bsSkinButton2Click
    end
  end
  object bsSkinPanel8: TbsSkinPanel
    Left = 0
    Top = 45
    Width = 579
    Height = 36
    HintImageIndex = 0
    TabOrder = 10
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
    Caption = 'bsSkinPanel8'
    Align = alTop
    object btServidor: TbsSkinSpeedButton
      AlignWithMargins = True
      Left = 424
      Top = 5
      Width = 150
      Height = 26
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      HintImageIndex = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      CheckedMode = False
      ImageList = DM.ico_24x24
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 8
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = 'Iniciar Servidor'
      ShowCaption = True
      NumGlyphs = 1
      Align = alRight
      Margin = 5
      Spacing = 1
      OnClick = btServidorClick
    end
    object btIPRede: TbsSkinSpeedButton
      AlignWithMargins = True
      Left = 320
      Top = 5
      Width = 94
      Height = 26
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      HintImageIndex = 0
      SkinData = DM.bsSkinData1
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      CheckedMode = False
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 0
      RepeatMode = False
      RepeatInterval = 100
      Transparent = True
      Flat = True
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = 'Usar IP da Rede'
      ShowCaption = True
      NumGlyphs = 1
      Align = alRight
      Margin = 5
      Spacing = 1
      OnClick = btIPRedeClick
    end
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
    BorderIcons = []
    Left = 215
    Top = 239
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 168
    Top = 240
  end
end