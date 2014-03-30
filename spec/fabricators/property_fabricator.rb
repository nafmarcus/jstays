Fabricator(:property) do 
  title {Faker::Lorem.words(2)}
  description {Faker::Lorem.sentences(2)}
  zip {Faker::Address.zip}
  address {Faker::Address.street_address}
  floor {[1,2,3,4,5,6,7,8,9].sample}
  bedrooms {[1,2,3,4,5,6,7,8,9].sample}
  bathrooms {[1,2,3,4,5,6,7,8,9].sample}
  sleeps {[1,2,3,4,5].sample}
  user
  #published
  #property_type        
  #sharing              
  #duration             
  #currency
  #country
  #state
  #city
  #kosher
  #amenities
  #active
  #rate_long_term
  #rate_daily_regular
  #rate_daily_high
  #rate_weekly_regular
  #rate_weekly_high
  #rate_monthly_regular
  #rate_monthly_high
end