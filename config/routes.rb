Rails.application.routes.draw do

  scope 'api' do
    resources :notes
    resources :docs
    resources :terms
    resources :authors
    resources :works
    resources :users
  end

  scope 'auth' do
    post 'user_token' => 'user_token#create'
    post 'lti', to: 'authentication#lti'
    post 'change_group', to: 'authentication#change_group'
  end

end
