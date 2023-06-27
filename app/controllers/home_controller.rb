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

  def update
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to post_url(@home), notice: "Home page was successfully updated." }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def home_params
    params.require(:home).permit(:title, :description, :primary_photo, :secondary_photo)
  end
end