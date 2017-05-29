Rails.application.routes.draw do

  
  resources :settlement_rules do
    resources :settlement_prices
    member do 
      put :refresh_products
      get :download
      get :upload
      post :upload
    end
  end

  resources :coupons
  resources :coupon_lists do 
    resources :order_promotions, only: [:new, :create, :edit, :update, :destroy]
    resources :promotion_rules
  end
  
  resources :user_card_charge_settings
  resources :vouchers
  resources :user_card_logs
  resources :product_items
  resources :items
  devise_for :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :workers do 
    member do 
      get :reset_password
      put :change_current_city
    end
  end
  resources :users do 
    resources :orders
    resources :user_cards do 
      member do 
        get :charge
        post :charge
      end
    end
    resources :coupons
  end
  resources :couriers
  resources :factories do 
    resources :factory_settlement_rules
    member do 
      get :settlement_detail
    end
  end

  resources :roles

  resources :categories do 
    resources :products
    member do 
      get :prices
      post :init_prices
    end
  end

  resources :prices

  resources :price_rules

  resources :stations do 
    collection do 
      get :suggestion
    end
  end

  resources :regions do 
    collection do 
      get :search
    end
  end

  resources :addresses do 
    collection do 
      get :suggestion
    end
  end
  resources :cities

  resources :orders do 
    member do 
      post :paidan
    end
  end

  resources :waybills

  resources :messages, only: [:index]

  mount ActionCable.server => '/cable' 
end
