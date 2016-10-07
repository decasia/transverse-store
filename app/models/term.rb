class Term < ApplicationRecord
  belongs_to :author

  serialize :example, JSON
  serialize :definition, JSON
  serialize :discussion, JSON
end
