class UsersController < ApplicationController
  before_filter :correct_user, only: [:show, :edit, :update]
  helper_method :sort_column, :sort_direction

	def show
		@user = User.find(params[:id])
		@property = @user.properties.order(sort_column + " " + sort_direction)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			NotificationsMailer.registration_confirmation(@user).deliver
			sign_in @user
  		flash[:success] = "Welcome to HomeNotes!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	    if @user.update_attributes(params[:user])
	      flash[:success] = "Profile updated"
	      sign_in @user
	      redirect_to @user
	    else
	      render 'edit'
    	end
	end

	def resetpass
		@user = User.find_by_email(params[:email])
		new_password = "54321"
		@user.update_attribute(:name, new_password)
	end
	
	private

		def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_path) unless current_user?(@user)
	    end

	    def sort_column
	    	Property.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
	  	end
  
		def sort_direction
		  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end

    

end
