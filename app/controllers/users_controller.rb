class UsersController < ApplicationController
	before_action :authorize, only: %i[show edit update destroy]

	# GET /users or /users.json
	def index
		@users = User.all
	end

	# POST /users or /users.json
	def create
		user = User.create!(user_params)
		session[:user_id] = user.id
		render json: user, status: :created
	end

	# DELETE /users/1 or /users/1.json
	def destroy
		@user.destroy
		render json: { status: 200, message: 'User was successfully destroyed.' }
	end

	private

	# Only allow a list of trusted parameters through.
	def user_params
		params
			.require(:user)
			.permit(
				:id,
				:firebase_uid,
				:username,
				:first_name,
				:last_name,
				:role,
				:team_id,
				:is_team_lead,
				:avatar,
				:firebase_access_token,
				:firebase_phone_number,
				:firebase_email,
				:firebase_email_verified,
				:firebase_provider_id,
				:firebase_display_name,
				:firebase_is_anonymous,
				:firebase_metadata_creationTime,
				:firebase_metadata_lastSignInTime,
				:firebase_client_version,
				:firebase_photo,
				:firebase_tenant_id,
			)
	end
end
