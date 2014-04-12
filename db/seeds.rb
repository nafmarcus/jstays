# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
alice = User.create(email: "alice@example.com", first_name: "Alice", last_name: "Smith", password: "password")
bob = User.create(email: "bob@example.com", first_name: "Bob", last_name: "Smith", password: "password")

Property.destroy_all
two_bedroom_ny = Property.create(user_id: 1, title: "Times Square", property_type: "Two Bedrooms", 
  title: "Greate Place", description: "Excellent deal in midtown", sharing: "Shared", duration: "short_term", 
  country: "USA", currency: "USD", rate_daily_regular: 115.00, rate_daily_high: 145.00, city: "New York", 
  address: "500 7th avenue", zip: 10018, bedrooms: 2.0, sleeps: 2, bathrooms: 1.0, sleeps: 1, 
  kosher: true, active: true, amenities: "Family Friendly,Heating,Internet")

one_bedroom_qn = Property.create(user_id: 1, title: "Queens location", property_type: "One Bedroom", 
  description: "wonderful one bedroom", sharing: "Exclusive", duration: "long_term", currency: "USD", 
  other_expenses: nil, country: "USA", state: nil, city: "Queens", zip: "11102", address: "30-38, 30th street, apt 3r", 
  floor: "3", bedrooms: 1.0, bathrooms: 1.0, sleeps: 1, kosher: true, amenities: "Family Friendly,Heating,Internet", 
  active: true, rate_long_term: 1.0)

three_bedroom_ny = Property.create(user_id: 1, title: "Fancy Shmancy", property_type: "Three Bedrooms", 
  description: "right near the hi-line", sharing: "Shared", duration: "short_term", country: "USA", 
  currency: "USD", rate_daily_regular: 150.00, rate_daily_high: 200.00, city: "New York", address: "601 west 26th street", 
  zip: 10001, active: true, bedrooms: 3.0, sleeps: 3, bathrooms: 2.0, sleeps: 3, kosher: true, amenities: "Family Friendly,Heating,Internet")

one_bedroom_qn = Property.create(user_id: 2, title: "Steinway", property_type: "One Bedroom", 
  description: "best of queens", sharing: "Shared", duration: "short_term", currency: "USD", 
  other_expenses: nil, rate_daily_regular: 65.00, rate_daily_high: 85.00, country: "USA", state: "NY", city: "Queens", zip: "11103", address: "23-43, 43th street", 
  floor: "2", bedrooms: 1.0, bathrooms: 1.0, sleeps: 1, kosher: true, amenities: "Family Friendly,Heating,Internet", 
  active: true)

three_bedroom_bk = Property.create(user_id: 2, title: "Clinton Hill", property_type: "Three Bedrooms", 
  description: "Do the Right Thing!", sharing: "Shared", duration: "short_term", country: "USA", 
  currency: "USD", rate_daily_regular: 65.00, rate_daily_high: 95.00, city: "Brooklyn", address: "451 Classon Avenue", 
  zip: 11238, active: true, bedrooms: 3.0, sleeps: 3, bathrooms: 1.0, sleeps: 3, kosher: true, amenities: "Family Friendly,Heating,Internet")

two_bedroom_bk = Property.create(user_id: 2, title: "Near Jefferson Stop", property_type: "Two Bedrooms", 
  description: "Viva Bushwick!", sharing: "Shared", duration: "short_term", country: "USA", 
  currency: "USD", rate_daily_regular: 80.00, rate_daily_high: 100.00, city: "Brooklyn", address: "30 Wyckoff Avenue", 
  zip: 11237, active: true, bedrooms: 2.0, sleeps: 2, bathrooms: 1.0, sleeps: 3, kosher: true, amenities: "Family Friendly,Heating,Internet")

two_bedroom_ny = Property.create(user_id: 2, title: "Close to Wall street", property_type: "Two Bedrooms", 
  description: "Financial District", sharing: "Shared", duration: "long_term", country: "USA", 
  currency: "USD", rate_daily_regular: 100.00, rate_daily_high: 120.00, city: "New York", address: "East Coast 22 Cortlandt Street", 
  zip: 10007, bedrooms: 2.0, sleeps: 2, bathrooms: 1.0, kosher: true, amenities: "Family Friendly,Heating,Internet",
  active: true, rate_long_term: 1.0)

AvailableDate.destroy_all
  times_square = AvailableDate.create(property_id: 1, a_date: "2014-04-20")
  queens_location = AvailableDate.create(property_id: 2, a_date: "2014-04-27")
  fancy_shmancy = AvailableDate.create(property_id: 3, a_date: "2014-05-15")
  best_of_queens = AvailableDate.create(property_id: 4, a_date: "2014-06-15")
  right_thing = AvailableDate.create(property_id: 5, a_date: "2014-08-15")
  viva_bushwick = AvailableDate.create(property_id: 6, a_date: "2014-06-15")
  financial_district = AvailableDate.create(property_id: 7, a_date: "2014-07-15")