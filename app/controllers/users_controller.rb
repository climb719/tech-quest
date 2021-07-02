class UsersController < ApplicationController
    #skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    # def index
    #     @users_questions = current_user.categories.by_category
    #     #binding.pry
    # end

    def new
        @user = User.new
    end

    def create
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render :new
            end
        end
        #flow instatiate a new user with the params, assign to instance variable
        #check to see if saves/valid
        #if valid, log them in and redirect to show page
        #else render the new/signup page again 
 

    def show
        @user = User.find_by_id(params[:id])
        @users_questions = current_user.categories.by_category
        redirect_to '/' if !@user
        #find by id will return nil if doesn't find and find throws an error
    end



    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
        #to be able to process params correctly and tell parameters what is permitted
    end

end


