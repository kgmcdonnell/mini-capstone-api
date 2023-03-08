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
end
