require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'
require './lib/shopping_cart'

class ProductTest < Minitest::Test

  def setup
    @cart = ShoppingCart.new("King Soopers", "30items")
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
    @product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
    @product4 = Product.new(:produce, 'apples', 0.99, '20')
  end

  def test_it_exists
    assert_instance_of ShoppingCart, @cart
  end

  def test_it_has_a_name
    assert_equal "King Soopers", @cart.name
  end

  def test_it_has_a_capacity
    assert_equal 30, @cart.capacity
  end

  def test_products_are_empty_by_default
    assert_equal [], @cart.products
  end

  def test_add_product
    assert_equal [], @cart.products

    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal 2, @cart.products.length
    assert_equal @product1, @cart.products[0]
    assert_equal @product2, @cart.products[1]
  end

  def test_total_number_of_products
    assert_equal 0, @cart.total_number_of_products

    @cart.add_product(@product1)
    @cart.add_product(@product2)

    assert_equal 12, @cart.total_number_of_products
  end

  def test_is_full?
    assert_equal [], @cart.products
    assert_equal false, @cart.is_full?

    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    assert_equal false, @cart.is_full?

    @cart.add_product(@product4)

    assert_equal true, @cart.is_full?
  end

  def test_cart_details
    cart_details = {name: "King Soopers", capacity: 30}
    assert_equal cart_details , @cart.details
  end

  def test_products_by_category
    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)
    @cart.add_product(@product4)

    assert_equal [@product1, @product3], @cart.products_by_category(:paper)
    assert_equal [@product4], @cart.products_by_category(:produce)
  end

  def test_percentage_occupied
    assert_equal 0, @cart.percentage_occupied

    @cart.add_product(@product1)
    @cart.add_product(@product2)
    @cart.add_product(@product3)

    assert_equal 43.33, @cart.percentage_occupied
  end
end
