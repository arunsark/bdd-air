require_relative '../../app/models/itinerary'

describe Itinerary do

  context "compare itineraries" do
    it "should be same if from/to/date are same" do
      it1 = Itinerary.new("Hyderabad", "Bangalore", "01/01/2012")
      it2 = Itinerary.new("Hyderabad", "Bangalore", "01/01/2012")
      it1.should eq(it2)
    end
  end
end
