class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :update, :destroy]

  def index
    equipment = Equipment.all
    equipment = equipment.where(status: params[:status]) if params[:status].present?
    equipment = equipment.order(params[:order] || 'created_at DESC')
    
    render json: equipment, include: :category, status: :ok
  end

  def show
    render json: @equipment, include: :category, status: :ok
  end

  def create
    equipment = Equipment.new(equipment_params)
    
    if equipment.save
      render json: equipment, include: :category, status: :created
    else
      render json: { errors: equipment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @equipment.update(equipment_params)
      render json: @equipment, include: :category, status: :ok
    else
      render json: { errors: @equipment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @equipment.destroy
    head :no_content
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Equipment not found' }, status: :not_found
  end

  def equipment_params
    params.require(:equipment).permit(:name, :serial_number, :status, :category_id)
  end
end