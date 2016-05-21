Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :stores
  end

  namespace :admin do
    resources :orders, :controller => 'orders' do
      member do
        get :json_from_api
      end
    end
  end
end
