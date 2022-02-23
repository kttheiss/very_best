class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.text :address
      t.integer :dish_id
      t.string :google_maps_url
      t.integer :neighborhood_id

      t.timestamps
    end
  end
end
