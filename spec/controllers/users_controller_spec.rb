require "rails_helper"

RSpec.describe UsersController, type: :controller do

  describe "GET new" do
    it "should be 200" do
      get :new, format: :html
      expect(response).to be_success
    end
  end

  describe "GET index" do
    it "should be 200" do
      controller.stub(:current_user).and_return(FactoryGirl.build :user, :admin)
      get :index, format: :html
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "should be 302" do
      controller.stub(:current_user).and_return(FactoryGirl.build :user, :admin)
      post :create, format: :html, user: {login: "login", password: "123456", password_confirmation: "123456"}
      expect(response.status).to eq(302)
    end
  end

  describe "GET edit" do
    it "should be 200" do
      controller.stub(:current_user).and_return(FactoryGirl.build :user, :admin)
      fake_user = FactoryGirl.create :user, :admin
      get :edit, format: :html, id: fake_user.id
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "should be 200" do
      fake_user = FactoryGirl.create :user, :admin
      controller.stub(:current_user).and_return(FactoryGirl.build :user, :admin)
      get :show, format: :html, id: fake_user.id
      expect(response).to be_success
    end
  end

  describe "PUT update" do

    context "admin"
      it "#update" do
        fake_user = FactoryGirl.create :user, :admin
        controller.stub(:current_user).and_return(FactoryGirl.build :user, :admin)
        put :update, format: :html, id: fake_user.id, user: {login: "new_login"}
        expect(response.status).to eq(302)
      end
    end

    context "manager"
      it "#update" do
        fake_user = FactoryGirl.create :user, :admin
        controller.stub(:current_user).and_return(FactoryGirl.build :user, :manager)
        put :update, format: :html, id: fake_user.id, user: {login: "new_login"}
        expect(response.status).to eq(302)
      end
    end

    context "client"
      it "#update" do
        fake_user = FactoryGirl.create :user, :admin
        controller.stub(:current_user).and_return(FactoryGirl.build :user, :admin)
        put :update, format: :html, id: fake_user.id, user: {login: "new_login"}
        expect(response.status).to eq(302)
      end
    end

  end

  describe "DELETE" do

    context "admin" do
      it "#destroy" do
        fake_user = FactoryGirl.create :user, :admin
        controller.stub(:current_user).and_return(FactoryGirl.build :user, :admin)
        delete :destroy, format: :html, id: fake_user.id
        expect(response.status).to eq(302)
      end
    end

    context "no admin" do
      
      it "#destroy" do
        fake_user = FactoryGirl.create :user, :admin
        controller.stub(:current_user).and_return(FactoryGirl.build :user, :client)
        expect{ delete :destroy, format: :html, id: fake_user.id }.to raise_error( CanCan::AccessDenied )
      end

      it "#destroy" do
        fake_user = FactoryGirl.create :user, :admin
        controller.stub(:current_user).and_return(FactoryGirl.build :user, :manager)
        expect{ delete(:destroy, format: :html, id: fake_user.id) }.to raise_error( CanCan::AccessDenied )
      end

    end

  end

end