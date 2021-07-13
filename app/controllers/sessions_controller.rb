class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in

    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create 
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user) 
        else
        flash[:massage] = "Oops, looks like your login info is incorrect. Please try again."
        redirect_to "/login"
        end
    end

    def omniauth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
            u.name= auth["info"]["first_name"]
            u.password= SecureRandom.hex(17) 
         end
        if @user.save
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
        else
            flash[:message] = "Something went wrong"
            redirect_to '/'
        end
    end

    private 

     def auth 
        request.env['omniauth.auth']
     end
    
end