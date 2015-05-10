require 'rails_helper'

RSpec.describe User, type: :model do
  let(:baduser) {User.new(username:"", password:"")}
  let(:user) {FactoryGirl.build :user}

  it "has a username and password" do
    expect(user.username).to eq "Bob"
    expect(user.password).to eq "123"
  end

  it "is not created with with bad params" do
    expect(baduser.save).to eq false
  end

end
