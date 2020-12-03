unit ufrmCadastroContasPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Datasnap.DBClient;

type
  TFormCadastroContasPagar = class(TFormCadastroBasico)
    Label2: TLabel;
    EditNumDocumento: TEdit;
    EditDescricao: TEdit;
    Label4: TLabel;
    EditParcelas: TEdit;
    Label5: TLabel;
    EditValorCompra: TEdit;
    Label6: TLabel;
    EditDtCompra: TEdit;
    Label7: TLabel;
    EditVariacao: TEdit;
    ClientParcelas: TClientDataSet;
    DBGrid1: TDBGrid;
    dsParcelas: TDataSource;
    BitBtn1: TBitBtn;
    ClientParcelasParcelas: TIntegerField;
    ClientParcelasValor: TCurrencyField;
    ClientParcelasVencimento: TDateField;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AcSalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroContasPagar: TFormCadastroContasPagar;

implementation

{$R *.dfm}

uses ModConexao, UnitFuncoes;

procedure TFormCadastroContasPagar.AcSalvarExecute(Sender: TObject);
begin

  if Trim(EditNumDocumento.Text) = '' then

  begin
  Application.MessageBox('Preencha o campo Descrição!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditNumDocumento.SetFocus;
  Abort;
  end;

  //Código do botão salvar.
    try
  
    ClientParcelas.First;
    while not ClientParcelas.Eof do
    
    if DsTabela.State in [dsBrowse, dsInsert] then
      begin
      DataModuleDados.CDS_contas_pagar.Insert;
      DataModuleDados.CDS_contas_pagarid.AsInteger := GetId('ID', 'CONTAS_PAGAR');
      DataModuleDados.CDS_contas_pagarnumero_doc.AsString := trim(EditNumDocumento.Text);
      DataModuleDados.CDS_contas_pagardescricao.AsString := trim(EditDescricao.Text);
      DataModuleDados.CDS_contas_pagarParcela.AsInteger := ClientParcelasParcelas.AsInteger;
      DataModuleDados.CDS_contas_pagarvalor_parcela.AsCurrency := ClientParcelasValor.AsInteger;
      DataModuleDados.CDS_contas_pagarvalor_compra.AsCurrency := StringToFloat(EditValorCompra.Text);
      DataModuleDados.CDS_contas_pagardt_compra.AsDateTime := StrtoDate(EditDtCompra.Text);
      DataModuleDados.CDS_contas_pagardt_vencimento.AsDateTime := ClientParcelasVencimento.AsDateTime;
      DataModuleDados.CDS_contas_pagardt_cadastro.AsDateTime := now;
      DataModuleDados.CDS_contas_pagarstatus.AsString := 'A';
      DataModuleDados.CDS_contas_pagarvalor_abatido.AsCurrency := 0;

      //Postagens dos valores e update.
      DataModuleDados.CDS_contas_pagar.Post;
      DataModuleDados.CDS_contas_pagar.ApplyUpdates(0);
      ClientParcelas.Next;
      end;         
    

  TClientDataSet(dsTabela.DataSet).Open;

  //Mensagem erro no processo.

    except  on E: Exception do
    raise Exception.Create('Erro ao salvar registro: '+E.Message);

  end;

  //inherited;

end;

procedure TFormCadastroContasPagar.BitBtn1Click(Sender: TObject);

var i : Integer;

begin

  if EditNumDocumento.Text = '' then
  
  begin
  Application.MessageBox('Preencha o campo N° do Documento!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditNumDocumento.SetFocus;
  Abort;
  end;

  if EditDtCompra.Text = '' then
  
  begin
  Application.MessageBox('Preencha o campo Data da compra!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditDtCompra.SetFocus;
  Abort;
  end;

  if EditDescricao.Text = '' then
  
  begin
  Application.MessageBox('Preencha o campo Descrição!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditDescricao.SetFocus;
  Abort;
  end;

  if StringToFloat (EditValorCompra.Text) = 0 then
  
  begin
  Application.MessageBox('Preencha o campo Valor da Compra!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditValorCompra.SetFocus;
  Abort;
  end;

  if EditParcelas.Text = '' then
  
  begin
  Application.MessageBox('Preencha o campo N° Parcelas!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditParcelas.SetFocus;
  Abort;
  end;

  if EditVariacao.Text = '' then
  
  begin
  Application.MessageBox('Preencha o campo Variação!', 'Atenção', MB_OK+MB_ICONWARNING );
  EditVariacao.SetFocus;
  Abort;
  end;
  
  ClientParcelas.EmptyDataSet;

  for I := 1 to Strtoint (EditParcelas.Text) do
  begin
    ClientParcelas.Insert;
    ClientParcelasParcelas.AsInteger := i;
    ClientParcelasValor.AsCurrency := StringToFloat (EditValorCompra.Text)/ Strtoint(EditParcelas.Text); 
    ClientParcelasVencimento.AsDateTime := StrtoDate (EditDtCompra.Text) + (Strtoint(EditVariacao.Text) * i);
    ClientParcelas.Post;
  end;
    

end;

procedure TFormCadastroContasPagar.BitBtn2Click(Sender: TObject);
begin

  ClientParcelas.EmptyDataSet;  

end;

procedure TFormCadastroContasPagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  EditarDBGrid(dsParcelas, DBGrid1, State, Rect, Column);

end;

end.
