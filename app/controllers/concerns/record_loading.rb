module RecordLoading
  extend ActiveSupport::Concern

  class UnauthorizedError < StandardError; end

  def index_by
    nil # override this in implementing classes to permit indexing by some key
  end

  def include_children
    nil
  end

  def index
    # TODO enable auth here
    @records = model.all #.where group_id: current_user.group_id
    if index_by && params[@index_by]
      @records = @records.where @index_by => params[@index_by]
    end
    @records = @records.includes(include_children) if include_children

    render jsonapi: @records, include: params[:include]
  end

  def show
    @record = load_record_for :show, params[:id]
    render jsonapi: @record
  end

  def update
    @record = load_record_for :update, params[:id]

    if @record.save
      render jsonapi: @record
    else
      render jsonapi: @record.errors, status: 422
    end
  end

  def create
    @record = model.create params[:id], resource_params
    @record.group_id = current_user.group_id

    if @record.save
      render jsonapi: @record, status: 201
    else
      render jsonapi: @record.errors, status: 422
    end
  end

  def destroy
    @record = load_record_for :destroy, params[:id]

    @record.destroy
    render jsonapi: nil, status: 204
  end

  protected

  def model
    @model_name ||= controller_name.classify.constantize
  end

  def load_record_for(method, id)
    record = model.find id
    if authorized_for? method, record
      record
    else
      raise UnauthorizedError, 'Unauthorized action'
    end
  end

  def authorized_for?(method, record)
    # TODO enable auth when necessary, differentiate by some permissions grid
    #    current_user.group_id == record.group_id
    true
  end
end
