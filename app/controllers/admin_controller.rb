require 'date'

class AdminController < ApplicationController
  before_filter :authenticate
  layout 'admin'

  def index
    redirect_to admin_posts_url
  end

  protected

  def authenticate
    today_is = Date.today.strftime('%A').downcase

    authenticate_or_request_with_http_basic do |username, password|
      username == 'michael' && password == "hey today is #{today_is}"
    end
  end
end
