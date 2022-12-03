# spec/features/stores/index_spec.rb

require 'rails_helper'

RSpec.describe 'the stores index page', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe 'as a visitor' do
        let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
        let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
        let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }

    describe "when I visit '/stores'" do
      it 'shows the name of each store in the system' do
        visit '/stores/'

        expect(page).to have_content(store.name)
        expect(page).to have_content(store_2.name)
        expect(page).to have_content(store_3.name)
      end
      
      it 'shows name of stores in order created ' do
        visit '/stores/'
        
        expect(store.name).to appear_before(store_2.name)
        expect(store.name).to appear_before(store_3.name)
        expect(store_2.name).to appear_before(store_3.name)
      end
      
      it 'displays time created next to store name' do
        visit '/stores/'
        expect(page).to have_content(store.created_at)
        expect(page).to have_content(store_2.created_at)
      end
    end
  end
end