
require 'rails_helper'

RSpec.describe "Update Store" do
  let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
  let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
  let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }
  let!(:guitar) { store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399) }
  let!(:piano) { store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299) }
  let!(:banjo) { store.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299) }

  describe "as a user" do
    describe "when I visit the '/stores/:id/edit' page" do
      # Then I am taken to '/parents/:id/edit'
      # where I  see a form to edit the parent's attributes:
      it "there is form to edit the stores attributes" do
        visit "/stores/#{store.id}/edit"

        expect(page).to have_field("Name") 
        expect(page).to have_field("Online only") 
        expect(page).to have_field("Max inventory") 
        expect(page).to have_field("Customer rating") 
      end
      
      # When I fill out the form with updated information
      # And I click the button to submit the form
      # Then a `PATCH` request is sent to '/parents/:id',
      # the parent's info is updated,
      # and I am redirected to the Parent's Show page where I see the parent's updated info 
      it "takes new information and can click button to submit form" do
        visit "/stores/#{store.id}/edit"

        fill_in("Name", with: "Schmuitar Schmenter")
        fill_in("Online only", with: false)
        fill_in("Max inventory", with: 2987)
        fill_in("Customer rating", with: 4)
        click_button("Update Store")
        save_and_open_page
        expect(page).to have_content("Schmuitar Schmenter")
        expect(page).to have_content(store.online_only)
      end
    end
  end
end