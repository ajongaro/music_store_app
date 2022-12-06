class Instrument < ApplicationRecord
  belongs_to :store

  def self.alpha_sort
    self.all.order(:name)
  end
end