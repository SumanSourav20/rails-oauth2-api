class ApiController < ApplicationController
    before_action :doorkeeper_authorize!

    skip_before_action :verify_authenticity_token

    respond_to :json

    def current_user
        @current_user ||= user.find_by(id: doorkeeper_token[:resource_owner_id])
    end

end