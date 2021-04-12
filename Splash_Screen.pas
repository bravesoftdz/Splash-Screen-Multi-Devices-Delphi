unit Splash_Screen;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, Vcl.Controls, Winapi.Windows, Winapi.Messages,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    pnPrincipal: TRectangle;
    lbIfchat: TLabel;
    lbApp: TLabel;
    lbInformation: TLabel;
    Timer1: TTimer;
    lbLoading: TLabel;
    lytProgressBar: TLayout;
    pnBarraVazia: TRectangle;
    lbValor: TLabel;
    Progress: TRectangle;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    StepUnit: Single;
    Step     : Single;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  StepUnit := 0;
  Step     := 0;
  Progress.Width := 0;
  StepUnit := (pnBarraVazia.Width / 10);

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Progress.Width >= pnBarraVazia.Width then
    begin
      Timer1.Enabled := False;
      Application.Terminate;
      Exit;
    end;

  Step := Step + StepUnit;
  Progress.Width := Step;

  lbValor.Text := Format('%2.2d', [Trunc(((Step / pnBarraVazia.Width) * 100)+10)]) + '%';


     Progress.Width := Progress.Width + 56;
   //  lbLoading.Text := IntToStr(ProgressBar1.Position)+'%';
     if lbLoading.Text = 'loading' then
        lbLoading.Text := 'loading.'
     else if lbLoading.Text = 'loading.' then
        lbLoading.Text := 'loading..'
     else if lbLoading.Text = 'loading..' then
        lbLoading.Text := 'loading...'
    else if lbLoading.Text = 'loading...' then
        lbLoading.Text := 'loading';

     if Progress.Width = 112 then
        lbInformation.Text := 'Carregando usu�rios';
     if Progress.Width = 280 then
        lbInformation.Text := 'Carregando banco de dados';
     if Progress.Width = 448 then
        lbInformation.Text := 'Carregando componentes visuais';
     if Progress.Width = 560 then
        lbInformation.Text := 'Quase l�';

     if Progress.Width = 616 then
      Application.Terminate;

end;

end.

