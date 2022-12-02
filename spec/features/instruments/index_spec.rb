
# spec/features/instruments/index_spec.rb

require 'rails_helper'

RSpec.describe 'the instrument index page', type: :feature do
  #  As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes

  describe 'as a visitor' do
    describe "when I visit '/instruments" do
      it 'I see each instrument name and its attributes' do
        store = Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5)
        store_2 = Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4)
        
        guitar = store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399)
        piano = store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299)
        banjo = store_2.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299)
        visit "/instruments/"

        save_and_open_page
        expect(page).to have_content("Instruments List")
        expect(page).to have_content(guitar.name)
        expect(page).to have_content(piano.name)
        expect(page).to have_content(banjo.name)
      end
    end
  end
end