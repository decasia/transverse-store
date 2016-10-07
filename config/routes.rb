Rails.application.routes.draw do
  scope 'api' do
    resources :notes
    resources :docs
    resources :terms
    resources :authors
    resources :works
  end
end
