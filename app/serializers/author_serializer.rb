class AuthorSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :description

  has_many :works do
    link(:related) {works_path(author_id: object.id)}
  end

  link(:self) { author_path(object.id) }
  # link(:works) { works_path(author_id: object.id) }

  def works
    object.works.loaded? ? object.works : object.works.none
  end
end
