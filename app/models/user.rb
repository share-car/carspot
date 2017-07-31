class User < ActiveRecord::Base
  before_create :skip_confirmation
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # belongs_to :profile
  def skip_confirmation
    self.skip_confirmation!
  end
end
