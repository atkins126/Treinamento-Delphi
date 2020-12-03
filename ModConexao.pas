unit ModConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.FMTBcd, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  TDataModuleDados = class(TDataModule)
    SQLConnection: TSQLConnection;
    SDS_caixa: TSQLDataSet;
    DSP_caixa: TDataSetProvider;
    CDS_caixa: TClientDataSet;
    SDS_contas_pagar: TSQLDataSet;
    DSP_contas_pagar: TDataSetProvider;
    CDS_contas_pagar: TClientDataSet;
    SDS_contas_receber: TSQLDataSet;
    DSP_contas_receber: TDataSetProvider;
    CDS_contas_receber: TClientDataSet;
    SDS_usuarios: TSQLDataSet;
    DSP_usuarios: TDataSetProvider;
    CDS_usuarios: TClientDataSet;
    CDS_caixaid: TIntegerField;
    CDS_caixanumero_doc: TStringField;
    CDS_caixadescricao: TStringField;
    CDS_caixavalor: TFMTBCDField;
    CDS_caixatipo: TStringField;
    CDS_caixadt_cadastro: TDateField;
    CDS_contas_pagarid: TIntegerField;
    CDS_contas_pagarnumero_doc: TStringField;
    CDS_contas_pagardescricao: TStringField;
    CDS_contas_pagarparcela: TIntegerField;
    CDS_contas_pagarvalor_parcela: TFMTBCDField;
    CDS_contas_pagarvalor_compra: TFMTBCDField;
    CDS_contas_pagarvalor_abatido: TFMTBCDField;
    CDS_contas_pagardt_compra: TDateField;
    CDS_contas_pagardt_cadastro: TDateField;
    CDS_contas_pagardt_vencimento: TDateField;
    CDS_contas_pagardt_pagamento: TDateField;
    CDS_contas_pagarstatus: TStringField;
    CDS_contas_receberid: TIntegerField;
    CDS_contas_receberdocumento: TStringField;
    CDS_contas_receberdescricao: TStringField;
    CDS_contas_receberparcelas: TIntegerField;
    CDS_contas_recebervalor_parcela: TFMTBCDField;
    CDS_contas_recebervalor_compra: TFMTBCDField;
    CDS_contas_recebervalor_abatido: TFMTBCDField;
    CDS_contas_receberdt_compra: TDateField;
    CDS_contas_receberdt_vencimento: TDateField;
    CDS_contas_receberdt_cadastro: TDateField;
    CDS_contas_receberdt_pagamento: TDateField;
    CDS_contas_receberstatus: TStringField;
    CDS_usuariosid: TIntegerField;
    CDS_usuariosnome: TStringField;
    CDS_usuarioslogin: TStringField;
    CDS_usuariossenha: TStringField;
    CDS_usuariosstatus: TStringField;
    CDS_usuariosdt_cadastro: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleDados: TDataModuleDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
