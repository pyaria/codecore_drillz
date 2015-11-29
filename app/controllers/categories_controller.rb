class CategoriesController < ApplicationController

  def index
    @categories = Category.order(:name)
    @cats_for_autocomplete = @categories.select("id", "name")
    respond_to do |format|
      format.html  { render :index }
      format.json  { render :json => @cats_for_autocomplete.map(&:name).to_json }
    end
  end

end
