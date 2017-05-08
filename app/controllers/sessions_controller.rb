class SessionsController < ApplicationController
    skip_before_filter :verify_authenticity_token


    def new
        render 'new'
    end
    
    def create
        user = User.find_by_email(params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:id] = user.id
            redirect_to '/'
        else
            redirect_to '/login'
        end
        
    end
    
    def destroy
        session[:id] = nil
        redirect_to '/login'
    end
end
