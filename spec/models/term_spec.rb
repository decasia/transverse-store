require 'rails_helper'

RSpec.describe Term, type: :model do
  it { should respond_to(:name) }
  it { should respond_to(:example) }
  it { should respond_to(:definition) }

  it { should belong_to(:group) }
  it { should belong_to(:author) }

  pending "should test serialization"
end
