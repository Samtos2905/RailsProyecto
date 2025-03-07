json.extract! product, :id, :name, :description, :price, :brand, :stock, :weight, :origin, :created_at, :updated_at
json.url product_url(product, format: :json)
