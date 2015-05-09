require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe " #authenticate_user!" do
    it "sets return point if current_user is nil"
    pending "redirects to signin_path" do
      expect(response).to redirect_to signin_path
    end
  end
end
