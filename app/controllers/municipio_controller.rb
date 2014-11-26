class MunicipioController < ApplicationController

  def index

   @municipio = CrudMunicipio.new
   @municipios = CrudMunicipio.all
   @nombre_municipio  = { }
   @municipios.each do |item|
     @nombre_municipio [item.nombre] = item.id
   end
 end

 
end
