require 'rails_helper'
require 'controllers/jsonapi_controller_examples'

RSpec.describe WorksController, type: :controller do
  it_behaves_like 'a JSONAPI controller', :work
end
