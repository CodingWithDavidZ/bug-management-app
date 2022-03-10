class ApplicationController < ActionController::Base
	include ActionController::Cookies

	rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

	before_action :authorize

	private

	def authorize
		if FirebaseIdToken::Certificates.present? == true
			validate_user =
				FirebaseIdToken::Signature.verify(params[:firebase_access_token])
			return validate_user
		elsif FirebaseIdToken::Certificates.present? == false
			FirebaseIdToken::Certificates.request!
			validate_user =
				FirebaseIdToken::Signature.verify(params[:firebase_access_token])
			return validate_user
		end
	end

	def auth_params
		params.permit(:firebase_access_token)
	end
end
