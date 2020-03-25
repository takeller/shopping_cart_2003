class ShoppingCart

  attr_reader :name, :capacity, :products, :total_number_of_prodcuts
  def initialize(name, capacity)
    @name = name
    @capacity = capacity[0..1].to_i
    @products = []
    @total_number_of_prodcuts = 0
  end

  def add_product(product)
    @products << product
    @total_number_of_prodcuts += product.quantity
  end

  def is_full?
    @total_number_of_prodcuts >= @capacity
  end
end
