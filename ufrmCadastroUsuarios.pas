unit ufrmCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFormCadastroUsuarios = class(TFormCadastroBasico)
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditNome: TEdit;
    EditLogin: TEdit;
    EditSenha: TEdit;
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure ButFiltrarClick(Sender: TObject);
    procedure AcPesquisarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroUsuarios: TFormCadastroUsuarios;

implementation

{$R *.dfm}

uses ModConexao, UnitFuncoes;

procedure TFormCadastroUsuarios.AcEditarExecute(Sender: TObject);
begin
  inherited;

  EditNome.Text := DataModuleDados.CDS_usuariosnome.AsString;
  EditLogin.Text := DataModuleDados.CDS_usuarioslogin.AsString;
  EditSenha.Text := DataModuleDados.CDS_usuariossenha.AsString;
end;

procedure TFormCadastroUsuarios.AcPesquisarExecute(Sender: TObject);
begin
  inherited;

  DataModuleDados.CDS_usuarios.Close;
  DataModuleDados.CDS_usuarios.CommandText := 'SELECT * FROM USUARIOS';
  DataModuleDados.CDS_usuarios.Open;

end;

procedure TFormCadastroUsuarios.AcSalvarExecute(Sender: TObject);
begin

  if (DsTabela.State in [dsInsert]) and (GetLoginCadastrado(trim(EditLogin.Text))) then
  Application.MessageBox('Login já cadastrado!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditLogin.SetFocus;

  if Trim(EditNome.Text) = '' then

  begin
  Application.MessageBox('Preencha o campo Nome!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditNome.SetFocus;
  Abort;
  end;

  if Trim(EditLogin.Text) = '' then

  begin
  Application.MessageBox('Preencha o campo Login!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditLogin.SetFocus;
  Abort;
  end;

  if Trim(EditSenha.Text) = '' then

  begin
  Application.MessageBox('Preencha o campo Senha!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditSenha.SetFocus;
  Abort;
  end;

  //Só será atualizado se existirem dados cadastrados.
  if DsTabela.State in [dsInsert] then

  //Colocar informações no banco de dados.
  DataModuleDados.CDS_usuariosid.AsInteger := GetId('ID', 'USUARIOS');
  DataModuleDados.CDS_usuariosnome.AsString := trim(EditNome.Text);
  DataModuleDados.CDS_usuarioslogin.AsString := trim(EditLogin.Text);
  DataModuleDados.CDS_usuariossenha.AsString := trim(EditSenha.Text);
  DataModuleDados.CDS_usuariosstatus.AsString := 'A';
  DataModuleDados.CDS_usuariosdt_cadastro.AsDateTime := now;

  inherited;//Deve ficar no final.

end;

procedure TFormCadastroUsuarios.ButFiltrarClick(Sender: TObject);
begin

  if EditPesquisar.Text = '' then
  begin
    Application.MessageBox('Informe o que será pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
    EditPesquisar.SetFocus;
    Abort;
  end;


  inherited;

  DataModuleDados.CDS_usuarios.Close;

  case ComboFiltrar.ItemIndex of
  0 : DataModuleDados.CDS_usuarios.CommandText := 'SELECT * FROM USUARIOS WHERE NOME LIKE '+QuotedStr('%'+EditPesquisar.Text+'%');
  1 : DataModuleDados.CDS_usuarios.CommandText := 'SELECT * FROM USUARIOS WHERE LOGIN LIKE '+QuotedStr('%'+EditPesquisar.Text+'%');
  end;

  DataModuleDados.CDS_usuarios.Open;

end;

end.
