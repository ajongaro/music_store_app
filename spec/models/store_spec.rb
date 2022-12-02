require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'relationships' do
    it { should have_many :instruments }
  end
end

