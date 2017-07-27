class VehicleInfo < ApplicationRecord
  belongs_to :users
  belongs_to :vehicle, polymorphic: true
  has_one :rent_setting, as: :rentable, dependent: :destroy
  has_many :rent_requests, dependent: :destroy
end
