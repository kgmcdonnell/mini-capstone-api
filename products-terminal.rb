require "http"

response = HTTP.get("http://localhost:3000/products")
data = response.parse(:json)

while true
  #displaying producta
  puts "----------------------------------"
  puts "Products:"
  puts "1. #{data[0]["name"]}"
  puts "2. #{data[1]["name"]}"
  puts "3. #{data[2]["name"]}"
  puts "4. #{data[3]["name"]}"
  puts "5. #{data[4]["name"]}"
  puts "----------------------------------"

  #ask the user what product they would like more information on
  puts "Would you like to see more information about a product? (Y/N)"
  response = gets.chomp
  if response.downcase == "y"
    puts "Enter Product Number: "
    product_id = gets.chomp
    if product_id.to_i > 5
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
