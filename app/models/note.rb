class Note < ApplicationRecord
  belongs_to :author

  serialize :content, JSON
  serialize :source, JSON
end
