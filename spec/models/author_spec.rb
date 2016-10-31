require 'rails_helper'

RSpec.describe Author, type: :model do
  it { is_expected.to have_many(:works) }
  it { is_expected.to have_many(:notes) }
  it { is_expected.to have_many(:terms) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }

  it { is_expected.to belong_to(:group) }

end
