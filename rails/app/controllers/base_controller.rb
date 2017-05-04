class BaseController < ApplicationController
  before_action :permit_all_params
  before_action :load_or_create_current_user

  private
  def permit_all_params
    params.permit!
  end

  def load_or_create_current_user
    @current_user = User.find_by(token: cookies[:login_token])
    if @current_user.blank?
      @current_user = User.create
    end
    cookies[:login_token] = @current_user.token
    return @current_user
  end
end