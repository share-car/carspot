class CarSerializer < ActiveModel::Serializer
  attributes :id, :engine, :horsepower, :torque, :doors, :seats
  has_one :vehicle_info
  belongs_to :chassi, class_name: 'Chassi'
  belongs_to :transmission, class_name: 'Transmission'
  belongs_to :fuel_type, class_name: 'FuelType'
end