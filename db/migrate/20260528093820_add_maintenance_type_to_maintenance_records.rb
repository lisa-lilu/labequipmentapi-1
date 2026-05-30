class AddMaintenanceTypeToMaintenanceRecords < ActiveRecord::Migration[8.1]
  def change
    add_column :maintenance_records, :maintenance_type, :string
  end
end
