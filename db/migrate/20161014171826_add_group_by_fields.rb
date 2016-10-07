class AddGroupByFields < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :group_id, :integer
    add_column :docs, :group_id, :integer
    add_column :notes, :group_id, :integer
    add_column :terms, :group_id, :integer
    add_column :works, :group_id, :integer

    add_index :authors, :group_id
    add_index :docs, :group_id
    add_index :notes, :group_id
    add_index :terms, :group_id
    add_index :works, :group_id
  end
end
