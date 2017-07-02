Airport.destroy_all
airport_codes = %w(LAX SFO DCA MIA)
airport_codes.each do |ac|
  Airport.create!(airport_code: ac)
end

Flight.destroy_all
airports = Airport.all
7.times do
  airports.each do |origin|
    airports.each do |destination|
      next if origin.id == destination.id
      origin.departures.create!(destination_id: destination.id,
                                departure_date: Faker::Time.between(DateTime.now, DateTime.now + 2),
                                duration: Faker::Number.between(60, 360))
    end
  end
end