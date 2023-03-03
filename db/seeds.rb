# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Review.destroy_all
Booking.destroy_all
Offering.destroy_all
User.destroy_all
CATEGORIES = ["Appartment", "Villa", "House", "Hostel", "Hotel"]
# Create users
User.create!(first_name: "Vilma",
  last_name:"Catani",
  email: "vilmacatani@gmail.com",
  password:"111111")

User.create!(first_name: "Maria",
  last_name:"Massano",
  email:"mariamassano@gmail.com",
  password:"121212")

User.create!(first_name: "Marta",
  last_name:"Solenne",
  email:"martamartasolenne@gmail.com",
  password:"212121")

# 15.times do
#   first = Faker::Name.first_name
#   last = Faker::Name.last_name
#   User.create!(first_name: first,
#     last_name: last,
#     email:"#{first}#{last}@gmail.com",
#     password:"111111")
# end

# Booking.create!(start_date: Date.new(2023, 2, 21), end_date: Date.new(23, 2, 27), accepted: false)

# Create offerings

# cities = {"Amsterdam" => ["Weesperzijde 124, 1091 ER", "Single 1", "Keisergracht 2", "Prinsengracht 10"],
#     "Finland" => ["Puistokatu 7b A 14 "],
#     "Portugal",
#     "Aosta",
#     "Antwerp"=>[]}


average_rating = rand(1.0 .. 5.0).round(1)
property_type = CATEGORIES.sample
price = rand(35.0..1500.0).round(1)

Offering.create!(user_id: User.all.sample.id, title: "Beautiful view appartment in the heart of Amsterdam", available: true,
description: "Beautiful 4 bedrooms appartment for a big family,
pets allowed, with balcony. An ideal magical place to gather, the splendid chalet overlooks the city with a magnificent view of mountains near the ski resort.
On 3 levels, with an area of 254m², the chalet benefits from 6 bedrooms, 4wc, 3 baths
This proprity features a games room, sauna and outdoor spa.
This magical place are ideally designed to accommodate 14 people.", property_type: property_type,average_rating: average_rating, price_per_night: price, address:"Weesperzijde 124-1, 1091 ER", city: "Amsterdam", country: "Netherlands", size:8)

Offering.create!(user_id: User.all.sample.id, title: "The scenery is amazing, experince Amsterdam ", available: true,
description: "Beautiful 4 bedrooms appartment for a big family,
pets allowed, with balcony. An ideal magical place to gather, the splendid chalet overlooks the city with a magnificent view of mountains near the ski resort.
On 3 levels, with an area of 254m², the chalet benefits from 6 bedrooms, 4wc, 3 baths
This proprity features a games room, sauna and outdoor spa.
This magical place are ideally designed to accommodate 14 people.", property_type: "Appartment",average_rating: average_rating, price_per_night: 29.99, address:"Weesperzijde 1, 1091 ER", city: "Amsterdam", country: "Netherlands", size:8)

Offering.create!(user_id: User.all.sample.id, title: "Coolest place ever in Amsterdam ", available: true,
description: "Beautiful 4 bedrooms appartment for a big family,
pets allowed, with balcony. An ideal magical place to gather, the splendid chalet overlooks the city with a magnificent view of mountains near the ski resort.
On 3 levels, with an area of 254m², the chalet benefits from 6 bedrooms, 4wc, 3 baths
This proprity features a games room, sauna and outdoor spa.
This magical place are ideally designed to accommodate 14 people.", property_type: property_type,average_rating: average_rating, price_per_night: 29.99, address:"Bloemgracht 117, 1016 KJ", city: "Amsterdam", country: "Netherlands", size:8)


Offering.create!(user_id: User.all.sample.id, title:"Noordwijk, let's have some fun!",available: true,
description: "Beautiful 2 bedrooms appartment for a big family,pets not allowed. An ideal magical place to gather, the splendid chalet overlooks the city with a magnificent view of mountains near the ski resort.
On 3 levels, with an area of 254m², the chalet benefits from 6 bedrooms, 4wc, 3 baths
This proprity features a games room, sauna and outdoor spa.
This magical place are ideally designed to accommodate 14 people.", property_type: "Appartment", average_rating: 4.6, price_per_night: 300.0, address:"Amstelveenseweg 42 2201", city: "Amsterdam", country: "Netherlands", size:12)

Offering.create!(user_id: User.all.sample.id, title:"Paris the city of love!", available: true,
description: "Beautiful place with 2 bedrooms,one kitchen, pets allowed with balcony. An ideal magical place to gather, the splendid chalet overlooks the city with a magnificent view of mountains near the ski resort.
On 3 levels, with an area of 254m², the chalet benefits from 6 bedrooms, 4wc, 3 baths
This proprity features a games room, sauna and outdoor spa. This magical place are ideally designed to accommodate 14 people.", property_type: "Appartment", average_rating: 3.5, price_per_night: 149.99, address:"Notre-Dame-des-Champs", city: "Paris", country: "France", size:4)

Offering.create!(user_id: User.all.sample.id, title:"Most beautiful view in Paris", available: true,
  description: "Beautiful place with 2 bedrooms,one kitchen, pets allowed with balcony. An ideal magical place to gather, the splendid chalet overlooks the city with a magnificent view of mountains near the ski resort.
  On 3 levels, with an area of 254m², the chalet benefits from 6 bedrooms, 4wc, 3 baths
  This proprity features a games room, sauna and outdoor spa. This magical place are ideally designed to accommodate 14 people.", property_type: "Appartment", average_rating: 4.3, price_per_night: 149.99, address:"Tour Eiffel", city: "Paris", country: "France", size:4)

10.times do
  average_rating = rand(1.0 .. 5.0).round(1)
  property_type = CATEGORIES.sample
  price = rand(35.0..1500.0).round(1)
  address = Faker::Address.full_address
  city = address.split(',')
  Offering.create!(user_id: User.all.sample.id, property_type: property_type,
    available: true, description: "Beautiful 4 bedrooms appartment in  for a big family, pets allowed, with balcony.
    An ideal magical place to gather, the splendid chalet overlooks the city with a magnificent view of mountains near the ski resort.
    On 3 levels, with an area of 254m², the chalet benefits from 6 bedrooms, 4wc, 3 baths
    This proprity features a games room, sauna and outdoor spa.
    This magical place are ideally designed to accommodate 14 people.", average_rating: average_rating,
    price_per_night: price, address: address, city: city[1], country:nil, title: "Best place in #{city[1]}!")
end

10.times do
  month = rand(1..3)
  day = rand(1..19)
  Booking.create!(offering_id: Offering.all.sample.id, user_id: User.all.sample.id, start_date: Date.new(2023, month, day), end_date: Date.new(2023, month, day+3), accepted: false, pending: true)
end

Booking.create!(offering_id: Offering.first.id, user_id: User.last.id, start_date: Date.new(2023, 4, 15), end_date: Date.new(2023, 4, 30),accepted: false, pending: true)
Booking.create!(offering_id: Offering.last.id, user_id: User.first.id, start_date: Date.new(2023, 6, 10), end_date: Date.new(2023, 6, 25), accepted:false, pending: true)

comments = ["Nice place to be!", "My god the host is so cool", "Excellent place loved it!", "It was okay", "Cool place"]

30.times do
  Review.create!(rating: rand(1..5), comment: comments.sample, booking_id: Booking.all.sample.id)
end

Review.create!(rating: 4, comment: "Exellent", booking_id: Booking.first.id)
Review.create!(rating:5, comment: "Beautiful", booking_id: Booking.last.id)

# create extra data
