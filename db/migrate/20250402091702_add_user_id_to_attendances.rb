class AddUserIdToAttendances < ActiveRecord::Migration[8.0]
  def change
    add_column :attendances, :user_id, :integer
  end
end
