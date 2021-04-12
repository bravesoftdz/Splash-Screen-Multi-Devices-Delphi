program Splash_Screen_MultiDevices;

uses
  System.StartUpCopy,
  FMX.Forms,
  Splash_Screen in 'Splash_Screen.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
