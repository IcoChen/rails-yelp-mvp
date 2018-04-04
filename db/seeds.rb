# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
restaurants_attributes = [
  {
    name:         "1",
    address:      "Where 1 is",
    category:     "chinese"
  },
  {
    name:         "2",
    address:      "Where 2 is",
    category:     "chinese"
  },
  {
    name:         "3",
    address:      "3",
    category:     "chinese"
  }
]
Restaurant.create!(restaurants_attributes)
puts 'Finished!'
