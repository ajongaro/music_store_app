# /spec/global/index_spec.rb

require 'rails_helper'

RSpec.describe 'all site pages', type: :feature do
  let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
  describe 'as a visitor' do
    describe "when I visit '/stores'" do
      it "it shows 'All Instruments' link at top of page" do
        visit '/stores/'

        expect(page).to have_link("All Instruments")
      end

      it "it shows 'All Stores' link at top of page" do
        visit '/stores/'

        expect(page).to have_link("All Stores")
      end
    end 

    describe "when I visit '/instruments'" do
      it "it shows 'All Instruments' link at top of page" do
        visit '/instruments/'

        expect(page).to have_link("All Instruments")
      end

      it "it shows 'All Stores' link at top of page" do
        visit '/instruments/'

        expect(page).to have_link("All Stores")
      end
    end 
  end
end