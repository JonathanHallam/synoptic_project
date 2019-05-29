Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#home'

  get '/user' => 'user#validate_card'
  get '/user/pin' => 'user#get-pin'
  get '/user/validate-pin' => 'user#validate_pin'
  get '/user/register' => 'user#register'
  get '/user/register-details' => 'user#register_details'

  get '/session' => 'session#home'
  get '/session/top-up' => 'session#top_up'
end
