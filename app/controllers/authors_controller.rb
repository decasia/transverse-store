class AuthorsController < ApplicationController
  include RecordLoading
  
  before_action :authenticate_user

  def include_children
    [:works]
  end

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :description]
    )
  end
end
