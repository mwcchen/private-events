class RemoveAttendedEventFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendances, :attended_event, :integer
  end
end
