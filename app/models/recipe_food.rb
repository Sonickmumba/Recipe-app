class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  # validations
  validates :quantity, presence: true, numericality: { greater_than: 0, less_than: 1_000_000 }
end
