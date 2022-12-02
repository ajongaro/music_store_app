# spec/features/stores/show_spec.rb

require 'rails_helper'

RSpec.describe 'the stores show page', type: :feature do
  describe 'as a visitor' do
    describe "when I visit '/stores/:id'" do
      it 'I see that store name and its attributes' do
        store = Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5)
        store_2 = Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4)
        store_3 = Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2)
        
        visit "/stores/#{store.id}"

        # save_and_open_page
        expect(page).to have_content(store.name)
        expect(page).to_not have_content(store_2.name)
        expect(page).to have_content("Online Only: false")
        expect(page).to have_content("Max Inventory: 999")
        expect(page).to have_content("Customer Rating: 5/5")
      end
    end
  end
end