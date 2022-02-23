class Dish < ApplicationRecord
  # Direct associations

  has_many   :dishes_at_venues,
             class_name: "UniqueListing",
             dependent: :destroy

  # Indirect associations

  has_many   :venues,
             through: :dishes_at_venues,
             source: :venue

  # Validations

  # Scopes

  def to_s
    cuisine
  end
end
