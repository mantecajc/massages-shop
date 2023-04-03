class PagesController < ApplicationController
  def home
    content = PagesContent.first
    @title = content.try(:home_title)
    @description = content.try(:home_description)
    @primary_photo = content.try(:home_primary_photo)
    @secondary_photo = content.try(:home_secondary_photo)
  end

  def additional_info
  end
end
