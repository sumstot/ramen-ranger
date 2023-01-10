require 'faker'

puts 'Destroying all ramen and restaurants'
Restaurant.destroy_all
Bowl.destroy_all

puts 'Generating new restaurants'

addresses = [
  "3-1-15 Mitsuyakita Yodogawa Ku, Osaka", # kirimen
  "1-2-2 Minamimorimachi Kita Ku, Osaka", # hayato
  "25-4 Mibuaiaicho Nakagyo Ku, Kyoto", #X seabura no kami
  "1-5-1 Nakatsu Kita Ku, Osaka", # menya new classic
  "5-12-21 Fukushima Fukushima Ku, Osaka", # moeyo mensuke
  "1-16 Nagasunishidori Amagasaki, Hyogo", #X buta no hoshi
  "1-11-5 Shibata Kita Ku, Osaka", # zen labs
  "1-2 Fukushima Fukushima Ku, Osaka", #X kozou +
  "4-6-3 Katsuyama Tennoji Ku, Osaka", # kamigata rainbow
  "2-11-1 Sannomiyacho Chuo Ku, Kobe" # kobe gyu ramen yazawa
]
index = 1
address_index = 0

10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    year_opened: rand(1970..2022)
  )
  restaurant.address = addresses[address_index]
  restaurant.save
  address_index += 1
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
  bowl.image.attach(
    io: File.open(File.join(Rails.root, "app/assets/images/ramen/ramen#{index}.jpg")),
    filename: "ramen#{index}.jpg"
  )
  index += 1
  bowl.save
end

puts "Generated #{Restaurant.all.count} restaurants and #{Bowl.all.count} bowls of ramen"
