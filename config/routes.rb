Rails.application.routes.draw do
  root to: 'searches#index'
  post '/' => 'searches#query'
end
