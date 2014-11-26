class MunicipioController < ApplicationController
  
  def index
     @municipio = CrudMunicipio.new
    @municipios = Municipios.all
    @nombre_municipio = {"Chalco"=>'ch','Huixquilucan'=>'hu', 'Lerma' =>'le', 'Metepec' =>'me', 'Tenango del Valle' =>'tv', 'Toluca' =>'to'}   
  end

end
