class AddInstructorFlagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_instructor, :boolean, default: false
  end
end
