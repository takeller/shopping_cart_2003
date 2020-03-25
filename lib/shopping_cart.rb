class ShoppingCart

  attr_reader :name, :capacity
  def initialize(name, capacity)
    @name = name
    @capacity = capacity[0..1].to_i
  end
end
