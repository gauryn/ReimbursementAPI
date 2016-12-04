class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by andrewid: params[:andrewid]
		if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
		  # redirect_to root_url, notice: "Logged in!"
		  render json: user
		else
		  # flash.now.alert = "Email or password is invalid"
		  # render "new"
		  render json: "Invalid Credentials", :status => bad_request
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out!"
	end

end
