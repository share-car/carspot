class RentSettingSerializer < ActiveModel::Serializer
  attributes :id, :base_price, :driver_price, :description
  belongs_to :rentable, polymorphic: true 
end
