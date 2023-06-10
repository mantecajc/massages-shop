class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @home = Home.first
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update(home_params)
        format.turbo_stream
        format.html { redirect_to home_index_path, notice: "La page d'accueil a été mise à jour avec succès." }
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