# spec/features/instruments/show_spec.rb

require 'rails_helper'

RSpec.describe 'the instrument show page', type: :feature do
  describe 'as a visitor' do
    describe "when I visit '/instruments/:id'" do
      it 'I see that instrument name and its attributes' do
        store = Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5)
        store_2 = Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4)
        
        guitar = store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399)
        piano = store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299)
        banjo = store_2.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299)

        visit "/instruments/#{piano.id}"

        save_and_open_page
        expect(page).to have_content("Steinway Grand Piano")
        expect(page).to have_content("Used: false")
        expect(page).to have_content("Needs Repair: false")
        expect(page).to have_content("Price: $61299")

        expect(page).to_not have_content("Gibson Dot Guitar")
      end
    end
  end
end