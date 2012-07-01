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

When /^I select the seat "(.*?)" and book the tickets$/ do |seat_number|
  passenger_details = OpenStruct.new(name: "Arun", seat: seat_number)
  book_tickets flight: selected_flight, itinerary: my_itinerary, passenger_details: passenger_details
end

Then /^I should have my tickets booked$/ do
    my_ticket.flight_number.should eq(selected_flight.flight_number)
    my_ticket.date.should eq(my_itinerary.date)
    my_ticket.from.should eq(my_itinerary.from)
    my_ticket.to.should eq(my_itinerary.to)
    my_ticket.passenger_name.should eq("Arun")
end
