class Itinerary
  attr_accessor :from, :to, :date
  def initialize(from, to, date)
    @from = from
    @to = to
    @date = date
  end

  def ==(another_object)
    self.from == another_object.from && self.to == another_object.to && self.date == another_object.date
  end
end
