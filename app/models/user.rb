class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :address, presence: true
  has_many :events, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unique_user
    "#{first_name} #{last_name}, #{email}"
  end
end
