object Form1: TForm1
  Left = 311
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Posh script starter V1.0'
  ClientHeight = 279
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 91
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1082#1088#1080#1087#1090':'
  end
  object Label2: TLabel
    Left = 9
    Top = 52
    Width = 50
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 26
    Width = 369
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 384
    Top = 24
    Width = 75
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 384
    Top = 168
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 232
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 8
    Top = 72
    Width = 369
    Height = 185
    ReadOnly = True
    TabOrder = 5
  end
  object Button7: TButton
    Left = 384
    Top = 200
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = Button7Click
  end
  object GroupBox1: TGroupBox
    Left = 472
    Top = 8
    Width = 473
    Height = 257
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1082#1088#1080#1087#1090' PowerShell'
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 9
      Top = 100
      Width = 50
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 50
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 29
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object Edit1: TEdit
      Left = 8
      Top = 32
      Width = 441
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 8
      Top = 72
      Width = 361
      Height = 21
      TabOrder = 1
    end
    object Button4: TButton
      Left = 374
      Top = 68
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 8
      Top = 212
      Width = 129
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 328
      Top = 212
      Width = 129
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      TabOrder = 4
      OnClick = Button6Click
    end
    object Memo2: TMemo
      Left = 9
      Top = 116
      Width = 438
      Height = 89
      TabOrder = 5
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '.ps1|*.ps1|ALL|*'
    Left = 768
    Top = 72
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 8
    object N1: TMenuItem
      Caption = #1052#1077#1085#1102
      object N2: TMenuItem
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1085#1077#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1089#1082#1088#1080#1087#1090#1099
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1085#1077#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1077' '#1089#1082#1088#1080#1087#1090#1099
        OnClick = N3Click
      end
    end
  end
end
