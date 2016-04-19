class CategoriesController < ApplicationController

	def index
		@categories = Category.page 1
		if request.xhr?
	    @categories = Category.page params[:page]
			render :partial => 'categories/category', :local => @categories  # respond to Ajax request
		end
	end

	def show
		@category = Category.includes(:trolls).find(params[:id])
		@trolls = @category.trolls.page 1
		if request.xhr?
			@trolls = @category.trolls.page params[:page]
			render :partial => 'trolls/troll', :local => @trolls  # respond to Ajax request
		end
	end

end