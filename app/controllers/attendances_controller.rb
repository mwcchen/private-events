class AttendancesController < ApplicationController

  def create
    @attendance = Attendance.new(attended_event_id: params[:event], attendee_id: session[:current_user_id])

    if @attendance.save
      redirect_to user_path(session[:current_user_id])
    else
      redirect_to events_path
    end

  end

end
