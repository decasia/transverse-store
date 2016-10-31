class Work < ApplicationRecord
  belongs_to :group
  belongs_to :author
  has_many :docs, dependent: :destroy
end
