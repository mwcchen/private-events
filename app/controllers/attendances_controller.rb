class AttendancesController < ApplicationController

  def create
    @event = Event.find(params[:event])
    current_user = User.find(session[:current_user_id])
    @attendance = Attendance.new(attended_event_id: params[:event], attendee_id: session[:current_user_id])
    if @attendance.save
      redirect_to current_user
    else
      redirect_to events_path
    end

  end

end
