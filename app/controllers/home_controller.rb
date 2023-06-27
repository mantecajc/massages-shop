class HomeController < ApplicationController
  def index
    @home = Home.first
    @title = @home.try(:title)
    @description = @home.try(:description)
    @primary_photo = @home.try(:primary_photo)
    @secondary_photo = @home.try(:secondary_photo)
  end

  def edit
    @home = Home.find(params[:id])
  end

  # Tutorial:
  # https://www.bearer.com/blog/how-to-build-modals-with-hotwire-turbo-frames-stimulusjs
  def update
    @home = Home.find(params[:id])

    if @home.update(home_params)
      redirect_to root_path, notice: "Model was successfully updated."
    else
      render :edit
    end
  end

  private

  def home_params
    params.require(:home).permit(:title, :description, :primary_photo, :secondary_photo)
  end
end