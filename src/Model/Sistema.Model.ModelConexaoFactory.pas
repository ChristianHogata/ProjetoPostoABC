unit Sistema.Model.ModelConexaoFactory;

interface

uses
  Sistema.Model.Interfaces;

type
  TModelConexaoFactory = class(TInterfacedObject, IModelConexaoFactory)
    public
      function GetConexao: IModelConexao;
      class function new: IModelConexaoFactory;
  end;

implementation

uses
  Sistema.Model.Conexao, Vcl.Forms, System.SysUtils;

{ TModelConexaoFactory }

function TModelConexaoFactory.GetConexao: IModelConexao;
begin
  Result :=
    TModelConexao
      .new
      .SetParametrosConexao
      .SetCaminhoConexao('CAMINHNO DO DB AQUI')
      .SetNomeUsuario('')
      .SetSenhaConexao('')
      .&End;
end;

class function TModelConexaoFactory.new: IModelConexaoFactory;
begin
  Result := Self.Create;
end;

end.
