class AddLmsContextToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lms_context_title, :string
  end
end
