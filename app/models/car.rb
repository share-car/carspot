class Car < ApplicationRecord
  has_one :vehicle_info, as: :vehicle, autosave: true, dependent: :destroy
  belongs_to :chassi, class_name: 'Chassi'
  belongs_to :transmission, class_name: 'Transmission'
  belongs_to :fuel_type, class_name: 'FuelType'
end
