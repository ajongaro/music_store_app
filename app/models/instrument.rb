class Instrument < ApplicationRecord
  belongs_to :store

  def self.alpha_sort
    order(:name)
  end

  def self.filter_price(minimum_price)
    where("price > #{minimum_price}")
  end
end