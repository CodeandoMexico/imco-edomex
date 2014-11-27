require "httparty"
class CrudTramitesController < ApplicationController
  before_action :set_crud_tramite, only: [:show, :edit, :update, :destroy]

  # GET /crud_tramites
  # GET /crud_tramites.json
  def index

    @crud_tramites = CrudTramite.all
  end

  # GET /crud_tramites/1
  # GET /crud_tramites/1.json
  def show
  end

  # GET /crud_tramites/new
  def new
    @giros = { } 
    @opciones = {"Sí"=> "si", "No"=>"no"} 

    @titulo = "¿QUÉ TRÁMITES NECESITO PARA ABRIR UN NEGOCIO?"
    @subtitulo= "COMPLETA EL FORMULARIO"

    @NOMBRE_NEGOCIO= "Nombre para tu negocio"
    @GIRO_NEGOCIO = "Giro de tu negocio"
    @LUGAR_DETERMINADO = "Tienes un local determinado para tu negocio?"
    @PLANEAS_REMODELAR = "¿Planeas hacer remodelaciones en el lugar?"
    
    #hacemos la peticion para saber el limite de los registros
    value = limit_giros(0)

    if value > 0
      limit_giros(value)
    end


    @crud_tramite = CrudTramite.new

 end

 def limit_giros limite_
  if limite_ == 0
    response = HTTParty.get('http://datamx.io/api/action/datastore_search?resource_id=21cd34ed-f6d3-4ae7-a6c6-813f7939e539', :headers => { "Authorization" => "68a89e02-1eac-41e0-8a08-e74b0d9c755b"})
    giro_json = JSON.parse(response.body)
    puts "******************************* get limit " 
      return giro_json['result']['total'] #obtenemos el tamaño de los rows
  else
    puts "******************************* con limite"
     response = HTTParty.get("http://datamx.io/api/action/datastore_search?resource_id=21cd34ed-f6d3-4ae7-a6c6-813f7939e539&limit=#{limite_}", :headers => { "Authorization" => "68a89e02-1eac-41e0-8a08-e74b0d9c755b"})
     giro_json = JSON.parse(response.body)
    
     giro_json['result']['records'].each do |item|
      @giros[item['Nom_giro'] ] = item['Num_Consc'] 
    end #termina do each
  end#termina else 

end


  # GET /crud_tramites/1/edit
  def edit
  end

  # POST /crud_tramites
  # POST /crud_tramites.json
  def create
    @crud_tramite = CrudTramite.new(crud_tramite_params)

    respond_to do |format|
      if @crud_tramite.save
        format.html { redirect_to @crud_tramite, notice: 'Crud tramite was successfully created.' }
        format.json { render :show, status: :created, location: @crud_tramite }
      else
        format.html { render :new }
        format.json { render json: @crud_tramite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crud_tramites/1
  # PATCH/PUT /crud_tramites/1.json
  def update
    respond_to do |format|
      if @crud_tramite.update(crud_tramite_params)
        format.html { redirect_to @crud_tramite, notice: 'Crud tramite was successfully updated.' }
        format.json { render :show, status: :ok, location: @crud_tramite }
      else
        format.html { render :edit }
        format.json { render json: @crud_tramite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crud_tramites/1
  # DELETE /crud_tramites/1.json
  def destroy
    @crud_tramite.destroy
    respond_to do |format|
      format.html { redirect_to crud_tramites_url, notice: 'Crud tramite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crud_tramite
      @crud_tramite = CrudTramite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crud_tramite_params
      params.require(:crud_tramite).permit(:nombre, :giro, :local_determinado, :remodelacion)
    end
  end
