class SessionsController < ApplicationController
    def new
        if(current_user != nil)
            redirect_to '/'
        end
    end
    
    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:uid] = user.id
            redirect_to '/'
        else
            redirect_to '/login'
        end
        
    end
    
    def destroy
        session[:uid] = nil
        redirect_to '/login'
    end
end
