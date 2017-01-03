require 'rails_helper'

RSpec.describe DocVersion, type: :model do
  it { is_expected.to respond_to(:content) }

  it { is_expected.to belong_to(:doc) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:group) }
  it { is_expected.to respond_to(:created_at) }

  pending "should test serialization"

end
