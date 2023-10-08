class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :set_current_action

	private

	def set_current_action
		@current_action = controller_name + "." + action_name
	end
end
