unit ufrmCadastroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormCadastroCaixa = class(TFormCadastroBasico)
    Label2: TLabel;
    Label4: TLabel;
    EditNumeroDoc: TEdit;
    EditDescricao: TEdit;
    RadioGroup: TRadioGroup;
    EditValor: TEdit;
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcPesquisarExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure ButFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCaixa: TFormCadastroCaixa;

implementation

{$R *.dfm}

uses ModConexao, UnitFuncoes, System.Math;

procedure TFormCadastroCaixa.AcEditarExecute(Sender: TObject);
begin
  inherited;

  EditNumeroDoc.Text := DataModuleDados.CDS_caixanumero_doc.AsString;
  EditDescricao.Text := DataModuleDados.CDS_caixadescricao.AsString;
  EditValor.Text := FormatFloat(',#0.00',DataModuleDados.CDS_caixavalor.AsCurrency);
  radiogroup.ItemIndex := ifthen(DataModuleDados.CDS_caixatipo.AsString = 'C', 0,1);

end;

procedure TFormCadastroCaixa.AcPesquisarExecute(Sender: TObject);
begin
  inherited;

  DataModuleDados.CDS_caixa.Close;
  DataModuleDados.CDS_caixa.CommandText := 'SELECT * FROM CAIXA';
  DataModuleDados.CDS_caixa.Open;
end;

procedure TFormCadastroCaixa.AcSalvarExecute(Sender: TObject);
begin

  if Trim(EditNumeroDoc.Text) = '' then

  begin
  Application.MessageBox('Preencha o campo N° do Documento!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditNumeroDoc.SetFocus;
  Abort;
  end;

  if Trim(EditValor.Text) = '' then

  begin
  Application.MessageBox('Preencha o campo Valor!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditValor.SetFocus;
  Abort;
  end;

  if Trim(EditDescricao.Text) = '' then

  begin
  Application.MessageBox('Preencha o campo Descrição!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditDescricao.SetFocus;
  Abort;
  end;

  if StringToFloat(EditValor.Text) <= 0 then
  begin
  Application.MessageBox('Este valor não é aceito!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditValor.SetFocus;
  Abort;
  end;

  //Só será atualizado se existirem dados cadastrados.
  if DsTabela.State in [dsInsert] then

  DataModuleDados.CDS_caixaid.AsInteger := GetId('ID', 'CAIXA');
  DataModuleDados.CDS_caixanumero_doc.AsString := trim(EditNumeroDoc.Text);
  DataModuleDados.CDS_caixadescricao.AsString := trim(EditDescricao.Text);
  DataModuleDados.CDS_caixavalor.AsCurrency := StringToFloat(EditValor.Text);
  DataModuleDados.CDS_caixadt_cadastro.AsDateTime := now;

  case RadioGroup.ItemIndex of
  0 : DataModuleDados.CDS_caixatipo.AsString := 'C';
  1 : DataModuleDados.CDS_caixatipo.AsString := 'D';
  end;

  inherited;

end;

procedure TFormCadastroCaixa.ButFiltrarClick(Sender: TObject);
begin

  if EditPesquisar.Text = '' then
  begin
    Application.MessageBox('Informe o que será pesquisado', 'Atenção', MB_OK+MB_ICONWARNING);
    EditPesquisar.SetFocus;
    Abort;
  end;


  inherited;

  DataModuleDados.CDS_caixa.Close;

  case ComboFiltrar.ItemIndex of
  0 : DataModuleDados.CDS_caixa.CommandText := 'SELECT * FROM CAIXA WHERE DOCUMENTO LIKE '+QuotedStr('%'+EditPesquisar.Text+'%');
  1 : DataModuleDados.CDS_caixa.CommandText := 'SELECT * FROM CAIXA WHERE DESCRICAO LIKE '+QuotedStr('%'+EditPesquisar.Text+'%');
  end;

  DataModuleDados.CDS_caixa.Open;

end;

end.
