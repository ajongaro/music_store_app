# spec/features/stores/instruments/index_spec.rb

require 'rails_helper'

RSpec.describe ' stores index page', type: :feature do
  # User Story 5 
  describe 'as a visitor' do
    describe "when I visit '/stores/:store_id/instruments'" do
      it 'shows each instrument and its attributes in stock at that store' do
        store = Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5)
        store_2 = Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4)
        
        guitar = store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399)
        piano = store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299)
        piano_2 = store.instruments.create!(name: "Bosendorfer Grand Piano", used: true, needs_repair: true, price: 40199)
        banjo = store_2.instruments.create!(name: "Fender Classic Banjo", used: false, needs_repair: false, price: 61299)

        visit "/stores/#{store.id}/instruments"

        # save_and_open_page

        expect(page).to have_content("Instruments at Guitar Center")
        expect(page).to have_content(guitar.name)
        expect(page).to have_content(piano.name)
        expect(page).to have_content("Price: $1399")

        expect(page).to_not have_content(banjo.name)

        visit "/stores/#{store_2.id}/instruments"
        expect(page).to have_content(banjo.name)
      end
    end
  end
end