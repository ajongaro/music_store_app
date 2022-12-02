# spec/features/stores/index_spec.rb

require 'rails_helper'

RSpec.describe 'the store index page', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe 'as a visitor' do
    describe "when I visit '/stores'" do
      it 'shows the name of each store in the system' do
        store = Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, rating: 5)
        store_2 = Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, rating: 4)
        store_3 = Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, rating: 2)
        
        visit '/stores/'

        expect(page).to have_content(store.name)
        expect(page).to have_content(store_2.name)
        expect(page).to have_content(store_3.name)
      end
    end
  end
end