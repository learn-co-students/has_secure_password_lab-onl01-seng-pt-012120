class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to '/users/home'
        else
            redirect_to '/users/new'
        end
    end
    
    def home
        @user = current_user
    end

    private

        def current_user
            User.find(session[:user_id])
        end

        def user_params
            params.require(:user).permit(:name,:password,:password_confirmation)
        end


end