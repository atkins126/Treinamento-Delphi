program Sistema_Financas;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  ModConexao in 'ModConexao.pas' {DataModuleDados: TDataModule},
  ufrmCadastroBasico in 'view\ufrmCadastroBasico.pas' {FormCadastroBasico},
  ufrmCadastroUsuarios in 'view\ufrmCadastroUsuarios.pas' {FormCadastroUsuarios},
  UnitFuncoes in 'classes\UnitFuncoes.pas',
  ufrmCadastroCaixa in 'view\ufrmCadastroCaixa.pas' {FormCadastroCaixa},
  ufrmCadastroContasPagar in 'view\ufrmCadastroContasPagar.pas' {FormCadastroContasPagar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDataModuleDados, DataModuleDados);
  Application.Run;
end.
