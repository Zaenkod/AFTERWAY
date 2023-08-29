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
  name:"Les marquises",
  address:"145 Rue Oberkampf, 75011 Paris",
  category:"Happy-hours",
  description: "Un bar et un restaurant cosy spécialisé dans la cuisine française. Vous serez accueilli dans un cadre sympa.
  Avec son ambiance chaleureuse, vous vous sentirez comme à la maison.",
  rating: 4.4
)

puts "Create The Frog Revolution"
bar2 = Bar.create!(
  name:"The Frog Revolution",
  address:"9 Rue de la Bastille, 75004 Paris",
  category:"English Pub",
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

EventBar.create(event: event, bar: bar1, vote: 0, status: nil)
EventBar.create(event: event, bar: bar2, vote: 0, status: nil)
