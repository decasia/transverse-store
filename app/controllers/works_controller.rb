class WorksController < ApplicationController
  include RecordLoading

  before_action :authenticate_user
  load_and_authorize_resource :work, instance_name: :record

  def index_by
    :author_id
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :description, :author]
    )
  end
end
