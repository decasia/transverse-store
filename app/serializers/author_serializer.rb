class AuthorSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :description

  has_many :works
  has_many :terms
  has_many :notes

  link(:self) { author_path(object.id) }
  link(:works) { works_path(author_id: object.id) }
  link(:terms) { terms_path(author_id: object.id) }
  link(:notes) { notes_path(author_id: object.id) }
end
