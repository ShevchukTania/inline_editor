require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has valid factories' do
    expect(FactoryBot.create(:post)).to be_persisted
  end
end
