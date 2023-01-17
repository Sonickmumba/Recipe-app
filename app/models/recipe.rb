class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, class_name: 'RecipeFood'
  has_many :foods, through: :recipe_foods

  # validations
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 4 }
end
