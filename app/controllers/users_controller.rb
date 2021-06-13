class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        binding.pry
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
        #to be able to process params correctly and tell parameters what is permitted
    end
end


