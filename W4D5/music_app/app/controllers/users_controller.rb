class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    user = User.find(params[:id])
    render plain: user.email
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
