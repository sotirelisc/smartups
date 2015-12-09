require "rails_helper"

RSpec.describe "Database seeding", :type => :model do
  it "should seed admin User correctly" do
    expect(User.first.first_name).to eq('Admin')
  end
  it "should seed demo Post 1 (Smartups Platform) correctly" do
    expect(Post.first.title).to eq('Smartups Platform')
  end
  it "should seed demo Post 2 (Santa Claus) correctly" do
    expect(Post.last.title).to eq('Santa Claus')
  end
end