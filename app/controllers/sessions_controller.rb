class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in

    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create #loggining in normal way
        #find user - not creating or updatinf user, don't need instance variable 
        user = User.find_by(email: params[:user][:email])
        #check if find the user AND passowrd valid
        if user && user.authenticate(params[:user][:password])
        #set the session
        session[:user_id] = user.id
        redirect_to user_path(user) #/users/#{user.if}
        #else redirect to login vs. rendering so nothing prepopulats and form clears completely and does give any info about what part was wrong 
        else
        flash[:massage] = "Oops, looks like your login info is incorrect. Please try again."
        redirect_to "/login"
        end
    end

    def omniauth
       #binding.pry
        # method for logging in only with omniauth
        # find or create users - using attributes  from auth/response from 3rd party
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
            u.name= auth["info"]["first_name"]
            u.password= SecureRandom.hex(17) #ruby module -assign a random password
        # password needs to be assigned because macro has_secure_password validates for presence of passowrd
        # validates that met requierments to be an object 
        # #find or create by to find the user with that email or create them, but want to try to find by parameters
        # #create with additional parameters
        # #pass in block tht are only used by create by
        # #find by whats passed in or create by whats passed in PLUS what is in do bloack
        # #before going to 3rd party need to escape app
         end
    #check if the registered correctly, make sure the user saves and thne log in
        if @user.save
                session[:user_id] = @user.id #logs them in 
                redirect_to user_path(@user)
        else
            flash[:message] = "Something went wrong"
            redirect_to '/'
    # #log them in 
        end
    end

    private 

     def auth #private method not to have to rewrite many times, vccan use like a has 
        request.env['omniauth.auth']
     end


end
