class Venue < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :dishes_at_venues,
             :class_name => "UniqueListing",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    address
  end

end
