
Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index]
  get "/healthz", to: proc { [200, { "Content-Type" => "text/plain" }, ["ok"]] }
end
