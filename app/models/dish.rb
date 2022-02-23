class Dish < ApplicationRecord
  # Direct associations

  has_many   :dishes_at_venues,
             :class_name => "UniqueListing",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    cuisine
  end

end
