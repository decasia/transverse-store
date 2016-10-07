class NotesController < ApplicationController
  include RecordLoading

  def resource_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :author]
    )

    # custom handling for mobiledocs
    add_mobiledocs :content, :source, to: parsed, from: params

    parsed
  end
end
