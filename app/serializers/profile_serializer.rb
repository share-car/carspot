class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :address, :phone, :identity_card
  belongs_to :user
end
