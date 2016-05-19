require 'spec_helper'

describe SearchController do
  describe "GET search" do
    it "sets the @properties variable by duration and city" do
      alice = User.create(email: "alice@example.com", first_name: "Alice", last_name: "Smith", password: "password")
      property = Property.create(user_id: 1, title: "Near Jefferson Stop", property_type: "Two Bedrooms", 
        description: "Viva Bushwick!", sharing: "Shared", duration: "short_term", country: "USA", 
        currency: "USD", rate_daily_regular: 80.00, rate_daily_high: 100.00, city: "Brooklyn", address: "30 Wyckoff Avenue", 
        zip: 11237, bedrooms: 2.0, sleeps: 2, bathrooms: 1.0, sleeps: 3, kosher: true, amenities: "Family Friendly,Heating,Internet", active: true)
      times_square = AvailableDate.create(property_id: 1, a_date: "2014-04-20")
      

      get :search, duration: "short_term", city: "Brooklyn"
      expect(assigns(:properties)).to match_array([property])
    end

    it "sets the @properties variable by duration, city, @form_date and @to_date" do
      alice = User.create(email: "alice@example.com", first_name: "Alice", last_name: "Smith", password: "password")
      from_date = {"day"=>"12", "month"=>"4", "year"=>"2014"}
      to_date = {"day"=>"23", "month"=>"4", "year"=>"2015"}
      property = Property.create(user_id: 1, title: "Queens location", property_type: "One Bedroom", 
        description: "wonderful one bedroom", sharing: "Exclusive", duration: "short_term", currency: "USD", 
        other_expenses: nil, country: "USA", state: nil, city: "Queens", zip: "11102", address: "30-38, 30th street, apt 3r", 
        floor: "3", bedrooms: 1.0, bathrooms: 1.0, sleeps: 1, kosher: true, amenities: "Family Friendly,Heating,Internet", 
        active: true, rate_daily_regular: 80.00, rate_daily_high: 100.00)
      queens_location = AvailableDate.create(property_id: 1, a_date: "2014-05-20")

      get :search, duration: "short_term", city: "Queens", from_date: from_date, to_date: to_date
      expect(assigns(:properties)).to match_array([property])
    end
  end
end