unit Sistema.Model.Conexao;

interface

uses
  Sistema.Model.Interfaces, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Phys.SQLite;

type
  TModelConexao = class(TInterfacedObject, IModelConexao, IModelConexaoParametros)
  private
    FConexao: TFDConnection;
    FDriver: TFDPhysSQLiteDriverLink;
    constructor Create; overload;
  public
    function SetParametrosConexao: IModelConexaoParametros;
    function Get: TObject;
    function SetCaminhoConexao(pCaminho: string): IModelConexaoParametros;
    function SetNomeUsuario(pNome: string): IModelConexaoParametros;
    function SetSenhaConexao(pSenha: string): IModelConexaoParametros;
    function &End: IModelConexao;
    class function new: IModelConexao;
  end;

implementation

{ TModelConexao }

constructor TModelConexao.Create;
begin
  FDriver := TFDPhysSQLiteDriverLink.Create(nil);

  FConexao := TFDConnection.Create(nil);
  FConexao.DriverName := 'SQLite';
  FConexao.LoginPrompt := false;
end;

function TModelConexao.&End: IModelConexao;
begin
  Result := Self;
end;

function TModelConexao.Get: TObject;
begin
  FConexao.Connected := true;
  Result := FConexao;
end;

class function TModelConexao.new: IModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexao.SetCaminhoConexao(pCaminho: string): IModelConexaoParametros;
begin
  Result := Self;
  FConexao.Params.Database := pCaminho;
end;

function TModelConexao.SetNomeUsuario(pNome: string): IModelConexaoParametros;
begin
  Result := Self;
  FConexao.Params.UserName := pNome;
end;

function TModelConexao.SetParametrosConexao: IModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexao.SetSenhaConexao(pSenha: string): IModelConexaoParametros;
begin
  Result := Self;
  FConexao.Params.Password := pSenha;
end;

end.
