class Store < ApplicationRecord
  has_many :instruments

  def count_things
    self.all.count
  end
end
