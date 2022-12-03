# spec/features/stores/show_spec.rb

require 'rails_helper'

RSpec.describe 'the stores show page', type: :feature do
  describe 'as a visitor' do
    let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
    let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
    let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }
    let!(:guitar) { store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399) }
    let!(:piano) { store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299) }
    let!(:banjo) { store.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299) }

    describe "when I visit '/stores/:id'" do
      it 'shows that store name and its attributes' do
        visit "/stores/#{store.id}"

        # save_and_open_page
        expect(page).to have_content(store.name)
        expect(page).to_not have_content(store_2.name)
        expect(page).to have_content("Online Only: false")
        expect(page).to have_content("Max Inventory: 999")
        expect(page).to have_content("Customer Rating: 5/5")
      end

      it 'shows a count of instruments at that store' do
        visit "/stores/#{store.id}"
        expect(page).to have_content("Instruments in Stock: 3")
        # save_and_open_page

        visit "/stores/#{store_2.id}"
        expect(page).to have_content("Instruments in Stock: 0")
      end
    end
  end
end