Rails.application.routes.draw do
  get 'wallet/mywa'
  get 'wallet/coupon'
  get 'wallet/vip'
  get 'wallet/card'

  resources :orders
  resources :membercards
  get 'personal/profile'

  get 'personal/address'

  get 'goods/list'

  get 'goods/buy'
  get 'goods/detail'
  get 'goods/orders'
  get 'goods/pay'
  get 'home/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
