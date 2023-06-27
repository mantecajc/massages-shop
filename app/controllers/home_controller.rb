class HomeController < ApplicationController
  def index
    home = Home.first
    @title = home.try(:title)
    @description = home.try(:description)
    @primary_photo = home.try(:primary_photo)
    @secondary_photo = home.try(:secondary_photo)
  end

  def edit
  end

  def update
  end
end