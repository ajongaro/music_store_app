# spec/features/stores/index_spec.rb

require 'rails_helper'

RSpec.describe 'the stores index page', type: :feature do
  describe 'as a visitor' do
        let!(:store) { Store.create!(name: "Guitar Center", online_only: false, max_inventory: 999, customer_rating: 5) }
        let!(:store_2) { Store.create!(name: "Dave's Music Shop", online_only: false, max_inventory: 100, customer_rating: 4) }
        let!(:store_3) { Store.create!(name: "Pete's Grand Piano Emporium", online_only: true, max_inventory: 20, customer_rating: 2) }
        let!(:guitar) { store.instruments.create!(name: "Gibson Dot Guitar", used: true, needs_repair: false, price: 1399) }
        let!(:piano) { store.instruments.create!(name: "Steinway Grand Piano", used: false, needs_repair: false, price: 61299) }
        let!(:banjo) { store_2.instruments.create!(name: "Fender Banjo", used: false, needs_repair: false, price: 61299) }

    describe "when I visit '/stores'" do
      it 'shows the name of each store in the system' do
        visit '/stores/'

        expect(page).to have_content(store.name)
        expect(page).to have_content(store_2.name)
        expect(page).to have_content(store_3.name)
      end
      
      it 'shows name of stores in order created ' do
        visit '/stores/'
        
        expect(store.name).to appear_before(store_2.name)
        expect(store.name).to appear_before(store_3.name)
        expect(store_2.name).to appear_before(store_3.name)
      end
      
      it 'displays time created next to store name' do
        visit '/stores/'

        expect(page).to have_content(store.created_at)
        expect(page).to have_content(store_2.created_at)
      end

      it 'has a link to edit that stores information' do
        visit '/stores/' 

        expect(page).to have_link("Edit Store", href: "/stores/#{store.id}/edit")
      end
      
      it 'has a link that upon clicking redirects to stores edit page' do
        visit '/stores/' 

        click_link("Edit Store", href: "/stores/#{store.id}/edit")
        
        expect(current_path).to eq("/stores/#{store.id}/edit")
      end

    end
    describe 'when I visit /stores and want to delete an entry' do
      it 'has a delete button to the right of each store' do
        visit '/stores/' 

        expect(page).to have_link("Delete Store", href: "/stores/#{store_3.id}")
      end

      it 'returns me to store page where that store is no longer listed after click' do
        visit '/stores/' 

        click_link("Delete Store", href: "/stores/#{store_3.id}")

        expect(current_path).to eq("/stores")
        expect(page).to_not have_content("Pete's Grand Piano Emporium")
      end
    end
  end
end