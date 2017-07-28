class VehicleInfoSerializer < ActiveModel::Serializer
  attributes :id, :model, :license_plate, :year, :branch, :description, :rent_publish
  belongs_to :user
  belongs_to :vehicle, polymorphic: true
  has_one :rent_setting, as: :rentable
  has_many :rent_requests
end