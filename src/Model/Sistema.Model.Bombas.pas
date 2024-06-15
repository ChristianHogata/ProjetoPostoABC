unit Sistema.Model.Bombas;

interface

uses
  Sistema.Model.Interfaces, FireDAC.Comp.Client, Data.DB, FireDAC.VCLUI.Wait, FireDAC.Stan.Async;

type
  TModelBombas = class(TInterfacedObject, IModel)
    private
      FDataSet: TFDQuery;
      FDataSource: TDataSource;
      FConexao: IModelConexao;
      constructor Create; overload;
      procedure inicializarDataSet;
    public
      procedure inserir;
      procedure excluir;
      procedure editar;
      procedure cancelar;
      function GetDataSource: TDataSource;
      class function new: IModel;
      destructor Destroy; override;
  end;

implementation

uses
  Sistema.Model.ModelConexaoFactory;

{ TModelBombas }

procedure TModelBombas.cancelar;
begin
  FDataSet.Cancel;
end;

constructor TModelBombas.Create;
begin
  FConexao := TModelConexaoFactory.new.GetConexao;
  FDataSet := TFDQuery.Create(nil);
  FDataSet.Connection := TFDCustomConnection(FConexao.Get);

  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet := FDataSet;

  inicializarDataSet;
end;

destructor TModelBombas.Destroy;
begin
  inherited;
  FDataSource.Free;
  FDataSet.Free;
end;

procedure TModelBombas.editar;
begin
  FDataSet.Edit;
end;

procedure TModelBombas.excluir;
begin
  FDataSet.Delete;
end;

function TModelBombas.GetDataSource: TDataSource;
begin
  Result := FDataSource;
end;

procedure TModelBombas.inicializarDataSet;
begin
  FDataSet.SQL.Add('Select * from Bombas');
  FDataSet.Open;
end;

procedure TModelBombas.inserir;
begin
  FDataSet.Insert;
end;

class function TModelBombas.new: IModel;
begin
  Result := Self.Create;
end;

end.

