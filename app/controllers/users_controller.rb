class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if user_params[:password] == user_params[:password_confirmation]
			user = User.new(user_params)
			if user.save
				session[:user_id] = user.id
				# redirect_to new_session_path
			else
				redirect_to new_user_path
			end
		else
			redirect_to "/signup"
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end

end