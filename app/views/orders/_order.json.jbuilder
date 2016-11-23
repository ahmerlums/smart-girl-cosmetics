json.extract! order, :id, :productID, :customerID, :status, :dateOrdered, :quantity, :created_at, :updated_at
json.url order_url(order, format: :json)