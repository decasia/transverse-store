class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :oauth_consumer_secret

      t.timestamps
    end
  end
end
