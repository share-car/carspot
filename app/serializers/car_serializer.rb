class CarSerializer < VehicleSerializer
  attributes :engine, :horsepower, :doors, :seats
  belongs_to :chassi, class_name: 'Chassi'
  belongs_to :transmission, class_name: 'Transmission'
  belongs_to :fuel_type, class_name: 'FuelType'
end