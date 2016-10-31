require 'rails_helper'

RSpec.describe Doc, type: :model do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:content) }

  it { is_expected.to belong_to(:group) }
  it { is_expected.to belong_to(:work) }

  pending "should test serialization"

end
