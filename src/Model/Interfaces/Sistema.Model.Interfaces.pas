unit Sistema.Model.Interfaces;

interface

uses
  Data.DB, System.Generics.Collections;

type

  IModelConexao = interface;
  IModelAbastecimento = interface;

  IModelConexaoParametros = interface
    ['{F5C416FC-8D4F-404B-9569-5B56D5FA39B3}']
    function SetCaminhoConexao(pCaminho: string): IModelConexaoParametros;
    function SetNomeUsuario(pNome: string): IModelConexaoParametros;
    function SetSenhaConexao(pSenha: string): IModelConexaoParametros;
    function &End: IModelConexao;
  end;

  IModelConexao = interface
    ['{2BA43376-54A8-4094-88BE-B237E9D00A6F}']
    function SetParametrosConexao: IModelConexaoParametros;
    function Get: TObject;
  end;

  IModel = interface
    ['{13990C7C-2B68-4915-908D-0DAF42321814}']
    procedure inserir;
    procedure excluir;
    procedure editar;
    procedure cancelar;
    function GetDataSource: TDataSource;
  end;

  IModelAbastecimentoParametros = interface
    ['{990D1CB6-0C59-4B9E-B87F-3E1CA98CB6FE}']
    function SetValorImposto(pValorImposto: Double): IModelAbastecimentoParametros;
    function SetValorCombustivelLitro(pValorCombustivelLitro: Double): IModelAbastecimentoParametros;
    function SetValorAbastecido(pValorAbastecido: Double): IModelAbastecimentoParametros;
    function SetNumeroBomba(pNumeroBomba: Integer): IModelAbastecimentoParametros;
    function SetTipoCombustivel(pTipoCombustivel: Integer): IModelAbastecimentoParametros;
    function &End: IModelAbastecimento;
  end;

  IModelAbastecimentoQueryParametros = interface
    ['{E78EEF74-1342-4391-96AE-99F1332D2254}']
    function AgruparValoresAbastecimento(pQuery: string): IModelAbastecimentoQueryParametros;
    function AdicionarCondicaoQuery(pQuery: string): IModelAbastecimentoQueryParametros;
    function &End: IModelAbastecimento;
  end;

  IModelAbastecimento = interface
    ['{D514C890-7300-41B2-9B01-6DCF4CAB1595}']
    function SetParametros: IModelAbastecimentoParametros;
    function SetQueryAbastecimentoParametros: IModelAbastecimentoQueryParametros;
    procedure inserir;
    procedure excluir;
    function GetValorImposto: Double;
    function GetQuantidadeCombustivelLitro: Double;
    function GetValorSubTotal: Double;
    function GetValorTotal: Double;
    function GetDataSource: TDataSource;

    procedure ProcessarAbastecimento;
  end;

  IModelConexaoFactory = interface
    ['{6BD1D380-A75E-4BE0-A8DA-DA94F385DE90}']
    function GetConexao: TObject;
  end;

implementation

end.
