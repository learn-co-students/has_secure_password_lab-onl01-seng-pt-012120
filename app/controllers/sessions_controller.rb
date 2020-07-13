class SessionsController < ApplicationController
    def new

    end
    
    def create
        @user = User.find_by(params[:name])
        r = BCrypt::Password.create "M4heswaran"
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to "/"
        else
            return head(:forbidden)
        end
    end

    private
end
