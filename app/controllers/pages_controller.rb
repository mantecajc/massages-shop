class PagesController < ApplicationController
  def home
    content = PagesContent.first
    @title = content.home_title
    @description = content.home_description
    @primary_photo = content.home_primary_photo
    @secondary_photo = content.home_secondary_photo
  end

  def additional_info
  end
end
