class AddStoreToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_reference :instruments, :store, foreign_key: true
  end
end
