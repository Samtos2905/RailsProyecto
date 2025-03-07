require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = Product.create(name: "Test Product", price: 100, description: "Test Description", stock: 10, weight: 2, origin: "Test Origin")
  end

  test "should update price" do
    @product.update_price(150)
    assert_equal 150, @product.price
  end

  test "should update description" do
    @product.update_description("New Description")
    assert_equal "New Description", @product.description
  end

  test "should increase stock" do
    result = @product.increase_stock(5)
    assert_equal 15, @product.stock
    assert_equal "Stock incrementado en 5. Nuevo stock: 15.", result
  end

  test "should not increase stock with negative amount" do
    result = @product.increase_stock(-5)
    assert_equal "La cantidad debe ser positiva.", result
  end

  test "should decrease stock" do
    result = @product.decrease_stock(5)
    assert_equal 5, @product.stock
    assert_equal "Stock reducido en 5. Nuevo stock: 5.", result
  end

  test "should not decrease stock with negative amount" do
    result = @product.decrease_stock(-5)
    assert_equal "La cantidad debe ser positiva.", result
  end

  test "should not decrease stock below zero" do
    result = @product.decrease_stock(15)
    assert_equal "No hay suficiente stock disponible.", result
  end

  test "should mark product as out of stock" do
    @product.decrease_stock(10)
    assert_equal 0, @product.stock
    assert_equal "El producto 'Test Product' está agotado.", @product.mark_as_out_of_stock
  end

  test "should calculate total weight" do
    assert_equal 20, @product.total_weight(10)
  end

  test "should update origin" do
    @product.update_origin("New Origin")
    assert_equal "New Origin", @product.origin
  end

  test "should apply discount" do
    @product.apply_discount(10)
    assert_equal 90, @product.price
  end
end