describe Property do
  describe ".available_between" do
    it "returns all properties within a start and end date" do
      alice = User.create(email: "alice@example.com", first_name: "Alice", last_name: "Smith", password: "password")
      from_date = "2014-04-20"
      to_date = "2014-07-20"
      property = Property.create(user_id: alice.id, title: "Queens location", property_type: "One Bedroom", 
      description: "wonderful one bedroom", sharing: "Exclusive", duration: "long_term", currency: "USD", 
      other_expenses: nil, country: "USA", state: nil, city: "Queens", zip: "11102", address: "30-38, 30th street, apt 3r", 
      floor: "3", bedrooms: 1.0, bathrooms: 1.0, sleeps: 1, kosher: true, amenities: "Family Friendly,Heating,Internet", 
      active: true, rate_long_term: 1.0)

      available_date = AvailableDate.create(property_id: property.id, a_date: "2014-05-20", level: "no idea")
      expect(Property.available_between(from_date, to_date)).to eq([property])
    end

    it "returns nil if there are no properties within a start and end date" do
      alice = User.create(email: "alice@example.com", first_name: "Alice", last_name: "Smith", password: "password")
      from_date = "2014-04-20"
      to_date = "2014-07-20"
      property = Property.create(user_id: alice.id, title: "Queens location", property_type: "One Bedroom", 
      description: "wonderful one bedroom", sharing: "Exclusive", duration: "long_term", currency: "USD", 
      other_expenses: nil, country: "USA", state: nil, city: "Queens", zip: "11102", address: "30-38, 30th street, apt 3r", 
      floor: "3", bedrooms: 1.0, bathrooms: 1.0, sleeps: 1, kosher: true, amenities: "Family Friendly,Heating,Internet", 
      active: true, rate_long_term: 1.0)

      available_date = AvailableDate.create(property_id: property.id, a_date: "2014-08-20", level: "no idea")
      expect(Property.available_between(from_date, to_date)).to eq([])
    end
  end
end