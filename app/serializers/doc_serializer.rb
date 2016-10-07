class DocSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :content

  def content
    object.content.as_json
  end

  belongs_to :work

  link(:self) { doc_path(object.id) }
  # link(:work) { work_path(object.work_id) }
end
