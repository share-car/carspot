class RentRequestSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date
  belongs_to :vehicle_info
  belongs_to :user
  belongs_to :status, class_name: 'Status'
  has_one :rent_setting, as: :rentable
end
