module Admin
  class DashboardController < ApplicationController
    before_action :basic_auth

    def show
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == Rails.configuration.x.basic_auth_username && password == Rails.configuration.x.basic_auth_password
      end
    end    
  end
end
