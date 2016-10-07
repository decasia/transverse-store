class WorkSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :description

  belongs_to :author
  has_many :docs
  
  link(:self) { author_path(object.id) }
end
