require 'rails_helper'

RSpec.describe Author, type: :model do
  it { should have_many(:works) }
  it { should have_many(:notes) }
  it { should have_many(:terms) }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should belong_to(:group) }

end
