Rails.application.routes.draw do

  #displays all products
  get "/products" => "products#index"
  #displays a product
  get "/products/:id" => "products#show"
  #creates a product
  post "/products" => "products#create"
  #updates a product
  patch "/products/:id" => "products#update"
  #deletes a product
  delete "/products/:id" => "products#destroy"

  #displays all suppliers
  get "/suppliers" => "suppliers#index"
  #create a supplier
  post "/suppliers" => "suppliers#create"
  #delete a supplier
  delete "/suppliers/:id" => "suppliers#destroy"
  #updates a supplier
  patch "/suppliers/:id" => "suppliers#update"

  #create users
  post "/users" => "users#create"

  #create session for jwt
  post "/sessions" => "sessions#create"

  #create orders
  post "/orders" => "orders#create"

  #show orders
  get "/orders/:id" => "orders#show"

  #display all orders
  get "/orders" => "orders#index"

  # add item to your shopping cart
  post "/carted_products" => "carted_products#create"

  # display all carted_products
  get "/carted_products" => "carted_products#index"
end
