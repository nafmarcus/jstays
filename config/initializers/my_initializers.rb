Countries = ['USA', 'Israel', 'Canada', 'UK', 'Australia', 'France',
							'Switzerland', 'Brazil', 'Argentina', 'South Africa']
Locations = [ "Australia - Melbourne",
							"Australia - Sidney",
							"Canada - Montreal",
							"Canada - Toronto",
							"England - London",
							"Israel - Jerusalem",
							"Israel - Tel Aviv",
							"Israel - Modi'in",
							"Israel - Netanya",
							"Israel - Haifa",
							"US - Chicago",
							"US - Los Angeles",
							"US - Miami",
							"US - New Jersey",
							"US - New Jersey",
							"US - NY - Manhattan",
							"US - NY - Brooklyn",
							"US - NY - Queens",
							"US - Washington D.C."
						]
PropertyTypes = {aprtment: "Apartment", basement: "Basement Apartment", duplex: "Duplex", house: "House"}
Sharing = { exclusive: "Exclusive", shared: "Shared", roommate: "Roommate"}
Duration = { short_term: "Short-term", long_term: "Long-term"}
Currencies = { aud:"AUD", cad: "CAD", eur: "EUR", gbp: "GBP", ils: "ILS", usd: "USD"}
Floors = { 0 => 'Basement', 1 => "Ground / 1 "}.merge (Hash[(2..20).collect {|i| [i, i.to_s]}])
Bedrooms = (1..7).to_a
Sleeps = (1..15).to_a
Bathrooms = [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5]
Amenities = ["Air Conditioning", "Balcony", "Breakfast", "Buzzer/Intercom", "Cable TV",
							"Dishwasher", "Doorman", "Elevator", "Family Friendly", "Fireplace",
							"Garden", "Gym", "Handicap Accessible", "Heating", "Internet", "Kitchen",
							"Microwave", "Parking", "Pets Allowed", "Pool",
							"Shabbat Elevator", "Smoking Allowed", "Suitable for Events",
							"TV", "Washer/Dryer"]
