class CrudMunicipiosController < ApplicationController
  before_action :set_crud_municipio, only: [:show, :edit, :update, :destroy]

  # GET /crud_municipios
  # GET /crud_municipios.json
  def index
    @crud_municipios = CrudMunicipio.all
  end

  # GET /crud_municipios/1
  # GET /crud_municipios/1.json
  def show
  end

  # GET /crud_municipios/new
  def new
    @crud_municipio = CrudMunicipio.new
  end

  # GET /crud_municipios/1/edit
  def edit
  end

  # POST /crud_municipios
  # POST /crud_municipios.json
  def create
    @crud_municipio = CrudMunicipio.new(crud_municipio_params)

    respond_to do |format|
      if @crud_municipio.save
        format.html { redirect_to @crud_municipio, notice: 'Crud municipio was successfully created.' }
        format.json { render :show, status: :created, location: @crud_municipio }
      else
        format.html { render :new }
        format.json { render json: @crud_municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crud_municipios/1
  # PATCH/PUT /crud_municipios/1.json
  def update
    respond_to do |format|
      if @crud_municipio.update(crud_municipio_params)
        format.html { redirect_to @crud_municipio, notice: 'Crud municipio was successfully updated.' }
        format.json { render :show, status: :ok, location: @crud_municipio }
      else
        format.html { render :edit }
        format.json { render json: @crud_municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crud_municipios/1
  # DELETE /crud_municipios/1.json
  def destroy
    @crud_municipio.destroy
    respond_to do |format|
      format.html { redirect_to crud_municipios_url, notice: 'Crud municipio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crud_municipio
      @crud_municipio = CrudMunicipio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crud_municipio_params
      params.require(:crud_municipio).permit(:nombre)
    end
end
