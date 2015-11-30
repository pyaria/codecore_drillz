class BadgesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_badge, only: [:show, :edit, :update, :destroy]

    # create_table "badges", force: :cascade do |t|
    #   t.datetime "created_at", null: false
    #   t.datetime "updated_at", null: false
    #   t.string   "name"
      # image
    # end

    def new
      @badge = Badge.new
    end

    def user_badges
      @badges = current_user.badges
    end

    def index
      @badges = Badge.all
    end

    def create
      @badge = Badge.new badge_params
      if @badge.save
        redirect_to badge_path @badge
      else
        render :new
      end
    end

    def destroy
      @badge.destroy
      redirect_to badges_path, notice: "Badge deleted."
    end

    def show
    end

    def edit

    end

    def update
      if @badge.update badge_params
        redirect_to badge_path @badge
      else
        render :new
      end
    end

    private

      def badge_params
        params.require(:badge).permit([:name, :image])
      end

      def find_badge
        @badge = Badge.find(params[:id])
      end


end
