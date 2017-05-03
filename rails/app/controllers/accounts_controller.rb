class AccountsController < BaseController
  def new
    @user = User.new(session[:user])
  end

  def create
    User.create!(params[:user])
    redirect_to root_url
  end

  def login
  end
end
