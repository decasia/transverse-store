class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :name
      t.text :example
      t.text :definition
      t.text :discussion
      t.references :author

      t.timestamps
    end
  end
end
