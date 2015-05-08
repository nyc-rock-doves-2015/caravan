require 'rails_helper'

RSpec.describe ParcelsController, type: :controller do

  let(:user) { FactoryGirl.create :user }
  let(:parcel1) { FactoryGirl.create :parcel }
  let(:parcel2) { FactoryGirl.build :parcel }
  let(:parcel3) { Parcel.new(description:"blah") }

  context "#create" do
    it "redirects to the users profile" do
      post :create, parcel: FactoryGirl.attributes_for(:parcel),
        expect(response).to redirect_to user_path(User.last.id)
    end

    it "should not redirect with bad attributes" do
      post :create, user: {username: nil , password: "wdw"}
      expect(response).to redirect_to new_user_path
    end

    it "creates a post with valid params" do
      post :create
      post2.save
      expect(post2).to eq Post.last
    end

  end


end
