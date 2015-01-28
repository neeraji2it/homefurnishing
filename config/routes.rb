Furnitureapp::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  devise_for :users, :controllers => {:sessions => "sessions"}
  namespace :admin do
    resources :orders do
      collection do
        get :guest_orders
        get :user_orders
      end
    end
    resources :banners
    resources :products do
      member do
        delete :delete_img
        put :image_show
        get :flag
      end
    end
    resources :categories do
      member do
        get :category_show
      end
    end
    resources :dashboards do
      collection do 
        get :view_graph
      end
    end
    resources :users
    resources :news_letters
    resources :profiles do
      collection do 
        get :setting
        put :update_setting
        get :edit_passcode
        put :update_passcode
      end
    end
    resources :stocks
  end
  resources :welcome 
  resources :profiles do
    member do
      put :update_profile
      put :change_password
    end
  end
  resources :homes do
    collection do
      get :offers
      get :how_to_buy
      get :faq
      get :payment
      get :shipment
      get :terms
      get :return_policy
      get :search
      get :new_news_letter
      post :post_news_letter
    end
    member do
      get :single_product
    end
  end 
  resources :line_items
  resources :carts
  resources :orders do
    member do
      get :confirm
      get :confirm_myorder
      match :cancel_order, via: [:get, :put]
    end
    collection do 
      get :myorder
      get :checkout_information
    end
  end
  root 'homes#index'
end