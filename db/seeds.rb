# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# generate 10 stores
10.times do
  Store.create!(
    name: Faker::Company.unique.name + " Music",
    max_inventory: rand(99..999),
    online_only: Faker::Boolean.boolean(true_ratio: 0.3),
    customer_rating: rand(1..5),
  )
end

100.times do
  Instrument.create!(
    name: "#{Faker::Commerce.brand} #{Faker::Music.instrument}",
    used: Faker::Boolean.boolean(true_ratio: 0.4),
    needs_repair: Faker::Boolean.boolean(true_ratio: 0.2),
    price: [rand(59..999), rand(59..999), rand(999..1999), rand(4999..9999)].sample,
    store_id: rand(1..10)
  )
end
