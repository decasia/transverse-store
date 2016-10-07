class WorksController < ApplicationController
  include RecordLoading

  def index_by
    :author_id
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :description, :author]
    )
  end
end
