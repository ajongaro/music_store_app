require 'rails_helper'

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'creating a new instrument' do
  let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
  let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
  let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }

  let!(:guitar) { store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399) }
  let!(:piano) { store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299) }
  let!(:piano_2) { store.instruments.create!(name: "Bosendorfer Grand Piano", used: true, needs_repair: true, price: 40199) }
  let!(:banjo) { store_2.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299) }

  describe 'when I visit /stores/store_id/instruments/new' do
    it 'shows a form to add a new instrument' do
      visit "/stores/#{store.id}/instruments/new"

      expect(page).to have_field("Name")
      expect(page).to have_field("Used")
      expect(page).to have_field("Needs repair")
      expect(page).to have_field("Price")
      expect(page).to have_button("Create Instrument")
    end

    it 'takes information in form, can submit, and see on instruments page for that store' do
      visit "/stores/#{store.id}/instruments/new"

      fill_in("Name", with: "Fender Double Bass")
      fill_in("Used", with: true)
      fill_in("Needs repair", with: false )
      fill_in("Price", with: 5994 )
      
      click_button("Create Instrument")

      expect(current_path).to eq("/stores/#{store.id}/instruments/")
      expect(page).to have_content("Fender Double Bass")
    end
  end
end