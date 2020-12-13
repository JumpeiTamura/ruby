require_relative '../framework/factory'

class CarFactory < Factory
  def initialize
    @products_info = {}
    @current_lot_number = 0
  end

  def create_product(owner)
    @current_lot_number += 1
    Car.new(owner, @current_lot_number)
  end

  def register_product(product)
    @products_info.merge!(product.get_info)
  end

  def get_products_info
    @products_info
  end
end
