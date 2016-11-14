class NotesController < ApplicationController
  include RecordLoading

  before_action :authenticate_user

  def resource_params
    parsed = ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :author]
    )

    # custom handling for mobiledocs
    add_mobiledocs :content, :source, to: parsed, from: params

    parsed
  end
end
