class CreateDocs < ActiveRecord::Migration[5.0]
  def change
    create_table :docs do |t|
      t.string :name
      t.text :content
      t.references :work

      t.timestamps
    end
  end
end
