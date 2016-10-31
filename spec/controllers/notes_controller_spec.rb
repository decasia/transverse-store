require 'rails_helper'
require 'controllers/jsonapi_controller_examples'

RSpec.describe NotesController, type: :controller do
  it_behaves_like 'a JSONAPI controller', :note
end
