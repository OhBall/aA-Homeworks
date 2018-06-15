class SessionsController < ApplicationController
  before_action :ensure_logged_out, only:[:new,:create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = ['Incorrect email/password']
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
