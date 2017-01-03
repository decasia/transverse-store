class DocVersionsController < ApplicationController
  before_action :authenticate_user

  def show
    @record = DocVersion.find params[:id]
    authorize! :show, @record

    render jsonapi: @record
  end

  def index
    doc = Doc.find(params[:doc_id])
    authorize! :show, doc
    @records = DocVersion.where doc_id: params[:doc_id]
    render jsonapi: @records
  end

end
