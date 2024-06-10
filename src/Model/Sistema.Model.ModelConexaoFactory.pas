unit Sistema.Model.ModelConexaoFactory;

interface

uses
  Sistema.Model.Interfaces;

type
  TModelConexaoFactory = class(TInterfacedObject, IModelConexaoFactory)
    public
      function GetConexao: TObject;
      class function new: IModelConexaoFactory;
  end;

implementation

uses
  Sistema.Model.Conexao, Vcl.Forms, System.SysUtils;

{ TModelConexaoFactory }

function TModelConexaoFactory.GetConexao: TObject;
begin
  Result :=
    TModelConexao
      .new
      .SetParametrosConexao
      .SetCaminhoConexao(ExtractFileDir(Application.ExeName) + '\Assets\DB\ProjetoPostoAbc')
      .SetNomeUsuario('')
      .SetSenhaConexao('')
      .&End
      .Get;
end;

class function TModelConexaoFactory.new: IModelConexaoFactory;
begin
  Result := Self.Create;
end;

end.
