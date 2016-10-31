class Note < ApplicationRecord
  belongs_to :group
  belongs_to :author

  serialize :content, JSON
  serialize :source, JSON
end
