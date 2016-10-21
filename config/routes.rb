Rails.application.routes.draw do
  scope 'api' do
    resources :notes
    resources :docs
    resources :terms
    resources :authors
    resources :works
  end

  scope 'auth' do
    post 'password', to: 'authentication#password'
    post 'lti', to: 'authentication#lti'
  end

end
