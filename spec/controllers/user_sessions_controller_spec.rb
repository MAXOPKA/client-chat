require "rails_helper"

describe UserSessionsController do

  describe "GET new" do
    it "should be 200" do      
      get :new, :format => :html
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "should be 200" do
      get :new, :format => :html
      expect(response).to be_success
    end
  end

  describe "DELETE destroy" do
    it "should be 200" do
      get :new, :format => :html
      expect(response).to be_success
    end
  end

end