require 'faker'

puts 'Destroying all ramen and restaurants'
Restaurant.destroy_all
Bowl.destroy_all

puts 'Generating new restaurants'
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    year_opened: rand(1970..2022)
  )
  restaurant.save
end

puts 'Generating new bowls'
soup = %w[niboshi tonkotsu shoyu shio tantanmen miso chukasoba sokisoba]
20.times do
  bowl = Bowl.create!(
    soup: soup.sample,
    score: rand(3.0..5.0),
    restaurant_id: Restaurant.all.sample.id
  )
  bowl.description = "This is a unique #{bowl.soup} ramen"
  bowl.review = "A solid bowl of #{bowl.soup} ramen"
  bowl.score = bowl.score.round(1)
  bowl.save
end

puts "Generated #{Restaurant.all.count} restaurants and #{Bowl.all.count} bowls of ramen"
