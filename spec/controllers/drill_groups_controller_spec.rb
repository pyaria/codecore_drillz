require 'rails_helper'

RSpec.describe DrillGroupsController, type: :controller do

  describe "#new" do
    context "with user not sign in" do
      it "redirect to user sign in page" do
        get :new
        expect(response).to redirect_to(new_user_path)

      end
    end

    context "with user sign in" do
  end

end
