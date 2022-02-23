class CreateUniqueListings < ActiveRecord::Migration[6.0]
  def change
    create_table :unique_listings do |t|
      t.integer :dish_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
