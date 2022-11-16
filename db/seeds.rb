# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
8.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Internet.domain_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORY.sample
    # va chercher la constante CATEGORY ds la table restaurant
  )
  restaurant.save!

    6.times do
      review = Review.new(
        rating: rand(0..5),
        content: Faker::Restaurant.review,
        restaurant_id: restaurant.id
      )
      review.save!
  end
  puts 'Finished!'
end
