class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :cuisine
      t.integer :venue_id

      t.timestamps
    end
  end
end
