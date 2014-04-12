#Countries = ['USA', 'Israel', 'Canada', 'UK', 'Australia', 'France',
#             'Switzerland', 'Brazil', 'Argentina', 'South Africa']
Locations = { :Australia => { :cities => %w(Sidney Melbourne Other),
                              :currency => 'AUD'},
              :Canada =>  { :cities => %w(Montreal Toronto Other),
                           :currency => 'CAD'},
              :England =>  { :cities => %w(London Other),
                           :currency => 'GBP'},
              :Israel =>  { :cities => ['Jerusalem', 'Tel Aviv', "Modi'in", 'Netanya', 'Haifa', 'Other'],
                            :currency => 'ILS'},
              :USA =>     { :cities => ['Chicago', 'Los Angeles', 'Miami', 'Teaneck', 'New York', 'Brooklyn', 'Queens', 'Bronx',
                                     'Washington', 'Other'],
                            :currency => 'USD'},
              :France =>  { :cities => %w(Paris Other),
                            :currency => 'EUR'},
              :Switzerland =>  { :cities => %w(Zurich Antwerp Other),
                            :currency => 'CHF'},
              :South_Africa => { :cities => ['Johannesburg', 'Cape Town', 'Other'],
                                  :currency => 'ZAR'},
              :Argentina => { :cities => ['Buenos Aires', 'Other'],
                   :currency => 'ARS'}
            }
Currencies = Locations.collect {|name, info| info[:currency]}
Countries = Locations.keys

PropertyTypes = { aprtment: 'Apartment', basement: 'Basement Apartment', duplex: 'Duplex', house: 'House' }
Sharing = { exclusive: 'Exclusive', shared: 'Shared', roommate: 'Roommate' }
Duration = { short_term: 'Short-term', long_term: 'Long-term' }
#Currencies = { aud: 'AUD', cad: 'CAD', eur: 'EUR', gbp: 'GBP', ils: 'ILS', usd: 'USD' }
Floors = { 0 => 'Basement', 1 => 'Ground / 1 ' }.merge (Hash[(2..20).collect { |i| [i, i.to_s] }])
Bedrooms = (1..7).to_a
Sleeps = (1..15).to_a
Bathrooms = [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
Amenities = ['Air Conditioning', 'Balcony', 'Breakfast', 'Buzzer/Intercom', 'Cable TV',
             'Dishwasher', 'Doorman', 'Elevator', 'Family Friendly',
             'Garden', 'Gym', 'Handicap Accessible', 'Heating', 'Internet',
             'Parking', 'Pets Allowed', 'Pool',
             'Shabbat Elevator', 'Smoking Allowed',
             'TV', 'Washer/Dryer']
