class CategoriesController < ApplicationController

  def index
    categories = Category.order(:name)
    @categories = categories.where("name LIKE?", "%#{params[:term]}%") if params[:term]
    respond_to do |format|
      format.html  { render :index }
      format.json  { render :json => @categories.map(&:name) }
    end
  end

end
