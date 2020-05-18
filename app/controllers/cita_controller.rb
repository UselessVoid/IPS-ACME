class CitaController < ApplicationController
  before_action :set_citum, only: [:show, :edit, :update, :destroy, :from_patient]
  before_action :authenticate_patient!, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # GET /cita
  # GET /cita.json
  def index
    @citum = Citum.where(patient_id: current_patient.id)
  end

  # GET /cita/1
  # GET /cita/1.json
  def show
  end

  # GET /cita/new
  def new
    @citum = Citum.new
  end

  # GET /cita/1/edit
  def edit
  end

  # POST /cita
  # POST /cita.json
  def create
    @citum = Citum.new(citum_params)
    @citum.patient = current_patient
    respond_to do |format|
      if @citum.save
        format.html { redirect_to @citum, notice: 'Citum was successfully created.' }
        format.json { render :show, status: :created, location: @citum }
      else
        format.html { render :new }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cita/1
  # PATCH/PUT /cita/1.json
  def update
    respond_to do |format|
      if @citum.update(citum_params)
        format.html { redirect_to @citum, notice: 'Citum was successfully updated.' }
        format.json { render :show, status: :ok, location: @citum }
      else
        format.html { render :edit }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cita/1
  # DELETE /cita/1.json
  def destroy
    @citum.destroy
    respond_to do |format|
      format.html { redirect_to cita_url, notice: 'Citum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citum
      @citum = Citum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def citum_params
      params.require(:citum).permit(:Fecha, :medic_id)
    end

    def from_patient
      @citum = Citum.find(params[:patient_id]) 
    end
end
