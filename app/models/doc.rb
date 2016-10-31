class Doc < ApplicationRecord
  belongs_to :work
  belongs_to :group

  serialize :content, JSON
end
