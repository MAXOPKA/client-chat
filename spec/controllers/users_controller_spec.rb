require "rails_helper"

set_current_user = lambda do |c|
  c.stub(:current_user).and_return(FactoryGirl.build :user)
end

describe UsersController do 

  describe "GET new" do
    it "should be 200" do
      get :new, format: :html
      expect(response).to be_success 
    end
  end

  describe "GET index" do
    it "should be 200" do
      set_current_user.call(controller)
      get :index, format: :html
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "should be 302" do
      post :create, format: :html, user: {login: "login", password: "123456", password_confirmation: "123456"}
      expect(response.status).to eq(302)
    end
  end

  describe "GET edit" do
    it "should be 200" do
      set_current_user.call(controller)
      fake_user = FactoryGirl.create :user
      get :edit, format: :html, id: fake_user.id
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "should be 200" do
      fake_user = FactoryGirl.create :user
      set_current_user.call(controller)
      get :show, format: :html, id: fake_user.id
      expect(response).to be_success
    end
  end

  describe "PUT update" do
    it "should be 302" do
      fake_user = FactoryGirl.create :user
      put :update, format: :html, id: fake_user.id, user: {login: "new_login"}
      expect(response.status).to eq(302)
    end
  end

  describe "DELETE" do
    it "should be 302" do
      fake_user = FactoryGirl.create :user
      set_current_user.call(controller)
      delete :destroy, format: :html, id: fake_user.id
      expect(response.status).to eq(302)
    end
  end

end