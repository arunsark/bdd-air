Feature: Searching flights
  In order to choose the appropriate flight
  As a user
  I need to be able to easily search and get the list of flights

  Scenario: should list the relevant flights
    Given there are flights between "Bangalore" and "Delhi"
    When I search for flights between "Bangalore" and "Delhi"
    Then all the flights between "Bangalore" and "Delhi" should be retrieved
