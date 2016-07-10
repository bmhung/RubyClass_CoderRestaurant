Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  get 'contact_us/index'

  resource :menu do
  	get 'index', to: 'menu#index'
  	get '/:id', to: 'menu#show', as: 'item'
  	get 'order/:id', to: 'menu#order', as: 'order'
  	post 'order_submit', to: 'menu#order_submit', as: 'submit_order'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
