Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'katas#index'

  get '/kata/:id' => 'katas#show', as: :kata # Se enviá al controller katas > show, y se usa as: :kata como kata_path del index.html.erb

end
