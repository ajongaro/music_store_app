require 'rails_helper'

RSpec.describe Instrument, type: :model do
  describe 'relationships' do
    it { should belong_to :store }
  end
end