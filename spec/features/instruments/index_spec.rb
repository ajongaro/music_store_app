
# spec/features/instruments/index_spec.rb

require 'rails_helper'

RSpec.describe 'the instrument index page', type: :feature do
  describe 'as a visitor' do
    let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
    let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
    let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }

    let!(:guitar) { store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399) }
    let!(:piano) { store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299) }
    let!(:banjo) { store_2.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299) }

    describe "when I visit '/instruments/" do
      it 'shows each instrument name and its attributes' do
        visit "/instruments/"

        expect(page).to have_content("Instruments List")
        expect(page).to have_content(guitar.name)
        expect(page).to have_content(piano.name)
        expect(page).to have_content(banjo.name)
      end
      
    end
  end
end