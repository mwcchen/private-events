class EventsController < ApplicationController

  before_action :require_login, except: [:index, :show]

  def new
    @event = Event.new
  end

  def create
    current_user = User.find_by("id", session[:current_user_id])
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    # @past_events = []
    # @upcoming_events = []
    # Event.all.each do |event|
    #   if event.date < Date.today
    #     @past_events << event
    #   else
    #     @upcoming_events << event
    #   end
    # end
  end

  def require_login
    if session[:current_user_id] == nil
      redirect_to new_session_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end

end
