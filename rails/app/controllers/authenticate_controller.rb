class AuthenticateController < BaseController
  def login
    user = User.find_by(email: params[:email])
    if user.present? && user.valid?(password: params[:password])
      user.sign_in!
      cookies[:login_session] = user.session_token
    end
    redirect_to root_url
  end

  def logout
    cookies[:login_session] = nil
    redirect_to root_url
  end

  def oauth_callback
    auth = request.env["omniauth.auth"]
    account_class = (auth.provider + "_account").classify.constantize
    account = account_class.find_or_initialize_by(uid: auth.uid)
    account.authenticate_or_update!(auth)
    if account.user.present?
      #Login
      cookies[:login_session] = account.user.session_token
      redirect_to root_url
    else
      #TODO セッションに詰める
      #SingUp
      session[:user] = {}
      redirect_to new_account_url
    end
  end
end
