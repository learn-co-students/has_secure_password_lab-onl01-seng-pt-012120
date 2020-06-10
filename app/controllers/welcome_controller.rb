class WelcomeController < ApplicationController
    def new
        @user = User.find_by(session[:id])
    end
end