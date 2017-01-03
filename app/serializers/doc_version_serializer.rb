class DocVersionSerializer < ActiveModel::Serializer
  attributes :id,
    :content,
    :created_at,
    :user_id

  def content
    object.content.as_json
  end

  belongs_to :doc

  link(:self) { doc_version_path(object.id) }
end
