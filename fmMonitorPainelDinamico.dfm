object fMonitorPainelDinamico: TfMonitorPainelDinamico
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Texto Din'#226'mico'
  ClientHeight = 400
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTxtPainelD: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 400
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object imgTxtPainelD: TImage
      Left = 2
      Top = 2
      Width = 780
      Height = 423
      Center = True
      Stretch = True
      Transparent = True
    end
    object lmdTxtPainelD: TLabel
      Left = 0
      Top = 0
      Width = 600
      Height = 400
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = '....'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = -3
      ExplicitTop = 3
      ExplicitWidth = 697
      ExplicitHeight = 364
    end
  end
end