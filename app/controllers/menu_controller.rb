class MenuController < ApplicationController
	def index
		if params[:sort] == nil
			order = 'name DESC'
		elsif params[:sort] == 'price_asc'
			order = 'price ASC'
		elsif params[:sort] == 'price_desc'
			order = 'price DESC'
		end

		if params[:section] == nil
			menuItems = MenuItem.order(order)
		else
			menuItems = MenuItem.where("section = ?", params[:section]).order(order)
		end

		if params[:search] != nil
			menuItems = menuItems.where('lower(name) LIKE ?', "%#{params[:search]}%".downcase)
		end

		@menuItems = menuItems
	end

	def show
		@menu_item = MenuItem.find(params[:id])
	end

	def order
		@menu_item = MenuItem.find(params[:id])
	end

	def order_submit
		@order = Order.create(order_params)
	end

	def order_params
    	params.require(:order).permit(:menu_item_id, :name, :phone, :address)
  	end
end
