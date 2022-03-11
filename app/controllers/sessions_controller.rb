class SessionsController < ApplicationController
	before_action :authorize

	def create
		user = User.find_by(firebase_uid: params[:firebase_uid])
		if authorize /= nil
			session[:firebase_uid] = user.firebase_uid
			user.update!(login_params, except: [:firebase_uid])
			render json: user
		else
			render json: { status: 401, message: 'You are not logged in' }
		end
		render json: { status: 200, message: 'You are logged in' }
	end

	def destroy
		session.delete(:firebase_uid)
		head :no_content
	end

	def test
		render json: { status: 200, message: 'Test Successful' }
	end

	private

	def login_params
		params.permit(
			:firebase_uid,
			:firebase_access_token,
			:firebase_client_version,
			:firebase_display_name,
			:firebase_email,
			:firebase_email_verified,
			:firebase_is_anonymous,
			:firebase_metadata_creationTime,
			:firebase_metadata_lastSignInTime,
			:firebase_phone_number,
			:firebase_photo,
			:firebase_provider_id,
			:firebase_tenant_id,
			:firebase_uid,
			:firebase_access_token,
			:firebase_client_version,
			:firebase_display_name,
			:firebase_email,
			:firebase_email_verified,
			:firebase_is_anonymous,
			:firebase_metadata_creationTime,
			:firebase_metadata_lastSignInTime,
			:firebase_phone_number,
			:firebase_photo,
			:firebase_provider_id,
			:firebase_tenant_id,
			:firebase_uid,
		)
	end
end
