class Store < ApplicationRecord
  has_many :instruments, dependent: :destroy

  def self.created_order
    order(:created_at)
  end
end
