unit TestForm;

interface

uses
  SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs,
  IdComponent, IdCustomTCPServer, IdTCPServer, IdContext, StdCtrls,
  IdIOHandler, IdIOHandlerStack,
   IdAntiFreeze;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    IdAntiFreeze1: TIdAntiFreeze;
    IdTCPServer1: TIdTCPServer;
    memResults: TMemo;
    Button4: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure IdSSLIOHandlerSocketOpenSSL1Status(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: string);
    procedure IdTCPServer1AfterBind(Sender: TObject);

  private
    { Private declarations }
    procedure ServerExecute(AContext: TIdContext);
    procedure ServerConnect(AContext: TIdContext);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
const
  SERVER_PORT = 80;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  IdTCPServer1.DefaultPort := SERVER_PORT;
  IdTCPServer1.OnConnect := ServerConnect;
  IdTCPServer1.OnExecute := ServerExecute;
  IdTCPServer1.Active := True;
  memResults.Lines.Add ('start');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  IdTCPServer1.Active := false;
   memResults.Lines.Add ('stop');
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
end;

procedure TForm2.ServerExecute(AContext: TIdContext);
var
  lCmdLine,uri: string;
begin
    lCmdLine := AContext.Connection.IOHandler.ReadLn;
    memResults.Lines.Add (lCmdLine);
    if lCmdLine<>'' then
        begin
        uri := StringReplace (lCmdLine ,'GET ','',[]);
        uri := copy(uri,1,pos(' ',uri )-1);
        uri :=StringReplace (uri,'/','',[]);;
        if FileExists(uri)
           then AContext.Connection.IOHandler.WriteFile(uri)
           else AContext.Connection.IOHandler.Writeln('file not found');
        AContext.Connection.Disconnect;
        end;
end;


end.
