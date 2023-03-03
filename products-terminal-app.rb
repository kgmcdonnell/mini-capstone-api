require "http"

response = HTTP.get("http://localhost:3000/products.json")
data = response.parse(:json)

while true
  #displaying products
  puts "--------------------------------------------------------------"
  puts "Products:"
  index = 0
  while index < data.length
    puts "#{data[index]["id"]}. #{data[index]["name"]}"
    index = index + 1
  end
  puts "--------------------------------------------------------------"
  #ask the user what product they would like more information on
  puts "[C]reate [R]ead [U]pdate [D]elete [Q]uit "
  user_input = gets.chomp
  if user_input.downcase == "r" || user_input == "u" || user_input == "d"
    puts "Enter Product Number: "
    product_id = gets.chomp
    # index = 0
    # id_exists = false
    # while index < data.length
    #   if data[index]["id"] == product_id.to_i
    #     id_exists = true
    #   end
    #   index += 1
    # end
    # if id_exists != true
    #   puts "Invalid response. Try again."
    # end
  end
  if user_input.downcase == "r"
    puts HTTP.get("http://localhost:3000/products/#{product_id}")
    sleep(30)
  elsif user_input.downcase == "c"
    puts "Name: "
    name_input = gets.chomp
    puts "Price: "
    price_input = gets.chomp
    puts "image_url: "
    image_url_input = gets.chomp
    puts "Description: "
    description_input = gets.chomp
    HTTP.post("http://localhost:3000/products.json", :json => { :name => name_input, :price => price_input, :image_url => image_url_input, :description => description_input })
  elsif user_input.downcase == "u"
    # HTTP.patch("http://localhost:3000/products.json/#{product_id}", :json => { :price => 200 })
  elsif user_input.downcase == "q"
    puts "Goodbye!"
    break
  else
    puts "Invalid response. Try again"
  end
end
