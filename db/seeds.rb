require "json"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'
EventBar.destroy_all
Participant.destroy_all
Event.destroy_all
Bar.destroy_all
User.destroy_all

puts "Create Les marquises"

bar1 = Bar.create!(
  name: "Les marquises",
  address: "145 Rue Oberkampf, 75011 Paris",
  category: "Happy-hours",
  description: "Un bar et un restaurant cosy spécialisé dans la cuisine française. Vous serez accueilli dans un cadre sympa.
  Avec son ambiance chaleureuse, vous vous sentirez comme à la maison.",
  rating: 4.4,
  opening_hours: "11AM",
  closing_hours: "2PM"
)

puts "Create The Frog Revolution"
bar2 = Bar.create!(
  name: "The Frog Revolution",
  address: "9 Rue de la Bastille, 75004 Paris",
  category: "English Pub",
  description: "Situé sur la place historique de la Bastille, au coeur d'un quartier aussi connu pour ses nuits animées que pour son passé révolutionnaire.
  Mi pub, mi lounge, Frog Revolution sert des bières artisanales en pression sur 24 pompes, ainsi qu'un menu délicieux et gourmand composé de BBQ fumé américain et des Genuinely Good Burgers jusqu'en fin de soirée, sept jours par semaine.",
  rating: 4.3
)

puts "Create User"
user1 = User.create!(first_name: "Nathaly", last_name: "Gomez", address:"4 rue d'Alsace, Asnières-Sur-Seine", email: "nath@gmail.com", password: "123456")
user2 = User.create!(first_name: "Pierre", last_name: "d'Anselme", address:"16 Villa Gaudelet, Paris", email: "pierre@gmail.com", password: "123456")
user3 = User.create!(first_name: "Cédric", last_name: "Ruault", address:"23 Rue Theodore de Banville, Paris", email: "cédric@gmail.com", password: "123456")
user4 = User.create!(first_name: "Michel", last_name: "Feu", address:"45 rue de la TOmbe Issoire, Paris", email: "michel@gmail.com", password: "123456")

puts "create event"
event = user1.events.new(date: "31/08/2023", address: user1.address, hour: "20:00", travel_time: 5, category: "Wine bars", price: "10", title: "les copains d'abord")
event.save!

Participant.create(event: event, user: user1)
Participant.create(event: event, user: user2)
Participant.create(event: event, user: user3)
Participant.create(event: event, user: user4)

EventBar.create(event: event, bar: bar1, status: nil)
EventBar.create(event: event, bar: bar2, status: nil)


puts "Create 60 bars"
category = ["Cocktail bar", "Sports bar", "Dive bar", "Wine bar", "Pub or tavern", "Live music bar", "Hotel bar", "Specialty bars", "Country Bar", "Beer Bar", "Tiki Bar"]

bar_descriptions = [
  "A cozy hideaway with soft lighting and an inviting atmosphere.",
  "An upscale lounge where art and cocktails blend seamlessly.",
  "A rustic bar with exposed brick walls and a warm fireplace.",
  "A beachside oasis offering tropical drinks and a laid-back vibe.",
  "A modern and sleek bar featuring minimalist design and craft cocktails.",
  "A lively pub with a wide selection of local and imported beers.",
  "A rooftop bar providing stunning views and handcrafted beverages.",
  "An underground speakeasy with a mysterious and alluring ambiance.",
  "A sports bar where fans gather to cheer on their favorite teams.",
  "A swanky cocktail bar known for its innovative mixology techniques.",
  "A jazz-infused bar hosting live music performances and soulful drinks.",
  "A European-style wine bar offering an extensive selection of wines.",
  "A karaoke bar where patrons can sing their hearts out with friends.",
  "A retro-themed bar filled with nostalgia and classic arcade games.",
  "A tropical tiki bar serving exotic cocktails in quirky glassware.",
  "A whiskey-focused establishment with a library of rare bourbons.",
  "A vibrant dance club with DJs spinning the latest hits all night.",
  "A cozy Irish pub complete with wooden furnishings and hearty brews.",
  "A cultural hub hosting art exhibitions alongside its drinks.",
  "A fusion of coffeehouse and bar, perfect for both day and night.",
  "An industrial-chic bar featuring exposed beams and creative drinks.",
  "A charming countryside bar offering a taste of rural life.",
  "A glamorous cocktail lounge frequented by the city's elite.",
  "A dive bar with a gritty charm and affordable drink specials.",
  "An elegant wine and cheese bar catering to sophisticated palates.",
  "A futuristic bar where robots assist in crafting your cocktails.",
  "A beachfront bar known for its sunset views and frozen margaritas.",
  "A literary-themed bar adorned with bookshelves and literary quotes.",
  "A health-conscious bar serving organic drinks and superfood cocktails.",
  "A retro diner bar with neon lights and milkshake-inspired drinks.",
  "A hybrid bar-gallery where local artists' work adorns the walls.",
  "A LGBTQ+ friendly bar promoting inclusivity and good times.",
  "A classy martini bar specializing in shaken, not stirred, drinks.",
  "A family-friendly bar offering mocktails and kid-friendly snacks.",
  "A themed bar with a rotating menu based on different countries.",
  "A mix of board games, cocktails, and good company in one place.",
  "A Mediterranean-inspired bar with white-washed walls and sangria.",
  "A historic bar that once served famous figures from history.",
  "A science-themed bar where cocktails are mixed like potions.",
  "An eco-friendly bar using locally sourced ingredients for drinks.",
  "A high-tech bar with interactive tables and digital drink menus.",
  "A Latin dance club and bar with spicy cocktails and rhythms.",
  "A bar set in an old cinema, preserving its vintage charm.",
  "A speakeasy hidden behind a secret door within another bar.",
  "An Asian-inspired bar with sake, sushi, and bonsai decorations.",
  "A bar nestled within a garden, surrounded by lush greenery.",
  "A bar with a rotating rooftop offering panoramic city views.",
  "A horse-themed bar paying homage to equestrian culture.",
  "A pirate-themed bar complete with ship-like decor and rum drinks.",
  "A bar with a focus on absinthe, offering traditional rituals.",
  "A bar with a rotating theme, transforming every few months.",
  "An avant-garde bar blurring the lines between art and drinks.",
  "A science fiction-themed bar with alien-inspired cocktails.",
  "A surf shack bar perfect for beach lovers and wave chasers.",
  "A yoga bar where you can enjoy post-class smoothies or cocktails.",
  "A disco-era bar bringing back the glitz and glamour of the '70s.",
  "A whiskey and cigar lounge providing a refined experience.",
  "A bar tucked inside a converted historic train car.",
  "A bar with an ever-changing menu based on seasonal ingredients."
]

filepath = File.join(Rails.root,"/public/bars.json")
serialized_bars = File.read(filepath)
bars = JSON.parse(serialized_bars)

bars.each do |bar|
 Bar.create!(
    name: bar["result"]["name"],
    address: bar["result"]["formatted_address"],
    price: bar["result"]["price_level"],
    category: category.sample,
    rating: bar["result"]["rating"],
    description: bar_descriptions.sample
  )
end
