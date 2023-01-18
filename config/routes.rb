Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/one_product/:id", controller: "products", action: "one_product"
  get "/all_products", controller: "products", action: "all_products"
  get "/second_product/", controller: "products", action: "second_product"
  get "/third_product/", controller: "products", action: "third_product"
end
