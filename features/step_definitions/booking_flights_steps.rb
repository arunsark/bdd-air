class Flight
  attr_accessor :flight_number

  def initialize(flight_number)
    @flight_number = flight_number
    @itineraries = []
  end

  def add_itinerary(itinerary)
    @itineraries << itinerary
  end
end

class Itinerary
  attr_accessor :from, :to, :date
  def initialize(from, to, date)
    @from = from
    @to = to
    @date = date
  end
end

class FlightSelector
  attr_accessor :flight_list

  def initialize(flight_list)
    @flight_list = flight_list
  end

  def search(itinerary)
    @flight_list
  end
end

class ReservationSystem
  def self.book_tickets(flight, itinerary, passenger)
    OpenStruct.new(flight_number: flight.flight_number,
                   from: itinerary.from,
                   to: itinerary.to,
                   date: itinerary.date,
                   passenger_name: passenger.name)
  end
end

Given /^there is a flight "(.*?)" between "(.*?)" and "(.*?)" on "(.*?)"$/ do |flight_number, from, to, on_date|
  flight = Flight.new(flight_number)
  flight.add_itinerary(Itinerary.new(from, to, on_date))
  flight_list << flight
end

Given /^I search for flights between "(.*?)" and "(.*?)" on "(.*?)"$/ do |from, to, on_date|
  create_my_itinerary(from, to, on_date)
  search_flights for:  my_itinerary
end

Given /^I select the flight "(.*?)" from the search result$/ do |flight_number|
  choose_flight(flight_number)
end

When /^I book the tickets$/ do
  passenger = OpenStruct.new(name: "Arun")
  book_tickets flight: selected_flight, itinerary: my_itinerary, passenger: passenger
end

Then /^I should have my tickets booked$/ do
    my_ticket.flight_number.should eq(selected_flight.flight_number)
    my_ticket.date.should eq(my_itinerary.date)
    my_ticket.from.should eq(my_itinerary.from)
    my_ticket.to.should eq(my_itinerary.to)
    my_ticket.passenger_name.should eq("Arun")
end
