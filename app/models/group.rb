class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :authors
  has_many :works
  has_many :docs
  has_many :notes
  has_many :terms
end
