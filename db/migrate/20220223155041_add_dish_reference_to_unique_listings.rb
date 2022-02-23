class AddDishReferenceToUniqueListings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :unique_listings, :dishes
    add_index :unique_listings, :dish_id
    change_column_null :unique_listings, :dish_id, false
  end
end
