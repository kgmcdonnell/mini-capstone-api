Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/products", controller: "products", action: "all_products"

  get "/perfume", controller: "products", action: "perfume"

  get "/hair_tools", controller: "products", action: "hair_tools"

  get "/foundation", controller: "products", action: "foundation"

  get "/cleanser", controller: "products", action: "cleanser"

  get "/lipstick", controller: "products", action: "lip_products"
end
