class FlightSelector
  attr_accessor :flight_list

  def initialize(flight_list)
    @flight_list = flight_list
  end

  def search(itinerary)
    @flight_list.select { |flight| flight.itineraries.include?(itinerary) }
  end
end
