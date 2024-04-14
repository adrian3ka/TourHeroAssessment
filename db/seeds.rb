# Seed data using Faker gem

# Clear existing data
puts "Clearing existing data..."
User.destroy_all
Trip.destroy_all
AddOn.destroy_all
BookingTrip.destroy_all
BookingTripAddOn.destroy_all
puts "Existing data cleared."

# Seed Users
puts "Seeding users..."
10.times do
  email = Faker::Internet.unique.email
  user = User.create!(
    email: email,
    password: 'password', # You may want to use a more secure password generation method in production
    password_confirmation: 'password'
  )
  puts "User created with email: #{user.email}"
end
puts "Users seeded successfully."

# Seed Trips
puts "Seeding trips..."
10.times do
  name = Faker::Lorem.unique.sentence
  start_date = Faker::Date.forward(days: 30)
  end_date = Faker::Date.forward(from: start_date, days: 60)
  price = Faker::Number.between(from: 200, to: 400)
  puts "Creating trip #{name} from #{start_date} to #{end_date}"
  trip = Trip.create!(
    name: name,
    description: Faker::Lorem.words(number: 30).join(' '),
    start_date: start_date,
    end_date: end_date,
    price: price
  )
  puts "Trip created with name: #{trip.name}"

  # Seed AddOns for each trip
  if trip.id % 3 != 0
    puts "Seeding add-ons for trip #{trip.name}..."
    3.times do
      spot_limit = [nil, Faker::Number.between(from: 2, to: 4)].sample
      price = Faker::Number.between(from: 10, to: 20)
      add_on = AddOn.create!(
        name: Faker::Lorem.words(number: 3).join(' '),
        start_time: Faker::Time.between_dates(from: trip.start_date, to: trip.end_date, period: :afternoon),
        end_time: Faker::Time.between_dates(from: trip.start_date, to: trip.end_date, period: :evening),
        spot_limit: spot_limit,
        trip_id: trip.id,
        description: Faker::Lorem.words(number: 30).join(' '),
        price: price
      )
      puts "Add-on created with name: #{add_on.name}"
    end
  else
    puts "This trip has no add-ons."
  end
end
puts "Trips and add-ons seeded successfully."

puts "Seeding completed successfully."
