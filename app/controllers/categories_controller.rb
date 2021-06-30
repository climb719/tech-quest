class CategoriesController < ApplicationController

    def index
        @categories = Category.alphabetical
    end

 
    def show
        @category = Category.find_by(id: params[:id])
    end

   private

   def category_params
    params.require(:category).permit(:name)
   end


end
