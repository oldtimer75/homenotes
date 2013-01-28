class ChecklistsController < ApplicationController
		
	def new
		@checklist = Checklist.new
	end

	def create
		@checklist = current_user.checkilists.build(params[:checklist])
		if @checklist.save
			flash[:success] = "Item added!"
			redirect_to property_path
		else
			render checklist_path
		end
	end

	def show
	end

	def edit
		@property = Property.find(params[:id])
		@user = @property.user_id
 	end

	def update
	    if @checklist.update_attributes(params[:checklist])
	      flash[:success] = "Item updated."
	      redirect_to checklist_path
	    else
	      render checklist_path
	    end
	end

	def destroy
		@checklist.destroy
		flash[:success] = "Item deleted from all checklists."
		redirect_to checklist_path
	end
end
