require 'rails_helper'

RSpec.describe User, type: :model do
  it "should require a name" do
  user = User.create(:name => "Alecks")
  user.valid?
  user.errors.should_not have_key(:name)
  end
  it { should validate_presence_of(:category_id) }
  end

