class MaintenanceRecordsController < ApplicationController
  before_action :set_maintenance_record, only: [:show, :update, :destroy]

  # GET /maintenance_records
  def index
    records = MaintenanceRecord.all.includes(:equipment)
    records = records.where(equipment_id: params[:equipment_id]) if params[:equipment_id].present?
    records = records.order(performed_at: :desc)

    render json: records.map { |record| record_json(record) }, status: :ok
  end

  # GET /maintenance_records/:id
  def show
    render json: record_json(@maintenance_record), status: :ok
  end

  # POST /maintenance_records
  def create
    @maintenance_record = MaintenanceRecord.new(maintenance_record_params)

    if @maintenance_record.save
      render json: record_json(@maintenance_record), status: :created
    else
      render json: { errors: @maintenance_record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /maintenance_records/:id
  def update
    if @maintenance_record.update(maintenance_record_params)
      render json: record_json(@maintenance_record), status: :ok
    else
      render json: { errors: @maintenance_record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /maintenance_records/:id
  def destroy
    @maintenance_record.destroy
    render status: :no_content
  end

  private

  def set_maintenance_record
    @maintenance_record = MaintenanceRecord.find_by(id: params[:id])
    render json: { error: "MaintenanceRecord not found" }, status: :not_found unless @maintenance_record
  end

  def maintenance_record_params
    params.require(:maintenance_record).permit(:description, :performed_at, :equipment_id)
  end

  def record_json(record)
    {
      id: record.id,
      description: record.description,
      performed_at: record.performed_at,
      equipment_id: record.equipment_id,
      equipment_name: record.equipment.name,
      created_at: record.created_at,
      updated_at: record.updated_at
    }
  end
end