class TermSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :example,
    :definition,
    :discussion

  belongs_to :author

  link(:self) { note_path(object.id) }
  link(:author) { author_path(object.author_id) }
end
