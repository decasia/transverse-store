class DocsController < ApplicationController
  include RecordLoading
  
  before_action :authenticate_user

  def resource_params
    parsed = ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :work]
    )
    # have to handle mobiledocs separately
    add_mobiledocs :content, to: parsed, from: params

    parsed
  end
end
