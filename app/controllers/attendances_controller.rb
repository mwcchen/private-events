class AttendancesController < ApplicationController

  before_action :require_login

  def create
    @attendance = Attendance.new(attended_event_id: params[:event], attendee_id: session[:current_user_id])

    if @attendance.save
      redirect_to user_path(session[:current_user_id])
    else
      redirect_to events_path
    end
  end

  def require_login
    if session[:current_user_id] == nil
      redirect_to new_session_path
    end
  end

end
