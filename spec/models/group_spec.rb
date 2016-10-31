require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should have_many :authors }
  it { should have_many :works }
  it { should have_many :docs }
  it { should have_many :notes }
  it { should have_many :terms }

  it { should have_and_belong_to_many :users }
end
