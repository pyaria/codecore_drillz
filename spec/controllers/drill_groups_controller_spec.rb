require 'rails_helper'

RSpec.describe DrillGroupsController, type: :controller do

  describe "#new" do
    context "with user not signed in" do
      it "redirects to user sign in page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)

      end
    end

    context "with user signed in" do
      before do
        # GIVEN
        u = FactoryGirl.create(:user)
        request.session[:user_id] = u.id

        # WHEN
        get :new
      end


    end
  end

  describe "#create" do

  end

  describe "#index" do

  end

  describe "#edit" do

  end

  describe "#update" do

  end

  describe "#destroy" do

  end

  describe "#show" do

  end

end
