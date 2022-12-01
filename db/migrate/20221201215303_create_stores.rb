class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.boolean :online_only
      t.integer :max_inventory
      t.integer :customer_rating
    
      t.timestamps
    end
  end
end
