
# spec/features/instruments/index_spec.rb

require 'rails_helper'

RSpec.describe 'the instrument index page', type: :feature do
  describe 'as a visitor' do
    let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
    let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
    let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }

    let!(:guitar) { store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399) }
    let!(:piano) { store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299) }
    let!(:banjo) { store_2.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 699) }
    let!(:keytar) { store_2.instruments.create!(name: "Fender Keytar", used: true, needs_repair: false, price: 99) }

    describe "when I visit '/instruments/" do
      it 'shows each instrument name and its attributes' do
        visit "/instruments/"

        expect(page).to have_content("Instruments List")
        expect(page).to have_content("Gibson Dot Guitar")
        expect(page).to have_content("Fender Keytar")
      end

      it 'does not show new instruments (used: true) only' do
        visit "/instruments/"

        expect(page).to_not have_content("Steinway Grand Piano")
        expect(page).to_not have_content("Fender Banjo")
      end
      
      it 'has a link to edit that instruments information' do
        visit '/instruments/' 

        expect(page).to have_link("Edit Instrument", href: "/instruments/#{guitar.id}/edit")
      end
      
      it 'has a link that upon clicking redirects to instrument edit page' do
        visit '/instruments/' 

        click_link("Edit Instrument", href: "/instruments/#{keytar.id}/edit")
        
        expect(current_path).to eq("/instruments/#{keytar.id}/edit")
      end
    end

    describe 'when I visit /instruments and want to delete an entry' do
      it 'has a delete button to the right of each instrument' do
        visit '/instruments' 

        expect(page).to have_link("Delete Instrument", href: "/instruments/#{guitar.id}")
      end

      it 'returns me to store page where that store is no longer listed after click' do
        visit '/instruments/' 

        expect(page).to have_content("Gibson Dot Guitar")

        click_link("Delete Instrument", href: "/instruments/#{guitar.id}")

        expect(current_path).to eq("/instruments")
        expect(page).to_not have_content("Gibson Dot Guitar")
      end
    end
  end
end