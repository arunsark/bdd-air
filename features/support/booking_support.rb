module BookingSupport
  def flight_list
    @flight_list ||= []
  end

  def search_flights(params)
    flight_selector = FlightSelector.new(@flight_list)
    @search_results = flight_selector.search(params[:for])
  end

  def choose_flight(flight_number)
    @selected_flight = @search_results.select { |flight| flight.flight_number == flight_number }[0]
  end

  def create_my_itinerary(from, to, on_date)
    @my_itinerary = Itinerary.new(from, to, on_date)
  end

  def my_itinerary
    @my_itinerary
  end

  def selected_flight
    @selected_flight
  end

  def book_tickets(params)
    @my_ticket = ReservationSystem.book_tickets(params[:flight], params[:itinerary], params[:passenger])
  end

  def my_ticket
    @my_ticket
  end
end

World(BookingSupport)
