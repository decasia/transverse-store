require 'rails_helper'

RSpec.describe Group, type: :model do
  it { is_expected.to have_many :authors }
  it { is_expected.to have_many :works }
  it { is_expected.to have_many :docs }
  it { is_expected.to have_many :notes }
  it { is_expected.to have_many :terms }

  it { is_expected.to have_and_belong_to_many :users }
end
