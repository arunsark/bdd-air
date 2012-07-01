require_relative '../../app/models/flight_selector'

describe FlightSelector do
  let (:itinerary1) { stub(:itinerary1) }
  let (:itinerary2) { stub(:itinerary2) }
  let (:flight1) { stub(:flight1, itineraries: [itinerary1]) }
  let (:flight2) { stub(:flight2, itineraries: [itinerary2]) }

  before do
    @it = FlightSelector.new([flight1, flight1])
  end

  it "should search for flights based on itinerary" do
    @it.search(itinerary1).should include(flight1)
  end
end
