object Form2: TForm2
  Left = 409
  Height = 593
  Top = 226
  Width = 350
  Anchors = []
  Caption = 'HTTPS Server'
  ClientHeight = 593
  ClientWidth = 350
  Color = clBtnFace
  DesignTimePPI = 120
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  LCLVersion = '1.8.2.0'
  object Label1: TLabel
    Left = 33
    Height = 13
    Top = 304
    Width = 87
    Caption = 'Server Responses'
    ParentColor = False
  end
  object Button1: TButton
    Left = 32
    Height = 25
    Top = 40
    Width = 296
    Caption = 'Setup Server and Activate it'
    OnClick = Button1Click
    TabOrder = 0
  end
  object memResults: TMemo
    Left = 32
    Height = 264
    Top = 320
    Width = 297
    Anchors = []
    ReadOnly = True
    TabOrder = 1
  end
  object Button4: TButton
    Left = 33
    Height = 25
    Top = 83
    Width = 297
    Anchors = []
    Caption = 'Close Server'
    OnClick = Button4Click
    TabOrder = 2
  end
  object rbsslv3: TRadioButton
    Left = 38
    Height = 23
    Top = 106
    Width = 58
    Caption = 'rbsslv3'
    TabOrder = 3
  end
  object rbtlsv10: TRadioButton
    Left = 96
    Height = 23
    Top = 106
    Width = 63
    Caption = 'rbtlsv10'
    TabOrder = 4
  end
  object rbtlsv11: TRadioButton
    Left = 160
    Height = 23
    Top = 106
    Width = 63
    Caption = 'rbtlsv11'
    TabOrder = 5
  end
  object rbtlsv12: TRadioButton
    Left = 224
    Height = 23
    Top = 106
    Width = 63
    Caption = 'rbtlsv12'
    Checked = True
    TabOrder = 6
    TabStop = True
  end
  object txtkey: TEdit
    Left = 33
    Height = 21
    Top = 152
    Width = 289
    TabOrder = 7
    Text = 'device.key'
  end
  object Label2: TLabel
    Left = 33
    Height = 13
    Top = 136
    Width = 18
    Caption = 'Key'
    ParentColor = False
  end
  object txtcertificate: TEdit
    Left = 33
    Height = 21
    Top = 192
    Width = 289
    TabOrder = 8
    Text = 'device.crt'
  end
  object Label3: TLabel
    Left = 35
    Height = 13
    Top = 176
    Width = 50
    Caption = 'Certificate'
    ParentColor = False
  end
  object txtport: TEdit
    Left = 31
    Height = 21
    Top = 19
    Width = 295
    TabOrder = 9
    Text = '4443'
  end
  object Label4: TLabel
    Left = 30
    Height = 13
    Top = 4
    Width = 20
    Caption = 'Port'
    ParentColor = False
  end
  object Label5: TLabel
    Left = 33
    Height = 13
    Top = 216
    Width = 46
    Caption = 'Password'
    ParentColor = False
  end
  object txtpassword: TEdit
    Left = 33
    Height = 21
    Top = 232
    Width = 289
    TabOrder = 10
    Text = 'password'
  end
  object Label6: TLabel
    Left = 33
    Height = 13
    Top = 256
    Width = 68
    Caption = 'RootCA (opt.)'
    ParentColor = False
  end
  object txtrootca: TEdit
    Left = 33
    Height = 21
    Top = 272
    Width = 289
    TabOrder = 11
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    OnAfterBind = IdTCPServer1AfterBind
    top = 72
  end
  object IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    left = 32
    top = 72
  end
  object IdAntiFreeze1: TIdAntiFreeze
    left = 72
    top = 72
  end
end
