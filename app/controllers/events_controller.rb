class EventsController < ApplicationController

  before_action :require_login

  def new
    @event = Event.new
  end

  def create
    current_user = User.find_by("id", session[:current_user_id])
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
  end

  def require_login
    if session[:current_user_id] == nil
      redirect_to new_session_url
    end
  end

  private

  def event_params
    params.require(:event).permit(:description)
  end

end
