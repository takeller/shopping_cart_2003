class ShoppingCart

  attr_reader :name, :capacity, :products, :total_number_of_products, :details
  def initialize(name, capacity)
    @name = name
    @capacity = capacity[0..1].to_i
    @products = []
    @total_number_of_products = 0
    @details = {name: @name, capacity: @capacity}
  end

  def add_product(product)
    @products << product
    @total_number_of_products += product.quantity
  end

  def is_full?
    @total_number_of_products >= @capacity
  end

  # Solution using each
  # def products_by_category(category)
  #   products_in_category = []
  #   @products.each do |product|
  #     if product.category == category
  #       products_in_category << product
  #     end
  #   end
  #   products_in_category
  # end

  # Refactor using .find_all enumerable... Way easier
  def products_by_category(category)
    products_in_category = @products.find_all { |product| product.category == category}
  end

  def percentage_occupied
    (@total_number_of_products.to_f/@capacity.to_f * 100).round(2)
  end
end
