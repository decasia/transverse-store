class NoteSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :content,
    :source

  belongs_to :author

  link(:self) { note_path(object.id) }
  link(:author) { author_path(object.author_id) }
end
