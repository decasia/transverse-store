class ChangeNoteForeignKey < ActiveRecord::Migration[5.0]
  def change
    rename_column :notes, :work_id, :author_id
  end
end
