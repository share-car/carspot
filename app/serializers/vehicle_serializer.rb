class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :model, :license_plate, :year, :branch, :description, :rent_publish
  belongs_to :owner, class_name: 'User'
end