class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :name
      t.text :source
      t.text :content
      t.references :work

      t.timestamps
    end
  end
end
