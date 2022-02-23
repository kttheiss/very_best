class AddVenueReferenceToUniqueListings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :unique_listings, :venues
    add_index :unique_listings, :venue_id
    change_column_null :unique_listings, :venue_id, false
  end
end
