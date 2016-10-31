require 'rails_helper'
require 'controllers/jsonapi_controller_examples'

RSpec.describe TermsController, type: :controller do
  it_behaves_like 'a JSONAPI controller', :term
end
