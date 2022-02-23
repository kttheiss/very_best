class DishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :cuisine, :string
  attribute :venue_id, :integer

  # Direct associations

  # Indirect associations

end
