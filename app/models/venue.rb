class Venue < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :dishes_at_venues,
             :class_name => "UniqueListing",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  # Validations

  # Scopes

  def to_s
    address
  end

end
