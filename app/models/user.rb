class User < ApplicationRecord
  has_many :foods
  has_many :recipes

  # validations
  validates :name, presence: true, allow_blank: false, allow_nill: false, length: { in: 1...50 }
end
