# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Review.destroy_all
Booking.destroy_all
Offering.destroy_all
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

Offering.create!(user_id: User.first.id, title: "Beautiful view appartment in the heart of Amsterdam", available: true,
  description: "Beautiful 4 bedrooms appartment for a big family, pets allowed, with balcony", property_type: "Appartment",average_rating: 4, price_per_night: 29.99, address:"Hoogvliet 3 2203 MB", city: "Amsterdam", country: "Netherlands", size:8)
Offering.create!(user_id: User.first.id, title:"Noordwijk, let's have some fun!",available: true,
  description: "Beautiful 2 bedrooms appartment for a big family,pets not allowed", property_type: "Appartment", average_rating: 5, price_per_night: 300.0, address:"Amstelveenseweg 42 2201", city: "Amsterdam", country: "Netherlands", size:12)
Offering.create!(user_id: User.last.id, title:"Paris the city of love!", available: true,
  description: "Beautiful place with 2 bedrooms,one kitchen, pets allowed with balcony", property_type: "Appartment", average_rating: 5, price_per_night: 149.99, address:"Zeeweg 3 2202", city: "Utrecht", country: "Netherlands", size:4)


Booking.create!(offering_id: Offering.last.id, user_id: User.first.id, start_date: Date.new(2023, 2, 21), end_date: Date.new(2023, 2, 27), accepted: false)
Booking.create!(offering_id: Offering.first.id, user_id: User.last.id, start_date: Date.new(2023, 4, 16), end_date: Date.new(2023, 4, 30),accepted: false)
Booking.create!(offering_id: Offering.last.id, user_id: User.first.id, start_date: Date.new(2023, 6, 10), end_date: Date.new(2023, 6, 25), accepted:false)


Review.create!(rating: 3, comment: "Nice place to be!", booking_id: Booking.first.id)
Review.create!(rating: 4, comment: "Exellent", booking_id: Booking.first.id)
Review.create!(rating:5, comment: "Beautiful", booking_id: Booking.last.id)

# create extra data
