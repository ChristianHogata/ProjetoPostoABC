unit Sistema.Model.Combustivel;

interface

uses
  Sistema.Model.Interfaces, FireDAC.Comp.Client, Data.DB, FireDAC.VCLUI.Wait, FireDAC.Stan.Async;

type
  TModelCombustivel = class(TInterfacedObject, IModel)
    private
      FDataSet: TFDQuery;
      FDataSource: TDataSource;
      constructor Create; overload;
      procedure inicializarDataSet;
    public
      procedure inserir;
      procedure excluir;
      procedure editar;
      procedure cancelar;
      function GetDataSource: TDataSource;
      class function new: IModel;
  end;

implementation

uses
  Sistema.Model.ModelConexaoFactory;

{ TModelCombustivel }

procedure TModelCombustivel.cancelar;
begin
  FDataSet.Cancel;
end;

constructor TModelCombustivel.Create;
begin
  FDataSet := TFDQuery.Create(nil);
  FDataSet.Connection := (TModelConexaoFactory.new.GetConexao) as TFDCustomConnection;

  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet := FDataSet;

  inicializarDataSet;
end;

procedure TModelCombustivel.editar;
begin
  FDataSet.Edit;
end;

procedure TModelCombustivel.excluir;
begin
  FDataSet.Delete;
end;

function TModelCombustivel.GetDataSource: TDataSource;
begin
  Result := FDataSource;
end;

procedure TModelCombustivel.inicializarDataSet;
begin
  FDataSet.SQL.Add('Select * from Combustivel');
  FDataSet.Open;
end;

procedure TModelCombustivel.inserir;
begin
  FDataSet.Insert;
end;

class function TModelCombustivel.new: IModel;
begin
  Result := Self.Create;
end;

end.

