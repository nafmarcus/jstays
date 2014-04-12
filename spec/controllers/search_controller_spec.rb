require 'spec_helper'

describe SearchController do
  describe "GET search" do
    it "sets the @properties variable by roommate attribute" do
      alice = User.create(email: "alice@example.com", first_name: "Alice", last_name: "Smith", password: "password")
      from_date = {"day"=>"12", "month"=>"4", "year"=>"2014"}
      to_date = {"day"=>"23", "month"=>"4", "year"=>"2015"}
      bushwick = Property.create(user_id: 1, title: "Near Jefferson Stop", property_type: "Two Bedrooms", 
        description: "Viva Bushwick!", sharing: "exclusive", duration: "short_term", country: "USA", 
        currency: "USD", rate_daily_regular: 80.00, rate_daily_high: 100.00, city: "Brooklyn", address: "30 Wyckoff Avenue", 
        zip: 11237, bedrooms: 2.0, sleeps: 2, bathrooms: 1.0, sleeps: 3, kosher: true, amenities: "Family Friendly,Heating,Internet", active: true)
      astoria = Property.create(user_id: 1, title: "Queens location", property_type: "One Bedroom", 
        description: "wonderful one bedroom", sharing: "shared", duration: "short_term", currency: "USD", 
        other_expenses: nil, country: "USA", state: nil, city: "Queens", zip: "11102", address: "30-38, 30th street, apt 3r", 
        floor: "3", bedrooms: 1.0, bathrooms: 1.0, sleeps: 1, kosher: true, amenities: "Family Friendly,Heating,Internet", 
        active: true, rate_daily_regular: 80.00, rate_daily_high: 100.00)
      bushwick_property_availability = AvailableDate.create(property_id: 1, a_date: "2014-05-20")
      astoria_property_availability = AvailableDate.create(property_id: 2, a_date: "2014-05-20")
      
      get :search, sharing: "shared", city: "Queens"
      expect(assigns(:properties)).to match_array([astoria])
    end
  end
end
