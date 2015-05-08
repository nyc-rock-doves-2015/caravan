require 'rails_helper'

RSpec.describe User, type: :model do
	let!(:baduser) {User.new(username:"", password:"")}
  pending "add some examples to (or delete) #{__FILE__}"

# test for creation

	let(:user) {FactoryGirl.build :user}
	it "should have a username and password" do
		expect(user.username).to eq "Bob"
		expect(user.password).to eq "password"
	end

	it "should not create a user with bad params" do
		expect(baduser.save).to eq false
	end
end
