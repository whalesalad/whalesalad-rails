class AdminController < ApplicationController
  before_filter :authenticate if Rails.env.production?

  def index
    redirect_to admin_posts_url
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == 'michael' && password == "hardwell"
    end
  end
end
