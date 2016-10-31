require 'rails_helper'

RSpec.describe Doc, type: :model do
  it { should respond_to(:name) }
  it { should respond_to(:content) }

  it { should belong_to(:group) }
  it { should belong_to(:work) }

  pending "should test serialization"

end
