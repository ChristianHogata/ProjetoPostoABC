unit Sistema.Controller.ModelFactory;

interface

uses
  Sistema.Controller.Interfaces, Sistema.Model.Interfaces;

type
  TControllerModelFactory = class(TInterfacedObject, IControllerModelFactory)
    private
      FModelAbastecimento: IModelAbastecimento;
      FModelCombustivel: IModel;
      FModelBombas: IModel;
    public
      function GetModelAbastecimento: IModelAbastecimento;
      function GetModelCombustivel: IModel;
      function GetModelBombas: IModel;
      class function new: IControllerModelFactory;
  end;

implementation

uses
  Sistema.Model.Abastecimento, Sistema.Model.Combustivel, Sistema.Model.Bombas;


{ TControllerModelFactory }

function TControllerModelFactory.GetModelAbastecimento: IModelAbastecimento;
begin
  if not Assigned(FModelAbastecimento) then
    FModelAbastecimento := TModelAbastecimento.new();

  Result := FModelAbastecimento;
end;

function TControllerModelFactory.GetModelBombas: IModel;
begin
  if not Assigned(FModelBombas) then
    FModelBombas := TModelBombas.new;

  Result := FModelCombustivel;
end;

function TControllerModelFactory.GetModelCombustivel: IModel;
begin
  if not Assigned(FModelCombustivel) then
    FModelCombustivel := TModelCombustivel.new;

  Result := FModelCombustivel;
end;

class function TControllerModelFactory.new: IControllerModelFactory;
begin
  Result := Self.Create;
end;

end.
