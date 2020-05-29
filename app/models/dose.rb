class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :cocktail_id, uniqueness: { scope: :ingredient_id,
    message: 'Each ingredient appears as 1 dose in a cocktail.' }
end
