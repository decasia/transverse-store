class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :authors
  has_many :works
  has_many :docs
  has_many :notes
  has_many :terms

  # lookup function for oauth signed requests
  def self.by_oauth_key(consumer_key)
    self.find_by(oauth_consumer_key: consumer_key)
  end
end
