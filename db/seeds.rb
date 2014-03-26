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
two_bedroom = Property.create(property_type: "Two Bedrooms", title: "Greate Place", sharing: "yes", duration: "5 days", country: "USA", 
  city: "New York", address: "street", bedrooms: 2.0, sleeps: 2, zip: 12345)