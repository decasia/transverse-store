require 'rails_helper'
require 'controllers/jsonapi_controller_examples'

RSpec.describe DocVersionsController, type: :controller do
  context 'when authenticated' do
    include AuthHelpers
    before { stub_current_user }

    describe '#index' do
      before do
        @doc = FactoryGirl.create :doc
        @records = FactoryGirl.create_list :doc_version, 3, doc_id: @doc.id
        get :index, params: { doc_id: @doc.id }
      end
      it_behaves_like 'a JSONAPI endpoint', 200
    end

    describe '#show' do
      before do
        @record = FactoryGirl.create :doc_version
        get :show, params: {id: @record.id}
      end
      it_behaves_like 'a JSONAPI endpoint', 200
    end

  end

end
