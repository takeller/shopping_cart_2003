require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ProductTest < Minitest::Test

  def setup
    @shopping_cart = ShoppingCart.new("King Soopers", "30items")
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @shopping_cart
  end

  def test_it_has_a_name
    assert_equal "King Soopers", @shopping_cart.name
  end

  def test_it_has_a_capacity
    assert_equal 30, @shopping_cart.capacity
  end
end
