require 'rails_helper'

RSpec.describe Place, type: :model do
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(256) }
  it { should validate_presence_of(:begins_at) }
  it { should validate_presence_of(:ends_at) }
end
