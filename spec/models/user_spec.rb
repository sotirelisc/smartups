require "rails_helper"

RSpec.describe User, :type => :model do
  it "can provide the full name" do
    expect(User.first.full_name).to eq("Admin Administrator")
  end
  it "raises an error if image size is more than 2MB" do
    @user = User.create!(:first_name => "Jax", :last_name => "Teller", :email => "jax@sonsofanarchy.com", :password => "123456789")
    @user.profile_pic = Rails.root.join("public/test.jpg").open
    @user.save
    @user.valid?
    expect(@user.errors.full_messages).to include("should be less than 2MB")
  end
end