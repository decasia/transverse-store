class DocVersion < ApplicationRecord
  belongs_to :doc
  belongs_to :user
  belongs_to :group

  serialize :content, JSON
end
