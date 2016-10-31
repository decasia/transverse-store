require 'rails_helper'

RSpec.describe Note, type: :model do
  it { should respond_to(:name) }
  it { should respond_to(:source) }
  it { should respond_to(:content) }

  it { should belong_to(:group) }
  it { should belong_to(:author) }

  pending "should test serialization"

end
