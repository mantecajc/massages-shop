class PagesController < ApplicationController
  def home
    @home = PagesContent.first
    @title = @home.try(:home_title)
    @description = @home.try(:home_description)
  end

  def additional_info
  end
end
