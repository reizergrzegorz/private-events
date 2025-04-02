class AddEventIdToAttendances < ActiveRecord::Migration[8.0]
  def change
    add_column :attendances, :event_id, :integer
  end
end
