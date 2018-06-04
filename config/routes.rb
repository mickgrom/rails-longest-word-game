Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'new', to: 'game#new', as: :new
  get 'score', to: 'game#score', as: :score
end
