Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products", controller: "products", action: "index"
  get "/products/:id", controller: "products", action: "show"
  post "/products", controller: "products", action: "create"
  patch "/products/:id", controller: "products", action: "update"
  delete "/products/:id", controller: "products", action: "destroy"

  post "/orders", controller: "orders", action: "create"
  get "/orders/:id", controller: "orders", action: "show"
  get "/orders", controller: "orders", action: "index"

  post "/carted_products", controller: "carted_products", action: "create"

  #signup
  post "/users" => "users#create"
  #login
  post "/sessions" => "sessions#create"
end
