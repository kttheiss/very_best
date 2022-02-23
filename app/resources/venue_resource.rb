class VenueResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :address, :string
  attribute :dish_id, :integer
  attribute :google_maps_url, :string
  attribute :neighborhood_id, :integer

  # Direct associations

  # Indirect associations

end
