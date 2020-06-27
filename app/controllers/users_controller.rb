class UsersController < ApplicationController

    def home
       if session[:user_id]
            @user = User.find(session[:user_id])
       else
            redirect_to "/signup"
       end
    end
    
    def new
    end

    def create
        if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:name] != "" && params[:user][:password] != ""
            user = User.create(user_params)
            session[:user_id] = user.id
        else
            redirect_to "/signup"
        end
    end

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
    
end