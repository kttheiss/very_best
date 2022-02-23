class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :venue

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
