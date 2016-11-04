require 'controllers/auth_helpers'

RSpec.shared_examples 'a JSONAPI endpoint' do |expected_status|
  it 'responds as JSONAPI' do
    expect(response.content_type).to eq 'application/vnd.api+json'
  end
  it 'responds with expected status' do
    expect(response.status).to eq expected_status
  end
end

RSpec.shared_examples 'a JSONAPI controller' do |model|
  context 'when authenticated' do
    include AuthHelpers
    before { stub_current_user }

    describe '#index' do
      before do
        @records = FactoryGirl.create_list model, 3
        get :index
      end

      it_behaves_like 'a JSONAPI endpoint', 200

      it 'responds with the right content' do
        body = JSON.parse response.body
        returned_ids = body['data'].map {|r| r['id'].to_i}
        expect(returned_ids).to eq @records.map(&:id)
      end
      pending "ensure group filter is working"
    end

    describe '#show' do
      before do
        @record = FactoryGirl.create model
        get :show, params: { id: @record.id }
      end

      it_behaves_like 'a JSONAPI endpoint', 200

      it 'responds with the right content' do
        body = JSON.parse response.body
        returned_id = body['data']['id'].to_i
        expect(returned_id).to eq @record.id
      end
    end

    pending "test update"
    pending "test destroy"
    pending "test create"
  end

  pending "test behavior without auth"

end
