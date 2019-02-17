object Form2: TForm2
  Left = 409
  Height = 343
  Top = 303
  Width = 609
  Caption = 'Form2'
  ClientHeight = 343
  ClientWidth = 609
  Color = clBtnFace
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  LCLVersion = '1.8.2.0'
  object Label1: TLabel
    Left = 296
    Height = 13
    Top = 69
    Width = 87
    Caption = 'Server Responses'
    ParentColor = False
  end
  object Button1: TButton
    Left = 32
    Height = 25
    Top = 24
    Width = 201
    Caption = 'Setup Server and Activate it'
    OnClick = Button1Click
    TabOrder = 0
  end
  object memResults: TMemo
    Left = 296
    Height = 227
    Top = 93
    Width = 297
    Anchors = [akTop, akLeft, akRight, akBottom]
    ReadOnly = True
    TabOrder = 1
  end
  object edtEcho: TEdit
    Left = 296
    Height = 21
    Top = 26
    Width = 217
    TabOrder = 2
    TextHint = 'Enter Echo Text'
  end
  object Button2: TButton
    Left = 519
    Height = 25
    Top = 24
    Width = 75
    Caption = 'Send'
    OnClick = Button2Click
    TabOrder = 3
  end
  object Button3: TButton
    Left = 24
    Height = 25
    Top = 192
    Width = 201
    Caption = 'Setup Client and Connect to Server'
    OnClick = Button3Click
    TabOrder = 4
  end
  object Button4: TButton
    Left = 32
    Height = 25
    Top = 56
    Width = 201
    Anchors = [akLeft, akBottom]
    Caption = 'Close Server'
    OnClick = Button4Click
    TabOrder = 5
  end
  object Button5: TButton
    Left = 24
    Height = 25
    Top = 224
    Width = 201
    Anchors = [akLeft, akBottom]
    Caption = 'Quit and Close Client'
    OnClick = Button5Click
    TabOrder = 6
  end
  object rbsslv3: TRadioButton
    Left = 38
    Height = 19
    Top = 90
    Width = 54
    Caption = 'rbsslv3'
    TabOrder = 7
  end
  object rbtlsv10: TRadioButton
    Left = 96
    Height = 19
    Top = 90
    Width = 59
    Caption = 'rbtlsv10'
    TabOrder = 8
  end
  object rbtlsv11: TRadioButton
    Left = 160
    Height = 19
    Top = 90
    Width = 59
    Caption = 'rbtlsv11'
    TabOrder = 9
  end
  object rbtlsv12: TRadioButton
    Left = 224
    Height = 19
    Top = 90
    Width = 59
    Caption = 'rbtlsv12'
    Checked = True
    TabOrder = 10
    TabStop = True
  end
  object uri: TButton
    Left = 184
    Height = 25
    Top = 312
    Width = 75
    Caption = 'uri'
    OnClick = uriClick
    TabOrder = 11
    Visible = False
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnAfterBind = IdTCPServer1AfterBind
    left = 72
    top = 128
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    left = 128
    top = 128
  end
  object IdTCPClient1: TIdTCPClient
    ConnectTimeout = 0
    Port = 0
    ReadTimeout = -1
    left = 72
    top = 264
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    OnStatus = IdSSLIOHandlerSocketOpenSSL1Status
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    left = 128
    top = 264
  end
  object IdAntiFreeze1: TIdAntiFreeze
    left = 272
    top = 160
  end
end
