require 'minitest/autorun'
require 'minitest/pride'
require './lib/product'

class ProductTest < Minitest::Test

  def setup
    @product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
    @product2 = Product.new(:meat, 'chicken', 4.50, '2')
  end

  def test_it_exists
    assert_instance_of Product, @product1
  end

  def test_it_has_a_category
    assert_equal :paper, @product1.category
  end

  def test_it_has_a_name
    assert_equal 'toilet paper', @product1.name
  end

  def test_it_has_a_unit_price
    assert_equal 3.70, @product1.unit_price
  end

  def test_it_has_a_quantity
    assert_equal 10, @product1.quantity
  end

  def test_it_can_get_total_price
    assert_equal 37.0, @product1.total_price
    assert_equal 9.0, @product2.total_price
  end

  def test_hoard_and_is_hoarded?
    assert_equal false, @product1.is_hoarded?
    assert_equal false, @product2.is_hoarded?

    @product1.hoard
    @product2.hoard

    assert_equal true, @product1.is_hoarded?
    assert_equal true, @product2.is_hoarded?
  end
end
