class SessionsController < ApplicationController
	before_action :authorize

	def create
		@user = User.find_by(firebase_uid: params[:firebase_uid])
		if authorize != nil
			session[:firebase_uid] = params[:firebase_uid]

			# update all user attributes
			@user.update(
				firebase_access_token: params[:firebase_access_token],
				firebase_client_version: params[:firebase_client_version],
				firebase_display_name: params[:firebase_display_name],
				firebase_email: params[:firebase_email],
				firebase_email_verified: params[:firebase_email_verified],
				firebase_is_anonymous: params[:firebase_is_anonymous],
				firebase_metadata_creationTime: params[:firebase_metadata_creationTime],
				firebase_metadata_lastSignInTime:
					params[:firebase_metadata_lastSignInTime],
				firebase_phone_number: params[:firebase_phone_number],
				firebase_photo: params[:firebase_photo],
				firebase_provider_id: params[:firebase_provider_id],
				firebase_tenant_id: params[:firebase_tenant_id],
			)

			render json: @user, status: :created
		else
			render json: { status: 500, message: 'User not found' }
		end
	end

	def destroy
		session.delete(:firebase_uid)
		head :no_content
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
		)
	end
end
