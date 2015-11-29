class CategoriesController < ApplicationController


  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  # create_table "categories", force: :cascade do |t|
  #   t.string   "name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end


  def index
    @categories = Category.order(:name)
    @cats_for_autocomplete = @categories.select("id", "name")
    respond_to do |format|
      format.html  { render :index }
      format.json  { render :json => @cats_for_autocomplete.map(&:name).to_json }
    end
  end

  def create
    @category = Category.new cat_params
    if @category.save
      redirect_to category_path category
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

  def show
  end

  private

    def cat_params
      params.require(:category).permit([:name])
    end

    def find_category
      @category = Category.find(params[:id])
    end

end
