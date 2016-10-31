require 'rails_helper'

RSpec.describe Work, type: :model do
  it { should have_many(:docs) }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should belong_to(:group) }
  it { should belong_to(:author) }
end
