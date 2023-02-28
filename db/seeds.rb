# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
User.create!(first_name: "Vilma",
  last_name:"Catani",
  email: "vilamcatani@gmail.com",
  password:"111111")

User.create!(first_name: "Maria",
  last_name:"Massano",
  email:"mariamassano@gmail.com",
  password:"121212")

User.create!(first_name: "Marta",
  last_name:"Solenne",
  email:"martamartasolenne@gmail.com",
  password:"212121")

# Booking.create!(start_date: Date.new(2023, 2, 21), end_date: Date.new(23, 2, 27), accepted: false)
Offering.create!(user_id: User.first.id, title: "Beautiful view appartment in the heart of Amsterdam", available: true, description: "Beautiful 4 bedrooms appartment for a big family, pets allowed, with balcony", average_rating: 4, price_per_night: 29.99, address:"Hoogvliet 3 2203 MB", cit: "Amsterdam", country: "Netherlands", size:8)
Offering.create!(user_id: User.last.id, size: 5, title:"Beautiful view appartment in the South of Amsterdam",available: true, description: "Beautiful 2 bedrooms appartment for a big family,pets not allowed", average_rating: 5, price_per_night: "38,99 pp",address:"Amstelveenseweg 42 2201 AB Amasterdam The Netherlands")
Offering.create!(user_id: User.first.id, size: 5, title:"Beautiful appartment with a sea view in Noordijk ", available: true, description: "Beautiful place with 2 bedrooms,one kitchen, pets allowed with balcony", average_rating: 5, price_per_night:"59,99 pp",address:"Zeeweg 3 2202 NK Noordwijk The Netherlands")

Booking.create!(offering_id: Offering.first.id, user_id: User.first.id, start_date: Date.new(2023, 2, 21), end_date: Date.new(2023, 2, 27), accepted: false)
Booking.create!(offering_id: Offering.first.id, user_id: User.last.id, start_date: Date.new(2023, 4, 16),end_date: Date.new(2023, 4, 30),accepted: false)
Booking.create!(offering_id: Offering.first.id, user_id: User.first.id,start_date: Date.new(2023, 6, 10),end_date: Date.new(2023, 6, 25), accepted:false)

Review.create!(rating: 3,comment: "Nice place to be!",booking_id: Booking.first.id)
Review.create!(rating: 4, comment:"Exellent", booking_id: Booking.first.id)
Review.create!(rating:5, comment:"Beautiful", booking_id: Booking.last.id)
