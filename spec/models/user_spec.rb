require "rails_helper"

RSpec.describe User, :type => :model do
  it "can provide the full name" do
    expect(User.first.full_name).to eq("Admin Administrator")
  end
end