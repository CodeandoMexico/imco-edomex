class MunicipioController < ApplicationController

  def index

   @municipio = CrudMunicipio.new
   @municipios = CrudMunicipio.all
  
   @titulo = "Ubicación de tu negocio"
   @subtitulo= "Selecciona un municipio"


    #recorremos todos los municipios que existan en la base de datos
   @nombre_municipio  = { }
   @municipios.each do |item|
     @nombre_municipio [item.nombre] = item.id
   end
 end


end
