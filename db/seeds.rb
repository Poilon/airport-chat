airports_data = [
  {code: "CDG", name: "Paris Charles de Gaulle", city: "Paris", country: "France"},
  {code: "ORY", name: "Paris Orly", city: "Paris", country: "France"},
  {code: "JFK", name: "John F. Kennedy International", city: "New York", country: "USA"},
  {code: "LAX", name: "Los Angeles International", city: "Los Angeles", country: "USA"},
  {code: "LHR", name: "London Heathrow", city: "London", country: "UK"},
  {code: "DXB", name: "Dubai International", city: "Dubai", country: "UAE"},
  {code: "HND", name: "Tokyo Haneda", city: "Tokyo", country: "Japan"},
  {code: "NRT", name: "Narita International", city: "Tokyo", country: "Japan"},
  {code: "SIN", name: "Singapore Changi", city: "Singapore", country: "Singapore"},
  {code: "ICN", name: "Incheon International", city: "Seoul", country: "South Korea"},
  {code: "HKG", name: "Hong Kong International", city: "Hong Kong", country: "Hong Kong"},
  {code: "AMS", name: "Amsterdam Schiphol", city: "Amsterdam", country: "Netherlands"},
  {code: "FRA", name: "Frankfurt Airport", city: "Frankfurt", country: "Germany"},
  {code: "MUC", name: "Munich Airport", city: "Munich", country: "Germany"},
  {code: "BCN", name: "Barcelona El Prat", city: "Barcelona", country: "Spain"},
  {code: "MAD", name: "Madrid Barajas", city: "Madrid", country: "Spain"},
  {code: "FCO", name: "Rome Fiumicino", city: "Rome", country: "Italy"},
  {code: "MXP", name: "Milan Malpensa", city: "Milan", country: "Italy"},
  {code: "IST", name: "Istanbul Airport", city: "Istanbul", country: "Turkey"},
  {code: "SYD", name: "Sydney Kingsford Smith", city: "Sydney", country: "Australia"},
  {code: "MEL", name: "Melbourne Airport", city: "Melbourne", country: "Australia"},
  {code: "YYZ", name: "Toronto Pearson", city: "Toronto", country: "Canada"},
  {code: "YVR", name: "Vancouver International", city: "Vancouver", country: "Canada"},
  {code: "GRU", name: "Sao Paulo Guarulhos", city: "Sao Paulo", country: "Brazil"},
  {code: "GIG", name: "Rio de Janeiro Galeao", city: "Rio de Janeiro", country: "Brazil"},
  {code: "MEX", name: "Mexico City International", city: "Mexico City", country: "Mexico"},
  {code: "BOM", name: "Chhatrapati Shivaji International", city: "Mumbai", country: "India"},
  {code: "DEL", name: "Indira Gandhi International", city: "New Delhi", country: "India"},
  {code: "BKK", name: "Suvarnabhumi Airport", city: "Bangkok", country: "Thailand"},
  {code: "KUL", name: "Kuala Lumpur International", city: "Kuala Lumpur", country: "Malaysia"},
  {code: "CGK", name: "Soekarno-Hatta International", city: "Jakarta", country: "Indonesia"},
  {code: "SFO", name: "San Francisco International", city: "San Francisco", country: "USA"},
  {code: "ORD", name: "O'Hare International", city: "Chicago", country: "USA"},
  {code: "ATL", name: "Hartsfield-Jackson Atlanta", city: "Atlanta", country: "USA"},
  {code: "DFW", name: "Dallas Fort Worth", city: "Dallas", country: "USA"},
  {code: "MIA", name: "Miami International", city: "Miami", country: "USA"},
  {code: "SEA", name: "Seattle-Tacoma International", city: "Seattle", country: "USA"},
  {code: "LAS", name: "Harry Reid International", city: "Las Vegas", country: "USA"},
  {code: "BOS", name: "Boston Logan International", city: "Boston", country: "USA"},
  {code: "EWR", name: "Newark Liberty International", city: "Newark", country: "USA"},
  {code: "IAD", name: "Washington Dulles", city: "Washington", country: "USA"},
  {code: "DCA", name: "Ronald Reagan Washington", city: "Washington", country: "USA"},
  {code: "PHX", name: "Phoenix Sky Harbor", city: "Phoenix", country: "USA"},
  {code: "DEN", name: "Denver International", city: "Denver", country: "USA"},
  {code: "LGA", name: "LaGuardia Airport", city: "New York", country: "USA"},
  {code: "MCO", name: "Orlando International", city: "Orlando", country: "USA"},
  {code: "PEK", name: "Beijing Capital International", city: "Beijing", country: "China"},
  {code: "PVG", name: "Shanghai Pudong International", city: "Shanghai", country: "China"},
  {code: "CAN", name: "Guangzhou Baiyun International", city: "Guangzhou", country: "China"},
  {code: "CTU", name: "Chengdu Shuangliu International", city: "Chengdu", country: "China"}
]

puts "Creating airports..."
airports_data.each do |data|
  Airport.find_or_create_by!(code: data[:code]) do |airport|
    airport.name = data[:name]
    airport.city = data[:city]
    airport.country = data[:country]
  end
end

puts "Created #{Airport.count} airports"
