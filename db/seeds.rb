MaintenanceRecord.destroy_all
Equipment.destroy_all
Category.destroy_all


microscopy = Category.create!(name: "Microscopy")
centrifugation = Category.create!(name: "Centrifugation")
spectroscopy = Category.create!(name: "Spectroscopy")
sterilization = Category.create!(name: "Sterilization")

microscope1 = Equipment.create!(
  name: "Electron Microscope",
  serial_number: "EM20230515",
  status: "active",
  category: microscopy
)

microscope2 = Equipment.create!(
  name: "Confocal Microscope",
  serial_number: "CM20220301",
  status: "active",
  category: microscopy
)

centrifuge1 = Equipment.create!(
  name: "High-Speed Centrifuge",
  serial_number: "HSC20230201",
  status: "active",
  category: centrifugation
)

centrifuge2 = Equipment.create!(
  name: "Micro-Centrifuge",
  serial_number: "MC20220815",
  status: "inactive",
  category: centrifugation
)

spectrometer = Equipment.create!(
  name: "Mass Spectrometer",
  serial_number: "MS20230620",
  status: "active",
  category: spectroscopy
)

autoclave = Equipment.create!(
  name: "Autoclave",
  serial_number: "AC20210101",
  status: "active",
  category: sterilization
)

MaintenanceRecord.create!(
  equipment: microscope1,
  maintenance_type: "Calibration",
  description: "Annual calibration and alignment check",
  performed_at: 2.weeks.ago
)

MaintenanceRecord.create!(
  equipment: centrifuge1,
  maintenance_type: "Oil Change",
  description: "Regular maintenance oil replacement",
  performed_at: 1.month.ago
)

MaintenanceRecord.create!(
  equipment: spectrometer,
  maintenance_type: "Cleaning",
  description: "Lens and detector cleaning",
  performed_at: 3.days.ago
)

MaintenanceRecord.create!(
  equipment: autoclave,
  maintenance_type: "Inspection",
  description: "Pressure gauge verification and seal inspection",
  performed_at: 10.days.ago
)

MaintenanceRecord.create!(
  equipment: microscope2,
  maintenance_type: "Software Update",
  description: "Updated imaging software to latest version",
  performed_at: 5.days.ago
)

puts "✅ Seed data created successfully!"
puts "Categories: #{Category.count}"
puts "Equipment: #{Equipment.count}"
puts "Maintenance Records: #{MaintenanceRecord.count}"