require 'rails_helper'

RSpec.describe Note, type: :model do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:source) }
  it { is_expected.to respond_to(:content) }

  it { is_expected.to belong_to(:group) }
  it { is_expected.to belong_to(:author) }

  pending "should test serialization"

end
