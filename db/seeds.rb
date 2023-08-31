require "json"

puts 'Cleaning database...'
EventBar.destroy_all
Participant.destroy_all
Event.destroy_all
Bar.destroy_all
User.destroy_all

puts "Create 6 Users : User1 = Nathaly, User2 = Pierre, User3 = Cédric, User4 = Michel, User5 = Paul, User6 = Cécile "
user1 = User.create!(
  first_name: "Nathaly",
  last_name: "Gomez",
  address: "4 rue d'Alsace, Asnières-Sur-Seine",
  email: "nath@gmail.com",
  password: "123456"
)

user2 = User.create!(
  first_name: "Pierre",
  last_name: "d'Anselme",
  address: "16 Villa Gaudelet, Paris",
  email: "pierre@gmail.com",
   password: "123456"
  )

user3 = User.create!(
  first_name: "Cédric",
  last_name: "Ruault",
  address: "23 Rue Theodore de Banville, Paris",
  email: "cédric@gmail.com",
  password: "123456"
)

user4 = User.create!(
  first_name: "Michel",
  last_name: "Feu",
  address: "45 rue de la Tombe Issoire, Paris",
  email: "michel@gmail.com",
  password: "123456"
)

user5 = User.create!(
  first_name: "Paul",
  last_name: "Portier",
  address: "9 Rue Madame de Sanzillon, Clichy",
  email: "paul@gmail.com",
  password: "123456"
)

user6 = User.create!(
  first_name: "Cécile",
  last_name: "Veneziani",
  address: "23 Rue Hoche, Ivry-sur-Seine",
  email: "cecile@gmail.com",
  password: "123456"
)

# Génerer 10 faux noms d'évenements
event_names = [
  "Technology Innovation Conference",
  "Local Art Exhibition",
  "Professional Networking Meetup",
  "Creative Cooking Workshop",
  "Personal Development Seminar",
  "Outdoor Concert",
  "Environmental Awareness Day",
  "Independent Film Festival",
  "Board Games Tournament",
  "Charity Masquerade Ball"
]

# Générer 10 fausses dates d'évenements
event_dates = [
  "04/09/23",
  "06/11/23",
  "08/12/23",
  "07/09/23",
  "20/11/23",
  "15/12/23",
  "11/10/23",
  "23/09/23",
  "21/11/23",
  "18/12/23",
  "05/09/23"
]

# Générer 10 fausses heures d'évenements
event_hours= [
  "17:30",
  "18:00",
  "19:00",
  "20:00",
  "19:45",
  "17:45",
  "18:20",
  "21:00",
  "20:30",
  "19:30",
  "17:00"
]


# Génerer 11 fausses catégories de bars
category = [
  "Cocktail bar",
  "Sports bar",
  "Dive bar",
  "Wine bar",
  "Pub or tavern",
  "Live music bar",
  "Hotel bar",
  "Specialty bars",
  "Country Bar",
  "Beer Bar",
  "Tiki Bar"
]

# Génerer 60 fausses descriptions
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



# # On génere 30 bars depuis le fichier json
# bars.each.take(3) do |bar|
#   bar = Bar.create!(
#       name: bar["result"]["name"],
#       address: bar["result"]["formatted_address"],
#       price: bar["result"]["price_level"],
#       category: category.sample,
#       rating: bar["result"]["rating"],
#       description: bar_descriptions.sample,
#       latitude: bar["result"]["geometry"]["location"]["lat"],
#       longitude: bar["result"]["geometry"]["location"]["lng"],
#       opening_hours:  bar.dig("result", "opening_hours", "periods")&.first&.dig("open", "time"),
#       closing_hours:  bar.dig("result", "opening_hours", "periods")&.first&.dig("close", "time")
#     )
#   # Attach the photo using your Cloudinary config
#   bar.photo.attach(io: file, filename: "bar.png", content_type: "image/png")
#   bar.save!
# end



# On récupere les infos des bars depuis le fichier json
filepath = File.join(Rails.root,"/public/bars.json")
serialized_bars = File.read(filepath)
bars = JSON.parse(serialized_bars)


puts "Create 30 bars"
# On génere 30 bars depuis le fichier json
bars.take(20).each do |bar|
  bar = Bar.new(
      name: bar["result"]["name"],
      address: bar["result"]["formatted_address"],
      price: bar["result"]["price_level"],
      category: category.sample,
      rating: bar["result"]["rating"],
      description: bar_descriptions.sample,
      latitude: bar["result"]["geometry"]["location"]["lat"],
      longitude: bar["result"]["geometry"]["location"]["lng"],
      opening_hours:  bar.dig("result", "opening_hours", "periods")&.first&.dig("open", "time"),
      closing_hours:  bar.dig("result", "opening_hours", "periods")&.first&.dig("close", "time")
    )

  # On récupere une image random d'un bar via unsplash
  url = "https://api.unsplash.com/photos/random?client_id=#{ENV["ACCESS_KEY"]}&query=bar"
  # Fetch this URL, it will return a json containing infos about 1 random photo
  photo_serialized = URI.open(url).read
  photo_json = JSON.parse(photo_serialized)
  # Get the URL for one of the sizes (small is the smallest obvy)
  photo_url = photo_json["urls"]["small"]
  # Download this photo and save it into a variable
  file = URI.open(photo_url)
  # Attach the photo using your Cloudinary config
  bar.photo.attach(io: file, filename: "bar.png", content_type: "image/png")
  bar.save!

  puts "Create 1 event for each bar organize by le N avec toutes l'équipe"
    event = user1.events.create!(
      date: event_dates.sample,
      address: user1.address,
      hour: event_hours.sample,
      distance: rand(1..8),
      category: category.sample,
      price: rand(0..5),
      title: event_names.sample
    )
    Participant.create!(event: event, user: user2)
    Participant.create!(event: event, user: user3)
    Participant.create!(event: event, user: user4)
    Participant.create!(event: event, user: user5)
    Participant.create!(event: event, user: user6)
    EventBar.create!(event: event, bar: bar, status: nil)

  puts "Create 1 events organize by le M avec toute l'équipe sans le P"
    event = user4.events.create!(
      date: event_dates.sample,
      address: user4.address,
      hour: event_hours.sample,
      distance: rand(1..8),
      category: category.sample,
      price: rand(0..5),
      title: event_names.sample
    )
    Participant.create!(event: event, user: user1)
    Participant.create!(event: event, user: user3)
    Participant.create!(event: event, user: user6)
    EventBar.create!(event: event, bar: bar, status: nil)
end

puts "Total : 20 bars, 40 Events et EventsBar, 6 Users"
