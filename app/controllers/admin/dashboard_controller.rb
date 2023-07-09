class Admin::BaseController < ApplicationController
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.configuration.http_authenticate[0] && password == Rails.configuration.http_authenticate[1]
    end
  end
end
