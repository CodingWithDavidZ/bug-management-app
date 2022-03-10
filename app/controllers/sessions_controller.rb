class SessionsController < ApplicationController
	before_action :authorize

	def create
		user = User.find_by(firebase_uid: params[:firebase_uid])
		if authorize /= nil
			session[:firebase_uid] = user.firebase_uid
			render json: user
		else
			render json: { status: 401, message: 'You are not logged in' }
		end
		render json: { status: 200, message: 'You are logged in' }
	end
end
