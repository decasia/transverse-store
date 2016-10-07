class AuthorSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :description

  has_many :works

  link(:self) { author_path(object.id) }
  link(:works) { works_path(author_id: object.id) }
end
