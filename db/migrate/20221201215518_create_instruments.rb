class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :brand
      t.string :type
      t.boolean :used
      t.boolean :needs_repair
      t.integer :price
      
      t.timestamps
    end
  end
end
