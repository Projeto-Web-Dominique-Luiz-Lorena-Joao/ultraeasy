class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.includes(:patients).all
  end

  def show
    @patients = @address.patients
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    
    if @address.save
      redirect_to @address, notice: 'Endereço criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to @address, notice: 'Endereço atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @address.patients.any?
      redirect_to @address, alert: 'Não é possível excluir endereço com pacientes cadastrados.'
    else
      @address.destroy
      redirect_to addresses_url, notice: 'Endereço excluído com sucesso.'
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :number, :complement, :neighborhood, :city, :state, :country)
  end
end