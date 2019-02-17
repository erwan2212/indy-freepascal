object Form2: TForm2
  Left = 409
  Height = 398
  Top = 303
  Width = 350
  Anchors = []
  Caption = 'Form2'
  ClientHeight = 398
  ClientWidth = 350
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  LCLVersion = '1.8.2.0'
  object Label1: TLabel
    Left = 32
    Height = 13
    Top = 112
    Width = 87
    Caption = 'Server Responses'
    ParentColor = False
  end
  object Button1: TButton
    Left = 32
    Height = 25
    Top = 24
    Width = 296
    Caption = 'Setup Server and Activate it'
    OnClick = Button1Click
    TabOrder = 0
  end
  object memResults: TMemo
    Left = 32
    Height = 264
    Top = 128
    Width = 297
    Anchors = []
    ReadOnly = True
    TabOrder = 1
  end
  object Button4: TButton
    Left = 32
    Height = 25
    Top = 56
    Width = 297
    Anchors = []
    Caption = 'Close Server'
    OnClick = Button4Click
    TabOrder = 2
  end
  object rbsslv3: TRadioButton
    Left = 38
    Height = 19
    Top = 90
    Width = 54
    Caption = 'rbsslv3'
    TabOrder = 3
  end
  object rbtlsv10: TRadioButton
    Left = 96
    Height = 19
    Top = 90
    Width = 59
    Caption = 'rbtlsv10'
    TabOrder = 4
  end
  object rbtlsv11: TRadioButton
    Left = 160
    Height = 19
    Top = 90
    Width = 59
    Caption = 'rbtlsv11'
    TabOrder = 5
  end
  object rbtlsv12: TRadioButton
    Left = 224
    Height = 19
    Top = 90
    Width = 59
    Caption = 'rbtlsv12'
    Checked = True
    TabOrder = 6
    TabStop = True
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnAfterBind = IdTCPServer1AfterBind
    top = 8
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    left = 48
    top = 8
  end
  object IdAntiFreeze1: TIdAntiFreeze
    left = 96
    top = 8
  end
end
