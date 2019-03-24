class Ticket
  attr_reader :fare, :stampted_at

  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    @stampted_at = name
  end
end
