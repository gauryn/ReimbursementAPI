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
		  logged_in = false
		  render json: logged_in, status: 400
		end
	end

	def destroy
		session[:user_id] = nil
		logged_out = true
		render json: logged_out, status: 200
	end

end
