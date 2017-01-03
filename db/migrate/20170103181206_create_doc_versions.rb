class CreateDocVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :doc_versions do |t|
      t.references :doc
      t.references :user
      t.references :group
      t.text :content
      t.timestamps
    end
  end
end
