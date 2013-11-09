class UserController < ApplicationController

	def login
		#Send the json
		# House.
		render :status => 200, :json => {:token=> current_user.authentication_token ,:json => ""}
	end

	def signup
		render json: true
	end


end
