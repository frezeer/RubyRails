Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get  "/bienvenida" , to: "home#index"  
  get  "article/new" , to: "article#new"
  post "articles",     to: "article#create"
end
