class RentSetting < ApplicationRecord
  belongs_to :rentable, polymorphic: true 
  has_many :service_options, dependent: :destroy
  has_many :custom_prices, dependent: :destroy
end
