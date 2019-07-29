{
1/rootca
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem

2/install rootca
import with certmgr.msc (x509)

3/generate a csr for a service
openssl genrsa -out device.key 2048
openssl req -new -key device.key -out device.csr
OR with SAN :
openssl req -new -key device.key -out device2.csr -extensions v3_req -reqexts SAN
->The important question to answer though is common-name.
->Whatever you see in the address field in your browser when you go to your device must be what you put under common name, even if it’s an IP address

openssl req -in device2.csr -noout -text

4/generate the final crt
openssl x509 -req -in device.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device.crt -days 500 -sha256
OR with SAN (dont forget to edit openssl.cnf with section default and req pointing to v3_req)
openssl x509 -req -in device2.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out device2.crt -days 500 -sha256 -extfile c:\_apps\openssl\ssl\openssl.cnf

openssl x509 -in device2.crt -text -noout

}
unit TestForm;

interface

uses
  SysUtils,  Classes, Graphics,
  Controls, Forms, Dialogs, IdServerIOHandler, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdTCPServer, IdContext, StdCtrls,
  IdIOHandler, IdIOHandlerStack, IdAntiFreezeBase, IdAntiFreeze;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Label4: TLabel;
    txtport: TEdit;
    Label3: TLabel;
    txtkey: TEdit;
    IdTCPServer1: TIdTCPServer;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    Label2: TLabel;
    memResults: TMemo;
    Button4: TButton;
    Label1: TLabel;
    IdAntiFreeze1: TIdAntiFreeze;
    rbtlsv12: TRadioButton;
    rbtlsv11: TRadioButton;
    rbtlsv10: TRadioButton;
    rbsslv3: TRadioButton;
    txtcertificate: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure IdSSLIOHandlerSocketOpenSSL1Status(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: string);
    procedure IdTCPServer1AfterBind(Sender: TObject);

  private
    { Private declarations }
    procedure ServerExecute(AContext: TIdContext);
    procedure GetPassword(var Password: string);
    procedure ServerConnect(AContext: TIdContext);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
//const   SERVER_PORT = 4443;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
 //In the real world:
 //    FileNames should not be hardcoded, let the be configured external.
 //    Certs expire and change be prepared to handle it.
  IdServerIOHandlerSSLOpenSSL1.SSLOptions.CertFile := txtcertificate.Text ;
  IdServerIOHandlerSSLOpenSSL1.SSLOptions.KeyFile := txtkey.Text ;
  //IdServerIOHandlerSSLOpenSSL1.SSLOptions.RootCertFile := 'rootca.pem';  //not mandatory since cert is signed with rootca and installed on client?

//  IdServerIOHandlerSSLOpenSSL1.SSLOptions.RootCertFile := 'C:\_apps\openssl\rootca.pem'; //needed? since cert is signed with root cert
  IdServerIOHandlerSSLOpenSSL1.SSLOptions.Mode := sslmServer;
  IdServerIOHandlerSSLOpenSSL1.SSLOptions.VerifyMode := [];
  IdServerIOHandlerSSLOpenSSL1.SSLOptions.VerifyDepth  := 0;
  if rbtlsv12.Checked then IdServerIOHandlerSSLOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1_2];    // Avoid using SSL
  if rbtlsv11.Checked then IdServerIOHandlerSSLOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1_1];    // Avoid using SSL
  if rbtlsv10.Checked then IdServerIOHandlerSSLOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1];    // Avoid using SSL
  if rbsslv3.Checked then IdServerIOHandlerSSLOpenSSL1.SSLOptions.SSLVersions := [sslvSSLv3 ];    // Avoid using SSL
  IdServerIOHandlerSSLOpenSSL1.OnGetPassword := GetPassword;


  IdTCPServer1.DefaultPort := strtoint(txtport.Text) ;
  IdTCPServer1.IOHandler := IdServerIOHandlerSSLOpenSSL1;
  IdTCPServer1.OnConnect := ServerConnect;
  IdTCPServer1.OnExecute := ServerExecute;
  IdTCPServer1.Active := True;

  memResults.Lines.Add ('start');

  //provided the root ca is added to the root trusted ca
  //I.E will be fully happy
  //FF will moan about the CN but will go allow to go thru : SEC_ERROR_UNKNOWN_ISSUER
  //Chrome is not happy at all : NET::ERR_CERT_COMMON_NAME_INVALID, use SAN=ip instead of CN=IP ?
end;





procedure TForm2.Button4Click(Sender: TObject);
begin
  IdTCPServer1.Active := false;
   memResults.Lines.Add ('stop');
end;



procedure TForm2.GetPassword(var Password: string);
begin
 //In the real world:
 //   This should never be hardcoded as it could change when the cert changes.
 //   Don't use Dictonary Words or your key can be brute force attacked.
    writeln('GetPassword');
    Password := 'test';
end;

procedure TForm2.IdSSLIOHandlerSocketOpenSSL1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: string);
begin
   memResults.Lines.Add(AStatusText);
end;

procedure TForm2.IdTCPServer1AfterBind(Sender: TObject);
begin

end;

procedure TForm2.ServerConnect(AContext: TIdContext);
begin
  memResults.Lines.Add('ServerConnect');
  //These two lines are required to get SSL to work.
  if (AContext.Connection.IOHandler is TIdSSLIOHandlerSocketBase) then
      TIdSSLIOHandlerSocketBase(AContext.Connection.IOHandler).PassThrough := false;

end;

procedure TForm2.ServerExecute(AContext: TIdContext);
var
  lCmdLine,uri: string;
  connected : Boolean;
begin

  Connected := true;
    lCmdLine := AContext.Connection.IOHandler.ReadLn;
    memResults.Lines.Add (lCmdLine);

    if lCmdLine<>'' then
        begin
        //AContext.Connection.IOHandler.Writeln('hello world');
        uri := StringReplace (lCmdLine ,'GET ','',[]);
        uri:= copy(uri,1,pos(' ',uri )-1);
        //memResults.lines.add(uri);
        uri:=StringReplace (uri,'/','',[]);;
        if FileExists(uri)
           then AContext.Connection.IOHandler.WriteFile(uri)
           else AContext.Connection.IOHandler.Writeln('file not found');
        AContext.Connection.Disconnect;
        Connected := false;
        end;
end;


end.
