class ApplicationController < ActionController::Base
	include ActionController::Cookies

	skip_before_action :verify_authenticity_token
	rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
	before_action :authorize

	private

	def authorize
		@current_user = User.find_by(id: session[:user_id])
		unless @current_user
			render json: { errors: ['Not Authorized'] }, status: :unauthorized
		end
	end

	def render_unprocessable_entity(exceptions)
		render json: {
				errors: exceptions.record.errors.full_messages,
		       },
		       status: :unprocessable_entity
	end
end
