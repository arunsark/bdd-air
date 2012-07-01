class ReservationSystem
  def self.book_ticket(flight, itinerary, passenger)
    OpenStruct.new(flight_number: flight.flight_number,
                   from: itinerary.from,
                   to: itinerary.to,
                   date: itinerary.date,
                   passenger_name: passenger.name)
  end
end
