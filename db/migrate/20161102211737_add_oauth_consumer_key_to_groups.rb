class AddOauthConsumerKeyToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :oauth_consumer_key, :string
    add_index :groups, :oauth_consumer_key
  end
end
