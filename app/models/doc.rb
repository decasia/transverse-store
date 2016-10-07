class Doc < ApplicationRecord
  belongs_to :work

  serialize :content, JSON
end
