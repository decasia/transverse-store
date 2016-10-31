class Author < ApplicationRecord
  belongs_to :group
  has_many :works, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :terms, dependent: :destroy
end
