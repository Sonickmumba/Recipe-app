class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  :confirmable, :lockable, :trackable
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  # validations
  validates :name, presence: true, allow_blank: false, length: { in: 1...50 }
end
