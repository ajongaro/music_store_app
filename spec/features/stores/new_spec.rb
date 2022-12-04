require 'rails_helper'

RSpec.describe 'Create A New Store', type: :feature do 
   #US11
  describe "As a user" do
    describe "the '/stores/new' page" do
      describe "it can be accessed from '/stores/' page link" do
        it "has a link to create a new Store record, 'New Store'" do
          visit '/stores/'

          expect(page).to have_link("New Store")
        end

        it "clicking 'New Store' link opens '/stores/new' page" do
          visit '/stores/'
          click_link("New Store")

          expect(current_path).to eq("/stores/new")
        end

        it "can fill out form to create new store" do
          visit '/stores/new'
          
          fill_in("name", with: "Davie's Special Guitar Boutique")
          fill_in("online_only", with: true)
          fill_in("max_inventory", with: 35 )
          fill_in("customer_rating", with: 5 )
          
          click_button("Create Store")
          # save_and_open_page
          expect(current_path).to eq("/stores/")
          expect(page).to have_content("Davie's Special Guitar Boutique")
        end
      end
    end
  end
end