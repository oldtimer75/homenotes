class ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def create
		@item = current_user.items.build(params[:item])
		if @item.save
			flash[:success] = "Checklist item added!"
			redirect_to session[:return_to]
		else
			render 'new'
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		flash[:success] = "Checklist item deleted."
		redirect_to additem_path
	end

end