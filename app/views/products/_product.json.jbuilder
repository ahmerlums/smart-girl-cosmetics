json.extract! product, :id, :tittle, :Type, :Price, :Information, :image, :delivery_time, :created_at, :updated_at
json.url product_url(product, format: :json)