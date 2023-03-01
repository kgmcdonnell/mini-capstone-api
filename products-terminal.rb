require "http"

response = HTTP.get("http://localhost:3000/products")
data = response.parse(:json)
#displaying product names
puts "Products:"
puts data[0]["name"]
puts data[1]["name"]
puts data[2]["name"]
puts data[3]["name"]
