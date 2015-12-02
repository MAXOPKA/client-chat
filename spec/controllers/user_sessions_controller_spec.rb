require "rails_helper"

describe UserSessionsController do

  let!(:user){ create :user, :admin }

  describe "GET new" do
    it "should be 200" do
      get :new, format: :html
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "should be 302" do
      post :create, format: :html
      expect(response.code).to eq '302'
    end
  end

  describe "DELETE destroy" do
    it "should be 302" do
      delete :destroy, format: :html
      expect(response.code).to eq '302'
    end
  end

end
