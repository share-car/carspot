class RentRequest < ApplicationRecord
  belongs_to :vehicle_info
  belongs_to :user
  belongs_to :status, class_name: 'Status'
  has_one :rent_setting, as: :rentable, dependent: :destroy
  has_many :comments, as:commentable, dependent: :destroy
end
