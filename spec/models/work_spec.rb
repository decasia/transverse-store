require 'rails_helper'

RSpec.describe Work, type: :model do
  it { is_expected.to have_many(:docs) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }

  it { is_expected.to belong_to(:group) }
  it { is_expected.to belong_to(:author) }
end
