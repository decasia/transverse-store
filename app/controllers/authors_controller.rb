class AuthorsController < ApplicationController
  include RecordLoading

  before_action :authenticate_user
  load_and_authorize_resource :author, instance_name: :record

  def include_children
    [:works]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :description]
    )
  end
end
