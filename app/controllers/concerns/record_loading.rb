module RecordLoading
  extend ActiveSupport::Concern
  
  def index_by
    nil # override this in implementing classes to permit indexing by some key
  end

  def include_children
    nil
  end

  def index
    if index_by && params[@index_by]
      @records = @records.where @index_by => params[@index_by]
    end
    @records = @records.includes(include_children) if include_children

    render jsonapi: @records, include: params[:include]
  end

  def show
    render jsonapi: @record, include: params[:include]
  end

  def update
    if @record.update resource_params
      render jsonapi: @record
    else
      render jsonapi: @record.errors, status: 422
    end
  end

  def create
    @record.group_id = current_user.current_group_id

    if @record.save
      render jsonapi: @record, status: 201
    else
      render jsonapi: @record.errors, status: 422
    end
  end

  def destroy
    @record.destroy
    render jsonapi: nil, status: 204
  end

  protected

  # extracts mobiledoc records from a source hash and adds them to a dest
  # this is a strong params workaround method, because strong_params
  # doesn't allow arbitrarily complex hash data to get through
  def add_mobiledocs(*docnames, params)
    dest = params[:to]
    src = params[:from]

    docnames.each do |name|
      # also note that we would use .dig here but our host only has ruby 2.2
      # which doesn't support .dig.
      dest[name] = src.try(:[], :data).try(:[], :attributes).try(:[], name)
    end
  end
end
