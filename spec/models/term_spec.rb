require 'rails_helper'

RSpec.describe Term, type: :model do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:example) }
  it { is_expected.to respond_to(:definition) }

  it { is_expected.to belong_to(:group) }
  it { is_expected.to belong_to(:author) }

  pending "should test serialization"
end
