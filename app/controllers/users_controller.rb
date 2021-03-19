class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end

  end

  def show
    @user = User.find(session[:current_user_id])
  end

  def require_login
    if session[:current_user_id] == nil
      redirect_to new_session_url
    end
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end

end
