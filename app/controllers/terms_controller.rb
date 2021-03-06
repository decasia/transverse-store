class TermsController < ApplicationController
  include RecordLoading

  before_action :authenticate_user
  load_and_authorize_resource :term, instance_name: :record

  def resource_params
    parsed = ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :example, :definition, :discussion, :author]
    )
    # have to handle mobiledocs separately
    add_mobiledocs :example, :definition, :discussion, to: parsed, from: params

    parsed
  end
end
