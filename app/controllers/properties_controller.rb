class PropertiesController < ApplicationController
	before_filter :correct_user, only: [:show, :edit, :update, :destroy]
	helper_method :sort_column, :sort_direction

	def new
		@property = Property.new
	end

	def create
		@property = current_user.properties.build(params[:property])
		if @property.save
			flash.now[:success] = "Property added!"
			render 'show'
		else
			render 'new'
		end
	end

	def show
		@property = Property.find(params[:id])
		@user = @property.user_id
	end

	def edit
 	end

	def update
	    if @property.update_attributes(params[:property])
	      flash[:success] = "Property updated."
	      redirect_to property_path
	    else
	      render 'edit'
	    end
	end

	def destroy
		@property.destroy
		flash[:success] = "Property deleted."
		redirect_to user_path(current_user)
	end


	private

		def correct_user
	      @property = Property.find(params[:id])
		  @user = User.find(@property.user_id)
	      redirect_to(root_path) unless current_user?(@user)
	    end
  
end
