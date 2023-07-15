class CategoriesController < ApplicationController
  def new
    page = params[:page] ? params[:page] : "massages"
    @category = Category.new(page: page)
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        @categories = Category.where(page: @category.page)
        format.turbo_stream { flash.now[:success] = "La catégorie a été créée avec succès." }
        format.html { redirect_to massages_path, notice: "La catégorie a été créée avec succès." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        @categories = Category.where(page: @category.page)
        format.turbo_stream { flash.now[:success] = "La catégorie a été modifiée avec succès." }
        format.html { redirect_to massages_path, notice: "La catégorie a été modifiée avec succès." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    page = @category.page
    @category.destroy

    respond_to do |format|
      @categories = Category.where(page: page)
      format.turbo_stream { flash.now[:success] = "La catégorie a été supprimée." }
      format.html { redirect_to massages_path, notice: "La catégorie a été supprimée." }
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :page, :photo)
  end
end
