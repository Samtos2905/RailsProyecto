class Product < ApplicationRecord
  # 1. Actualizar el precio del producto
  def update_price(new_price)
    self.update(price: new_price)
  end

  # 2. Actualizar la descripción del producto
  def update_description(new_description)
    self.update(description: new_description)
  end

  # 3. Aumentar el stock
  def increase_stock(amount)
    return "La cantidad debe ser positiva." if amount <= 0
    self.update(stock: self.stock + amount)
    "Stock incrementado en #{amount}. Nuevo stock: #{self.stock}."
  end

  # 4. Disminuir el stock, asegurando que no sea negativo
  def decrease_stock(amount)
    return "La cantidad debe ser positiva." if amount <= 0
    if self.stock - amount < 0
      return "No hay suficiente stock disponible."
    end
    self.update(stock: self.stock - amount)
    mark_as_out_of_stock if self.stock == 0
    "Stock reducido en #{amount}. Nuevo stock: #{self.stock}."
  end

  # 5. Calcular el peso total si se compran múltiples unidades
  def total_weight(quantity)
    self.weight * quantity
  end

  # 6. Actualizar el origen del producto
  def update_origin(new_origin)
    self.update(origin: new_origin)
  end

  # 7. Marcar un producto como agotado si el stock llega a 0
  def mark_as_out_of_stock
    if self.stock <= 0
      self.update(stock: 0)
      Rails.logger.info "Producto agotado: #{self.name}" # Registra en logs
      return "El producto '#{self.name}' está agotado."
    end
    "Stock actualizado correctamente."
  end

  # 8. Aplicar un descuento al precio en porcentaje
  def apply_discount(percentage)
    new_price = self.price - (self.price * percentage / 100)
    self.update(price: new_price)
  end

end
