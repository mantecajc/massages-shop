class PagesController < ApplicationController
  # TODO: set fly.io https://www.youtube.com/watch?v=E6UCy20ZKtA&ab_channel=Deanin
  # Init styles.
  
  def home
    @home = PagesContent.first
    @title = @home.try(:home_title)
    @description = @home.try(:home_description)
  end

  def additional_info
  end
end
