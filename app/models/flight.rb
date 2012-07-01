class Flight
  attr_accessor :flight_number, :itineraries

  def initialize(flight_number)
    @flight_number = flight_number
    @itineraries = []
  end

  def add_itinerary(itinerary)
    @itineraries << itinerary
  end
end
