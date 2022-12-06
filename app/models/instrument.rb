class Instrument < ApplicationRecord
  belongs_to :store

  def self.alpha_sort
    order(:name)
  end
end