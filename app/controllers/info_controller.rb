class InfoController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @marker = [
      {
        lat: 48.8649574,
        lng: 2.3800617
      }
    ]
  end
end
