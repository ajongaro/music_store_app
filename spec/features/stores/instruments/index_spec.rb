# spec/features/stores/instruments/index_spec.rb

require 'rails_helper'

RSpec.describe ' stores index page', type: :feature do
  let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
  let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
  let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }

  let!(:guitar) { store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399) }
  let!(:piano) { store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299) }
  let!(:piano_2) { store.instruments.create!(name: "Bosendorfer Grand Piano", used: true, needs_repair: true, price: 40199) }
  let!(:banjo) { store_2.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299) }
  # User Story 5 
  describe 'as a visitor' do
    describe "when I visit '/stores/:store_id/instruments'" do
      it 'shows each instrument and its attributes in stock at that store' do

        visit "/stores/#{store.id}/instruments"

        expect(page).to have_content("Instruments at Guitar Center")
        expect(page).to have_content(guitar.name)
        expect(page).to have_content(piano.name)
        expect(page).to have_content("Price: $1399")

        expect(page).to_not have_content(banjo.name)

        visit "/stores/#{store_2.id}/instruments"
        expect(page).to have_content(banjo.name)
      end
      
      it "shows a link to add a new adoptable instrument for this store, 'Create Instrument'" do
        visit "/stores/#{store.id}/instruments"
        
        expect(page).to have_link("Create Instrument")
      end

      it "takes me to /new when I click the 'Create Instrument' link" do
        visit "/stores/#{store.id}/instruments"

        click_link("Create Instrument") 
        expect(current_path).to eq("/stores/#{store.id}/instruments/new")
      end
    end
  end
end