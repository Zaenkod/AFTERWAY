# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database...'
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
user = User.create!(first_name: "Nathaly", last_name: "Gomez", address:"4 rue d'Alsace, Asnières-Sur-Seine", email: "nath@gmail.com", password: "123456")
