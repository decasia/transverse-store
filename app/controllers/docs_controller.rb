class DocsController < ApplicationController
  include RecordLoading

  before_action :authenticate_user

  def update
    @record = Doc.find params[:id]
    authorize! :update, @record

    if @record.update resource_params
      # create a new version
      DocVersion.create content: @record.content,
                        user: current_user,
                        doc: @record,
                        group: @record.group_id
      render jsonapi: @record
    else
      render jsonapi: @record.errors, status: 422
    end

  end

  def resource_params
    parsed = ActiveModelSerializers::Deserialization.jsonapi_parse!(params,
      only: [:name, :work]
    )
    # have to handle mobiledocs separately
    add_mobiledocs :content, to: parsed, from: params

    parsed
  end
end
