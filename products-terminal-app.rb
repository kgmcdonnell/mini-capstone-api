require "http"

response = HTTP.get("http://localhost:3000/products")
data = response.parse(:json)

while true
  #displaying producta
  puts "--------------------------------------------------------------"
  puts "Products:"
  index = 0
  while index < data.length
    puts "#{data[index]["id"]}. #{data[index]["name"]}"
    index = index + 1
  end
  puts "--------------------------------------------------------------"
  #ask the user what product they would like more information on
  puts "Would you like to see more information about a product? (Y/N)"
  response = gets.chomp
  if response.downcase == "y"
    puts "Enter Product Number: "
    product_id = gets.chomp
    if product_id.to_i > data.length
      puts "Invalid response. Try again."
    else
      puts data[product_id.to_i - 1]
      sleep(30)
    end
  elsif response.downcase == "n"
    puts "Goodbye!"
    break
  else
    puts "Invalid response. Try again"
  end
end
