Feature: Booking Flight Tickets
  In order to confirm my travel
  As a passenger
  I need to be able to easily book my tickets


Scenario: Book a ticket
  Given there is a flight "6E-154" between "Bangalore" and "Hyderabad" on "01/12/2012"
  And I search for flights between "Bangalore" and "Hyderabad" on "01/12/2012"
  And I select the flight "6E-154" from the search result
  When I book the tickets
  Then I should have my tickets confirmed with a valid ticket number
