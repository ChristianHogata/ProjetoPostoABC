unit Sistema.Controller.Interfaces;

interface

uses
  Sistema.Model.Interfaces, Data.DB;

type

  IControllerModelFactory = interface
    ['{FAF4101B-614F-4887-AC4D-E4BAFB3B7753}']
    function GetModelAbastecimento: IModelAbastecimento;
    function GetModelCombustivel: IModel;
    function GetModelBombas: IModel;
  end;

implementation

end.
