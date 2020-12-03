unit ufrmCadastroBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.StdStyleActnCtrls, Datasnap.DBClient, Vcl.Buttons;

type
  TFormCadastroBasico = class(TForm)
    dsTabela: TDataSource;
    TabTitulo: TPageControl;
    TabCadastro: TTabSheet;
    ImageListCadastro: TImageList;
    Label1: TLabel;
    EditPesquisar: TEdit;
    ButFiltrar: TButton;
    ActAcoes: TActionList;
    ActInserir: TAction;
    ActEditar: TAction;
    ActExcluir: TAction;
    ActSalvar: TAction;
    ActCancelar: TAction;
    ActPesquisar: TAction;
    ActImprimir: TAction;
    ActVoltar: TAction;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBGridDados: TDBGrid;
    Label3: TLabel;
    TabPesquisa: TTabSheet;
    ComboFiltrar: TComboBox;
    Label0: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabTituloChange(Sender: TObject);
    procedure TabPesquisarShow(Sender: TObject);
    procedure AcInserirExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcExcluirExecute(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure AcPesquisarExecute(Sender: TObject);
    procedure AcImprimirExecute(Sender: TObject);
    procedure AcVoltarExecute(Sender: TObject);
    procedure AcInserirUpdate(Sender: TObject);
    procedure AcEditarUpdate(Sender: TObject);
    procedure AcExcluirUpdate(Sender: TObject);
    procedure AcCancelarUpdate(Sender: TObject);
    procedure AcImprimirUpdate(Sender: TObject);
    procedure AcSalvarUpdate(Sender: TObject);
    procedure DBGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private

    iModo : Integer;

    procedure LimparCampos;

  public
    { Public declarations }
  end;

var
  FormCadastroBasico: TFormCadastroBasico;

implementation

{$R *.dfm}

uses ModConexao, UnitFuncoes;

procedure TFormCadastroBasico.AcCancelarExecute(Sender: TObject);
begin
  LimparCampos;
  TClientDataSet(dsTabela.DataSet).Cancel;
end;

procedure TFormCadastroBasico.AcCancelarUpdate(Sender: TObject);
begin
  //O botão cancelar estará ativo apenas quando o botão salvar também estiver.
  TAction(ActCancelar).Enabled := TAction(ActSalvar).Enabled = true;
end;

procedure TFormCadastroBasico.AcEditarExecute(Sender: TObject);
begin

  iModo := 1;

  if TabTitulo.ActivePage = TabPesquisa then
  TabCadastro.TabVisible := true;
  TabPesquisa.TabVisible := false;
  TabTitulo.ActivePage := TabCadastro;

  TClientDataSet(dsTabela.DataSet).Edit;
end;

procedure TFormCadastroBasico.AcEditarUpdate(Sender: TObject);
begin
  if not TClientDataSet (dsTabela.DataSet).IsEmpty then
  ActEditar.Enabled := true;
end;

procedure TFormCadastroBasico.AcExcluirExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluir o registro?', 'Pergunta', MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin

    try
      TClientDataSet(dsTabela.DataSet).Delete;
      TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

      Application.MessageBox('Registro excluído com sucesso', 'Informação', 0+64);

      //Limpar os campos.
      TClientDataSet(dsTabela.DataSet).Open;

      //Caso dê erro ao excluir.
      except on E: Exception do
      raise Exception.Create('Erro ao excluir registro '+E.Message);

    end;

  end;
end;

procedure TFormCadastroBasico.AcExcluirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet (dsTabela.DataSet).IsEmpty) then
  ActExcluir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TFormCadastroBasico.AcImprimirExecute(Sender: TObject);
begin
  showmessage('Em desenvolvimento');
end;

procedure TFormCadastroBasico.AcImprimirUpdate(Sender: TObject);
begin
  if (dsTabela.State in [dsBrowse]) and (not TClientDataSet (dsTabela.DataSet).IsEmpty) then
  ActImprimir.Enabled := dsTabela.State in [dsBrowse];
end;

procedure TFormCadastroBasico.AcInserirExecute(Sender: TObject);
begin

  IModo := 0;

  //trocar a página do painel.
  if TabTitulo.ActivePage = TabPesquisa then
  TabCadastro.TabVisible := true;
  TabPesquisa.TabVisible := false;
  TabTitulo.ActivePage := TabCadastro;

  if not TClientDataSet(dsTabela.DataSet).Active then
  TClientDataSet(dsTabela.DataSet).Open;
  TClientDataSet(dsTabela.DataSet).Insert;
end;

procedure TFormCadastroBasico.AcInserirUpdate(Sender: TObject);
begin
  //botão inserir estará ativo quando o painel estiver inativo.
  ActInserir.Enabled := dsTabela.State in [dsBrowse, dsInactive];
end;

procedure TFormCadastroBasico.AcPesquisarExecute(Sender: TObject);
begin

  TabTitulo.ActivePage := TabPesquisa;
  EditPesquisar.Clear;

end;

procedure TFormCadastroBasico.AcSalvarExecute(Sender: TObject);
begin
  //Botão salvar ativo somente quando existir dados no painel.
  ActSalvar.Enabled := dsTabela.State in [dsinsert, dsedit];

  try

  //Postagens dos valores e update.
  TClientDataSet(dsTabela.DataSet).Post;
  TClientDataSet(dsTabela.DataSet).ApplyUpdates(0);

  //Caso dê certo.
  case iModo of
  0 : Application.MessageBox('Registro inserido com sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
  1 : Application.MessageBox('Registro atualizado com sucesso!', 'Informação', MB_OK+MB_ICONINFORMATION);
  end;

  //Para limpar os campos
  LimparCampos;
  TClientDataSet(dsTabela.DataSet).Open;

  //Mensagem erro no processo.

    except  on E: Exception do
    raise Exception.Create('Erro ao salvar registro: '+E.Message);

  end;
end;

procedure TFormCadastroBasico.AcSalvarUpdate(Sender: TObject);
begin
  ActSalvar.Enabled := dsTabela.State in [dsInsert, dsEdit];
end;

procedure TFormCadastroBasico.AcVoltarExecute(Sender: TObject);
begin
  close;
end;

procedure TFormCadastroBasico.DBGridDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  EditarDBGrid(dsTabela, DBGridDados, State, Rect, Column);
end;

procedure TFormCadastroBasico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TClientDataSet(dsTabela.DataSet).Cancel;
   TClientDataSet(dsTabela.DataSet).Close;
end;

procedure TFormCadastroBasico.FormKeyPress(Sender: TObject; var Key: Char);

begin

  if key = #27 then //tecla esc

  close;

  if key = #13 then //tecla enter

  Perform(WM_NEXTDLGCTL,0,0);

end;

procedure TFormCadastroBasico.LimparCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do

  begin
    if Components[i] is TCustomEdit then
    TCustomEdit(Components[i]).Clear;

  end;

  if TabTitulo.ActivePage = TabCadastro then
  begin
  TabCadastro.TabVisible := false;
  TabTitulo.ActivePage := TabPesquisa;
  end;

  EditPesquisar.setFocus;

end;

procedure TFormCadastroBasico.TabPesquisarShow(Sender: TObject);
begin
  //Mostrar a página pesquisa quando painel estiver ativo.
  TabTitulo.ActivePage := TabPesquisa;
end;

procedure TFormCadastroBasico.TabTituloChange(Sender: TObject);
begin
  //Metodo criado apenas para que TabTitulo Change funcione.
  //NÃO APAGAR!!!
end;

end.
