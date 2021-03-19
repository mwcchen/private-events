class SessionsController < ApplicationController

  def new
    # reset_session
  end

  def create
    @user = User.find_by_name(params[:name])
    if @user
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end


end
