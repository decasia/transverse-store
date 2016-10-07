class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :name
      t.jsonb :example
      t.jsonb :definition
      t.jsonb :discussion
      t.references :author

      t.timestamps
    end
  end
end
