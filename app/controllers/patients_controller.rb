class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :load_addresses, only: [:new, :edit, :create, :update]

  def index
    @patients = Patient.includes(:address).all
  end

  def show
  end

  def new
    if params[:address_id]
      @address = Address.find(params[:address_id])
      @patient = @address.patients.build
    else
      @patient = Patient.new
    end
  end

  def create
    @patient = Patient.new(patient_params)
    
    if @patient.save
      redirect_to @patient, notice: 'Paciente cadastrado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Paciente atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Paciente excluído com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def load_addresses
    @addresses = Address.all.order(:street)
  end

  def patient_params
    params.require(:patient).permit(:name, :email, :birthdate, :phone, :address_id)
  end
end