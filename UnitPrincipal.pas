unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    ImgUsuario: TImage;
    ImgReceber: TImage;
    ImgPagar: TImage;
    ImgCaixa: TImage;
    ImgConReceber: TImage;
    ImgConPagar: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ImgRelatorioPagar: TImage;
    Label10: TLabel;
    ImgConfiguracoes: TImage;
    Label11: TLabel;
    ImgNavegador: TImage;
    Label12: TLabel;
    ImgRelatorioReceber: TImage;
    Label15: TLabel;
    ImgRelatorioCaixa: TImage;
    Label16: TLabel;
    Label13: TLabel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure ImgUsuarioClick(Sender: TObject);
    procedure ImgCaixaClick(Sender: TObject);
    procedure ImgPagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses ufrmCadastroBasico, ufrmCadastroUsuarios, ufrmCadastroCaixa,
  ufrmCadastroContasPagar;

procedure TFormPrincipal.BitBtn1Click(Sender: TObject);

begin
   FormCadastroBasico := TFormCadastroBasico.Create(nil);

   try

    FormCadastroBasico.ShowModal;

   finally

    FreeAndNil (FormCadastroBasico);

   end;
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if Application.MessageBox('Tem certeza que deseja sair?', 'Informação', MB_YESNO+MB_ICONQUESTION) = mrYes then

  Application.Terminate

  else

  Abort;

  end;

procedure TFormPrincipal.ImgCaixaClick(Sender: TObject);
begin
  FormCadastroCaixa := TFormCadastroCaixa.Create(nil);
  try

    FormCadastroCaixa.ShowModal;

   finally

    FreeAndNil (FormCadastroCaixa);

   end;
end;

procedure TFormPrincipal.ImgPagarClick(Sender: TObject);
begin
  FormCadastroContasPagar := TFormCadastroContasPagar.Create(nil);
  try

    FormCadastroContasPagar.ShowModal;

   finally

    FreeAndNil (FormCadastroContasPagar);

   end;
end;

procedure TFormPrincipal.ImgUsuarioClick(Sender: TObject);
begin
  FormCadastroUsuarios := TFormCadastroUsuarios.Create(nil);
  try

    FormCadastroUsuarios.ShowModal;

   finally

    FreeAndNil (FormCadastroUsuarios);

   end;
end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

end.
